; _________________________________________
;| Colonel Sanders by IkuTronHD            |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Special 1
[Statedef 1000]
type=S
physics=S
movetype=A
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

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1000, 1000))

[State 1000, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1000, Combo]
type = VarSet
trigger1 = time = 0
fvar(18) = 0
ignorehitpause = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1040,0
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1040,1

[State 1000, 2]
type = Helper
trigger1 = Animelem = 1
pos = 0,0
stateno = 1045
sprpriority = 4
ownpal = 1
id = 1045
helpertype = normal
keyctrl = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = Time >= 15 && !numhelper(1045)
value = 1041
ctrl = 1

;---------------------------------------------------------------------------
;ƒL[ƒ‹I‚í‚è

[Statedef 1041]
type = S
movetype = I
physics = S
poweradd = 0
ctrl = 0
anim = 1041
velset = 0,0

[State 1041, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;“÷•”•ª

[Statedef 1045]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1042
sprpriority = 4
velset = 0,0

[state 1010]
type = explod
trigger1 = Time = 0
anim = 4022
postype = p1
pos = 0,0
sprpriority = 6
ownpal = 1
ID = 4025

[State 1045,0]
type = Bindtoparent
trigger1 = 1
pos = 60,-55
postype = p1

[State 1045, 16]
type = AngleAdd
trigger1 = Time >= 0
value = 1.5*Time

[State 1045, 16]
type = AngleDraw
trigger1 = Time >= 0
;scale = .2*Time,.2*Time

[State 1045]
type = HitDef
trigger1 = Time%10 = 0
attr             = S, SA
animtype         = Hard
damage           = 20-ifelse(Enemy,Gethitvar(hitcount)*3 > 17, 17, Enemy,Gethitvar(hitcount)*3),2
getpower         = 30,10
hitflag		 = MAFLH
guardflag        = HA
priority         = 5
pausetime        = 8,12
sparkno          = s8010
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
guard.sparkno    = s8000
hitsound         = s2,3
guardsound       = s3,0
ground.type      = High
ground.slidetime = 16
ground.hittime   = 19
ground.velocity  = -10,0
guard.velocity   = -7
air.velocity     = -10,0
airguard.velocity= -10,-4.5

[State 1045,2]
type = hitby
trigger1 = 1
value = SCA,AP

[State 1045,3]
type = HitOverride
trigger1 = 1
attr = SCA,AP
stateno = 1046

[State 1045,4]
type = ChangeState
trigger1 = parent,anim = [5000,5300]
trigger2 = time >= 40
trigger3 = parent,movetype = H
value = 1047

;---------------------------------------------------------------------------
;”½ŽË

[Statedef 1046]
type    = S
movetype= A
physics = N
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1046, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1046,2]
type = PlaySnd
trigger1 = Time = 0
value = 3,16
channel = 2

[State 1046,Super]
type = Helper
trigger1 = time = 0
id = 1048
name = "reflect"
pos = 0,0
postype = P1
stateno = 1048
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1046,1]
type = ChangeState
trigger1 = time = 1
value = 1045
;---------------------------------------------------------------------------
;“÷Á‚¦‚é

[Statedef 1047]
type = A
movetype= I
physics = N
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1047, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1047, 16]
type = AngleDraw
trigger1 = 1
scale = .2*(5-Time),.2*(5-Time)

[State 1047, 1]
type = Trans
trigger1 = 1
trans = add

[state 1010]
type = Explod
trigger1 = Time = 5
anim = 4022
postype = p1
pos = 0,0
sprpriority = 6
ownpal = 1
ID = 4025

[State 1047,1]
type = DestroySelf
trigger1 = time = 5

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;”ò‚Ô“÷

[Statedef 1048]
type    = S
movetype = A
physics = N
ctrl = 0
velset = 20,0
anim = 1043
sprpriority = 4

;[State 1048,2]
;type = hitby
;trigger1 = 1
;value = SAC,NP,SP,HP

;[State 1048,3]
;type = HitOverride
;trigger1 = Time > 0
;attr = SCA,NP,SP,HP
;stateno=-1

[State 1048, 16]
type = AngleAdd
trigger1 = Time >= 0
value = 1.5*Time

[State 1048, 16]
type = AngleDraw
trigger1 = Time >= 0
;scale = .2*Time,.2*Time

[State 1048, tes]
type = PlaySnd
trigger1 = Time = 0
value = 3000,2;

[State 1048, 2]
type = Hitdef
trigger1 = Time = 0
attr = S, SP
hitflag = MA

[State 1048, ChangeState]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= 10
trigger2 = MoveHit = 1
value = 1049

;---------------------------------------------------------------------------
;ƒL[ƒ‹”š”­

[Statedef 1049]
type    = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 4300

[State 1048, 2]
type = Hitdef
trigger1 = Time = 0
attr = S, SP
damage = 40-ifelse(Enemy,Gethitvar(hitcount)*5 > 42,42,Enemy,Gethitvar(hitcount)*5),5
hitflag = MA
guardflag = MA
pausetime = 3,3
guard.pausetime = 3,3
sparkno = s8010
guard.sparkno = s8000
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound = s2,3
guardsound = s3,0
ground.type = high
ground.slidetime = 18
ground.hittime = 18
air.hittime = 18
guard.ctrltime = 18
ground.velocity = -4.5, -6
guard.velocity = -8
air.velocity = -4.5, -6
airguard.velocity = -5.33,-1
palfx.time = 30
palfx.add = 150,0,-100
palfx.sinadd = 50,50,0,10
palfx.color = 0
palfx.invertall = 1
sprpriority = 3

[State 1049, Voice]
type = PlaySnd
triggerall = !root,var(36)
trigger1 = time = 1
value = 6, 6

[State 1049, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1
;===========================================================================

;---------------------------------------------------------------------------
;EX Special 1
[Statedef 1050]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

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
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1050, ‹­Žã]
type = VarSet
triggerall = (var(0) = 0)
trigger1 = Time = 0
v = 53
value = ifelse((command="y"),1,0)
IgnoreHitPause = 1
Persistent = 1

[State 1050, ‹­Žã];‚`‚h—p
type = VarSet
triggerall = (var(0) = 1)
trigger1 = Time = 0
v = 53
value = 1
IgnoreHitPause = 1
Persistent = 1

[State 1050, •¨—“I‚ÈƒLƒƒƒ‰‚Ì•]
type = Width
trigger1 = (AnimElemTime(3) >= 0) && (AnimElemTime(14) < 0)
edge = 5,0

[State 1050, Ž²ˆÊ’u]
type = PosSet
trigger1 = 1
y = 0

[state 1050]
type = velset
trigger1 = animelem = 4
x = 11

[state 1050]
type = velset
trigger1 = animelem = 5
x = 0

[state 1050]
type = explod
trigger1 = animelem = 2
anim = 4022
postype = p1
pos = 10,-85
sprpriority = 1
ownpal = 1
ID = 4025

[state 1050]
type = explod
trigger1 = animelem = 2
anim = 4022
postype = p1
pos = 50,-83
sprpriority = 1
ownpal = 1
ID = 4025

[state 1050]
type = explod
trigger1 = animelem = 2
anim = 4022
postype = p1
pos = 90,-80
sprpriority = 1
ownpal = 1
ID = 4025

[state 1050]
type = explod
trigger1 = animelem = 6
anim = 4022
postype = p1
pos = 10,-60
sprpriority = 1
ownpal = 1
ID = 4025

[state 1050]
type = explod
trigger1 = animelem = 6
anim = 4022
postype = p1
pos = 50,-30
sprpriority = 1
ownpal = 1
ID = 4025

[state 1050]
type = explod
trigger1 = animelem = 6
anim = 4022
postype = p1
pos = 90,-20
sprpriority = 1
ownpal = 1
ID = 4025

[State 1050]
type = PlaySnd
trigger1 = Time = 6
value = 1,2

[State 1000]
type = HitDef
trigger1 = Time = 6
attr             = S, SA
animtype         = Back
damage           = 70-ifelse(Enemy,Gethitvar(hitcount)*5 > 35, 35, Enemy,Gethitvar(hitcount)*5),4
getpower         = 30,10
guardflag        = M
priority         = 5
pausetime        = 8,12
sparkno          = s8012
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
guard.sparkno    = s8000
hitsound         = s2,5
guardsound       = s3,0
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 19
ground.velocity  = ifelse(var(35)=1,-1.2,-2.4),0
guard.velocity   = -7
air.velocity     = ifelse(var(35)=1,-1.8,-2.4),-2
airguard.velocity= -6,-4.5

[State 1000]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Special 2
[Statedef 1055]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1055, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1055, Anim]
type=changeanim
trigger1=!time
value=1055

[State 1055,Posset]
type=posset
trigger1=!time
y=0

[State 1055, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1055, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1055, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1055, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1055, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1055, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 1055, 1]
type = Projectile
trigger1 = AnimElem = 1
projanim = 1043
projhitanim = 4022
projpriority = 1
projheightbound = -240, 100
projedgebound = 100
projscreenbound = 100
projshadow = -1
offset = 47,-41
velocity = 3
attr = S, SP
damage   = 50
animtype = heavy
guardflag = MA
hitflag = MAFDP
pausetime = 10,10
hitsound = s2,4
guardsound = s3,0
sparkno = s8010
guard.sparkno = s8000
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
air.fall = 1
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
p2stateno = 5950

[State 1055, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ƒEƒBƒ“ƒO
;---------------------------------------------------------------------------

[Statedef 1110]
type     = S
movetype = A
physics  = N
juggle   = 2
poweradd = 60
ctrl     = 0
anim     = 1010
velset   = 0,0

[state 1110]
type = explod
trigger1 = animelem = 1
anim = 4022
postype = p1
pos = -10,-80
sprpriority = 1
ownpal = 1
ID = 4025

[state 1110]
type = explod
trigger1 = animelem = 1
anim = 4022
postype = p1
pos = -30,-100
sprpriority = 1
ownpal = 1
ID = 4025

[state 1110]
type = explod
trigger1 = animelem = 1
anim = 4022
postype = p1
pos = -50,-120
sprpriority = 1
ownpal = 1
ID = 4025

[state 1110]
type = explod
trigger1 = animelem = 1
anim = 4022
postype = p1
pos = -40,-140
sprpriority = 1
ownpal = 1
ID = 4025


[State 1110, ‹­Žã]
type = VarSet
triggerall = (var(0) = 0)
trigger1 = Time = 0
v = 53
value = ifelse((command="y"),1,0)
IgnoreHitPause = 1
Persistent = 1

[State 1110, ‹­Žã];‚`‚h—p
type = VarSet
triggerall = (var(0) = 1)
trigger1 = Time = 0
v = 53
value = 1
IgnoreHitPause = 1
Persistent = 1

[State 1110, ƒXƒe[ƒg•ÏX]
type = ChangeState
trigger1 = AnimTime = 0
value = 1111

;---------------------------------------------------------------------------
”ò‚Ñã‚ª‚è

[Statedef 1111]
type    = A
movetype= A
physics = N
velset = 2.0,-12
anim = 1011

[state 1111]
type = explod
trigger1 = animelem = 5
anim = 4022
postype = p1
pos = -30,-70
sprpriority = 1
ownpal = 1
ID = 4025

[state 1111]
type = explod
trigger1 = animelem = 5
anim = 4022
postype = p1
pos = -40,-80
sprpriority = 1
ownpal = 1
ID = 4025

[state 1111]
type = explod
trigger1 = animelem = 5
anim = 4022
postype = p1
pos = -70,-90
sprpriority = 1
ownpal = 1
ID = 4025

[state 1111]
type = explod
trigger1 = animelem = 5
anim = 4022
postype = p1
pos = -50,-100
sprpriority = 1
ownpal = 1
ID = 4025

[State 1111]
type = PlaySnd
trigger1 = Time = 6
value = 0,2

[State 1111]
type = PlaySnd
trigger1 = Time = 10
value = 0,21

[State 1111]
type = HitDef
trigger1 = Time = 0
attr             = S, SA
animtype         = Up
damage           = 45-ifelse(Enemy,Gethitvar(hitcount)*5 > 35,35,Enemy,Gethitvar(hitcount)*5),4
getpower         = 30,10
hitflag		 = MA
guardflag        = MA
priority         = 5
pausetime        = 8,12
sparkno          = s8012
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
guard.sparkno    = s8000
hitsound         = s2,5
guardsound       = s3,0
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 19
ground.velocity  = -2.4,-8
guard.velocity   = -7
air.velocity     = -2.4,0
airguard.velocity= -6,-4.5
fall = 1
fall.recover = 0

[State 1111]
type = VelAdd
trigger1 = 1
y = .60

[State 1111]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 52

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
trigger1 = AnimElemTime(4) >= 5
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
edge = 40,0

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
trigger1 = AnimElemTime(6) >= 3
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1