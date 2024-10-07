; ________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<BASE SPECIAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Fireball (Base)
[Statedef 1000]
type=S
physics=S
movetype=A
anim = 1000
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 50, 0

[State 1000, Voice Snd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 2
value = 5,13

[State 1000, Fireball]
type = helper
triggerall = var(1) = 0
trigger1 = animelemtime(2) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Fireball"
postype = p1
pos = 70, -70
size.xscale = 0.8
size.yscale = 0.8
ownpal = 1
[State 0, Hand Fireball Aura Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 2
anim = 1003
ID = 1003
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .4,.4
ontop = 1
removeongethit = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1004 
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1005 

[State 1000, Idle]
type = StateTypeSet
triggerall = var(1) = 0
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = command = "x" & Time > 15
value = 1001

[State 1000, ChangeState]
type = ChangeState
trigger1 = command = "y" & Time > 15
value = 1001

[State 1000, ChangeState]
type = ChangeState
trigger1 = command = "z" & Time > 15
value = 1001

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Fireball (Base)
[Statedef 1001]
type=S
physics=S
movetype=A
anim = 1001
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 50, 0

[State 1000, Voice Snd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 2
value = 5,14

[State 1000, Fireball]
type = helper
triggerall = var(1) = 0
trigger1 = animelemtime(2) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Fireball"
postype = p1
pos = 70, -70
size.xscale = 0.8
size.yscale = 0.8
ownpal = 1
[State 0, Hand Fireball Aura Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 2
anim = 1003
ID = 1003
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .4,.4
ontop = 1
removeongethit = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1004 
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1005 

[State 1000, Idle]
type = StateTypeSet
triggerall = var(1) = 0
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Fireball
[Statedef 1050]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1050

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1050, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,66
[State 1050, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,66
[State 1050, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,66
[State 1050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,2

[State 0, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 3
anim = 1003
ID = 1003
pos = 60, -75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .4,.4
ontop = 1
ownpal = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1004 

[State 1000, Fireball]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1009
ID = 1009
name = "EX Fireball"
postype = p1
pos = 70, -75
size.xscale = 0.8
size.yscale = 0.8
ownpal = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Rapid Kicks
[Statedef 1200]
type=A
physics=S
movetype=A
anim = 1200
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z"), 3, ifElse((command = "y"), 2, 1))

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time > 0
x = 1.7+var(10)*3

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 12 || animelem = 16
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 8
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -7.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 12
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
triggerall = var(1) = 1
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 16
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-73
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;---------------------------------------------------------------
;EX Rapid Kicks
[Statedef 1250]
type=A
physics=S
movetype=A
anim = 1200
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 12 || animelem = 16
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 8
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 12
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
triggerall = var(1) = 1
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 16
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-73
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1250
trigger1 = movehit && time > 29
value = 1251

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;---------------------------------------------------------------
;EX Rapid Kicks (Teleport Last Kick)
[Statedef 1251]
type=A
physics=S
movetype=A
anim = 1250
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X +85
y = -15+P2Dist y

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, Gravity]
type = Gravity
trigger1 = time > 22

[State 0, VelSet]
type = VelSet
trigger1 = movehit && time > 22
x = 1

[State 1301, TeleportSnd]
type = PlaySnd
trigger1 = !time
value = S6,0

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 6
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 6
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -7.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;Rapid Kicks (SSJ2)
[Statedef 1300]
type=A
physics=S
movetype=A
anim = 1300
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z"), 3, ifElse((command = "y"), 2, 1))

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time > 0
x = 1.7+var(10)*3

[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 12
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 8
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -7.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 12
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 16
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-73
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;---------------------------------------------------------------
;EX Rapid Kicks (SSJ2)
[Statedef 1350]
type=A
physics=S
movetype=A
anim = 1300
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 12
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,6

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 8
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 12
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 16
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=87), var(36):=-73
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1350
trigger1 = movehit && time > 38
value = 1351

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;---------------------------------------------------------------
;EX Rapid Kicks (SSJ2 Teleport Last Kick)
[Statedef 1351]
type=A
physics=S
movetype=A
anim = 1350
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X +85
y = -15+P2Dist y

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, Gravity]
type = Gravity
trigger1 = time > 22

[State 0, VelSet]
type = VelSet
trigger1 = movehit && time > 22
x = 1

[State 1301, TeleportSnd]
type = PlaySnd
trigger1 = !time
value = S6,0

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 6 
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 6
ID = 1200
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 25, 25, fvar(11) * 35)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 12), ifelse(var(20), 3, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2.61, -7.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;Dash Elbow
[Statedef 1400]
type = S
physics = S
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
poweradd=72*!var(20)
sprpriority = 1
juggle = 8
facep2 = 0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z"), 3, ifElse((command = "y"), 2, 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = ifelse(var(10)=3,1402,ifelse(var(10)=2,1401,1400))

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 12+var(10)*3

[State 105, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,5
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,5

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 1
x = -5

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S100,2
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,5

[State 0, Explod]
type = Explod
trigger1 = time = 9
anim = 1403
ID = 1403
pos = 20,-80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 15
superMoveTime = 255
scale = 1.3,.5
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1401, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*65<7, 7, fvar(11)*65)), 8
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 20), ifelse(var(20), 18, 20)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -6.86, -7.52), -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -3.52)
guard.cornerPush.velOff = 0
air.velocity = -7.39, -8.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall=1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=40), var(36):=-75
envshake.time = 16
envshake.freq = 140
envshake.ampl = 12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1401, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 101

;---------------------------------------------------------------------------
;EX Dash Elbow (Elbow 1)
[Statedef 1450]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1450, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Anim]
type=changeanim
trigger1=!time
value=1402

[State 1450,Posset]
type=posset
trigger1=!time
y=0

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1450, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1450, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 12+var(10)*3

[State 105, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,5
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,5

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 1
x = -5

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S100,2
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,5

[State 0, Explod]
type = Explod
trigger1 = time = 9
anim = 1403
ID = 1403
pos = 20,-80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 15
superMoveTime = 255
scale = 1.3,.5
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1401, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*65<7, 7, fvar(11)*65)), 8
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 14, 22), ifelse(var(20), 14, 22)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -3.52)
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall=0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=40), var(36):=-75
envshake.time = 16
envshake.freq = 140
envshake.ampl = 12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1450, ChangeState]
type = ChangeState
trigger1 = movehit
value = 1451

[State 1450, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------
;EX Dash Elbow (Elbow 2)
[Statedef 1451]
type=S
physics=S
movetype=A
anim = 1450
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1401, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 1
x = -20

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 2
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 23

[State 105, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S100,2
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,5

[State 0, Explod]
type = Explod
trigger1 = time = 9
anim = 1403
ID = 1403
pos = 20,-80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 15
superMoveTime = 255
scale = 1.3,.5
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,49
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,49

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*50<7, 7, fvar(11)*50)), 0
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 24, 26), ifelse(var(20),  24, 26)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -14, -6
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -14, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall=1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=40), var(36):=-75
envshake.time = 16
envshake.freq = 140
envshake.ampl = 12
ID = 1502
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

;-------------------------------------------------------------
;Flash Kick
[Statedef 1500]
type=A
physics=S
movetype=A
anim = 1500
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1501, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1501, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1501, VelSet]
type = VelSet
trigger1 = time = 5
x = 15
[State 1501, VelSet]
type = VelMul
trigger1 = time = 5
x = .85

[State 1501, VelSet]
type = VelSet
trigger1 = time = 5
y = -2

[State 1501, VelSet]
type = VelSet
trigger1 = time > 11
x = 2

[State 0, Gravity]
type = Gravity
trigger1 = time > 11

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 1505
ID = 1505
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 4
pausemovetime = 0
scale = .37,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
trans = add

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 1506
ID = 1506
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 4
pausemovetime = 0
scale = .37,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
trans = Sub

[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,3
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,3
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,3
[State 1500, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 4
value = S1,3

[State 1500, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 85 < 85, 85, (fvar(12)) * 85)), 8
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 8), ifelse(var(20), 6, 8)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -6.86, -6.52)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -4.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall=1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-68
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-------------------------------------------------------------
;EX Flash Kick 1
[Statedef 1550]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1500

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1501, VelSet]
type = VelSet
trigger1 = time = 5
x = 15
[State 1501, VelSet]
type = VelMul
trigger1 = time = 5
x = .85

[State 1501, VelSet]
type = VelSet
trigger1 = time = 5
y = -2

[State 1501, VelSet]
type = VelSet
trigger1 = time > 11
x = 2

[State 0, Gravity]
type = Gravity
trigger1 = time > 11

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 1505
ID = 1505
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 4
pausemovetime = 0
scale = .37,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
trans = add

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 1506
ID = 1506
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 4
pausemovetime = 0
scale = .37,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
trans = Sub

[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,3
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,3
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,3
[State 1500, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 4
value = S1,3

[State 1500, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 75 < 55, 55, (fvar(12)) * 75)), 8
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 10), ifelse(var(20), 6, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -7.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall=0
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-68
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1550
trigger1=movehit && pos y > -vel y
value = 1551

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-------------------------------------------------------------
;EX Flash Kick 2
[Statedef 1551]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1550

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = 50, 0

[State 1501, VelSet]
type = VelSet
trigger1 = time > 4
x = 5
[State 1501, VelSet]
type = VelMul
trigger1 = time > 4
x = .85

[State 1501, VelSet]
type = VelSet
trigger1 = time > 18
x = 2

[State 0, Gravity]
type = Gravity
trigger1 = time > 18

[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,67
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,67
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,67
[State 1500, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,67
[State 1500, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S1,3

[State 1500, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 75 < 55, 55, (fvar(12)) * 75)), 8
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 20, 22), ifelse(var(20), 20, 22)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -12,-6
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -7.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -12,-6
air.cornerPush.velOff = 0
yAccel = 0.58
ID = 1502
fall=1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=83), var(36):=-67
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-------------------------------------------------------------
;Kaioken Attack (Start Dash)
[Statedef 1600]
type=S
physics=S
movetype=A
anim = 1600
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z"), 3, ifElse((command = "y"), 2, 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = ifelse(var(10)=3,1611,ifelse(var(10)=2,1610,1600))

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 15+var(10)*3

[state 1600,Posset]
type=posset
trigger1=!time
y=0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,0
channel = 1
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,0
channel = 2

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, NA
hitflag = MAF
guardflag = M
ID = 5000
damage = 0, 0
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0,0), ifelse(var(20), 12, 12)
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -3
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -63
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1600
trigger1=movehit
value = 1601
ignorehitpause=1

;---------------------------------------------------------------
;Kaioken Attack
[Statedef 1601]
type=A
physics=S
movetype=A
anim = 1601
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 2
channel = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 2
channel = 2

[State 3000, width]
type = width
trigger1 = Time > 0
value = 0, 0

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 3
x = 0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.53
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 1601, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1601, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1601, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = 1,3
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,72
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,72

[State 220, Hit]
type=hitdef
trigger1= Animelem = 3
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*50<25, 25, fvar(11)*50)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 6,20
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -10, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -10, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=80), var(36):=-70
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1600, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1601
trigger1=movehit
value = 1602+(random%3)

[State 1600, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------
;Kaioken Diagonal Kick
[Statedef 1602]
type=A
physics=S
movetype=A
anim = 1602
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[state 1602]
type = posadd
trigger1 = !Time
x = -90+P2Dist x
y = -150+P2Dist y

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 2
x = 12
y = 12

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.6
size.yscale = 0.53
ownpal = 1

[State 1601, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = 6,0
[State 1601, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = 1,3
[State 1601, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = 5,73
[State 1601, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = 5,73

[State 1600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1600
attr = S, HP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 20), ifelse(var(20), 18, 20)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -6.61, 5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -5, 7
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=65), var(36):=-20
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1602
trigger1=movehit && Time > 5
value = 1605

[State 1600, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------
;Kaioken Dash Knee
[Statedef 1603]
type=A
physics=S
movetype=A
anim = 1603
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.53
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 30
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 0

[state 0]
type = posadd
trigger1 = animelem = 3 && target, pos x = [-220,220]
x = P2Dist X +55

[State 0, Turn]
type = Turn
trigger1 = animelem = 3 && target, pos x = [-220,220]

[State 1601, Aura Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1601, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 6
value = 1,3
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,3
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,3

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*50<25, 25, fvar(11)*50)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 8), ifelse(var(20), 6, 8)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -6.25, -12.25
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -5, -11
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 1
fall.recover = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=30), var(36):=-75
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 1600, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------
;Kaioken Diagonal Drop Kick
 [Statedef 1604]
type=A
physics=S
movetype=A
anim = 1604
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[state 1602]
type = posadd
trigger1 = !Time
x = -20+P2Dist x
y = -150+P2Dist y

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 2
x = 12
y = 12

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6008;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = -30,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.6
size.yscale = 0.53
ownpal = 1

[State 1601, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = 6,0
[State 0, Aura End Snd]
type = PlaySnd
trigger1 = !AnimTime
value = S6,7
[State 0, Aura End Snd]
type = PlaySnd
trigger1 = !AnimTime
value = S6,7
[State 1601, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = 1,3
[State 1601, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = 5,4
[State 1601, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = 5,4

[State 1600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1600
attr = S, HP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 20), ifelse(var(20), 18, 20)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -6.61, 5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -5, 7
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=40), var(36):=-15
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1602
trigger1=movehit && Time > 5
value = 1606

[State 1600, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;Kaioken Diagonal Kick (Air Land)
[Statedef 1605]
type = A
physics = S
movetype = A
anim = 1605
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 0

[State 0, Aura End Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 907
ID = 907
pos = -7,-25
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ontop = 1
removeongethit = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 2
x = -4
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time > 7
x = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 7

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;Kaioken Diagonal Drop Kick (Air Land)
[Statedef 1606]
type = A
physics = S
movetype = A
anim = 1606
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 0

[State 0, Aura End Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 907
ID = 907
pos = -7,-25
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ontop = 1
removeongethit = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 2
x = -4
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time > 12
x = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 2

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;EX Kaioken (Start Dash)
[Statedef 1650]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1600

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -46
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[state 1600,Posset]
type=posset
trigger1=!time
y=0

[State 1600,1]
type= VelSet
trigger1= animelem = 2
x= 15

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,0
channel = 1
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,0
channel = 2

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, NA
hitflag = MAF
guardflag = M
ID = 5000
damage = 0, 0
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0,0), ifelse(var(20), 12, 12)
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -3
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -63
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1650
trigger1=movehit
value = 1651
ignorehitpause=1

;----------------------------------------------------

;-----------------------------------------------
;EX Kaioken 3 Hit Combo
[Statedef 1651]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=1651

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 3000, width]
type = width
trigger1 = Time > 0
value = 0, 0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 40, 0
ID = 5000
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = animelem = 1
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !numhelper(6000) && !var(1)
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.45
size.yscale = 0.5
ownpal = 1


[State 3200, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,1
[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7

[State 3200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 0
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 15), ifelse(var(20), 8, 15)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 3200, ChangeState]
type = ChangeState
triggerall = prevstateno!=1651
trigger1=movehit && time >= 15
value = 1652
ignorehitpause=1

;-----------------------------------------
;EX Kaioken 3 Hit Combo Cont.
[Statedef 1652]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=1652

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !numhelper(6004) 
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6004
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,38
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,38
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,10
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,10
[State 3200, Teleport Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,0
[State 3200, Teleport Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,0
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,11
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,4
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S1,0
[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7

[State 0, Turn]
type = Turn
trigger1 = animelem = 1
[State 0, Turn]
type = Turn
trigger1 = animelem = 7
[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -55
y = P2Dist Y =0
[state 0]
type = posadd
trigger1 = animelem = 7
x = P2Dist X -55
y = P2Dist Y =0

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 4
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 0
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 15), ifelse(var(20), 4, 15)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 10
forcenofall = !var(20)
ID = 1502
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 0       
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 15), ifelse(var(20), 4, 15)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -14, -10
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -14, -10
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-50
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;==============================================================================================
;========================================<SSJ2 SPECIAL MOVES>========================================
;==============================================================================================

;Instant Transmission Kick (Instant Transmission)
[Statedef 1700]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 3700, Anim]
type=changeanim
trigger1=!time
value=1700

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c"), 3, ifElse((command = "b"), 2, 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
;var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 3))
var(10) = ifElse(P2stateType = C || p2statetype = S && random < 500, 1, ifElse(P2statetype = A && enemynear, vel y <0, 3, 2))

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 1701

;---------------------------------------------------
;Instant Transmission Kick (Appear Attack)
[Statedef 1701]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3700, Anim]
type=changeanim
trigger1=!time
value=1701

[State 3000, width]
type = width
trigger1 = animelemtime(7) = 0
value = 30, 0

[State 3000, width]
type = width
trigger1 = animelemtime(8) = 0
value = 30, 0

[state 1001]
type = posadd
trigger1 = animelem = 1 && pos y != 0
x = ifelse((P2Dist X -30)<126,(P2Dist X -30),126)
y = 80-50*var(10)

[state 1001]
type = posadd
trigger1 = animelem = 1 && pos y = 0
x = ifelse((P2Dist X -30)<126,(P2Dist X -30),126)
y = -10*var(10)

[state 1001]
type = posset
trigger1 = animelem = 1 && pos y >= 0
y = 0

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 7 
value = 1,5

[State 1700, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*65<7, 7, fvar(11)*65)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 16, 18), ifelse(var(20), 16, 18)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall=1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-96
envshake.time = 16
envshake.freq = 140
envshake.ampl = 12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1701
trigger1=movecontact && Time > 5
value = 1702

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;------------------------------------------------------------------
;Instant Transmission Kick (Air Land)
[Statedef 1702]
type = A
physics = S
movetype = A
anim = 1702
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 2
x = -4
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time > 7
x = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 7

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;--------------------------------------------------------
;EX Instant Transmission Kick (Instant Transmission)
[Statedef 1750]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 3700, Anim]
type=changeanim
trigger1=!time
value=1700

[State 1450, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1450, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1750, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 1700, ChangeState]
type = ChangeState
trigger1 = !Animtime 
value = 1751

;----------------------------------------------------
;EX Instant Transmission Kick (Appear Kick 1)
[Statedef 1751]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3700, Anim]
type=changeanim
trigger1=!time
value=1701

[State 3000, width]
type = width
trigger1 = animelemtime(7) = 0
value = 30, 0

[State 3000, width]
type = width
trigger1 = animelemtime(8) = 0
value = 30, 0

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[state 1602]
type = posadd
trigger1 = !Time
x = -50+P2Dist x
y = P2Dist y

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 7 
value = 1,5

[State 1700, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*55<7, 7, fvar(11)*55)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 16), ifelse(var(20), 8, 16)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall=0
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-96
envshake.time = 16
envshake.freq = 140
envshake.ampl = 12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1700, ChangeState]
type = ChangeState
trigger1 = !Animtime 
value = 1752

;----------------------------------------------------
;EX Instant Transmission Kick (Appear Kick 2)
[Statedef 1752]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3700, Anim]
type=changeanim
trigger1=!time
value=1750

[State 3000, width]
type = width
trigger1 = animelemtime(1) = 0
value = 30, 0

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 1 
value = 1,5

[State 1700, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*55<7, 7, fvar(11)*55)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 12, 14), ifelse(var(20), 12, 14)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -15,-8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -15,-8
air.cornerPush.velOff = 0
yAccel = 0.58
fall=1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-103
envshake.time = 16
envshake.freq = 140
envshake.ampl = 12
ID = 1502
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1701
trigger1=movecontact && Time > 5
value = 1702

[State 1700, ChangeState]
type = ChangeState
trigger1 = !Animtime 
value = 50

;------------------------------------------------------
;Rising Knee
[Statedef 1800]
type=A
physics=S
movetype=A
anim = 1800
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c"), 3, ifElse((command = "b"), 2, 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, Vel]
type = velset
trigger1 = anim = 1800 && !Time
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 10, 8))
y = ifelse(var(10) = 3, -6.3, ifelse(var(10) = 2, -3.3, -4.3))

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 10
x = 1.8

[State 0, Gravity]
type = Gravity
trigger1 = Time >= 10

[State 102, Dust]
type = helper
trigger1 = animelem = 1
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 40, Dust]
type = helper
trigger1 = !animtime
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 0,Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3

[State 0,Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,2
[State 0,Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,2

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 3
forcenofall = !var(20)
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*50<35, 35, fvar(11)*50)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -3.86, -10
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -2.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=20), var(36):=-67
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------
;EX Rising Knee
[Statedef 1850]
type=A
physics=S
movetype=A
anim = 1850
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 10.8
y = -4.3

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 14
x = 1.8

[State 0, Gravity]
type = Gravity
trigger1 = Time >= 14

[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 5,63
[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 5,63
[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 5,63
[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 5,63
[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 5,63
[State 1800, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1,5

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 13
anim = 1854
ID = 1854
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 28
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 3
forcenofall = !var(20)
ID = 1502
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*50<35, 35, fvar(11)*50)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Diagup
air.animtype = Diagup
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -17, -5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -17, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=20), var(36):=-67
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1850
trigger1=movehit && p2stateno = 1111302
value = 1851
ignorehitpause=1

;-------------------------------------------------------
;EX Rising Knee (Teleport Flips)
[Statedef 1851]
type=A
physics=S
movetype=A
anim = 1851
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[state 0]
type = posadd
trigger1 = animelem = 1
y = P2Dist Y -200
x = P2Dist X -90

[State 1200, VelSet]
type = VelSet
trigger1 = !Time
x = 8
y = 5
persistent = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = P2Dist X < 50
trigger1 = P2Dist Y < 50
value = 1852

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-------------------------------------------------------------
;EX Rising Knee Cont. (Drop Kick)
[Statedef 1852]
type=A
physics=S
movetype=A
anim = 1852
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 0, 60

[State 0, Gravity]
type = Gravity
trigger1 = 1

[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = 5,49
[State 1800, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = 5,49
[State 1800, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,5

[State 1600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1600
attr = S, HP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 20), ifelse(var(20), 18, 20)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -6.61, 5.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -5, 7
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=-10), var(36):=-15
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1852
trigger1=movehit && Time > 4
value = 1853

[State 1600, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;SSJ Drop Kick (Air Land)
[Statedef 1853]
type = A
physics = S
movetype = A
anim = 1853
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 2
x = -4
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time > 12
x = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 2

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;Dash Scatter Attack 1
[Statedef 2000]
type = S
physics = S
movetype = A
anim = 2000
ctrl = 0
velset = 0, 0
poweradd=72*!var(20)
sprpriority = 1
juggle = 8
facep2 = 1

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z"), 3, ifElse((command = "y"), 2, 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = ifelse(var(10)=3,2002,ifelse(var(10)=2,2001,2000))

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 12+var(10)*3

[State 100, steps]
type = playsnd
trigger1 = !time
value = s100, 2
persistent = 0
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 9
anim = 2005
ID = 2005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 32
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, NA
hitflag = MAF
guardflag = M
ID = 5000
damage = ceil(ifelse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,4), ifelse(var(20), 12, 12)
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Hard
fall.animtype = Hard
ground.type = HIGH
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -75
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=2000
trigger1=movehit && Time = 10
value = 2003
ignorehitpause=1

;--------------------------------------------------------------------
;Dash Scatter Attack 2
[Statedef 2003]
type = S
physics = S
movetype = A
anim = 2003
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
;facep2 = 1

[State 3000, width]
type = width
trigger1 = animelemtime(8) = 0
value = 30, 0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[state 0]
type = posadd
trigger1 = !Time
x = 100+P2Dist X

[State 0, Turn]
type = Turn
trigger1 = !Time

;x = -160
[State 1301, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 20

[State 100, steps]
type = playsnd
trigger1 = !time
value = s100, 2
persistent = 0
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1301, TeleportSnd]
type = PlaySnd
trigger1 = !time
value = S6,0
[State 1301, SwingSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,2
[State 1301, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,5
[State 1301, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,5

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 22 
anim = 2006
ID = 2005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 32
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 8
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 30 < 15, 7, fvar(11) * 30)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,4), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -85
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1301, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1301, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 2004
ctrl = 1

;--------------------------------------------------------------------
;Dash Scatter Attack 3
[Statedef 2004]
type = S
physics = S
movetype = A
anim = 2004
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
;facep2 = 1

[State 3000, width]
type = width
trigger1 = animelemtime(8) = 0
value = 30, 0

[state 0]
type = posadd
trigger1 = !Time
x = 100+P2Dist X

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 100, steps]
type = playsnd
trigger1 = !time
value = s100, 2
persistent = 0
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1302, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 30
[State 1302, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 3

[State 1301, TeleportSnd]
type = PlaySnd
trigger1 = !time
value = S6,0
[State 1302, SwingSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,2
[State 1302, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,11
[State 1302, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,11

[State 1310, hit]
type = hitdef
trigger1 = !time
attr = S, SA
damage = ceil(ifElse(fvar(11) * 20 < 20, 7, fvar(11) * 20)), 9
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 14, 14), ifelse(var(20), 16,16)
guard.pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -6
air.type = Low
air.velocity = -8, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2facing = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.5
fall = 1
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -45
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1301, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

;------------------------------------------------------------------
;EX Dash Scatter Attack 1
[Statedef 2050]
type = S
physics = S
movetype = A
anim = 2000
ctrl = 0
velset = 0, 0
poweradd=-500
sprpriority = 1
juggle = 8
facep2 = 1

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1450, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1450, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
bindtime = -1
pos = 0, -65
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1750, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 18

[State 100, steps]
type = playsnd
trigger1 = !time
value = s100, 2
persistent = 0
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 9
anim = 2005
ID = 2005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 32
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, NA
hitflag = MAF
guardflag = M
ID = 5000
damage = ceil(ifelse(fvar(11) * 30 < 4, 4, fvar(11) * 30)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,4), ifelse(var(20), 12, 12)
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Hard
fall.animtype = Hard
ground.type = HIGH
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -75
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=2050
trigger1=movehit && Time = 10
value = 2051
ignorehitpause=1


;------------------------------------------------------------------
;EX Dash Scatter Attack 1 (2nd Hit)
[Statedef 2051]
type = S
physics = S
movetype = A
anim = 2050
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 1

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 3000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 30, 0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 5

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,2
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,11
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,11

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 8
anim = 2052
ID = 2005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 32
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 30 < 4, 4, fvar(11) * 30)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,4), ifelse(var(20), 12, 12)
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Hard
fall.animtype = Hard
ground.type = HIGH
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -65
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=2051
trigger1=movehit && Time = 9
value = 2052
ignorehitpause=1

;--------------------------------------------------------------------
;EX Dash Scatter Attack 2
[Statedef 2052]
type = S
physics = S
movetype = A
anim = 2003
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
;facep2 = 1

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 3000, width]
type = width
trigger1 = animelemtime(8) = 0
value = 30, 0

[state 0]
type = posadd
trigger1 = !Time
x = 100+P2Dist X

[State 0, Turn]
type = Turn
trigger1 = !Time

;x = -160
[State 1301, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 20

[State 100, steps]
type = playsnd
trigger1 = !time
value = s100, 2
persistent = 0
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1301, TeleportSnd]
type = PlaySnd
trigger1 = !time
value = S6,0

[State 1301, SwingSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,2
[State 1301, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,5
[State 1301, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,5

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 22 
anim = 2006
ID = 2005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 32
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 8
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 30 < 4, 4, fvar(11) * 30)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,4), ifelse(var(20), 12, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -85
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1301, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1301, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 2053
ctrl = 1

;------------------------------------------------------------------
;EX Dash Scatter Attack 2 (2nd Hit)
[Statedef 2053]
type = S
physics = S
movetype = A
anim = 2051
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 1

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = 30, 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 5

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,2
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,43
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,43

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 12
anim = 2053
ID = 2005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 32
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 30 < 4, 4, fvar(11) * 30)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,4), ifelse(var(20), 12, 12)
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Hard
fall.animtype = Hard
ground.type = HIGH
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
kill = 0
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -60
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=2051
trigger1=movehit && Time = 13
value = 2004
ignorehitpause=1

;---------------------------------------------------------------------------
;Fireball (SSJ)
[Statedef 2100]
type=S
physics=S
movetype=A
anim = 131000
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 50, 0

[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,13

[State 1000, Fireball]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 2105
ID = 2105
name = "Fireball"
postype = p1
pos = 75, -70
size.xscale = 0.25
size.yscale = 0.25
ownpal = 1
[State 0, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 2
anim = 1002
ID = 1002
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .4,.4
ontop = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1004 

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = command = "x" & Time > 15
value = 2101

[State 1000, ChangeState]
type = ChangeState
trigger1 = command = "y" & Time > 15
value = 2101

[State 1000, ChangeState]
type = ChangeState
trigger1 = command = "z" & Time > 15
value = 2101

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Fireball (SSJ)
[Statedef 2101]
type=S
physics=S
movetype=A
anim = 131001
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 50, 0

[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,14

[State 1000, Fireball]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 2105
ID = 2105
name = "Fireball"
postype = p1
pos = 75, -70
size.xscale = 0.25
size.yscale = 0.25
ownpal = 1
[State 0, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 2
anim = 1002
ID = 1002
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .4,.4
ontop = 1
removeongethit = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1004 

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Fireball (SSJ)
[Statedef 2150]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=131050

[State 1000, width]
type = width
trigger1 = animelemtime(3) = 0
value = 50, 0

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1050, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,100
[State 1050, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,100

[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,2

[State 0, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 3
anim = 1002
ID = 1002
pos = 60, -75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .4,.4
ontop = 1
ownpal = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1004 

[State 1000, Fireball]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 2155
ID = 2155
name = "EX Fireball"
postype = p1
pos = 70, -75
size.xscale = 0.25
size.yscale = 0.25
ownpal = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------
;PUNCH ZERO COUNTER
[STATEDEF 2900]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
faceP2 = 1

[STATE 2900,POSSET]
type=posset
trigger1=!time
y=0

[STATE 2900,ANIM]
type=changeanim
trigger1=!time
value=2900

[State 2900, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=132900

[STATE 2900,DUST]
type = helper
trigger1 = Animelem=3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[STATE 2900,WIDTH]
type = Width
trigger1 = 1
edge = 30,0

[STATE 2900,NOT HIT BY]
type = NotHitBy
trigger1 = Anim = 2900
trigger1 = AnimElemNo(0) = [1,5]
value = SCA
time = 1

[State 0, Turn]
type = Turn
trigger1 = !time

[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X - 45
y = p2Dist y = 0  

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,11
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,11
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,11
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,11
[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,3

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 2900
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getpower = 0
givepower = 0, 0
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Heavy
air.animtype = Heavy
fall.animtype = Diagup
ground.type = hIGH
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = -3,-11.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2,-8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2900,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[STATE 2900,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
 
;KICK ZERO COUNTER
[STATEDEF 2910]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[STATE 2910,POSSET]
type=posset
trigger1=!time
y=0

[STATE 2910,ANIM]
type=changeanim
trigger1=!time
value=2910

[State 2910, SSJ2Mode]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=132910

[STATE 2910,NOT HIT BY]
type = nothitby
trigger1 = animelemtime(8) < 0
value = SCA
time = 1
ignorehitpause = 1

[STATE 2910,WIDTH]
type = Width
trigger1 = 1
edge = 40,0

[State 0, Turn]
type = Turn
trigger1 = !time

[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X - 40
y = p2Dist y = 0  

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,43

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S1,4

[STATE 2910,HIT]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 6
ID = 2910
attr = S, SA
hitFlag = MAF
guardFlag = M
damage =ceil(ifelse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = 0, 0
givePower = 0, 0
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Back
air.animType = Back
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6,-5.5
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -6.46, -4.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=76), var(36):=-83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[STATE 2910,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1