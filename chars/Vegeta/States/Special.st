; _________________________________________
;| Vegeta by DJMouF               |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Elbow Rush
[Statedef 1000]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1000

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 12+var(10)*3

[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,2
[State 1000, Movement Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,5
[State 1100, Dash Snd]
type = playsnd
trigger1 = animelem = 2
value = 100, 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 18

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

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = !Time
anim = 1003
ID = 1003
pos = 0,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
superMoveTime = 255
scale = .6,.65
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime 
id = 1003

[State 0, Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = !Time
anim = 1004
ID = 1004
pos = 0,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
superMoveTime = 255
scale = .6,.65
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime 
id = 1004

[State 3051, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
priority = 4, Hit
attr = A, HP
damage = ceil(ifelse((fvar(12)) * 25 < 10, 10, (fvar(12)) * 25)), 2
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -65
hitsound = s2, 2
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6,-6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -4,-4
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

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

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 1001
ctrl = 0
 
;---------------------------------------------------------------------------
;Elbow Rush Cont.
[Statedef 1001]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=0

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1001

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,3

[State 200, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
trigger1 = Animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 35, 35, fvar(11) * 45)), 8
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.41, -4.49), -8
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -80
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Elbow Rush
[Statedef 1050]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1000

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
pos = 0,-50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1000, Voice Snd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 2
value = 5,2
[State 1000, Voice Snd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 2
value = 5,2

[State 1000, Voice Snd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 2
value = 5,22
[State 1000, Voice Snd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 2
value = 5,22

[State 1000, Movement Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,5
[State 1100, Dash Snd]
type = playsnd
trigger1 = animelem = 2
value = 100, 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 18

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

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = !Time
anim = 1003
ID = 1003
pos = 0,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
superMoveTime = 255
scale = .6,.65
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime 
id = 1003

[State 0, Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = !Time
anim = 1004
ID = 1004
pos = 0,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
superMoveTime = 255
scale = .6,.65
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime 
id = 1004

[State 3051, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
priority = 4, Hit
attr = A, HP
damage = ceil(ifelse((fvar(12)) * 25 < 10, 10, (fvar(12)) * 25)), 2
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -65
hitsound = s2, 2
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6,-6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -4,-4
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.animtype = Low
air.velocity = -6, -4
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

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

[State 1000, End]
type = changestate
triggerall = var(1) = 0
trigger1 = !animtime
value = 1051
ctrl = 0

[State 1000, End]
type = changestate
triggerall = var(1) = 1
trigger1 = !animtime
value = 1053
ctrl = 0
 
;---------------------------------------------------------------------------
;EX Elbow Rush Cont.
[Statedef 1051]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=0

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1051

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

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,3

[State 0, Explod]
type = Explod
trigger1 = movehit 
anim = 10511
ID = 10511
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 20
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 200, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
trigger1 = Animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 25 < 15, 15, fvar(11) * 25)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = -13, -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -13, -7
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -80
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
ID = 1502
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[State 1051, ChangeState]
type = ChangeState
triggerall = var(1) = 0
triggerall = prevstateno!=1051
trigger1=movehit && p2stateno = 1111302
value = 1052
ignorehitpause=1

;---------------------------------------------------------------------------
;EX Elbow Rush Cont. (Teleport/Kick)
[Statedef 1052]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=0

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1052

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

[state 1001]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -80
y = p2Dist y -40

[State 0, VelSet]
type = VelSet
trigger1 = time > 3
x = 3.3

[State 0, Gravity]
type = Gravity
trigger1 = time > 22

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0
[State 1000, Movement Snd]
type = PlaySnd
trigger1 = animelem = 5
value = 1,2

[State 200, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 25 < 15, 15, fvar(11) * 25)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 22), ifelse(var(20), 18, 22)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = -7,-7.52
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -7,-7.52
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -55
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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

[State 50, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52 

;---------------------------------------------------------------------------
;EX Elbow Rush UpperCut (SSJ)
[Statedef 1053]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=0

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1053

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

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,3

[State 3000, Uppercut FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1054
ID = 1054
name = "Uppercut FX"
postype = p1
pos = 18, -115
size.xscale = 0.5 
size.yscale = 0.5
ownpal = 1

[State 200, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
trigger1 = Animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 50, 50, fvar(11) * 50)), 8
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 20), ifelse(var(20), 18, 20)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.41, -4.49), -10
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -3.31, -9.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 25), var(36) := -90
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2stateno = 8850
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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
value = 0
ctrl = 1

;------------------------------------------------------------------
;======================< RISING KICK >============================= 
;RisngKick
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
;juggle = ifelse(var(1) = 1, 8, ifelse((p2movetype = H && p2statetype = A), 7, 9))
sprpriority = 1
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "RisngKicka" || prevstateno = 750), 3, ifelse(command = "RisngKickb", 2, 1))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || prevstateno = 750 || random < 333), 3, ifelse(random < 500, 2, 1))

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1100, NotHitBy]
type = NotHitBy
triggerall = prevstateno != 750
triggerall = anim = 1100
trigger1 = AnimElemTime(4) < 0 && var(10) = 1
trigger2 = AnimElemTime(4) < 3 && var(10) = 2
trigger3 = AnimElemTime(3) < 0 && var(10) = 3
value = SCA
time = 1

[State 1100, HitBy]
type = HitBy
triggerall = prevstateno != 750
triggerall = anim = 1100
trigger1 = AnimElemTime(3) > 0 && AnimElemTime(4) < 0 && var(10) = 1
trigger2 = AnimElemTime(3) > 0 && AnimElemTime(4) < 3 && var(10) = 2
trigger3 = AnimElemTime(2) > 0 && AnimElemTime(3) < 0 && var(10) = 3
value = SCA,NP,SP,HP,NT,ST,HT,
time = 1

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(4) < 1
value = SCA
time = 1

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelem = 3
x = ifelse(var(10) = 3, 13, ifelse(var(10) = 2, 9, 6))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))
[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 1150, Swingsnd]
type = playsnd
trigger1 = anim = 1100 && animelem = 3
value = 1, 5
[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 3
value = 0, 41
[State 1100, VoiceSnd]
type = playsnd
trigger1 = anim = 1100 && animelem = 2
value = 5,27
ignorehitpause = 1
persistent = 0
[State 1100, VoiceSnd]
type = playsnd
trigger1 = anim = 1100 && animelem = 2
value = 5,27
ignorehitpause = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = anim = 1100 && animelem = 2
anim = 1102
ID = 1102
pos = -15,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
superMoveTime = 255
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1102 


[State 1100, Hit]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(16) && (var(15) < 20 || var(14) && var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 1100 
attr = S, SA
ID = 110000
;damage = ifelse(var(20), 60 + var(10) * 7, 111 + var(10) * 7), 15
damage = ceil(ifElse(fvar(12) * ifelse(var(14), ifelse(var(10) = 3, 111, ifelse(var(10) = 2, 102, 88)), ifelse(var(10) = 3, 139, ifelse(var(10) = 2, 128, 110))) < 100, 100, fvar(12) * ifelse(var(14), ifelse(var(10) = 3, 111, ifelse(var(10) = 2, 102, 88)), ifelse(var(10) = 3, 139, ifelse(var(10) = 2, 128, 110))))), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -79
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 0, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -4,  ifelse(var(10) = 2, -3.5, -3))), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, NormRyuHit Juggle Hit]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(16) && var(15) < var(10)
trigger1 = animelem = 4 && anim = 1100 
trigger1 = (p2movetype = H && p2statetype = A) && !var(20)
trigger1 = !var(27)
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 86, ifelse(var(10) = 2, 74, 38)) < 25, 25, fvar(12) * ifelse(var(10) = 3, 86, ifelse(var(10) = 2, 74, 38)))), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 11)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -79
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12.5, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 0, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -4,  ifelse(var(10) = 2, -3.5, -3))), ifelse(var(10) = 3, -12.5, ifelse(var(10) = 2, -10, -9))
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, NormRyuhit2]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(16) && (var(15) < var(10)|| var(20))
trigger1 = animelem = 5 && anim = 1100 
trigger1 = !movecontact && !movereversed
attr = A, SA
;damage = 44 + var(10) * 7, 7
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 65, ifelse(var(10) = 2, 58, 51)) < 25, 25, fvar(12) * ifelse(var(10) = 3, 65, ifelse(var(10) = 2, 58, 51)))), 15
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -106
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 5, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3))), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
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

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
trigger3 = anim = 1150 && animelemtime(4) >= 0
statetype = A
physics = A
[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
trigger2 = anim = 1150 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State 1200, VarSet]
type = VarAdd
trigger1 = var(1) = 1
trigger1 = var(10) > 1
trigger1 = numtarget(110000)
var(15) = 2
persistent = 0
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

;======================< EX RISING KICK >=============================
;EX RisngKick
[Statedef 1150]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
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
value=1150

[State 1150, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0, -50
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1150, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

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

[State 1150, nothitby]
type = nothitby
trigger1 = anim = 1150 && animelemtime(4) < 3
value = SCA
time = 1

[State 1150, Vel]
type = velset
trigger1 = anim = 1150 && animelem = 3
x = 12
y = -10
[State 1150, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1150, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1150, dust]
type = helper
trigger1 = anim = 1150 && animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = anim = 1150 && animelem = 2
anim = 1102
ID = 1102
pos = -15,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
superMoveTime = 255
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 1102 

[State 1150, Swingsnd]
type = playsnd
trigger1 = anim = 1150 && animelem = 3
value = 1, 5
[State 1100, Snd]
type = playsnd
trigger1 = anim = 1150 && animelem = 3
value = 0, 41
[State 1100, VoiceSnd]
type = playsnd
trigger1 = anim = 1150 && animelem = 2
value = 5,27
ignorehitpause = 1
persistent = 0
[State 1100, VoiceSnd]
type = playsnd
trigger1 = anim = 1150 && animelem = 2
value = 5,27
ignorehitpause = 1
persistent = 0

[State 3051, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelemtime(3)>=0
trigger1 = animelemtime(4)<0
priority = 4, Hit
attr = A, SA
damage = ceil(ifelse((fvar(12)) * 25 < 25, 25, (fvar(12)) * 25)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 2,0 
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -95
hitsound = s2, 5
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 1,-6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 1,-6
guard.velocity = -10.52
ground.cornerpush.veloff = 0
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3051, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = animelem = 5 && anim = 1150
priority = 4, Hit
attr = A, SA
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 16,18 
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -95
hitsound = s2, 5
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6,-10
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -4,-10
guard.velocity = -10.52
ground.cornerpush.veloff = 0
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

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

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1150, statetype]
type = statetypeset
trigger1 = anim = 1150 && animelemtime(3) >= 0
trigger2 = anim = 1101
statetype = A
physics = A
[State 1150, Anim]
type = changeanim
trigger1 = anim = 1150 && animelemtime(3) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

;------------------------------------------------------------------

;---------------------------------------------------------------------------
;Knee Bash
[Statedef 1200]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=0

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1200

[State 50, Accel]
type = gravity
trigger1 = Time > 17

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 5.8
y = -3.3

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

[State 0, Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = animelem = 3
anim = 1201
ID = 1201
pos = 45,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 4
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0 

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 3
anim = 1202
ID = 1202
pos = 7,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 4
pausemovetime = 0
scale = .8,.8
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time > 1
x = 4.5

[State 0,Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3
[State 0,Swing Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,5

[State 0,Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,25
[State 0,Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,25

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
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, Hit]
type=hitdef
trigger1= Animelem = 9
forcenofall = !var(20)
attr = A,SA
hitflag = MAFD
guardflag = MAF
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
ground.velocity = -5.86, 3
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -4.23, 3.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
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

;------------------------------------------------------------------
;EX Knee Bash
[Statedef 1250]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
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
value=1200

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
pos = 0,-50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 50, Accel]
type = gravity
trigger1 = Time > 17

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 5.8
y = -3.3

[State 0, VelSet]
type = VelSet
trigger1 = Time > 1
x = 4.5

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

[State 0, Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = animelem = 3
anim = 1201
ID = 1201
pos = 45,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 4
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0 

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 3
anim = 1202
ID = 1202
pos = 7,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 4
pausemovetime = 0
scale = .8,.8
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0,Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3
[State 0,Swing Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,5

[State 0,Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,25
[State 0,Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,25

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 3
forcenofall = !var(20)
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*50<35, 35, fvar(11)*50)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 10, 16), ifelse(var(20), 10, 16)
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
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, Hit]
type=hitdef
trigger1= Animelem = 9
forcenofall = !var(20)
attr = A,SA
hitflag = MAFD
guardflag = MAF
damage = ceil(ifelse(fvar(11)*50<35, 35, fvar(11)*50)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 10, 16), ifelse(var(20), 10, 16)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 0
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, 3
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 3.73
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
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

[State 0, ChangeState]
type = ChangeState
triggerall = var(1) = 0
trigger1 = movehit && Time >=27
value = 1251

[State 0, ChangeState]
type = ChangeState
triggerall = var(1) = 1
trigger1 = movehit && Time >=27
value = 1252

;------------------------------------------------------------------
;EX Knee Bash (Base Cont.)
[Statedef 1251]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=0

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1251

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

[state 1001]
type = posadd
trigger1 = animelem = 6
x = P2Dist X =50
y = p2Dist y -50

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
y = 8.2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
y = 0

[State 0, Gravity]
type = Gravity
trigger1 = time >= 33

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
y = -4
x = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
x = -3

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = animelem = 3 
value = S6,0

[State 420, Hit]
type=hitdef
trigger1= Animelem = 7
forcenofall = !var(20)
attr = A,SA
hitflag = MAFD
guardflag = MAF
damage = ceil(ifelse(fvar(11)*50<35, 35, fvar(11)*50)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Heavy
fall.animtype = Back
ground.type = Low
ground.hittime = 0
ground.slidetime = 0
guard.hittime = 18
air.hittime = 0
ground.velocity = 0,5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0,5
air.cornerPush.velOff = 0
yAccel = 0
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=0), var(36):=0
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

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;EX Knee Bash (SSJ Air Blast Cont.)
[Statedef 1252]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=0

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1252

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

[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 35
channel = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = time < 33
x = -1.6
y = -.7

[State 0, VelSet]
type = VelSet
trigger1 = time = 21
x = -2
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time > 33
x = -2

[State 0, Gravity]
type = Gravity
trigger1 = time > 33

[State 3006, Voice Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 9
[State 3006, Voice Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 9
[State 3006, Voice Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 9

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 1253
ID = 1253
pos = -7,-135
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 1253
ID = 1253
pos = -50,-107
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 1253
ID = 1253
pos = -7,-115
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, BBA]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1253
ID = 1253
name = "BBA"
postype = p1
pos = 0,-80
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;FireBlast
[Statedef 1300]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1300

[State 0, Gravity]
type = Gravity
trigger1 = Time > 9

[State 105, Dust]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 3
x = -5.5
y = -3.5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 6
x = -4.5

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,1
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S5,57
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S5,57
[State 1100, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 41

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3 
helpertype = normal ;player
name = "Fireblast"
ID = 1305
stateno = 1305
pos = 35,-58
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3
helpertype = normal ;player
name = "Hand Fireblast FX"
ID = 1307
stateno = 1307
pos = 25,-58
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

;-------SSJ

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3 
helpertype = normal ;player
name = "SSJ Fireblast"
ID = 1315
stateno = 1315
pos = 57,-60
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3
helpertype = normal ;player
name = "SSJ Hand Fireblast FX"
ID = 1317
stateno = 1317
pos = 18,-33
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1300 && animelemtime(4) >= 0
statetype = A
physics = A

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52
ctrl = 0

;---------------------------------------------------------------------------
;EX FireBlast
[Statedef 1350]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
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
value=1300

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
pos = 0,-50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1300

[State 0, Gravity]
type = Gravity
trigger1 = Time > 9

[State 105, Dust]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 3
x = -5.5
y = -3.5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 6
x = -4.5

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,1
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S5,56
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S5,56
[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S6,9
[State 1100, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 41

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3 
helpertype = normal ;player
name = "EX Fireblast"
ID = 1308
stateno = 1308
pos = 35,-58
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3
helpertype = normal ;player
name = "Hand Fireblast FX"
ID = 1307
stateno = 1307
pos = 25,-58
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

;-------SSJ

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3 
helpertype = normal ;player
name = "EX SSJ Fireblast"
ID = 1318
stateno = 1318
pos = 57,-60
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3
helpertype = normal ;player
name = "SSJ Hand Fireblast FX"
ID = 1317
stateno = 1317
pos = 25,-33
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1


[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1300 && animelemtime(4) >= 0
statetype = A
physics = A

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1351
ctrl = 0

;-------------------------------
;EX FireBlast 2
[Statedef 1351]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1350

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

[State 0, SwingSnd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,2
[State 0, Fireball Release Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S6,9

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3 
helpertype = normal ;player
name = "EX Fireblast"
ID = 1309
stateno = 1309
pos = 55,-53
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3
helpertype = normal ;player
name = "Hand Fireblast FX"
ID = 1307
stateno = 1307
pos = 45,-53
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

;-------SSJ

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3 
helpertype = normal ;player
name = "EX SSJ Fireblast"
ID = 1319
stateno = 1319
pos = 57,-55
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3
helpertype = normal ;player
name = "SSJ Hand Fireblast FX"
ID = 1317
stateno = 1317
pos = 25,-28
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

[State 620, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------
;AirFireball
[Statedef 1400]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1400

[State 0, Gravity]
type = Gravity
trigger1 = Time > 20

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = -.7
y = -.5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 4
x = -.6

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3 
helpertype = normal ;player
name = "AirFireblastLeftHand"
ID = 1405
stateno = 1405
pos = 35,-78
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 5
helpertype = normal ;player
name = "AirFireblastRightHand"
ID = 1405
stateno = 1405
pos = 30,-70
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3
helpertype = normal ;player
name = "Air Left Hand Fireblast FX"
ID = 1407
stateno = 1407
pos = 35,-70
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 5
helpertype = normal ;player
name = "Air Right Hand Fireblast FX"
ID = 1407
stateno = 1407
pos = 22,-65
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

;-------SSJ

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3 
helpertype = normal ;player
name = "AirFireblastLeftHand"
ID = 1408
stateno = 1408
pos = 50,-60
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 5
helpertype = normal ;player
name = "AirFireblastRightHand"
ID = 1408
stateno = 1408
pos = 45,-50
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Left Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = animelem = 3 
anim = 3101
ID = 3101
pos = 30, -80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = .67,.67
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Right Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = animelem = 5 
anim = 3101
ID = 3101
pos = 20, -75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = .67,.67
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 630, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,23
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S5,23

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;EX AirFireball
[Statedef 1450]
type=A
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
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
value=1450

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
pos = 0,-50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 0, Gravity]
type = Gravity
trigger1 = Time > 36

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = -.7
y = -.5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 4
x = -.6

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3 || animelem = 7
helpertype = normal ;player
name = "AirFireblastLeftHand"
ID = 1405
stateno = 1405
pos = 35,-78
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 5 || animelem = 9
helpertype = normal ;player
name = "AirFireblastRightHand"
ID = 1405
stateno = 1405
pos = 30,-70
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 3 || animelem = 7
helpertype = normal ;player
name = "Air Left Hand Fireblast FX"
ID = 1407
stateno = 1407
pos = 35,-70
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 0
trigger1 = animelem = 5 || animelem = 9
helpertype = normal ;player
name = "Air Right Hand Fireblast FX"
ID = 1407
stateno = 1407
pos = 22,-65
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

;-------SSJ

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3 || animelem = 7 
helpertype = normal ;player
name = "AirFireblastLeftHand"
ID = 1408
stateno = 1408
pos = 50,-60
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 5 || animelem = 9
helpertype = normal ;player
name = "AirFireblastRightHand"
ID = 1408
stateno = 1408
pos = 45,-50
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .24
size.yscale = .24
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 3 || animelem = 7
helpertype = normal ;player
name = "Air Left Hand Fireblast FX"
ID = 1409
stateno = 1409
pos = 30, -80
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = var(1) = 1
trigger1 = animelem = 5 || animelem = 9
helpertype = normal ;player
name = "Air Right Hand Fireblast FX"
ID = 1409
stateno = 1409
pos = 20, -75
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .67
size.yscale = .67
ignorehitpause = 1

[State 630, Type]
type=statetypeset
trigger1= animelemtime(11)>=0
movetype=I

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,47
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,47

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;Dash Kick
[Statedef 1500]
type = A
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
poweradd=72*!var(20)
sprpriority = 1
juggle = 8
facep2 = 0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c"), 3, ifElse((command = "b"), 2, 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = ifelse(var(10)=3,1502,ifelse(var(10)=2,1501,1500))

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 12+var(10)*3

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
trigger1 = animelem = 2
value = S1,2
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,16
[State 0, VoiceSnd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,16
[State 1100, Dash Snd]
type = playsnd
trigger1 = animelem = 2
value = 100, 2

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 65 < 65, 65, fvar(11) * 65)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = 8,12
fall = 1
air.fall = 1
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.41, -4.49), -2
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -6.31, -2
air.cornerPush.velOff = 0
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -48
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
value = 101

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=1500
trigger1=movehit
value = 1504
ignorehitpause=1

;------------------------------------------------------------------
;Dash Kick (Air Land)
[Statedef 1504]
type = A
physics = S
movetype = A
anim = 1504
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

;--------------------------------------------
;------------------------------------------------------------------
;EX Dash Kick
[Statedef 1550]
type = A
physics = S
movetype = A
ctrl = 0
velset = 0, 0
poweradd=-500
sprpriority = 1
juggle = 0
facep2 = 0

;---------SSJ During Attack

;[state Transform During Attack]
type = varset
triggerall = var(1) = 0
trigger1 = time <= 6
trigger1 = command = "s"
v = 1
value = 1

;[State 0]
type = RemapPal
trigger1 = command = "s" && time <= 6
source = 1, 1
dest = 1, 2

;[State 0, EnvColor]
type = EnvColor
trigger1 = command = "s" && time <= 6
value = 255,255,255
time = 2

;[State 0, Aura PlaySnd]
type = PlaySnd
trigger1 = command = "s" && time <= 6
value = S6,2
;[State 0, Aura PlaySnd]
type = PlaySnd
trigger1 = command = "s" && time <= 6
value = S6,2

;[State 0, Explod]
type = Explod
trigger1 = command = "s" && time <= 6
anim = 4701
ID = 4701
pos = -10,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 8
pausemovetime = 255
scale = .9,1
ontop = 1
ownpal = 1
removeongethit = 1

;---------SSJ During Attack End


[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Base Anim]
type=changeanim
triggerall = var(1) = 0
trigger1=!time
value=1552

[State 1050, SSJ Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=1550

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
triggerall = var(1) = 0
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 5,-60
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1


[State 1050, ExFX]
type = explod
triggerall = var(1) = 1
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 50,-50
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
triggerall = var(1) = 0
trigger1 = time > 0
x = 4

[State 0, VelSet]
type = VelSet
triggerall = var(1) = 1
trigger1 = !time
x = 22

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

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 4
anim = 1553
ID = 1553
pos = 0,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 4
pausemovetime = 0
scale = .18,.11
sprpriority = 0
ignorehitpause = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 9
anim = 1554
ID = 1554
pos = -10,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 5
pausemovetime = 0
scale = .26,.1
sprpriority = 0
ignorehitpause = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 730, Rushing Ki Aura]
type = helper
triggerall = var(1) = 0 && animelem = 10
trigger1 = !numhelper(6000) && !var(1)
stateno = 6006;ifelse(var(1),6002,6000)
ID = 6000
name = "Rushing Ki Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.4
size.yscale = 0.33
ownpal = 1

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 13
anim = 1556
ID = 1556
pos = 20,-45
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 8
pausemovetime = 0
scale = .18,.25
sprpriority = 4
ignorehitpause = 0
ontop = 1
trans = add
shadow = 0,0,0
ownpal = 1
removeongethit = 1
[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 13
anim = 1557
ID = 1557
pos = 20,-45
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 8
pausemovetime = 0
scale = .18,.25
sprpriority = 4
ignorehitpause = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = animelem = 2
anim = 1558
ID = 1558
pos = 20,-45
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 8
pausemovetime = 0
scale = .18,.25
sprpriority = 4
ignorehitpause = 0
ontop = 1
trans = add
shadow = 0,0,0
ownpal = 1
removeongethit = 1
[State 0, Explod]
type = Explod
triggerall = var(1) = 1
trigger1 = animelem = 2
anim = 1559
ID = 1559
pos = 20,-45
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 8
pausemovetime = 0
scale = .18,.25
sprpriority = 4
ignorehitpause = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, SSJSwingSnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 2
value = S1,2

[State 1100, Dash Snd]
type = playsnd
trigger1 = animelem = 2
value = 100, 2

[State 0, BaseSwingSnd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 3 || animelem = 9 || animelem = 13
value = S1,2

[State 0, BaseVoiceSnd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 1
value = S5,12
[State 0, BaseVoiceSnd]
type = PlaySnd
triggerall = var(1) = 0
trigger1 = animelem = 1
value = S5,12

[State 0, SSJVoiceSnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 1
value = S5,17
[State 0, SSJVoiceSnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 1
value = S5,17

[State 1550, Base Hit]
type = hitdef
triggerall = var(1) = 0
trigger1 = !(var(16)) && (var(15) < 1 || var(20))
trigger1 = Animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 35, 35, fvar(11) * 35)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 8,16), ifelse(var(20), 8, 16)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), 0, 0), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -12.31, -3.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -60
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1550, Base Hit]
type = hitdef
triggerall = var(1) = 0
trigger1 = !(var(16)) && (var(15) < 1 || var(20))
trigger1 = Animelem = 9
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 35 < 35, 35, fvar(11) * 35)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4,12), ifelse(var(20), 4, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), 0, 0), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -12.31, -3.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -60
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1552, Base Hit]
type = hitdef
triggerall = var(1) = 0
trigger1 = !(var(16)) && (var(15) < 1 || var(20))
trigger1 = Animelem = 13
forcenofall = !var(20)
ID = 1502
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 65 < 65, 65, fvar(11) * 65)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 10,12), ifelse(var(20), 10, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -17.41, -17.49), -3
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -12.31, -3.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -48
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48


[State 1550, SSJ Hit]
type = hitdef
triggerall = var(1) = 1
trigger1 = !(var(16)) && (var(15) < 1 || var(20))
trigger1 = Animelem = 2
forcenofall = !var(20)
ID = 1502
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 65 < 65, 65, fvar(11) * 65)), 4
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 8,12), ifelse(var(20), 8, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -17.41, -17.49), -3
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -12.31, -3.36
air.cornerPush.velOff = 0
yAccel = 0.4
kill = 0
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -48
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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

[State 1300, ChangeState]
type = ChangeState
triggerall = var(1) = 0
triggerall = prevstateno!=1550
trigger1= movehit && Time >=41
value = 1504
ignorehitpause=1

[State 1300, ChangeState]
type = ChangeState
triggerall = var(1) = 1
triggerall = prevstateno!=1550
trigger1=movehit && p2stateno = 1111302
value = 1551
ignorehitpause=1

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 101

;-----------------------------------
;EX Dash Kick Cont.(SSJ Atomic Blast)
[Statedef 1551]
type = S
physics = S
movetype = A
anim = 1551
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 0
facep2 = 1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1551

[State 3000, width]
type = width
trigger1 = animelemtime(9) = 0
value = 50, 0

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

[State 0, PosSet]
type = Posadd
trigger1 = animelem = 5
x = P2Dist X -230

[State 0, Teleport PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, Aura PlaySnd]
type = PlaySnd
trigger1 = time = 30
value = S6,2
[State 0, Aura PlaySnd]
type = PlaySnd
trigger1 = time = 30
value = S6,2

[State 0, Aura PlaySnd]
type = PlaySnd
trigger1 = !animtime
value = S6,2
[State 0, Aura PlaySnd]
type = PlaySnd
trigger1 = !animtime
value = S6,2

[State 0, Blast PlaySnd]
type = PlaySnd
trigger1 = time = 35
value = S6,4
[State 0, Blast PlaySnd]
type = PlaySnd
trigger1 = time = 35
value = S6,4
[State 0, Blast PlaySnd]
type = PlaySnd
trigger1 = time = 35
value = S6,5

[State 0, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,26
[State 0, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,26
[State 0, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,26

[State 730, SSJ Aura]
type = helper
triggerall = animelem = 9
trigger1 = !numhelper(6000) && var(1)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.27
size.yscale = 0.33
ownpal = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 10
id = 4204
ignorehitpause = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = time = 30
value = 255,255,255
time = 2

[State 0, Helper]
type = Helper
trigger1 = time = 35
helpertype = normal ;player
name = "Hand Atomic Blast FX"
ID = 1317
stateno = 1317
pos = 35,-35
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .9
size.yscale = .9
ignorehitpause = 1

[State 0, Helper]
type = Helper
trigger1 = time = 35
helpertype = normal ;player
name = "Atomic Blast"
ID = 1555
stateno = 1555 
pos = 55,-70
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
size.xscale = .3
size.yscale = .25

[State 1550, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;------------------------------------------------------------------
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

[STATE 2900,ANIM]
type=changeanim
trigger1=!time
value=2900

[STATE 2900,DUST]
type = helper
trigger1 = Animelem=3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[state 3351]
type = posadd
trigger1 = animelem = 1
x = -10+P2Dist x
y = 0

[STATE 2900,WIDTH]
type = Width
trigger1 = 1
edge = 0,0

[STATE 2900,NOT HIT BY]
type = NotHitBy
trigger1 = Anim = 2900
trigger1 = AnimElemNo(0) = [1,5]
value = SCA
time = 1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S6,0

[State 0, Hand Blast Explod Snd]
type = PlaySnd
trigger1 = Animelem = 5
value = S6,1

[State 0, Explod]
type = Explod
trigger1 = Animelem = 5
anim = 2901
ID = 2901
pos = 40,-60
postype= p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 14
scale = .4,.4
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,45
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,45

[State 205, Pause]
type = Pause
trigger1 = animelem = 5 && movehit
time = 2
movetime = 1
anim = -1

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= Animelem = 3
ID = 2900
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getpower = 0
givepower = 0, 0
pausetime = 8, 30
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Heavy
air.animtype = Heavy
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = 2,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 2,0
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-57
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= Animelem = 5
ID = 2900
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
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
ground.velocity = -3,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=6)
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
trigger1 = AnimElemTime(7) >= 0
moveType = I

[STATE 2900,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
 
;KICK ZERO COUNTER
[STATEDEF 2910]
type = S
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

[STATE 2910,NOT HIT BY]
type = nothitby
trigger1 = animelemtime(6) < 0
value = SCA
time = 1
ignorehitpause = 1

[STATE 2910,WIDTH]
type = Width
trigger1 = 1
edge = 20,0

[STATE 2910,HIT]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
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
trigger1 = AnimElemTime(6) >= 0
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1