; _________________________________________
;| Elektrosoldat by Saikou Shiva           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< HELPER STATES >========================================
;==============================================================================================

;========================< PALETTE SELECTOR >=============================
;Palette Selector
[Statedef 256]
physics = N
anim = 256
velset=0,0
sprpriority=99999
 
[State 256, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-90
y = 20
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 256, Reset]
type=varset
trigger1=!time
var(29)=200
[State 256, Pal]
type=varset
trigger1=!time
fvar(0)=root,fvar(0)
[State 256, Pal]
type=varset
trigger1=!time
fvar(27)=root,fvar(27)

[State 256, Varset]
type=varset
trigger1=fvar(0)<1||fvar(0)>fvar(27)
fvar(0)=1+(fvar(0)<1)*((fvar(27))-1)

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 20
[State 256, PlaySnd]
type = PlaySnd
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=var(29)<=5
value = S256,1
volumescale = 50
channel = 20
persistent =0 

[State 256, Countdown]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 256, Countdown]
type = VarAdd
trigger1=!var(10)&&var(29)<150
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=25

[State 256, Varadd]
type=varadd
trigger1=!var(10)
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
fvar(0)=1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

[State 256, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 256, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 256, End]
type=changestate
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=var(29)<=0
trigger3=root, var(56) = 3
trigger4=root,AILevel
value = 257

[State 256, End]
type=destroyself
triggerall=ishelper(256) && root, var(56) = 1
trigger1=root, var(56) < 3
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=root, var(56) < 3
trigger2=var(29)<=0
trigger3=root,AILevel



;Mode Select
[Statedef 257]
physics = N
anim = 257+root,var(54)
velset=0,0
sprpriority=99999
 
[State 257, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-90
y = -4
ignorehitpause = 1

[State 257, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 257, Reset]
type=varset
trigger1=!time
var(29)=150
[State 257, Reset]
type=varset
trigger1=!time
var(11)=parent,var(54)
[State 257, Reset]
type=parentvarset
trigger1=1
var(54)=(anim-257)

[State 257, Varset]
type=varset
trigger1 =var(10)=1
var(10)=Ifelse(var(11)=0,1,0)
[State 257, ChangeAnim]
type = ChangeAnim
trigger1 =var(10)=1
value = Ifelse(anim=257,258,257)

[State 257, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S257,0
volumescale = 50
channel = 25
[State 257, PlaySnd]
type = PlaySnd
triggerall = time >= 8
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=var(29)<=5
value = S257,1
volumescale = 50
channel = 20
persistent =0 

[State 257, Countdown]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 257, Countdown]
type = VarAdd
trigger1=!var(10)&&var(29)<100
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=20

[State 257, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 257, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 257, End]
type=destroyself
trigger1=root,AILevel
[State 257, Change]
type=destroyself
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||(var(29)<=140&&root,command="start")||roundstate=2
trigger2=var(29)<=0
trigger3 = root, var(56) =1

;--------------------------------------------------------------
; Blitz Projectile
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
anim = ifelse(root,fvar(0) = 9, 1040, ifelse(root,fvar(0) = 4, 1006, 1005))
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != ifelse(root,fvar(0) = 9, 1040, ifelse(root,fvar(0) = 4, 1006, 1005))
value = ifelse(root,fvar(0) = 9, 1040, ifelse(root,fvar(0) = 4, 1006, 1005))

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, VelSet]
type = VelSet
trigger1 = 1
x = ifelse(var(10)=2, 6.75, ifelse(var(10)=1, 3.0, 4.05))

[State 1005, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1 + 0.2*((time % 3)=[2,3]), 1 + 0.2*((time % 3)=[2,3])
ignorehitpause=1

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Projectile Flag On]
type = ParentVarSet
trigger1 = !Time
var(39) = 1

[State 1005, Startup FX]
type = Explod
trigger1 = time = 1
anim = 1004
sprPriority = 3
posType = P1
vel = -2.6,0
accel = -0.15, 0
scale = 0.75 * const(size.xScale),0.75
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(root,fvar(11) * ifElse(var(10) = 2, 63, ifElse(var(10), 56, 49)) < 7, 7, root,fvar(11) * ifElse(var(10) = 2, 63, ifElse(var(10), 56, 49)))), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 14
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 22
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, HitDef (Intro)]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo = 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 0,0
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1005, Projectile Flag Off]
type = ParentVarSet
trigger1 = pos x != [-200/(root,fvar(7)),200/(root,fvar(7))]
var(39) = 0

[State 1005, End]
type = DestroySelf
trigger1 = pos x != [-200/(root,fvar(7)),200/(root,fvar(7))]

;--------------------------------------------------------------
;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State -2, Stun System - Add]
type = parentvaradd
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root,var(20) = 0
trigger1 = root,fvar(22) >= 0
trigger1 = hitdefattr != SCA, HA, HP, HT
trigger1 = movehit = 1
fvar(22) = ceil((ifelse(prevstateno=1035,160,90)) * (parent,fvar(11)))
ignorehitpause = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignoreHitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = 1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
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

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 4 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1007, 1035)

;--------------------------------------------------------------
;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
anim = ifelse(root,fvar(0) = 9, 1041, ifelse(root,fvar(0) = 4, 1008, 1007))
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, Projectile Flag Off]
type = ParentVarSet
trigger1 = !Time
var(39) = 0

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 2
volume = -128
lowPriority = 1

;[State 1007, Transparency]
;type = Trans
;trigger1 = 1
;trans = AddAlpha
;alpha = 256,256
;ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;--------------------------------------------------------------
;Wait
[StateDef 1008]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;--------------------------------------------------------------
; EX Blitz Projectile
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3

[State 1035, Projectile Hits Left]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 1035, Projectile Hits Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = ifElse(var(2) < 2, 1035, 1007)
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != ifelse(root,fvar(0) = 9, 1040, ifelse(root,fvar(0) = 4, 1036, 1035))
value = ifelse(root,fvar(0) = 9, 1040, ifelse(root,fvar(0) = 4, 1036, 1035))

[State 1035, VelSet]
type = VelSet
trigger1 = Time > 1 && !PrevStateNo
trigger2 = PrevStateNo
x = ifElse(Time < 2 && var(0) < 2, 1, 5.35)

[State 1005, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1 + 0.2*((time % 3)=[2,3]), 1 + 0.2*((time % 3)=[2,3])
ignorehitpause=1

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Projectile Flag On]
type = ParentVarSet
trigger1 = !Time
var(39) = 1

[State 1035, Startup FX]
type = Explod
trigger1 = time = 1
anim = 1004
sprPriority = 3
posType = P1
vel = -2.6,0
accel = -0.15, 0
scale = 0.75 * const(size.xScale),0.75
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1035, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = var(0) > 0
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(root,fvar(11) * ifElse(var(0) < 2, 49, 35) < 7, 7, root,fvar(11) * ifElse(var(0) < 2, 49, 35))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 4, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 4, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -6.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -32
palfx.time = 22
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1035, End]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 1006, 1007)
ignoreHitPause = 1

[State 1035, End]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1035, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
value = 1007
ignoreHitPause = 1

[State 1035, Projectile Flag Off]
type = ParentVarSet
trigger1 = pos x != [-200/(root,fvar(7)),200/(root,fvar(7))]
var(39) = 0

[State 1035, End]
type = DestroySelf
trigger1 = pos x != [-200/(root,fvar(7)),200/(root,fvar(7))]

;-------------------------------------------------------------
; Größer Blitzkugel Projectile
[Statedef 3105]
type = S
physics = N
moveType = A
ctrl = 0
anim = ifElse(root,fvar(0) = 4, 3110, 3105)
sprPriority = 4

[State 3105, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 3105, 3106)
ignorehitpause = 1

[State 3105, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3105, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5

[State 3105, Vel]
type = velset
trigger1 = 1
x = 3.25

[State 3105, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 3105, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(18) = 1
ignorehitpause = 1

[State 3105, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3105, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 3105, Miss]
type = HitDef
trigger1 = 1
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 3105, Hit]
type = Hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5 || Root, var(20))
trigger1 = 1
attr = S, HP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifElse(root,fvar(11) * 56 < 7, 7, root,fvar(11) * 56)), 7
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -4
p2facing = 1
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 22
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3105, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3105, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = 1
ownPal = 1
persistent = 0
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3105, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(9))
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

[State 3105, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3105, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3105, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3105, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 3105, 3106)

[State 3105, End]
type = destroyself
trigger1 = pos x != [-200/(root,fvar(7)),200/(root,fvar(7))]

;-------------------------------------------------------------
; Projectile Hit
[Statedef 3106]
type = A
physics = N
movetype = I
anim = 3106
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3106, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1005, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 2, 2
ignorehitpause=1

[State 3106, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3106, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0

[State 3106, End]
type = destroyself
trigger1 = !animtime

;-------------------------------------------------------------
; Größer Blitzkugel Projectile
[Statedef 3155]
type = S
physics = N
moveType = A
ctrl = 0
anim = ifElse(root,fvar(0) = 4, 3110, 3105)
sprPriority = 4

[State 3155, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3155, 3106)
ignorehitpause = 1

[State 3155, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3155, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5

[State 3155, Vel]
type = velset
trigger1 = 1
x = 1.75

[State 3155, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 3155, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(18) = 1
ignorehitpause = 1

[State 3155, timevar]
type = varadd
trigger1 = time && var(4) < 25
var(4) = 1

[State 3155, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3155, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 3155, Miss]
type = HitDef
trigger1 = 1
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 3155, Hit]
type = Hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 10 || Root, var(20))
trigger1 = 1
attr = S, HP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifElse(root,fvar(11) * 49 < 7, 7, root,fvar(11) * 49)), 7
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -4
p2facing = 1
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 22
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3155, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3155, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = 1
ownPal = 1
persistent = 0
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3155, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(9))
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

[State 3155, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3155, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3155, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3155, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3155, 3106)

[State 3155, End]
type = destroyself
trigger1 = pos x != [-200/(root,fvar(7)),200/(root,fvar(7))]


;CAMERA FOCUS
[Statedef 6001]
type = S
physics  = S
anim = 0
ctrl = 0

[state 6001,TURN]
type=turn
trigger1=ishelper(6001)
trigger1=facing!=root,facing
ignorehitpause=1

[State 6001,vel]
type = VelSet
trigger1 = parent,pos X > 0
x = ifelse(facing = 1,4,-4)
[State 6001,vel]
type = VelSet
trigger1 = parent,pos X < 0
x = ifelse(facing = 1,-4,4)
[State 6001,vel]
type = VelSet
trigger1 = parent,pos X = [-5,5]
x = 0

[State 6001, WIDTH]
type = Width
trigger1 = 1
value = 1,1

[State 6001, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 6001,AS]
type = AssertSpecial
Trigger1 = 1
flag = invisible
flag2 = noshadow

[State 6001,Bound]
type = ScreenBound
trigger1 =1
value =1
movecamera = 320,0
[State 6001,push]
type = PlayerPush
trigger1 =1
value = 0

[State 0, Varset]
type = Varset
trigger1 = 1
fvar(11) = root, pos x
[State 0, Varset]
type = Varadd
trigger1 = 1
var(10) = ifelse(fvar(10) != fvar(11),-var(10),1)
[State 0, VelSet]
type = Varset
trigger1 = 1;
fvar(10) = root, pos x

[State 6001, Destroyself]
type = destroyself
trigger1 = Time >= 50
trigger1 = enemy, Life >= 1
trigger2=numhelper(6001)>=2
trigger3 = root, fvar(35)>1
trigger3 = var(10)>=20


;========================<SPARKS>=============================
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)
ignorehitpause = 1

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.3 - (Time * 0.03)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.3 - (Time * 0.03)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignorehitpause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,var(57)=2)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.15 + (0.009375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.15 + (0.009375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.15 + (0.009375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.15 + (0.009375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.3 - (0.0375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.3 - (0.0375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16


;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.35 - (Time * 0.035)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.35 - (Time * 0.035)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignorehitpause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011+(root,var(57)=2)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.175 + (0.0109375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.175 + (0.0109375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.175 + (0.0109375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.175 + (0.0109375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.35 - (0.04375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.35 - (0.04375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16


;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.4 - (Time * 0.04)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.4 - (Time * 0.04)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignorehitpause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,var(57)=2)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.2 + (0.0125 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.2 + (0.0125 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.2 + (0.0125 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.2 + (0.0125 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.4 - (0.05 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.4 - (0.05 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8010+(root,var(57)=1)*40+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.45 - (Time * 0.045)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.45 - (Time * 0.045)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignorehitpause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,var(57)=1)*40+(root,var(57)=2)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.225 + (0.0140625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.5,ifelse(root,var(46)=3,0.65,1))), (0.225 + (0.0140625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,var(57)=1)*40+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod (Classic)]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.225 + (0.0140625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.225 + (0.0140625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod (Classic)]
type = Explod
triggerall = root, var(57)!=2
trigger1 = !Time
anim = 8013+(root,var(57)=1)*40+(root,var(57)=2)*60
ID = 3
posType = P1
facing = 1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod (PotS 2022)]
type = ModifyExplod
triggerall = root, var(57)!=2
trigger1= NumExplod(3)
ID = 3
scale = (0.4) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.4) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, P2 Back (PotS 2022)]
type = explod
triggerall = root, var(57)=2
triggerall = !time
triggerall = parent, numtarget
trigger1 = numenemy = parent, numtarget
trigger2 = numenemy > parent, numtarget
trigger2 = abs(enemynear(0), pos x - enemynear(1), pos x) >= 120
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8013, Position (PotS 2022)]
type = modifyexplod
triggerall = root, var(57)=2
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8013, Scale]
type = modifyexplod
triggerall = root, var(57)=2
trigger1 = numexplod(3)
ID = 3
scale = (0.25 + (0.03125 * time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.25 + (0.03125 * time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.45 - (0.05625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.45 - (0.05625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8010+(root,var(57)=1)*50+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.5 - (Time * 0.05)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.5 - (Time * 0.05)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignorehitpause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,var(57)=1)*50+(root,var(57)=2)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.25 + (0.015625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.25 + (0.015625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,var(57)=1)*50+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.25 + (0.015625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.25 + (0.015625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod (Classic)]
type = Explod
triggerall = root,var(57)!=2
trigger1 = !Time
anim = 8013+(root,var(57)=1)*50+(root,var(57)=2)*60
ID = 3
posType = P1
facing = 1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod (Classic)]
type = ModifyExplod
triggerall = root,var(57)!=2
trigger1 = NumExplod(3)
ID = 3
scale = (0.5) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.5) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, P2 Back (PotS 2022)]
type = explod
triggerall = root,var(57)=2
triggerall = !time
triggerall = parent, numtarget
trigger1 = numenemy = parent, numtarget
trigger2 = numenemy > parent, numtarget
trigger2 = abs(enemynear(0), pos x - enemynear(1), pos x) >= 120
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8014, Position (PotS 2022)]
type = modifyexplod
triggerall = root,var(57)=2
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8014, Scale (PotS 2022)]
type = modifyexplod
triggerall = root,var(57)=2
trigger1 = numexplod(3)
ID = 3
scale = (0.30 + (0.0375 * time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1))), (0.30 + (0.0375 * time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.5,1)))
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.5 - (0.0625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.5 - (0.0625 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16


;Normal Slash Spark
[StateDef 8015]
type = A
physics = N
moveType = I
anim = 8015+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8015, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8015, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8015, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = ((0.5 + (Time * 0.15)) / 2)*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), ((1 - (Time * 0.1)) / 2)*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignoreHitPause = 1

[State 8015, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8015, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8015, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8015, Particles]
type = Explod
trigger1 = time<8 && root,var(57)=1
anim = 8017+(root,var(57)=2)*60
ID = 17
postype = p1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -4+random%10
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
scale = 0.15,0.15
vel = Ifelse(random<500,2+random%2,-4+random%2), -5 + (random / 90.0)
accel = -1||1,-1||1
ignorehitpause = 1

[State 8015, Scale Particles]
type = ModifyExplod
trigger1 = NumExplod(17)
ID = 17
scale = (0.2 - (0.005 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.2 - (0.005 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256
ignorehitpause = 1

[State 8015, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.2 + (0.0125 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.2 + (0.0125 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8015, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8015, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Slash Spark
[StateDef 8016]
type = A
physics = N
moveType = I
anim = 8015+(root,var(57)=1)*40+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8016, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8016, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8016, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = ((0.5 + (Time * 0.15)) / 2)*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), ((1 - (Time * 0.1)) / 2)*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignoreHitPause = 1

[State 8016, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8016, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8016, Circle]
type = Explod
trigger1 = !Time
anim = 8016+(root,var(57)=1)*40+(root,var(57)=2)*60
ID = 8016
posType = p1
removeTime = 10
sprPriority = 5
pauseMoveTime = -1
superMoveTime = -1

[State 8016, Circle Scale]
type = ModifyExplod
trigger1 = NumExplod(8016)
ID = 8016
scale = (0.25 + (0.025 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.25 + (0.025 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = ceil(256 - 25.6 * Time), 256

[State 8016, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,var(57)=1)*40+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8016, Particles]
type = Explod
trigger1 = time<8 && root,var(57)=1
anim = 8017+(root,var(57)=1)*40+(root,var(57)=2)*60
ID = 17
postype = p1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -4+random%10
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
scale = 0.15,0.15
vel = Ifelse(random<500,2+random%2,-4+random%2), -5 + (random / 90.0)
accel = -1||1,-1||1
ignorehitpause = 1

[State 8016, Scale Particles]
type = ModifyExplod
trigger1 = NumExplod(17)
ID = 17
scale = (0.225 - (0.005 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.225 - (0.005 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256
ignorehitpause = 1

[State 8016, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.225 + (0.0140625 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.225 + (0.0140625 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8016, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8016, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Move Slash Spark
[StateDef 8017]
type = A
physics = N
moveType = I
anim = 8015+(root,var(57)=1)*50+(root,var(57)=2)*60
velSet = 0,0
sprPriority = 5

[State 8017, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8017, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8017, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = ((0.5 + (Time * 0.15)) / 2)*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), ((1 - (Time * 0.1)) / 2)*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignoreHitPause = 1

[State 8017, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8017, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8017, Circle]
type = Explod
trigger1 = !Time
anim = 8016+(root,var(57)=1)*50+(root,var(57)=2)*60
ID = 8016
posType = p1
removeTime = 10
sprPriority = 5
pauseMoveTime = -1
superMoveTime = -1

[State 8017, Circle Scale]
type = ModifyExplod
trigger1 = NumExplod(8016)
ID = 8016
scale = (0.3 + (0.03 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.3 + (0.03 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = ceil(256 - 25.6 * Time), 256

[State 8017, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,var(57)=1)*50+(root,var(57)=2)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8017, Particles]
type = Explod
trigger1 = time<10 && root,var(57)=1
anim = 8017+(root,var(57)=1)*50+(root,var(57)=2)*60
ID = 17
postype = p1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -4+random%10
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
scale = 0.15,0.15
vel = Ifelse(random<500,2+random%2,-4+random%2), -5 + (random / 90.0)
accel = -1||1,-1||1
ignorehitpause = 1

[State 8017, Scale Particles]
type = ModifyExplod
trigger1 = NumExplod(17)
ID = 17
scale = (0.25 - (0.005 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.25 - (0.005 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256
ignorehitpause = 1

[State 8017, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.25 + (0.015625 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.25 + (0.015625 * Time))*ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8017, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8017, End]
type = DestroySelf
trigger1 = Time >= 16


;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = (0.25 + (0.09375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1))), (0.25 + (0.09375 * Time)) * ifelse(root,var(46)=1,0.8, ifelse(root,var(46)=2,0.65,ifelse(root,var(46)=3,0.65,1)))
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8

;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8

;Jump dust
[Statedef 8100]
type = S
anim = 1
velset = 0, 0

[State 8100, Bind]
type = bindtoroot
trigger1 = time

[State 8100, Dust]
type = explod
trigger1 = !time
anim = 8100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 8101
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, End]
type = destroyself
trigger1 = time >= 7


;Dash dust
[Statedef 8103]
type = A
anim = 1
velset = 0, 0
sprpriority = 5

[State 8103, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 8103, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 8103
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 -(16 * (time -3)), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 -(16 * (time -6)), 256

[State 8103, End]
type = removeexplod
trigger1 = time >= 22

[State 8103, End]
type = destroyself
trigger1 = !numexplod

;-----------------------------------
;Ground Impact 
[Statedef 8110]
type = A
anim = 1
velset = 0, 0
sprpriority = 5

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8110
ID = ifelse(time = 8, 3, ifelse(time = 4, 2, 1))
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8120
ID = 2
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, Scale]
type = modifyexplod
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 -(64 * (time -4))), 256

[State 8110, End]
type = removeexplod
trigger1 = time >= 8

[State 8110, End]
type = destroyself
trigger1 = !numexplod

;WALL IMPACT DUST
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;FLAMES
[Statedef 8150]
type = A
velset = 0, 0
anim = 1

[State 8150, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8150, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 60, 60
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8150, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;----------------------------------------------------
; ELECTRICITY FX
[StateDef 8155]
type = A
velSet = 0,0
anim = 1

[State 8155, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 8155, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.mid.pos.y))

[State 8155, PosSet (Laying Down)]
type = PosSet
trigger1 = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) - 20

[State 8155, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 8155, Spark Explod]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8155
sprPriority = 3
posType = P1
random = 40,40
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
;bindtime = -1
scale = 0.25, 0.25
ownPal = 1

[State 8155, End]
type = DestroySelf
trigger1 = Time >= 600
trigger2 = !PlayerIDexist(var(0))

[State 8155, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), MoveType != H || PlayerID(var(0)), StateNo = 5300
trigger3 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])
trigger4 = PlayerID(var(0)), PrevStateNo = 1546
trigger5 = PlayerID(var(0)), StateNo = 865

[State 8155, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0)) && Root, MoveHit
trigger1 = Root, StateNo = [200,999]
trigger2 = Root, StateNo = 1200 || Root, StateNo = 1230
trigger3 = (Root, StateNo = 1201 || Root, StateNo = 1231) && Root, AnimElemTime(12) < 0
trigger4 = Root, StateNo = [1400,1499]
trigger5 = Root, StateNo = [3100,3199]

;RECOVER FX
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)
ignoreHitPause = 1

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17.1 * time), 256
ignoreHitPause = 1

[State 8200, End]
type = destroyself
trigger1 = time >= 15


;========================< COUNTER FX >=============================
; COUNTER! text FX
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 9741

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290) && root, fvar(13)<2
anim = 8290
ID = 8290
sprpriority = 64
postype = p1
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8292) && root, fvar(13)>0
anim = 8292
ID = 8292
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = numexplod(8292)
ID = 8292
scale = 0.2 + (0.05 * time), 0.2 + (0.05 * time)
trans = addalpha
alpha = ceil(256 -(16 * time)), 256

[State 8290, Scale]
type = modifyexplod
trigger1 = numexplod(8290) && time < 8
ID = 8290
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 0
[State 8290, Scale]
type = modifyexplod
trigger1 = numexplod(8290) && time >= 8
ID = 8290
scale = 0.5 + .0625 * (time -8), 0.5 + .0625 * (time -8)
trans = addalpha
alpha = 256 -32 * (time -8), 32 * (time -8)

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16
[State 8290, End]
type = destroyself
trigger1 = time >= 16

;MAX MODE TEXT FX
[StateDef 8291]
type = A
physics = N
velSet = 0,0
anim = 1

[State 8291, "Power Up!" Text Explod]
type = Explod
trigger1 = !NumExplod(8291)
anim = 8291
ID = 8291
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8291
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8291
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8291, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8291, End]
type = DestroySelf
trigger1 = Time >= 16

;POWER CHARGE MAIN FX 
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = 0,0

[State 8330, Snd]
type = playsnd
trigger1 = !time
value = 730,0
channel = 0

[State 8330, Aura]
type = explod
trigger1 = !numexplod(8330)
ID = 8330
anim = 8330
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
channel = 0

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 730


;POWER CHARGE Particles 
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type=bindtoroot
trigger1= !(time%8)
pos=ceil(-153+(random/3.125)),ceil(82-(random/3.125))

[State 8331, Particle]
type=explod
trigger1= (time%8)=1
anim=8331
sprpriority=ifelse(random<750,5,-1)
postype=p1
vel= ((rootdist x+1)/32.0), ((rootdist y-75)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 730


;ZERO COUNTER PAUSE
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8350, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8350, Circle]
type = explod
trigger1 = !time
anim = 8350
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 8350, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8351
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, End]
type = destroyself
trigger1 = time >= 16


;CUSTOM COMBO
[Statedef 8400]
type = A
physics = N
movetype = I
anim = 8400
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8400, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = time < 25
time = 1
mul = 128, 128, 128

[State 8400, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8400, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8400, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
ignoreHitPause = 1

[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256
ignoreHitPause = 1

[State 8400, Lines]
type = explod
trigger1 = !time
anim = 8401
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8400, Circle]
type = explod
trigger1 = time = 16
anim = 8402
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 26


;========================< EXCEL COMBO CHARGE >=============================
;Excel Combo Charge
[Statedef 8401]
type = A
velset = 0, 0
anim = 9741

[State 8400, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 35
add = -255, -128, -128
sinadd = 255, 128, 128, 140

[State 8400, FX]
type = explod
trigger1 = !time
anim = 8400
ID = 8400
sprpriority = 5
postype = p1
removetime = 20
supermovetime = -1

[State 8400, FX]
type = explod
trigger1 = time = 15
anim = 8401
ID = 8401
sprpriority = 5
postype = p1
supermovetime = -1

[State 8400, FX]
type = explod
trigger1 = !time
anim = 8402
ID = 8402
sprpriority = 5
postype = p1
removetime = 15
supermovetime = -1

[State 8400, logo]
type = explod
trigger1 = !time
anim = 8403
ID = 8403
sprpriority = -5
postype = p1
facing = facing
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(8400)
ID = 8400
scale = 0.02 * time, 0.02 * time

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(8400) && time >= 15
ID = 8400
scale = 0.02 * time, 0.02 * time
trans = addalpha
alpha = ceil(256 -(51.2 * (time -15))), 256

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(8401)
ID = 8401
scale = 0.1 + (0.1 * (time -15)), 0.1 + (0.1 * (time -15))
trans = addalpha
alpha = ceil(256 -(25.6 * (time -15))), 256

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(8402)
ID = 8402
scale = 2 -(0.133 * time), 2 -(0.133 * time)

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(8403)
ID = 8403
scale = 0.0385 * time, 0.0385 * time
trans = addalpha
alpha = ifelse(time < 15, ceil(17.1 * time), ceil(256 -23.3 * (time -15))), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 30


;========================< EXCEL TIMER >=============================
;Excel Timer
[Statedef 8405]
type = A
physics = N
velset = 0, 0
anim = 9741

[State 8405, Turn]
type = turn
trigger1 = facing = -1

[State 8405, back]
type = explod
trigger1 = !numexplod(8406)
anim = 8406
ID = 8406
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
ontop = 1

[State 8495, front]
type = explod
trigger1 = !numexplod(8407)
anim = 8407
ID = 8407
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
ontop = 1

[State 8405, frame]
type = explod
trigger1 = !numexplod(8405)
anim = 8405
ID = 8405
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
ontop = 1

[State 8405, Scale]
type = modifyexplod
trigger1 = numexplod(8407)
ID = 8407
scale = (root, var(20)) / ifelse(root,fvar(17)>=2,300.0,180.0), 1

[State 8405, Bind]
type = bindtoroot
trigger1 = 1
pos = 20 * (root, facing), 4
time = -1

[State 8405, Safety]
type = removeexplod
trigger1 = (root, var(20) <= 0)

[State 8405, End]
type = destroyself
trigger1 = (root, var(20) <= 0)


;========================< SUPERPAUSE FX >=============================
;--- --Level 1 -----
[Statedef 8500]
type = A
velset = 0, 0
anim = 8500
sprpriority = 5

[State 8520, Lv1 Sound (Classic)]
type = PlaySnd
trigger1 = !time
value = S8500,0

[State 8500, Afterimages]
type = Helper
triggerall = root, var(55)=[1,2]
trigger1 = Time = 0 && (Parent,ID = Root,ID)
helpertype = normal
name = "Afterimages"
ID = 8590
stateno = 8590
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = root,const(size.xscale)
size.yscale = root,const(size.yscale)
supermovetime = 999999
pausemovetime = 999999

[State 8500, Afterimages]
type = Helper
triggerall = root, var(55)=[1,2]
trigger1 = Time = 0 && (Parent,ID = Root,ID)
helpertype = normal
name = "Afterimages"
ID = 8591
stateno = 8590
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = root,const(size.xscale)
size.yscale = root,const(size.yscale)
supermovetime = 999999
pausemovetime = 999999

[State 8500, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 8500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Circle]
type = explod
trigger1 = time = 24
anim = 8502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8500, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 2 -----
[Statedef 8510]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 8520, Lv3 Sound (Classic)]
type = PlaySnd
trigger1 = !time && root, fvar(24) = 0
value = S8500,0
[State 8520, Lv3 Sound (Infinite)]
type = PlaySnd
trigger1 = !time && root, fvar(24) = 1
value = S8510,0
[State 8520, Lv3 Sound (PotS 2022)]
type = PlaySnd
trigger1 = !time && root, fvar(24) = 2
value = S8510,1

[State 8500, Afterimages]
type = Helper
triggerall = root, var(55)=[1,2]
trigger1 = Time = 0 && (Parent,ID = Root,ID)
helpertype = normal
name = "Afterimages"
ID = 8590
stateno = 8590
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = root,const(size.xscale)
size.yscale = root,const(size.yscale)
supermovetime = 999999
pausemovetime = 999999

[State 8500, Afterimages]
type = Helper
triggerall = root, var(55)=[1,2]
trigger1 = Time = 0 && (Parent,ID = Root,ID)
helpertype = normal
name = "Afterimages"
ID = 8591
stateno = 8590
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = root,const(size.xscale)
size.yscale = root,const(size.yscale)
supermovetime = 999999
pausemovetime = 999999

[State 8510, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 8510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Circle]
type = explod
trigger1 = time = 24
anim = 8512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8510, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 3 -----
[Statedef 8520]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Lv3 Sound (Classic)]
type = PlaySnd
trigger1 = !time && root, fvar(25) = 0
value = S8500,0
[State 8520, Lv3 Sound (Infinite)]
type = PlaySnd
trigger1 = !time && root, fvar(25) = 1
value = S8520,0
[State 8520, Lv3 Sound (PotS 2022)]
type = PlaySnd
trigger1 = !time && root, fvar(25) = 2
value = S8520,1
[State 8520, Lv3 Sound (Buckus / Mr. Ansatsuken)]
type = PlaySnd
trigger1 = !time && root, fvar(25) = 3
value = S8520,2

[State 8500, Afterimages]
type = Helper
triggerall = root, var(55)=[1,2]
trigger1 = Time = 0 && (Parent,ID = Root,ID)
helpertype = normal
name = "Afterimages"
ID = 8590
stateno = 8590
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = root,const(size.xscale)
size.yscale = root,const(size.yscale)
supermovetime = 999999
pausemovetime = 999999

[State 8500, Afterimages]
type = Helper
triggerall = root, var(55)=[1,2]
trigger1 = Time = 0 && (Parent,ID = Root,ID)
helpertype = normal
name = "Afterimages"
ID = 8591
stateno = 8590
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = root,const(size.xscale)
size.yscale = root,const(size.yscale)
supermovetime = 999999
pausemovetime = 999999

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525+(root,fvar(18))
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525+(root,fvar(18))
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40


;--------------------------------------------------
;Super Afterimages
[Statedef 8590]
physics=N
anim = 9999

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = root,anim
elem = root,animelemno(0)

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 2
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
triggerAll = Time = 0
trigger1 = Root,StateType = A
var(1) = 1

[State 0, VarAdd]
type = Null
triggerall = Time > 0
trigger1 = IsHelper(8590)
trigger1 = 1 || fvar(1):=fvar(1)+.45
trigger1 = 1 || fvar(2):=fvar(2)+ifelse(!var(1),0,-.45)
trigger2 = IsHelper(8591)
trigger2 = 1 || fvar(1):=fvar(1)-.45
trigger2 = 1 || fvar(2):=fvar(2)+ifelse(!var(1),0,.45)

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
pos = fvar(1),fvar(2)

[State 0, Trans]
type = Trans
trigger1 = 1
trans=addalpha
alpha=200-5*(time),56+5*(time)

[State 0, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Time >= 40
trigger2 = Root,MoveType = H


;SUPER FINISH
[StateDef 8600]
type = A
velSet = 0,0
anim = 1

[State 8600, Super Moves Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 8600,0
channel = 0

[State 8600, SndPan]
type = SndPan
trigger1 = Time <= 80
channel = 1
absPan = ceil(sin(GameTime / 20.0 * pi) * 160)

[State 8600, Snd]
type = assertspecial
trigger1 = time <= 80 && root, var(47)!=[1,2]
flag = nomusic

[State 8600, BG PalFX]
type = bgpalfx
triggerall = root,var(41)>=2
trigger1 = time < 16
trigger1 = !(time % 2)
time = 1
color = 0
[State 8600, BG PalFX]
type = bgpalfx
triggerall = root,var(41)>=2
trigger1 = time < 16
trigger1 = (time % 2)
time = 1
color = 0
mul = 128, 32, 0
[State 8600, BG PalFX]
type = bgpalfx
triggerall = root,var(41)>=2
trigger1 = time = [16, 24]
time = 1
color = 32 * (time -16)
mul = 128 + 8 * (time - 16), 32 + 14 * (time - 16), 32 * (time - 16)

[State 8600, BG PalFX]
type = bgpalfx
triggerall = root,var(41)<2
trigger1 = time < 16
time = 1
mul = 0, 0, 0
[State 8600, BG PalFX]
type = bgpalfx
triggerall = root,var(41)<2
trigger1 = time = [16, 24)
time = 1
mul = 32 * (time -16), 32 * (time -16), 32 * (time -16)

[State 8600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && Root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Größer Flak Tritt]
type = varset
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Größer Blitzkugel]
type = varset
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Blitzbombe]
type = varset
trigger1 = !Time && (Root, var(23) = [3300,3399])
var(0) = 4

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), 0.5 + (0.0625 * time)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
under = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG

[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3

[State 8600, End]
type = destroyself
trigger1 = roundstate < 3



;========================= SPECIAL FINISH =================
; Special Finish
[Statedef 8601]
type = A
ctrl = 0
anim = 9741
sprpriority = -10

[State 0, EX Special detection]
type = VarSet
triggerall = !time && root, fvar(26)>2
trigger1 = (root, stateno = 1030)
trigger2 = (root, stateno = 1130)
trigger3 = numhelper(1055)
trigger3 = helper(1055), movecontact
v = 10    ;fv = 10
value = 1

[State 8600, Assert]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = nofg
ignorehitpause=1

[State 8600, Assert]
type = AssertSpecial
trigger1 = root, var(48) = [2,3]
flag = NoMusic
ignorehitpause=1

[State 8600, PlaySnd]
type = PlaySnd
trigger1 = !time && !var(10)
value = S8600,1
volume = 255
channel = 0
persistent=0

[State 8600, PlaySnd]
type = PlaySnd
trigger1 = !time && var(10)
value = S8600,2
volume = 255
channel = 0
persistent=0

[State 8600, PlaySnd]
type = PlaySnd
trigger1 = !time && var(10)
value = S8600,2
volume = 255
channel = 2
persistent=0

[State 8600, Explod]
type = Explod
trigger1 = time = 0
anim =8550
ID = 8600
pos = 0,0
postype = back
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime =30
supermovetime = 9999
pausemovetime = 9999
scale = 1.2,1.2
sprpriority = -990
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1
;persistent =

[State 8600, Explod]
type = Explod
trigger1 = time = 0 && var(10)
anim =8551
ID = 8600
pos = 0,0
postype = back
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime =30
supermovetime = 9999
pausemovetime = 9999
scale = 1.2,1.2
sprpriority = -991
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1
;persistent =

[State 8600, ModifyExplod]
type = ModifyExplod
trigger1 = time>=1
ID = 8600
trans = addalpha
alpha=256-((time)*10),256

[State 8600, End]
type=removeexplod
trigger1= time>=120
trigger2= roundstate<3
[State 8600, End]
type=destroyself
trigger1= roundstate!=3


;========================<DIZZY STARS>=============================
; Dizzy stars
[Statedef 8970]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 0

[State 0, Turn]
type = Turn
trigger1 = facing != 1

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = ifelse(random<250,ifelse(random<500,7,8),ifelse(random<333,ifelse(random<500,5,6),ifelse(random<500,ifelse(random<500,3,4),ifelse(random<500,1,2))))

[State 0, VarSet]
type = Varadd
trigger1 = 1
var(33) = 1

[State 8970, Bullet time]
type = bgpalfx
trigger1 = !time
time = 5
sinadd = 128, 128, 128, 10
ignorehitpause = 1
persistent = 0

[State 8970, Bullet time]
type = varadd
trigger1= numenemy
trigger1 = enemynear, hitshakeover
trigger2 = var(0)
var(0) = 1

[State 8970, Bullet time]
type = pause
triggerall = numenemy
triggerall = enemynear, hitshakeover
trigger1 = var(0) = [1, 16]
trigger2 = var(0) = [17, 32]
trigger2 = !(var(0) % 2)
time = 1

[State 8970, Pos]
type = posset
trigger1 = numenemy
x = enemynear, pos x
y = (enemynear, pos y) + (enemynear, const(size.head.pos.y)) - 16

[State 8970, Pos]
type = posset
trigger1 = numenemy = 1
trigger1 = (enemynear, pos y) > 0
y = (enemynear, const(size.head.pos.y)) - 16

[State 8970, Star]
type = explod
trigger1 = !numexplod(1)
anim = ifelse(var(10)=8,8978,8970+(var(10)-1))
ID = 1
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(2)
anim = ifelse(var(10)=8,8969,8970+(var(10)-1))
ID = 2
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(3)
anim = ifelse(var(10)=8,8979,8970+(var(10)-1))
ID = 3
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(4)
anim = ifelse(var(10)=8,8977,8970+(var(10)-1))
ID = 4
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
postype = p1
pos = ceil(32 * cos((var(33) + 0) / 32.0 * pi)), ceil(6 * sin((var(33) + 0) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((var(33) + 0) / 32.0 * pi), 0.375 + 0.125 * sin((var(33) + 0) / 32.0 * pi)
sprpriority = ifelse(sin((var(33) + 0) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
postype = p1
pos = ceil(32 * cos((var(33) + 32) / 32.0 * pi)), ceil(8 * sin((var(33) + 32) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((var(33) + 32) / 32.0 * pi), 0.375 + 0.125 * sin((var(33) + 32) / 32.0 * pi)
sprpriority = ifelse(sin((var(33) + 32) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
postype = p1
pos = ceil(32 * cos((var(33) + 16) / 32.0 * pi)), ceil(8 * sin((var(33) + 16) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((var(33) + 16) / 32.0 * pi), 0.375 + 0.125 * sin((var(33) + 16) / 32.0 * pi)
sprpriority = ifelse(sin((var(33) + 16) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = ceil(32 * cos((var(33) + 48) / 32.0 * pi)), ceil(8 * sin((var(33) + 48) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((var(33) + 48) / 32.0 * pi), 0.375 + 0.125 * sin((var(33) + 48) / 32.0 * pi)
sprpriority = ifelse(sin((var(33) + 48) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Snd]
type = playsnd
trigger1 = 1
value = 0, 5300
lowpriority = 1
volumescale = 50
channel = 0

[State 8970, End]
type = stopsnd
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemynear, stateno != [1115300, 1115319]
channel = 0

[State 8970, End]
type = removeexplod
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemynear, stateno != [1115300, 1115319]

[State 8970, End]
type = destroyself
trigger1 = !numexplod


;CAMERA CONTROL
[Statedef 8999]
type = S
velset = 0, 0
anim = 1

[State 8999, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
ignoreHitPause = 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2