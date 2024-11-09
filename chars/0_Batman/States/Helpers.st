; _________________________________________
;| Batman by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;====================<PARRY HELPER>=========================
[StateDef 765]
type = A
physics = N
moveType = I
anim = ifElse(Root, StateType = C, 766, ifElse(Root, StateType = A, 767, 765))
velSet = 0,0
ctrl = 0

[State 765, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 765, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1

[State 765, Change to Crouching]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "down"
trigger2 = Root, AILevel && (Root, StateType != A) && P2StateType = C
value = 766

[State 765, Change to Standing / Jumping]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "fwd"
trigger2 = Root, AILevel && Anim != 766
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Change to Standing / Jumping]
type = ChangeAnim
trigger1 = Anim = 765 || Anim = 767
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Disable]
type = VarSet
trigger1 = Time >= ifElse((Root, StateType = A), 7, 8)
trigger2 = Facing != (Root, Facing)
trigger3 = !(Root, ctrl)
trigger3 = (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
var(0) = 1

[State 765, Disable]
type = VarSet
triggerAll = !(Root, AILevel)
trigger1 = (Root, command = "holdback")
trigger2 = Time < 4 && (Root, command = "holdfwd" + Root, command = "holddown") > 1
trigger3 = Time >= 4 && (Root, command = "holdfwd" || Root, command = "holddown")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && Root, command = "fwd") || (Anim = 766 && Root, command = "down"))
var(0) = 1

[State 765, Disable]
type = ChangeAnim
trigger1 = var(0) = 1
value = 1

[State 765, Standing/Air]
type = ReversalDef
trigger1 = !var(0) && (Anim = 765 || Anim = 767)
trigger1 = (Root, StateNo != 5120) || !(Root, AnimTime)
reversal.attr = SCA,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Crouching]
type = ReversalDef
trigger1 = !var(0) && Anim = 766
reversal.attr = SC,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Disable]
type = ReversalDef
trigger1 = var(0) = 1
reversal.attr =
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, End]
type = DestroySelf
trigger1 = Time >= 18
trigger2 = (Root, MoveType != I)
trigger3 = !(Root, ctrl) && (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
trigger4 = (Root, StateNo = [760,762]) && (Root, Time <= 1)


;Success
[StateDef 766]
moveType = I
ctrl = 0

[State 766, Disable]
type = VarSet
trigger1 = 1
var(0) = 1

[State 766, End]
type = DestroySelf
trigger1 = Root, StateNo = [760,762]
trigger2 = Time >= 2



;=====================<NORMAL BATARANG PROJECTILE>=========================
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
velset = 10
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
trigger1 = Anim != 1005
value = 1005

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Boomerang]
type = VelAdd
trigger1 = 1
x = -0.2

[State 1005, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 50
PalContrast =  -2, -2, -1
timegap = 1
framegap = 1
trans = Sub

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

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
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1005, End]
type = DestroySelf
trigger1 = Vel X < 0
trigger1 = Pos X = [parent, Pos X - 30, parent, Pos X + 30]
trigger1 = Pos Y = [parent, Pos Y - 80, parent, Pos Y - 30]
trigger2 = BackEdgeBodyDist <= -120

;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

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
facing = -1
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
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1050]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1035, 1007)

;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
anim = 1007
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1007, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

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
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<ELECTRIC BATARANG PROJECTILE>=========================
[StateDef 1015]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1015
velset = 10
sprPriority = 3

[State 1015, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1017
ignoreHitPause = 1

[State 1015, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1015, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1015
value = 1015

[State 1015, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1015,sound]
type = Playsnd
trigger1 = time = 3
value = 9,1

[State 1015, Boomerang]
type = VelAdd
trigger1 = 1
x = -0.2

[State 1015, elect]
type = Explod
trigger1 = Movehit = 1
anim = 1018
random = 50, 90
pos = 0,-75
postype = p2
scale = .7,.7
sprpriority = 5
bindtime = 1

[State 1015, elect2]
type = Explod
trigger1 = Movehit = 1
anim = 1018
random = 125, 10
pos = -5,-35
scale = .7,.7
postype = p2
sprpriority = 5
bindtime = 1

[State 1015, Spark]
type = Explod
trigger1 = Movehit = 1
anim = 1016
pos = 0, -90
postype = p2
sprpriority = 3
bindtime = -1
ownpal = 1
ontop = 1
persistent = 0

[State 1015, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1015, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1015, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1015, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 45
palfx.add  = -90,0,140
palfx.sinadd = 100,100,100,10
Palfx.color = 0
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1015, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1016
ignoreHitPause = 1

[State 1015, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1017
ignoreHitPause = 1

[State 1015, End]
type = DestroySelf
trigger1 = Vel X < 0
trigger1 = Pos X = [parent, Pos X - 30, parent, Pos X + 30]
trigger1 = Pos Y = [parent, Pos Y - 80, parent, Pos Y - 30]
trigger2 = BackEdgeBodyDist <= -120

;Hit Pause
[StateDef 1016]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1016, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1016, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1016, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1016, Counter FX]
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

[State 1016, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1016, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1016, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1016, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1016, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1045, 1017)

;Disappear
[StateDef 1017]
type = A
physics = N
moveType = A
anim = 1017
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1017, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1017, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1017, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1017, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1017, End]
type = ChangeState
trigger1 = !AnimTime
value = 1018

;Wait
[StateDef 1018]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1018, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EXPLOSIVE BATARANG PROJECTILE>=========================
[StateDef 1025]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
velset = 10
sprPriority = 3

[State 1025, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1027
ignoreHitPause = 1

[State 1025, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1025, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005
value = 1005

[State 1025, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1025, Boomerang]
type = VelAdd
trigger1 = 1
x = -0.2

[State 1025, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1025, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1025, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1025, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 20
palfx.add = 64,32,0
palfx.mul = 512,384,256
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1025, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1026
ignoreHitPause = 1

[State 1025, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1027
ignoreHitPause = 1

[State 1025, End]
type = DestroySelf
trigger1 = Vel X < 0
trigger1 = Pos X = [parent, Pos X - 30, parent, Pos X + 30]
trigger1 = Pos Y = [parent, Pos Y - 80, parent, Pos Y - 30]
trigger2 = BackEdgeBodyDist <= -120

;Hit Pause
[StateDef 1026]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1026, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1026, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1026, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1026, Counter FX]
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

[State 1026, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1026, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1026, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1026, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1050]
var(18) = 1

[State 1026, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1055, 1027)

;Disappear
[StateDef 1027]
type = A
physics = N
moveType = A
anim = 1026
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1027, 20]
type = Explod
triggerall = !numexplod(1027)
trigger1 = time = 0
anim = 1027
ID = 1027
bindtime = 100
pos = 0, -50
scale = .7,.7
postype = p2
ontop = 1

[State 1027, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1027, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1027, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1027, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1027, End]
type = ChangeState
trigger1 = !AnimTime
value = 1028

;Wait
[StateDef 1028]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1028, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX NORMAL BATARANG PROJECTILE>=========================
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
velset = 10
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005
value = 1005

[State 1035, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1035, Boomerang]
type = VelAdd
trigger1 = 1
x = -0.2

[State 1035, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 50
PalContrast =  -2, -2, -1
timegap = 1
framegap = 1
trans = Sub

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1035, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1035, End]
type = DestroySelf
trigger1 = Vel X < 0
trigger1 = Pos X = [parent, Pos X - 30, parent, Pos X + 30]
trigger1 = Pos Y = [parent, Pos Y - 80, parent, Pos Y - 30]
trigger2 = BackEdgeBodyDist <= -120

;=====================<EX ELECTRIC BATARANG PROJECTILE>=========================
[StateDef 1045]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1015
velset = 10
sprPriority = 3

[State 1045, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1017
ignoreHitPause = 1

[State 1045, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1045, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1015
value = 1015

[State 1045, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1045,sound]
type = Playsnd
trigger1 = time = 3
value = 9,1

[State 1045, Boomerang]
type = VelAdd
trigger1 = 1
x = -0.2

[State 1045, elect]
type = Explod
trigger1 = Movehit = 1
anim = 1018
random = 50, 90
pos = 0,-75
postype = p2
scale = .7,.7
sprpriority = 5
bindtime = 1

[State 1045, elect2]
type = Explod
trigger1 = Movehit = 1
anim = 1018
random = 125, 10
pos = -5,-35
scale = .7,.7
postype = p2
sprpriority = 5
bindtime = 1

[State 1045, Spark]
type = Explod
trigger1 = Movehit = 1
anim = 1016
pos = 0, -90
postype = p2
sprpriority = 3
bindtime = -1
ownpal = 1
ontop = 1
persistent = 0

[State 1045, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1045, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1045, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1045, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 45
palfx.add  = -90,0,140
palfx.sinadd = 100,100,100,10
Palfx.color = 0
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1045, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1016
ignoreHitPause = 1

[State 1045, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1017
ignoreHitPause = 1

[State 1045, End]
type = DestroySelf
trigger1 = Vel X < 0
trigger1 = Pos X = [parent, Pos X - 30, parent, Pos X + 30]
trigger1 = Pos Y = [parent, Pos Y - 80, parent, Pos Y - 30]
trigger2 = BackEdgeBodyDist <= -120

;=====================<EX EXPLOSIVE BATARANG PROJECTILE>=========================
[StateDef 1055]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
velset = 10
sprPriority = 3

[State 1055, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1027
ignoreHitPause = 1

[State 1055, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1055, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005
value = 1005

[State 1055, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1055, Boomerang]
type = VelAdd
trigger1 = 1
x = -0.2

[State 1055, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1055, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1055, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1055, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 20
palfx.add = 64,32,0
palfx.mul = 512,384,256
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1055, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1026
ignoreHitPause = 1

[State 1055, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1027
ignoreHitPause = 1

[State 1055, End]
type = DestroySelf
trigger1 = Vel X < 0
trigger1 = Pos X = [parent, Pos X - 30, parent, Pos X + 30]
trigger1 = Pos Y = [parent, Pos Y - 80, parent, Pos Y - 30]
trigger2 = BackEdgeBodyDist <= -120

;=====================<RAZOR BATARANG PROJECTILE>=========================
[StateDef 1105]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1105
velset = 10
sprPriority = 3

[State 1105, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1107
ignoreHitPause = 1

[State 1105, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1105, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105
value = 1105

[State 1105, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1105, Boomerang]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1105, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 50
PalContrast =  -2, -2, -1
timegap = 1
framegap = 1
trans = Sub

[State 1105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1105, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1105, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1105, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1107
ignoreHitPause = 1

[State 1105, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;Hit Pause
[StateDef 1106]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1106, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1106, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1106, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1106, Counter FX]
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

[State 1106, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1106, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1106, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1106, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1

[State 1106, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1135, 1107)

;Disappear
[StateDef 1107]
type = A
physics = N
moveType = A
anim = 1107
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1107, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1107, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1107, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1107, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1107, End]
type = ChangeState
trigger1 = !AnimTime
value = 1108

;Wait
[StateDef 1108]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1108, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<DOUBLE BATARANG PROJECTILE>=========================
[StateDef 1115]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1105
velset = 10
sprPriority = 3

[State 1115, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1117
ignoreHitPause = 1

[State 1115, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1115, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105
value = 1105

[State 1115, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1115, Boomerang]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1115, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 50
PalContrast =  -2, -2, -1
timegap = 1
framegap = 1
trans = Sub

[State 1115, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1115, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1115, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1115, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1115, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1116
ignoreHitPause = 1

[State 1115, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1117
ignoreHitPause = 1

[State 1115, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;Hit Pause
[StateDef 1116]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1116, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1116, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1116, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1116, Counter FX]
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

[State 1116, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1116, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1116, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1116, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1

[State 1116, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1145, 1117)

;Disappear
[StateDef 1117]
type = A
physics = N
moveType = A
anim = 1107
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1117, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1117, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1117, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1117, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1117, End]
type = ChangeState
trigger1 = !AnimTime
value = 1118

;Wait
[StateDef 1118]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1118, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<TRIPLE MINI BATARANG PROJECTILE>=========================
[StateDef 1125]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1105
velset = 10
sprPriority = 3

[State 1125, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1127
ignoreHitPause = 1

[State 1125, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1125, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105
value = 1105

[State 1125, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1125, Boomerang]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1125, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1125, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1125, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1125, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1125, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1126
ignoreHitPause = 1

[State 1125, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1127
ignoreHitPause = 1

[State 1125, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;Hit Pause
[StateDef 1126]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1126, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1126, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1126, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1126, Counter FX]
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

[State 1126, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1126, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1126, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1126, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1

[State 1126, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1155, 1127)

;Disappear
[StateDef 1127]
type = A
physics = N
moveType = A
anim = 1107
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1127, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1127, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1127, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1127, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1127, End]
type = ChangeState
trigger1 = !AnimTime
value = 1128

;Wait
[StateDef 1128]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1128, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX RAZOR BATARANG PROJECTILE>=========================
[StateDef 1135]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1105
sprPriority = 3

[State 1135, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifElse(var(2) < 2, 1135, 1107)
ignoreHitPause = 1

[State 1135, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1135, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105 && !PrevStateNo
value = 1105

[State 1135, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 1135, Boomerang]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1135, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 50
PalContrast =  -2, -2, -1
timegap = 1
framegap = 1
trans = Sub

[State 1135, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1135, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1135, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1135, Hit 1]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) < 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
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
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1135, Hit 2]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) >= 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
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
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1135, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1135, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1135, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 1135, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1135, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1135, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1135, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1
persistent = 0

[State 1135, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(var(2) < 2, 1135, 1107)
ignoreHitPause = 1

[State 1135, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1107
ignoreHitPause = 1

[State 1135, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;=====================<EX DOUBLE BATARANG PROJECTILE>=========================
[StateDef 1145]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1105
sprPriority = 3

[State 1145, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifElse(var(2) < 2, 1145, 1117)
ignoreHitPause = 1

[State 1145, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1145, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105 && !PrevStateNo
value = 1105

[State 1145, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 1145, Boomerang]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1145, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 50
PalContrast =  -2, -2, -1
timegap = 1
framegap = 1
trans = Sub

[State 1145, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1145, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1145, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1145, Hit 1]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = var(2) < 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
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
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1145, Hit 2]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = var(2) >= 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
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
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1145, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1145, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1145, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 1145, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1145, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1145, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1145, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1
persistent = 0

[State 1145, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(var(2) < 2, 1145, 1117)
ignoreHitPause = 1

[State 1145, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1117
ignoreHitPause = 1

[State 1145, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;=====================<EX TRIPLE MINI BATARANG PROJECTILE>=========================
[StateDef 1155]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1105
sprPriority = 3

[State 1155, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifElse(var(2) < 2, 1155, 1127)
ignoreHitPause = 1

[State 1155, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1155, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105 && !PrevStateNo
value = 1105

[State 1155, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 1155, Boomerang]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1155, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1155, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1155, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1145, Hit 1]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger1 = var(2) < 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
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
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1155, Hit 2]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger1 = var(2) >= 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 4 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
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
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1155, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1155, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1155, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 1155, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1155, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1155, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1155, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1
persistent = 0

[State 1155, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(var(2) < 2, 1155, 1127)
ignoreHitPause = 1

[State 1155, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1127
ignoreHitPause = 1

[State 1155, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;=====================<AIR EXPLOSIVE BATARANG PROJECTILE>=========================
[StateDef 1165]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1155
velset = ifElse(root,var(10) = 2, 9, ifElse(root,var(10) = 1, 7, 5)),ifElse(root,var(10) = 2, 5, ifElse(root,var(10) = 1, 7, 9))
sprPriority = 3

[State 1165, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1027
ignoreHitPause = 1

[State 1165, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1165, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1155
value = 1155

[State 1165, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1165,sound]
type = Playsnd
trigger1 = time = 1
value = 9,1

[State 1165,3]
type = ScreenBound
trigger1 = stateno = 1150
value = 0

[State 1165,4]
type = VelSet
trigger1 = stateno = 1150
x = 6.2
y = 5.8

[State 1165,6]
type = EnvColor
trigger1 = movehit = 1
value = 255,255,255
time = 4
under = 0
ignorehitpause = 1
persistent = 0

[State 1165, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1165, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1165, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1165, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 20
palfx.add = 64,32,0
palfx.mul = 512,384,256
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1165, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1026
ignoreHitPause = 1

[State 1165, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1027
ignoreHitPause = 1

[State 1165, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

[State 1165, End]
type = ChangeState
trigger1 = Pos Y >= 0
value = 1167

;Disappear
[StateDef 1167]
type = A
physics = N
moveType = A
anim = 1026
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1167, 20]
type = Explod
triggerall = !numexplod(1027)
trigger1 = time = 0
anim = 1027
ID = 1027
bindtime = 100
pos = 0, 0
scale = .7,.7
postype = p1
ontop = 1

[State 1167, VelSet]
type = VelSet
trigger1 = Time = 5
x = -2
y = -2

[State 1167, ]
type = VelAdd
trigger1 = 1
y = 0.2

[State 1167, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1167, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1167, End]
type = ChangeState
trigger1 = !AnimTime
value = 1028

;=====================<EX AIR EXPLOSIVE BATARANG PROJECTILE>=========================
[StateDef 1185]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1155
velset = ifElse(root,var(10) = 2, 9, ifElse(root,var(10) = 1, 7, 5)),ifElse(root,var(10) = 2, 5, ifElse(root,var(10) = 1, 7, 9))
sprPriority = 3

[State 1185, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1027
ignoreHitPause = 1

[State 1185, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1185, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1155
value = 1155

[State 1185, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1185,sound]
type = Playsnd
trigger1 = time = 1
value = 9,1

[State 1185,3]
type = ScreenBound
trigger1 = stateno = 1150
value = 0

[State 1185,4]
type = VelSet
trigger1 = stateno = 1150
x = 6.2
y = 5.8

[State 1185,6]
type = EnvColor
trigger1 = movehit = 1
value = 255,255,255
time = 4
under = 0
ignorehitpause = 1
persistent = 0

[State 1185, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1185, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1185, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1185, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.time = 20
palfx.add = 64,32,0
palfx.mul = 512,384,256
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1185, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1026
ignoreHitPause = 1

[State 1185, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1027
ignoreHitPause = 1

[State 1185, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

[State 1185, End]
type = ChangeState
trigger1 = Pos Y >= 0
value = 1167

;=====================<BATBALL PROJECTILE>=========================
[StateDef 1205]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1205
velset = 10
sprPriority = 3

[State 1205, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1207
ignoreHitPause = 1

[State 1205, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1205, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1205
value = 1205

[State 1205, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1205, vel]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1205,sound]
type = Playsnd
trigger1 = time = 10
value = 9,1

[State 1205, BatBalls]
type = Helper
trigger1 = MoveHit
helpertype = normal
name = "BatBall"
ID = 1210
pos = -1, 0
postype = p2
stateno = 1210
ownpal = 1

[State 1205, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1205, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1205, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1205, HitDef]
type = HitDef
triggerall = p2movetype != H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
p2stateno = 1215
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1205, HitDef]
type = HitDef
triggerall = p2movetype = H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1205, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1206
ignoreHitPause = 1

[State 1205, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1207
ignoreHitPause = 1

[State 1205, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;Hit Pause
[StateDef 1206]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1206, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1206, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1206, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1206, Counter FX]
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

[State 1206, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1206, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1206, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1206, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1250]
var(18) = 1

[State 1206, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1235, 1207)

;Disappear
[StateDef 1207]
type = A
physics = N
moveType = A
anim = 1207
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1207, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1207, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1207, End]
type = ChangeState
trigger1 = !AnimTime
value = 1208

;Wait
[StateDef 1208]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1208, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;Helper Batbolas
[Statedef 1210]
type = S
movetype = I
physics = S
juggle = 1
sprpriority = 4
velset = 0,0
ctrl = 0
anim = 1206

;Reset Position
[State 1206, 0]
type = PosSet
trigger1 = 1
x = Ceil(enemy,pos x)-1*(facing)
y = 2

[State 1206,end ]
type = DestroySelf
trigger1 = p2stateno != 1215

;P2 State catched
[StateDef 1215]
type = U
MoveType = H
physics = U
ctrl = 0
VelSet = 0,0

[State 1215, falling (if catched in air)]
type = ChangeState
trigger1 = pos y < 0
value = 1216

;Reset Position
[State 1215, 0]
type = PosSet
trigger1 = 1
y = 0

[State 1215, 0]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1215, KOed by bolas]
type = ChangeState
trigger1 = life <= 0
value = 5050

[State 1215, ground, no anim]
type = ChangeAnim2
triggerall = !AnimExist(7999)
trigger1 = (time = 0) && (pos y >= 0)
ctrl = 0
value = 1250

[State 1215, back to normal]
type = SelfState
trigger1 = time = 150
value = 0
ctrl = 1

;Catch P2 custom falling state (if catch in air)
[StateDef 1216]
type = A
MoveType = H
physics = N
ctrl = 0
VelSet = 0,0

[State 1216, 0]
type = VelSet
trigger1 = time = 10
x = -4
y = 6

[State 1216, 1]
type = VelSet
trigger1 = time = 20
x = -5
y = 7

[State 1216, air catch, has anim]
type = ChangeAnim
trigger1 = (time = 0) && (AnimExist(7999))
value = 1250

[State 1216, air catch, no anim]
type = ChangeAnim2
trigger1 = (time = 0) && (!AnimExist(7999))
ctrl = 0
value = 1251

[State 1216, back to normal]
type = ChangeState ;SelfState
trigger1 = (pos y >= 10)
value = 1217

;P2 State catched
[StateDef 1217]
type = U
MoveType = H
physics = U
ctrl = 0
VelSet = 0,0

;Reset Position
[State 1217, 0]
type = PosAdd
trigger1 = 1
y = 0

[State 1217, KOed by bolas]
type = ChangeState
trigger1 = life <= 0
value = 5050

[State 1217, ground, no anim]
type = ChangeAnim2
triggerall = !AnimExist(7999)
trigger1 = (time = 0) && (pos y >= 0)
ctrl = 0
value = 1250

[State 1217, back to normal]
type = SelfState
trigger1 = time = 100
value = 0
ctrl = 1

;=====================<EX BATBALL PROJECTILE>=========================
[StateDef 1235]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1205
velset = 11
sprPriority = 3

[State 1235, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1207
ignoreHitPause = 1

[State 1235, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1235, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1205
value = 1205

[State 1235, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1235, vel]
type = velset
trigger1 = 1
x = 8
y = 0

[State 1235,sound]
type = Playsnd
trigger1 = time = 10
value = 9,1

[State 1235, BatBalls]
type = Helper
trigger1 = MoveHit
helpertype = normal
name = "BatBall"
ID = 1210
pos = -1, 0
postype = p2
stateno = 1210
ownpal = 1

[State 1235, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1235, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1235, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1235, HitDef]
type = HitDef
triggerall = p2movetype != H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
p2stateno = 1215
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1235, HitDef]
type = HitDef
triggerall = p2movetype = H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1235, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1206
ignoreHitPause = 1

[State 1235, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1207
ignoreHitPause = 1

[State 1235, End]
type = DestroySelf
trigger1 = frontedgedist< -105 || backedgedist < -120

;=====================<BATBOMB PROJECTILE>=========================
[StateDef 1305]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1305
velset = 0
sprPriority = 3

[State 1305, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1307
ignoreHitPause = 1

[State 1305, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1305, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1305
value = 1305

[State 1305, Shine]
type = helper
trigger1 = time = 1
ID = 1310
pos = 0,0
postype = p1
stateno = 1310
supermovetime = 9999
helpertype = normal
name = ""
ownpal = 0
keyctrl = 0

[State 1305, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1305, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1305, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1305, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1305, HitDef]
type = HitDef
triggerall = p2movetype != H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p2stateno = 1315
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1305, HitDef]
type = HitDef
triggerall = p2movetype = H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 8
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1305, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1306
ignoreHitPause = 1

[State 1305, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1307
ignoreHitPause = 1

[State 1305, End]
type = DestroySelf
trigger1 = animtime = 0

;Hit Pause
[StateDef 1306]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1306, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1306, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1306, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -50
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1306, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -50
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1306, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1306, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1306, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1306, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1300,1350]
var(18) = 1

[State 1306, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1335, 1307)

;Disappear
[StateDef 1307]
type = A
physics = N
moveType = A
anim = 1306
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1307, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1307, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1307, End]
type = ChangeState
trigger1 = !AnimTime
value = 1308

;Wait
[StateDef 1308]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1308, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;Hyper flash
[Statedef 1310]
ctrl = 0
anim = 1

[State 1310, Assert]
type = AssertSpecial
trigger1 = Time <= 30
flag = NoFG
flag2 = NoBarDisplay
flag3 = GlobalNoShadow

[State 1310, PalFX]
type = AllPalFX
trigger1 = Time >= 0
time = 1
color = 256-(time*4)
add = 130+(time*9), 130+(time*9), 130+(time*9)
ignorehitpause = 1

[State 1310, 1]
type = DestroySelf
trigger1 = Time >= 35

;Opponent dizzy (custom p2 gethit state)
[StateDef 1315]
type = S
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1315, feet on the ground]
type = PosSet
trigger1 = Pos Y <= 0
y = 0

[State 1315, dizzy anim]
type = ChangeAnim
trigger1 = (Time = 0) && SelfAnimExist(5300)
value = 5300

[State 1315, custom dizzy anim]
type = ChangeAnim2
trigger1 = (Time = 0) && !(SelfAnimExist(5300))
value = 5310

[State 1315, KOed gre]
type = ChangeState
trigger1 = life <= 0
value = 5050

[State 1315, back to normal]
type = SelfState
trigger1 = (Time > 95) && (Alive = 1)
value = 0
ctrl = 1

;=====================<EX BATBOMB PROJECTILE>=========================
[StateDef 1335]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1305
velset = 0
sprPriority = 3

[State 1335, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1307
ignoreHitPause = 1

[State 1335, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1335, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1305
value = 1305

[State 1335, Shine]
type = helper
trigger1 = time = 1
ID = 1310
pos = 0,0
postype = p1
stateno = 1310
supermovetime = 9999
helpertype = normal
name = ""
ownpal = 0
keyctrl = 0

[State 1335, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1335, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1335, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1335, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1335, HitDef]
type = HitDef
triggerall = p2movetype != H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p2stateno = 1315
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1335, HitDef]
type = HitDef
triggerall = p2movetype = H
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAFP
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 8
getPower = 0,0
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
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -4, -5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(var(20), 6, 12)
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

[State 1335, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1306
ignoreHitPause = 1

[State 1335, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1307
ignoreHitPause = 1

[State 1335, End]
type = DestroySelf
trigger1 = animtime = 0

;========================<EX DARK KNIGHT COMBO HELPER>=============================
;Energy Hit DNC
[Statedef 1425]
type = S
movetype = I
physics = S
anim = 1425
sprpriority = 4

[State 1425, Super C]
type = AfterImage
trigger1 = Time = 0
trans = sub
TimeGap  = 1
FrameGap = 6
time = 999
length = 15
PalBright = 1,1,1
PalContrast = ifelse (Var(5) = 0, 128, ifelse (Var(5) = 1, 50, 150)),ifelse (Var(5) = 0, 128, ifelse (Var(5) = 1, 50, 50)),ifelse (Var(5) = 0, 128, ifelse (Var(5) = 1, 150, 50))
PalAdd = 0,0,0
PalMul = .5,.5,.9

[State 1425, 1]
type = VelSet
trigger1 = Time >= 18
x = 2
y = 0

[State 1425, 1]
type = VelSet
trigger1 = Time >= 32
x = 3
y = 0

[State 1425, 1]
type = VelSet
trigger1 = Time >= 40
x = 1
y = 0

[State 1425, 1]
type = VelSet
trigger1 = Time >= 46
trigger2 = Time >= 84
x = 0
y = 0

[State 1425, 1]
type = VelSet
trigger1 = Time >= 55
x = 1
y = 0

[State 1425, 3]
type = DestroySelf
trigger1 = time >= 88
trigger2 = parent, StateNo != 1430
;trigger3 = Parent, MoveType = H

;========================<DARK SWARM HELPER>=============================
[Statedef 3005]
type = S
movetype = A
psysics = S
poweradd = 0
anim = 3025
sprpriority = 9

[State 3005, 6]
type = AfterImage
trigger1 = time = 0
time = 100
TimeGap  = 1
FrameGap = 4
length = 15

[State 3005, ]
type = VarRandom
trigger1 = Time = 0
v = 0
range = 5,9

[State 3005, ]
type = VarRandom
trigger1 = 1
v = 1
range = -5,5

[State 3005, ]
type = VelSet
trigger1 = 1
x = var(0)
y = var(1)

[State 3005, 4]
type = PlaySnd
trigger1 = time = 16
value = S3000,2

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, 0]
type = HitDef
trigger1 = AnimElem = 2
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
damage = ceil(ifElse(fvar(11) * 8 < 7, 7, fvar(11) * 8)), 8
pausetime = 0,9
sparkno = S30002
sparkxy = -18, -40
getPower = 0,0
givePower = 36, 36
hitsound = S2,6
guardsound = S3,0
ground.type = High
ground.slidetime = 0
ground.hittime = 15
ground.velocity = -4,-5
air.velocity = -4, -5
sprpriority = 9
fall = 1
air.fall = 1
hitonce = 1
numhits = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3005, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 3005, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeBodyDist < -50

;========================<MAX DARK SWARM HELPER>=============================
[Statedef 3055]
type = S
movetype = A
psysics = S
poweradd = 0
anim = 3025
sprpriority = 9

[State 3055, 6]
type = AfterImage
trigger1 = time = 0
time = 100
TimeGap  = 1
FrameGap = 4
length = 15

[State 3055, ]
type = VarRandom
trigger1 = Time = 0
v = 0
range = 5,9

[State 3055, ]
type = VarRandom
trigger1 = 1
v = 1
range = -5,5

[State 3055, ]
type = VelSet
trigger1 = 1
x = var(0)
y = var(1)

[State 3055, 4]
type = PlaySnd
trigger1 = time = 16
value = S3000,2

[State 3055, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3055, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3055, 0]
type = HitDef
trigger1 = AnimElem = 2
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
damage = ceil(ifElse(fvar(11) * 4 < 7, 7, fvar(11) * 4)), 8
pausetime = 0,9
sparkno = S30002
sparkxy = -18, -40
hitsound = S2,6
guardsound = S3,0
getPower = 0,0
givePower = 36, 36
ground.type = High
ground.slidetime = 0
ground.hittime = 15
ground.velocity = -4,-5
air.velocity = -4, -5
sprpriority = 9
fall = 1
air.fall = 1
hitonce = 1
numhits = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3055, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3055, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3055, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 3055, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeBodyDist < -50

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
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8


;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
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
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
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
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
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
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
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
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

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
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
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
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
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
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
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
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
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
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

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
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
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
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
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
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
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
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
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
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

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
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
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
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

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
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
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
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

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
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
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
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
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
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3000,3999]), -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

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
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
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
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
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



;======================<JUMP DUST>===========================
[StateDef 8100]
type = S
anim = 1
velSet = 0,0

[State 8100, Bind]
type = BindToRoot
trigger1 = Time

[State 8100, Floor Dust]
type = Explod
trigger1 = !Time
anim = 8100
sprPriority = 3
posType = P1
pos = 0, ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, Player Dust]
type = Explod
trigger1 = !Time || Time = 2 || Time = 6
anim = 8101
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, End]
type = DestroySelf
trigger1 = Time >= 7



;======================<DASH DUST>===========================
[StateDef 8103]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8103, posSet]
type = PosSet
trigger1 = !Time = 0
y = 0

[State 8103, Dash Dust]
type = Explod
trigger1 = Time = 0 || Time = 3 || Time = 6
anim = 8103
ID = ifElse((Time = 6), 3, ifElse((Time = 3), 2, 1))
posType = P1
pos = 0,-4
random = 8,8
vel = -3 - (Random / 1000.0), -2 - (Random / 2000.0)
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 16
sprPriority = 3
pauseMoveTime = -1
superMoveTime = -1

[State 8103, Scale Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.1 + (0.025 * Time), 0.1 + (0.025 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8103, Scale Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.1 + (0.025 * (Time - 3)), 0.1 + (0.025 * (Time - 3))
trans = AddAlpha
alpha = 256 - (16 * (Time - 3)), 256

[State 8103, Scale Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.1 + (0.025 * (Time - 6)), 0.1 + (0.025 * (Time - 6))
trans = AddAlpha
alpha = 256 - (16 * (Time - 6)), 256

[State 8103, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 22

[State 8103, End]
type = DestroySelf
trigger1 = !NumExplod


;======================<IMPACT DUST>===========================
[StateDef 8110]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8110, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8110
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8120
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod


;======================<WALL IMPACT DUST>===========================
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



;========================<RECOVER FX>=============================
[StateDef 8200]
type = A
velSet = 0,0
anim = 8200
sprPriority = 5

[State 8200, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8200, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.017 * Time), 0.25 + (0.017 * Time)
ignoreHitPause = 1

[State 8200, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = ceil(256 - 17.1 * Time), 256
ignoreHitPause = 1

[State 8200, End]
type = DestroySelf
trigger1 = Time >= 15



;========================<COUNTER FX>=============================
[StateDef 8290]
type = A
physics = N
velSet = 0,0
anim = 1

[State 8290, "Counter!" Text Explod]
type = Explod
trigger1 = !NumExplod(8290)
anim = 8290
ID = 8290
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8290
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8290
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8290, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8290, End]
type = DestroySelf
trigger1 = Time >= 16



;==================<POWER CHARGE FX>==================
;Aura and Dust
[StateDef 8330]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velset = 0,0

[State 8330, BindToRoot]
type = BindToRoot
trigger1 = (Root, StateNo = 730)
pos = 0,0

[State 8330, Charging Sound]
type = PlaySnd
trigger1 = !Time
value = 730,0
channel = 0

[State 8330, Power Charge Aura]
type = Explod
trigger1 = !NumExplod(8330)
ID = 8330
anim = 8330
sprPriority = 3
posType = P1
bindTime = -1
removeTime = -1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8330, Power Charge Dust]
type = Explod
trigger1 = !(Time % 6)
anim = 8105
sprPriority = -3
posType = P1
pos = 0, -ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8330, Modify Aura 1]
type = ModifyExplod
trigger1 = Numexplod(8330) && Root, Power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (Root, Power / 3000.0)

[State 8330, Modify Aura 2]
type = ModifyExplod
trigger1 = NumExplod(8330) && Root, Power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, StopSnd]
type = StopSnd
trigger1 = Root, StateNo != 730
channel = 0

[State 8330, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 730

[State 8330, End]
type = DestroySelf
trigger1 = Root, StateNo != 730


;Particles
[StateDef 8331]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8331, BindToRoot]
type = BindToRoot
trigger1 = !(Time % 8)
pos = ceil(-151 + (Random / 3.125)), ceil(98 - (Random / 3.125))

[State 8331, Particle]
type = Explod
trigger1 = (Time % 8) = 1
anim = 8331
sprPriority = ifElse(Random < 750, 5, -1)
posType = P1
vel = ((RootDist x + 1) / 32.0), ((RootDist y - 71) / 32.0)
scale = ifElse(Random < 500, 0.5, -0.5), ifElse(Random < 500, 0.5, -0.5)
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8331, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 730

[State 8331, End]
type = DestroySelf
trigger1 = Root, StateNo != 730


;==================<VIOLENT WIN VS VEGA PARTICLES>==================
[StateDef 8332]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8332, BindToRoot]
type = BindToRoot
trigger1 = !(Time % 4)
pos = ceil(-40 + (Random /10.25)), ceil(-17 - (Random / 10.25))

[State 8332, Particles]
type = Explod
trigger1 = (Time % 4) = 1
anim = 8332
sprPriority = ifElse(Random < 750,5,-1)
posType = P1
vel = (-(RootDist x + 4) / 10.0),(-(RootDist y - 85) / 10.0)
scale = ifElse(random < 500 ,0.5, -0.5),ifElse(random < 500, 0.5, -0.5)
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8332, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 187 || Root, AnimElemTime(60) >= 0

[State 833, End]
type = DestroySelf
trigger1 = Root, StateNo != 187 || Root, AnimElemTime(60) >= 0



;==================<ZERO COUNTER FX>==================
[StateDef 8350]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8350, bgPalFX]
type = bgPalFX
trigger1 = 1
time = 1
color = 16 * Time
mul = 16 * Time, 16 * Time, 16 * Time

[State 8350, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8350
ID = 1
sprPriority = 3
posType = P1
removeTime = 16
superMoveTime = -1
ownPal = 1

[State 8350, Scale]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.0625 * Time), (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8350, Lightning Explod]
type = Explod
trigger1 = !Time
anim = 8351
ID = 2
sprPriority = -2
posType = P1
pos = 0, -ceil(pos y)
superMoveTime = -1
ownPal = 1

[State 8350, End]
type = DestroySelf
trigger1 = Time >= 16



;========================<CUSTOM COMBO>=============================
[StateDef 8400]
type = A
physics = N
moveType = I
anim = 8400
ctrl = 0
velSet = 0,0
sprPriority = 5

[State 8400, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8400, BGpalFX]
type = BGpalFX
trigger1 = Time < 25
time = 1
mul = 128,128,128

[State 8400, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8400, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8400, Scale]
type = AngleDraw
trigger1 = Time < 8
scale = (0.0625 * Time), (0.0625 * Time)
ignoreHitPause = 1

[State 8400, Scale]
type = AngleDraw
trigger1 = Time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time < 16
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time >= 16
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignoreHitPause = 1

[State 8400, Lines Explod]
type = Explod
trigger1 = !Time
anim = 8401
ID = 1
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8400, Scale Lines Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 2 - (0.125 * Time), 2 - (0.125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8400, Circle Explod]
type = Explod
trigger1 = Time = 16
anim = 8402
ID = 2
sprPriority = 5
posType = P1
removeTime = 32
superMoveTime = -1

[State 8400, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.1 * (Time - 16)), (0.1 * (Time - 16))
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256

[State 8400, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 26

[State 8400, End]
type = DestroySelf
trigger1 = Time >= 26



;========================<SUPER PAUSE FX>=============================
;Level 1 Super FX
[StateDef 8500]
type = A
velSet = 0,0
anim = 8500
sprPriority = 5

[State 8500, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8500, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 0,0,256

[State 8500, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8500, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8500, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8500, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5,0.5
ignoreHitPause = 1

[State 8500, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8500, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8501
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8500, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8500, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8502
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8500, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8500, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 2 Super FX
[StateDef 8510]
type = A
velSet = 0,0
anim = 8510
sprPriority = 5

[State 8510, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8510, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 192,0,256

[State 8510, Rotate]
type = AngleSet
trigger1 = !Time
value =6 * (Random % 60)

[State 8510, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8510, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8510, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8510, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8511
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8510, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8510, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8510, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8510, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 -(0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8510, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8512
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 32
superMoveTime = -1

[State 8510, Scale]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24)<4, 64 * (Time - 24), 256), 256

[State 8510, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8510, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 3 Super FX
[StateDef 8520]
type = A
velset = 0,0
anim = 8520
sprPriority = 5

[State 8520, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 40
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8520, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8520, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8520, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8520, Portrait 1]
type = Explod
trigger1 = !Time
anim = 8525
ID = 20
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Portrait 2]
type = Explod
trigger1 = !Time
anim = 8525
ID = 21
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Scale Portrait 1a]
type = ModifyExplod
trigger1 = NumExplod(20) && Time < 16
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 1 - (0.03125 * Time), 1 - (0.03125 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 2a]
type = ModifyExplod
trigger1 = NumExplod(21) && Time < 16
ID = 21
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 2 - (0.09375 * Time), 2 - (0.09375 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 1b]
type = ModifyExplod
trigger1 = NumExplod(20) && (Time = [16,32])
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
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

[State 8520, Lines Explod]
type = explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8521
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8520, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8520, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1-(0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8520, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8520, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8522
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1 ,1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8520, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 40



;========================<SUPER FINISH>=============================
[StateDef 8600]
type = A
velSet = 0,0
anim = 1

[State 8600, Super Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 8600,0
channel = 0

[State 8600, SndPan]
type = SndPan
trigger1 = Time <= 80
channel = 1
absPan = ceil(sin(GameTime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time = [16,24)
time = 1
mul = 32 * (Time - 16), 32 * (Time - 16), 32 * (Time - 16)

[State 8600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && Root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Dark Swarm]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Dark Knight Ride]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Crime Alley Vengace]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Move Name: The Batmen]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3300,3399])
var(0) = 5

[State 8600, Move Name: Urban Legend]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3400,3499])
var(0) = 6

[State 8600, Super Finish Explod]
type = Explod
trigger1 = !Time
anim = 8600
ID = 8600
ontop = 1
postype = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Super Finish Explod Fade]
type = ModifyExplod
trigger1 = NumExplod(8600)
ID = 8600
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), 256

[State 8600, Text 1]
type = Explod
trigger1 = !Time && var(0)
anim = 8610 + var(0)
ID = 10
onTop = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 2]
type = Explod
trigger1 = !Time && var(0)
anim = 8610 + var(0)
ID = 11
onTop = 1
posType = left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 1 Fade]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), ifElse(Time < 16, 0, 32 * (Time - 16))

[State 8600, Text 2 Fade]
type = ModifyExplod
trigger1 = NumExplod(11)
ID = 11
scale = 0.5 + (0.0625 * Time), 0.5 + (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time), 32 * Time

[State 8600, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8601
ID = 8601
under = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
bindTime = -1
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Circle Fade]
type = ModifyExplod
trigger1 = NumExplod(8601)
ID = 8601
scale = (0.25 * Time) * (1.3333333 * GameHeight / GameWidth), (0.25 * Time) * (1.3333333 * GameHeight / GameWidth)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8600, Assert: NoFG]
type = AssertSpecial
trigger1 = Time < 16
flag = NoFG

[State 8600, Assert: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 24
flag = NoBarDisplay

[State 8600, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 24
trigger2 = RoundState < 3

[State 8600, End]
type = DestroySelf
trigger1 = RoundState < 3



;========================<CAMERA CONTROL>=============================
[StateDef 8999]
type = S
velSet = 0,0
anim = 1

[State 8999, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2
