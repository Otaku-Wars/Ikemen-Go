; _________________________________________
;| Iron Man by varo_hades                  |
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

;=====================<MISSILE PROJECTILE>=========================
[StateDef 421]
type = S
physics = N
moveType = A
ctrl = 0
anim = 421
sprPriority = 3

[State 421, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 423
ignoreHitPause = 1

[State 421, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 421, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 421
value = 421

[State 421, 3]
type = Explod
trigger1 = time = 0
anim = 4036
id = 420
postype = P1
pos = -50, -53
sprpriority = 0
ownpal = 1
removetime = 150
bindtime = -1
scale = .8333,1

[State 421, VelSet]
type = VelSet
trigger1 = 1
x = 5

[State 421, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 421, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 421, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 421, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 8
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
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -3, -2
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

[State 421, HitDef (Intro)]
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

[State 421, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 422
ignoreHitPause = 1

[State 421, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 422
ignoreHitPause = 1

[State 421, 6]
type = ChangeState
trigger1 = Time = 150
value = 423

;Hit Pause
[StateDef 422]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 422, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 422, sndx]
type = PlaySnd
trigger1 = moveguarded = 1 || movehit = 1
value = 3200,0

[State 422, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 422, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), -55
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 422, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), -55
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 422, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 422, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 422, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 422, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 422, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1035, 423)

;Disappear
[StateDef 423]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 423, Dust]
type = Explod
trigger1 = AnimElem = 1
anim = 3106
sprPriority = 3
posType = P1
pos = 0, -55
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 423, 2]
type = RemoveExplod
trigger1 = time = 0
id = 420

[State 423, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 423, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 423, End]
type = ChangeState
trigger1 = !AnimTime
value = 424

;Wait
[StateDef 424]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 424, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<UNIBEAM PROJECTILE>=========================
[StateDef 1005]
type = S
physics = S
moveType = A
ctrl = 0
anim = 4065
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
trigger1 = !Time
value = ifElse(var(10) = 2, 4067, ifElse(var(10) = 1, 4066, 4065))

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = UniqHitCount < 7
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 17, ifElse(var(10), 16, 15)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 17, ifElse(var(10), 16, 15)))), ifElse(var(10) >= 2, 1, 1)
getPower = ifElse(Root, var(10) = 3, 0, ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)) * !(Root, var(51))), ifElse(Root, var(10) = 3, 0, 36 * !(Root, var(20)) * !(Root, var(51)))
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

[State 1005, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000, 2
channel = 5

[State 1005, 7]
type = StopSnd
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1000
trigger2 = Parent, Stateno != 1050
channel = 5

[State 1005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1005, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1005, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1005, End]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1000
trigger2 = Parent, Stateno != 1050

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
trigger1 = Root, StateNo = [1000,1030]
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
anim = 1
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

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

;=====================<EX UNIBEAM PROJECTILE>=========================
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
anim = 4068
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

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1035, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = UniqHitCount < 10
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 13 < 7, 7, fvar(11) * 13)), 1
getPower = 0, 0
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

[State 1035, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000, 2
channel = 5

[State 1035, 7]
type = StopSnd
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1030
trigger2 = Parent, Stateno != 1080
channel = 5

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1035, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1035, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1035, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1035, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1
persistent = 0

[State 1035, End]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1030
trigger2 = Parent, Stateno != 1080

;=====================<AIR UNIBEAM PROJECTILE>=========================
[StateDef 1055]
type = S
physics = S
moveType = A
ctrl = 0
anim = 4065
sprPriority = 3

[State 1055, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1057
ignoreHitPause = 1

[State 1055, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1055, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 4067, ifElse(var(10) = 1, 4066, 4065))

[State 1055, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1055, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1055, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1055, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1055, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1055, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = UniqHitCount < 7
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 17, ifElse(var(10), 16, 15)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 17, ifElse(var(10), 16, 15)))), ifElse(var(10) >= 2, 1, 1)
getPower = ifElse(Root, var(10) = 3, 0, ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)) * !(Root, var(51))), ifElse(Root, var(10) = 3, 0, 36 * !(Root, var(20)) * !(Root, var(51)))
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

[State 1055, VelSet]
type = VelSet
trigger1 = root,var(42)
x = 0
y = 0

[State 1055, 5]
type = VelSet
trigger1 = root,var(42) = 0
x = 0
y = 0.3

[State 1055, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000, 2
channel = 5

[State 1055, 7]
type = StopSnd
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1000
trigger2 = Parent, Stateno != 1050
channel = 5

[State 1055, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1055, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1055, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1055, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1055, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1055, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1055, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1080]
var(18) = 1

[State 1055, End]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1000
trigger2 = Parent, Stateno != 1050

;Hit Pause
[StateDef 1056]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1056, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1056, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1056, HitSpark]
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

[State 1056, Counter FX]
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

[State 1056, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1056, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1056, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1056, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1056, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1035, 1057)

;Disappear
[StateDef 1057]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1057, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1057, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1057, End]
type = ChangeState
trigger1 = !AnimTime
value = 1058

;Wait
[StateDef 1058]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1058, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX AIR UNIBEAM PROJECTILE>=========================
[StateDef 1085]
type = S
physics = N
moveType = A
ctrl = 0
anim = 4068
sprPriority = 3

[State 1085, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1057
ignoreHitPause = 1

[State 1085, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1085, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1085, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1085, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1085, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1085, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = UniqHitCount < 10
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 13 < 7, 7, fvar(11) * 13)), 1
getPower = 0, 0
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

[State 1085, VelSet]
type = VelSet
trigger1 = root,var(42)
x = 0
y = 0

[State 1085, 5]
type = VelSet
trigger1 = root,var(42) = 0
x = 0
y = 0.3

[State 1085, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000, 2
channel = 5

[State 1085, 7]
type = StopSnd
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1030
trigger2 = Parent, Stateno != 1080
channel = 5

[State 1085, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1085, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1085, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1085, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1085, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1085, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1085, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1080]
var(18) = 1
persistent = 0

[State 1085, End]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, Stateno != 1030
trigger2 = Parent, Stateno != 1080

;=====================<SMART BOMB PROJECTILE>=========================
[StateDef 1105]
type = S
physics = S
moveType = A
ctrl = 0
anim = 4070
velset = 5
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

[State 1105, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1105, 1]
type = AfterImage
trigger1 = Time = 0
palcolor = 256
palbright = 0,0,0
palcontrast = 256, 256, 256
length = 7
framegap = 2
timegap = 2
trans = none
time = 5000

[State 1105, 2.1]
type = VelAdd
trigger1 = Time > 3
y = 0.37-(ifelse((IsHelper(1100)=1 || IsHelper(1110)=1 || IsHelper(1120)=1), 0, 0.08))

[State 1105, 2.2]
type = VelSet
trigger1 = IsHelper(1100) = 1
trigger2 = IsHelper(1101) = 1
x = 2.5

[State 1105, 2.3]
type = VelSet
trigger1 = IsHelper(1110) = 1
trigger2 = IsHelper(1111) = 1
x = 4.5

[State 1105, 2.4]
type = VelSet
trigger1 = IsHelper(1120) = 1
trigger2 = IsHelper(1121) = 1
x = 6.5

[State 1105, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1105, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Time = 0
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 57, ifElse(var(10), 56, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 57, ifElse(var(10), 56, 55)))), ifElse(var(10) >= 2, 8, 1)
getPower = ifElse(Root, var(10) = 3, 0, ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)) * !(Root, var(51))), ifElse(Root, var(10) = 3, 0, 36 * !(Root, var(20)) * !(Root, var(51)))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -9, 0
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -5, -1
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

[State 1105, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1105, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1105, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1105, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1105, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1105, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1105, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1100,1150]
var(18) = 1

[State 1105, 7.1]
type = ChangeState
trigger1 = MoveContact
value = 1107

[State 1105, 7.2]
type = ChangeState
triggerall = Pos Y >= 0
trigger1 = IsHelper(1100)
trigger2 = IsHelper(1110)
trigger3 = IsHelper(1120)
value = 1107

[State 1105, 7.3]
type = ChangeState
triggerall = Pos Y >= -7
trigger1 = IsHelper(1101)
trigger2 = IsHelper(1111)
trigger3 = IsHelper(1121)
value = 1107

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
trigger1 = Root, StateNo = [1100,1130]
var(18) = 1

[State 1106, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1135, 1107)

;Disappear
[StateDef 1107]
type = S
physics = S
moveType = A
anim = 4072
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1107, Dust]
type = Explod
trigger1 = AnimElem = 1
anim = 3106
sprPriority = 3
posType = P1
pos = 0, 0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 1107, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1107, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 1100,3
channel = 4
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

;=====================<EX SMART BOMB PROJECTILE>=========================
[StateDef 1135]
type = S
physics = N
moveType = A
ctrl = 0
anim = 4070
sprPriority = 3

[State 1135, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1107
ignoreHitPause = 1

[State 1135, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1135, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1135, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1135, 1]
type = AfterImage
trigger1 = Time = 0
palcolor = 256
palbright = 0,0,0
palcontrast = 256, 256, 256
length = 7
framegap = 2
timegap = 2
trans = none
time = 5000

[State 1135, 2.1]
type = VelAdd
trigger1 = Time > 3
y = 0.37-(ifelse((IsHelper(1100)=1 || IsHelper(1110)=1 || IsHelper(1120)=1), 0, 0.08))

[State 1135, 2.2]
type = VelSet
trigger1 = IsHelper(1100) = 1
trigger2 = IsHelper(1101) = 1
x = 8.5

[State 1135, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1135, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Time = 0
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 31 < 7, 7, fvar(11) * 31)), 8
getPower = 0, 0
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
ground.velocity = -9, 0
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -5, -1
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

[State 1135, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
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
pos = ceil(P2Dist x), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
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
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
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
trigger1 = Root, StateNo = [1100,1180]
var(18) = 1
persistent = 0

[State 1135, 7.1]
type = ChangeState
trigger1 = MoveContact
value = 1107

[State 1135, 7.2]
type = ChangeState
triggerall = Pos Y >= 0
trigger1 = IsHelper(1100)
trigger2 = IsHelper(1110)
trigger3 = IsHelper(1120)
value = 1107

[State 1135, 7.3]
type = ChangeState
triggerall = Pos Y >= -7
trigger1 = IsHelper(1101)
trigger2 = IsHelper(1111)
trigger3 = IsHelper(1121)
value = 1107

;=====================<REPULSOR BLAST PROJECTILE>=========================
;Light Laser Down Foward
[Statedef 1201]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4073
sprpriority = 0

[State 1201, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(root,var(10) = 2, 4075, ifElse(root,var(10) = 1, 4074, 4073))

[State 1201, 1]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1201, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1201, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1201, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1201, 2]
type = HitDef
trigger1 = root,var(10) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 10, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 10, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = ifElse((Root, var(20)), 9, 4.5), ifElse((Root, var(20)), -14, -8)
guard.velocity = -8
air.type = High
air.velocity = ifElse((Root, var(20)), 8, 4), ifElse((Root, var(20)), -12, -6)
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1201, 2]
type = HitDef
trigger1 = root,var(10) = 1
trigger1 = NumHelper(1215) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 10, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 10, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = ifElse((Root, var(20)), 8, 6), ifElse((Root, var(20)), -12, -8)
guard.velocity = -8
air.type = High
air.velocity = ifElse((Root, var(20)), 6, 3), ifElse((Root, var(20)), -12, -6)
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1201, 2]
type = HitDef
trigger1 = root,var(10) = 2
trigger1 = NumHelper(1225) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 10, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 10, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = ifElse((Root, var(20)), 8, 6), ifElse((Root, var(20)), -12, -8)
guard.velocity = -8
air.type = High
air.velocity = ifElse((Root, var(20)), 6, 3), ifElse((Root, var(20)), -12, -6)
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1201, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1201, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1201, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1201, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1201, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1201, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1201, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1201, 3]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1205
postype = P1
pos = 0, 0
stateno = 1205
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1201, 4]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1201, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 1200

;=====================<REPULSOR BLAST PROJECTILE>=========================
;Light Laser Up Foward
[Statedef 1202]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4076
sprpriority = 0

[State 1202, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(root,var(10) = 2, 4078, ifElse(root,var(10) = 1, 4077, 4076))

[State 1202, 1]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1202, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1202, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1202, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1202, 2]
type = HitDef
trigger1 = root,var(10) = 0
trigger1 = NumHelper(1205) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 10, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 10, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = ifElse((Root, var(20)), 9, 4.5), ifElse((Root, var(20)), -14, -8)
guard.velocity = -8
air.type = High
air.velocity = ifElse((Root, var(20)), 8, 4), ifElse((Root, var(20)), -12, -6)
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1202, 2]
type = HitDef
trigger1 = root,var(10) = 1
trigger1 = NumHelper(1215) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 10, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 10, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = ifElse((Root, var(20)), 8, 6), ifElse((Root, var(20)), -12, -8)
guard.velocity = -8
air.type = High
air.velocity = ifElse((Root, var(20)), 7, 5), ifElse((Root, var(20)), -12, -4)
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1202, 2]
type = HitDef
trigger1 = root,var(10) = 2
trigger1 = NumHelper(1225) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 10, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 10, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = ifElse((Root, var(20)), 8, 6), ifElse((Root, var(20)), -12, -8)
guard.velocity = -8
air.type = High
air.velocity = ifElse((Root, var(20)), 7, 5), ifElse((Root, var(20)), -12, -4)
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1202, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1202, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1202, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1202, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1202, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1202, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1202, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1202, 3]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1205
postype = P1
pos = 0, 0
stateno = 1205
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1202, 4]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1202, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root, StateNo != 1200

;=====================<REPULSOR BLAST PROJECTILE>=========================
;Light Laser Up Back
[Statedef 1203]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4076
sprpriority = 0

[State 1203, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(root,var(10) = 2, 4078, ifElse(root,var(10) = 1, 4077, 4076))

[State 1203, 1]
type = Turn
trigger1 = Time = 0

[State 1203, 2]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1203, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1203, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1203, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1203, 3]
type = HitDef
trigger1 = root,var(10) = 0
trigger1 = NumHelper(1205) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 4, -8
guard.velocity = -8
air.type = High
air.velocity = 4, -6.5
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1203, 3]
type = HitDef
trigger1 = root,var(10) = 1
trigger1 = NumHelper(1215) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 5, -4
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1203, 3]
type = HitDef
trigger1 = root,var(10) = 2
trigger1 = NumHelper(1225) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 35)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 5, -4
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1203, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1203, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1203, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1203, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1203, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1203, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1203, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1203, 4]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1205
postype = P1
pos = 0, 0
stateno = 1205
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1203, 5]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1203, 8]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 1200

;=====================<REPULSOR BLAST PROJECTILE>=========================
;Light Laser Down Back
[Statedef 1204]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4073
sprpriority = 0

[State 1204, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(root,var(10) = 2, 4075, ifElse(root,var(10) = 1, 4074, 4073))

[State 1204, 1]
type = Turn
trigger1 = Time = 0

[State 1204, 2]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1204, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1204, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1204, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1204, 3]
type = HitDef
trigger1 = root,var(10) = 0
trigger1 = NumHelper(1205) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 4.5, -8
guard.velocity = -8
air.type = High
air.velocity = 4, -6.5
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1204, 3]
type = HitDef
trigger1 = root,var(10) = 1
trigger1 = NumHelper(1215) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 5, -4
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1204, 3]
type = HitDef
trigger1 = root,var(10) = 2
trigger1 = NumHelper(1225) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 35)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 4, -6
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1204, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1204, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1204, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1204, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1204, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1204, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1204, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1204, 4]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1205
postype = P1
pos = 0, 0
stateno = 1205
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1204, 5]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1204, 8]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 1200

;=====================<REPULSOR BLAST PROJECTILE>=========================
;Hitter
[Statedef 1205]
type = S
movetype = I
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 1
sprpriority = 0

[State 1205, 7]
type = DestroySelf
trigger1 = Time = 17
trigger2 = Root, StateNo != 1200

;=====================<EX REPULSOR BLAST PROJECTILE>=========================
;Light Laser Down Foward
[Statedef 1231]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4075
sprpriority = 0

[State 1231, 1]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1231, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1231, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1231, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1231, 2]
type = HitDef
trigger1 = NumHelper(1235) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 1
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
getPower = 0, 0
givePower = 36, 36
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 3, -6
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1231, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1231, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1231, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1231, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1231, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1231, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1231, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1231, 3]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1235
postype = P1
pos = 0, 0
stateno = 1235
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1231, 4]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1231, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 1230

;=====================<EX REPULSOR BLAST PROJECTILE>=========================
;Light Laser Up Foward
[Statedef 1232]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4078
sprpriority = 0

[State 1232, 1]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1232, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1232, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1232, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1232, 2]
type = HitDef
trigger1 = NumHelper(1235) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 1
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
getPower = 0, 0
givePower = 36, 36
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 5, -4
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1232, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1232, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1232, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1232, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1232, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1232, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1232, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1232, 3]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1235
postype = P1
pos = 0, 0
stateno = 1235
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1232, 4]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1232, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root, StateNo != 1230

;=====================<EX REPULSOR BLAST PROJECTILE>=========================
;Light Laser Up Back
[Statedef 1233]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4078
sprpriority = 0

[State 1233, 1]
type = Turn
trigger1 = Time = 0

[State 1233, 2]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1233, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1233, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1233, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1233, 3]
type = HitDef
trigger1 = NumHelper(1235) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 1
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
getPower = 0, 0
givePower = 36, 36
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 5, -4
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1233, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1233, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1233, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, -63, ifelse(P2Dist X > 110, -37, -20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1233, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1233, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1233, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1233, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1233, 4]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1235
postype = P1
pos = 0, 0
stateno = 1235
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1233, 5]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1233, 8]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 1230

;=====================<EX REPULSOR BLAST PROJECTILE>=========================
;Light Laser Down Back
[Statedef 1234]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4075
sprpriority = 0

[State 1234, 1]
type = Turn
trigger1 = Time = 0

[State 1234, 2]
type = PlaySnd
trigger1 = TimeMod = 8, 1
value = 1200, 2
channel = 5

[State 1234, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1234, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1234, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1234, 3]
type = HitDef
trigger1 = NumHelper(1235) = 0
trigger1 = UniqHitCount = 0
attr = S, SA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 1
guardflag = MA
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
getPower = 0, 0
givePower = 36, 36
priority = 6, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = 6, -8
guard.velocity = -8
air.type = High
air.velocity = 4, -6
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
p2stateno = 1250
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1234, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1234, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1234, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ifelse(P2Dist X > 150, 63, ifelse(P2Dist X > 110, 37, 20))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1234, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1234, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1234, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1234, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1
persistent = 0

[State 1234, 4]
type = Helper
trigger1 = UniqHitCount = 1
name = "Hitter"
id = 1235
postype = P1
pos = 0, 0
stateno = 1235
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0

[State 1234, 5]
type = BindToRoot
trigger1 = 1
pos = 6, -119

[State 1234, 8]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 1230

;=====================<EX REPULSOR BLAST PROJECTILE>=========================
;Hitter
[Statedef 1235]
type = S
movetype = I
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 1
sprpriority = 0

[State 1235, 7]
type = DestroySelf
trigger1 = Time = 17
trigger2 = Root, StateNo != 1230

;=====================<REPULSOR BLAST PROJECTILE>=========================
;Repulsor Blast P2 Paused
[Statedef 1250]
type = S
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1250, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 5012

[State 1250, 7]
type = SelfState
trigger1 = Time = 17
value = 5030

;=====================<REPULSOR SHOT PROJECTILE>=========================
[StateDef 1405]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 1405, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 1405, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1405, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 1405, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1405, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(Root, StateNo =  193, 5.25, 3.25 + var(10))

[State 1405, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1405, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1405, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1405, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1405, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 63, ifElse(var(10), 56, 49)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 63, ifElse(var(10), 56, 49)))), ifElse(var(10) >= 2, 8, 7)
getPower = ifElse(Root, var(10) = 3, 0, ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)) * !(Root, var(51))), ifElse(Root, var(10) = 3, 0, 36 * !(Root, var(20)) * !(Root, var(51)))
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
ground.velocity = -8, 0
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -3, -6
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

[State 1405, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 1405, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 1405, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;Hit Pause
[StateDef 1406]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1406, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1406, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1406, HitSpark]
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

[State 1406, Counter FX]
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

[State 1406, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1406, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1406, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1406, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1400,1430]
var(18) = 1

[State 1406, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1435, 1407)

;Disappear
[StateDef 1407]
type = A
physics = N
moveType = A
anim = 1407
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1407, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1407, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1407, End]
type = ChangeState
trigger1 = !AnimTime
value = 1408

;Wait
[StateDef 1408]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1408, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX REPULSOR SHOT PROJECTILE>=========================
[StateDef 1435]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 1435, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifElse(var(2) < 2, 1435, 1407)
ignoreHitPause = 1

[State 1435, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1435, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405 && !PrevStateNo
value = 1405

[State 1435, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 1435, VelSet]
type = VelSet
trigger1 = 1
x = ifElse((Time < 2 && var(2) > 1), 1, 8.25)

[State 1435, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1435, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1435, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1435, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1435, Hit 1]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) < 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 8
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
ground.velocity = -8, 0
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -3, -6
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

[State 1435, Hit 2]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) >= 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 8
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
ground.velocity = -8, 0
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -3, -6
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

[State 1435, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1435, HitSpark]
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

[State 1435, Counter FX]
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

[State 1435, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1435, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1435, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1435, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1400,1430]
var(18) = 1
persistent = 0

[State 1435, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(var(2) < 2, 1435, 1407)
ignoreHitPause = 1

[State 1435, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 1435, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<SHOULDER MISIL PROJECTiLE>==========================
[Statedef 1705]
type = S
movetype = A
physics = S
poweradd = 0
anim = 3302
sprpriority = -6

[State 1705, 3]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1705, 4]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1706
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1705, 5]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1705, vel]
type = VelSet
trigger1 = 1
x = 8

[State 1705, sndx]
type = PlaySnd
trigger1 = time = 0
value = 110,1

[State 78101, fire]
type = Explod
triggerall = !NumExplod(3002)
trigger1 = StateNo = 1705
id = 3002
anim = 3303
bindtime = -1
removeongethit = 1

[State 1705, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1705, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1705, 0]
type = HitDef
trigger1 = time = 0
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pausetime = 0,9
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
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

[State 1705, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1705, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1705, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1705, explosive]
type = Explod
triggerall = !NumExplod(3106)
trigger1 = movehit = 1
anim = 3106
id = 3106
pos = 0, ceil(P2Dist y-80)
postype = p2
sprpriority = 6
ontop = 1
removeongethit = 1
bindtime = 999
ownpal = 1
persistent = 0
scale = 0.5,0.5

[State 1705, med1]
type = Explod
triggerall = !NumExplod(3106)
trigger1 = moveguarded = 1
anim = 3106
id = 3106
;velocity = 0, 0
pos = 0, ceil(P2Dist y-80)
postype = p2
sprpriority = 6
ontop = 1
removeongethit = 1
ownpal = 1
persistent = 0
scale = 0.5,0.5

[State 1705, sndx]
type = PlaySnd
trigger1 = moveguarded = 1 || movehit = 1
value = 3200,0

[state 1705, destroy]
type = Destroyself
trigger1 = movecontact = 1

[state 1705, destroy]
type = Destroyself
trigger1 = time = 50

;Destroy
[Statedef 1706]
type = S
movetype = A
physics = S
poweradd = 0
anim = 1
sprpriority = -6

[State 1706, Dust]
type = Explod
trigger1 = AnimElem = 1
anim = 3106
sprPriority = 3
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
persistent = 0
ownpal = 1

[State 1706, sndx]
type = PlaySnd
trigger1 = time=0
value = 3200,0

[state 1706, destroy]
type = Destroyself
trigger1 = animtime = 0

;=====================<SHOULDER MISIL PROJECTiLE>==========================
[Statedef 1735]
type = S
movetype = A
physics = S
poweradd = 0
anim = 3302
sprpriority = -6

[State 1735, 3]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1735, 4]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1706
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1735, 5]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1735, vel]
type = VelSet
trigger1 = 1
x = 10

[State 1735, sndx]
type = PlaySnd
trigger1 = time = 0
value = 110,1

[State 78131, fire]
type = Explod
triggerall = !NumExplod(3002)
trigger1 = StateNo = 1735
id = 3002
anim = 3303
bindtime = -1
removeongethit = 1

[State 1735, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1735, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1735, 0]
type = HitDef
trigger1 = time = 0
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 1
getPower = 0, 0
givePower = 36, 36
pausetime = 1,9
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
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

[State 1735, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1735, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1735, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1735, explosive]
type = Explod
triggerall = !NumExplod(3106)
trigger1 = movehit = 1
anim = 3106
id = 3106
pos = 0, ceil(P2Dist y-80)
postype = p2
sprpriority = 6
ontop = 1
removeongethit = 1
bindtime = 999
ownpal = 1
persistent = 0
scale = 0.5,0.5

[State 1735, med1]
type = Explod
triggerall = !NumExplod(3106)
trigger1 = moveguarded = 1
anim = 3106
id = 3106
;velocity = 0, 0
pos = 0, ceil(P2Dist y-80)
postype = p2
sprpriority = 6
ontop = 1
removeongethit = 1
ownpal = 1
persistent = 0
scale = 0.5,0.5

[State 1735, sndx]
type = PlaySnd
trigger1 = moveguarded = 1 || movehit = 1
value = 3200,0

[state 1735, destroy]
type = Destroyself
trigger1 = movecontact = 1

[state 1735, destroy]
type = Destroyself
trigger1 = time = 50

;=====================<MINI MISILS PROJECTILE>==========================
[StateDef 1805]
type = A
movetype = A
physics = N
anim = 1810
ctrl = 0
velset = 6,-7
poweradd = 0
sprpriority = 8

[State 1805, PlaySnd]
type = null;Arkady;PlaySnd
trigger1 = animelem = 1
value = S1100,1
volume = 255
channel = 5

[State 1805, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 1806
time = -1

[State 1805, VelSet]
type = VelSet
trigger1 = time = 10
x = 3
y = -3

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1810
trigger1 = vel x > 0
trigger1 = vel y < 0
value = 1810

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1812
trigger1 = vel x > 0
trigger1 = vel y > 0
value = 1812

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1814
trigger1 = vel x < 0
trigger1 = vel y > 0
value = 1814

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1816
trigger1 = vel x < 0
trigger1 = vel y < 0
value = 1816

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1813
trigger1 = vel x = [-1,1]
trigger1 = vel y > 0
value = 1813

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1815
trigger1 = vel x < 0
trigger1 = vel y = [-1,1]
value = 1815

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1811
trigger1 = vel x > 0
trigger1 = vel y = [-1,1]
value = 1811

[State 1805, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1817
trigger1 = vel x = [-1,1]
trigger1 = vel y < 0
value = 1817

[State 1805, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel x < 4
trigger1 = p2bodydist x > 0
x = 0.2

[State 1805, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel x > -4
trigger1 = p2bodydist x < 0
x = -0.2

[State 1805, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel y < 4
trigger1 = p2bodydist y > 0
y = 0.2

[State 1805, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel y > -4
trigger1 = p2bodydist y < 0
y = -0.2

[State 1805, PosSet]
type = PosSet
trigger1 = pos y > -10
y = -10

[State 1805, HitDef]
type = HitDef
trigger1 = time = 0
attr = A,SA
damage = 55,3
getPower = ifElse(!(Root, var(13)), 52, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
animtype = medium
priority = 2, Hit
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 3,8
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -8, 0
air.velocity = 0, -3.5
fall = 0

[State 1805, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1805, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1805, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

;[State 1805, ParentVarSet]
;type = ParentVarSet
;trigger1 =fvar(26)!= 1
;fv = 26
;value = 1

[State 1805, DestroySelf]
type = changestate
trigger1 = time = 84
trigger2 = movehit
value = 1806
ctrl = 0

;Destroy
[StateDef 1806]
type = A
movetype = I
physics = N
anim = 1
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 8

[State 1806, Dust]
type = Explod
trigger1 = AnimElem = 1
anim = 3106
sprPriority = 3
posType = P1
pos = 0, 0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
persistent = 0
ownpal = 1

[State 1806, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3200,0

[State 1806, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;=====================<EX MINI MISILS PROJECTILE>==========================
[StateDef 1835]
type = A
movetype = A
physics = N
anim = 1810
ctrl = 0
velset = 6,-7
poweradd = 0
sprpriority = 8

[State 1835, PlaySnd]
type = null;Arkady;PlaySnd
trigger1 = animelem = 1
value = S1100,1
volume = 255
channel = 5

[State 1835, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 1806
time = -1

[State 1835, VelSet]
type = VelSet
trigger1 = time = 10
x = 3
y = -3

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1810
trigger1 = vel x > 0
trigger1 = vel y < 0
value = 1810

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1812
trigger1 = vel x > 0
trigger1 = vel y > 0
value = 1812

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1814
trigger1 = vel x < 0
trigger1 = vel y > 0
value = 1814

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1816
trigger1 = vel x < 0
trigger1 = vel y < 0
value = 1816

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1813
trigger1 = vel x = [-1,1]
trigger1 = vel y > 0
value = 1813

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1815
trigger1 = vel x < 0
trigger1 = vel y = [-1,1]
value = 1815

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1811
trigger1 = vel x > 0
trigger1 = vel y = [-1,1]
value = 1811

[State 1835, ChangeAnim]
type = ChangeAnim
triggerall = anim != 1817
trigger1 = vel x = [-1,1]
trigger1 = vel y < 0
value = 1817

[State 1835, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel x < 4
trigger1 = p2bodydist x > 0
x = 0.2

[State 1835, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel x > -4
trigger1 = p2bodydist x < 0
x = -0.2

[State 1835, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel y < 4
trigger1 = p2bodydist y > 0
y = 0.2

[State 1835, VelAdd]
type = VelAdd
triggerall = time > 10
triggerall = vel y > -4
trigger1 = p2bodydist y < 0
y = -0.2

[State 1835, PosSet]
type = PosSet
trigger1 = pos y > -10
y = -10

[State 1835, HitDef]
type = HitDef
trigger1 = time = 0
attr = A,SA
damage = 35,3
getPower = 0,0
givePower = 36, 36
animtype = medium
priority = 2, Hit
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 3,12
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -8, 0
air.velocity = 0, -3.5
fall = 0

[State 1835, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1835, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1835, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

;[State 1835, ParentVarSet]
;type = ParentVarSet
;trigger1 =fvar(26)!= 1
;fv = 26
;value = 1

[State 1835, DestroySelf]
type = changestate
trigger1 = time = 84
trigger2 = movehit
value = 1806
ctrl = 0

;========================<PROTON CANNON PROJECTILE>=============================
[Statedef 3010]
type = S
movetype = I
physics = S
juggle = 0
poweradd = 0
ctrl = 0
velset = 0
anim = 4085
sprpriority = -3

[State 3010, 1.1]
type = VelSet
trigger1 = Time > 18
trigger1 = Time < 35
x = Parent, Vel X
y = 2.4

[State 3010, 1.2]
type = VelSet
trigger1 = Time > 168
x = Parent, Vel X
y = -0.15

[State 3010, 1.3]
type = VelSet
trigger1 = Time > 34
trigger1 = Time < 169
x = Parent, Vel X
y = 0

[State 3010, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Time < 169
trigger2 = Parent, Stateno != 3000
trigger3 = Parent, MoveType = H

;========================<PROTON CANNON PROJECTILE>=============================
[Statedef 3015]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4089
sprpriority = 6

[State 3015, 1.1]
type = PlaySnd
trigger1 = Time = 0
value = 3000, 2
channel = 6

[State 3015, 1.2]
type = StopSnd
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 3000
channel = 6

[State 3015, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3015, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3015, 2]
type = HitDef
trigger1 = TimeMod = 6, 1
attr = S, SA
hitflag = MAFD
animtype = Hard
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 8
guardflag = MA
pausetime = 0,ifElse((Root, var(20)), 6, 12)
priority = 7, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = -1, -3
guard.velocity = -9
air.type = High
air.velocity = -2, -3
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
getpower = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3015, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 3015, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -94
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3015, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -94
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3015, 3]
type = BindToRoot
trigger1 = 1
pos = floor(70*const(size.xscale)), 0

[State 3015, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 3000

;========================<MAX PROTON CANNON PROJECTILE>=============================
[Statedef 3060]
type = S
movetype = I
physics = S
juggle = 0
poweradd = 0
ctrl = 0
velset = 0
anim = 4085
sprpriority = -3

[State 3060, 1.1]
type = VelSet
trigger1 = Time > 18
trigger1 = Time < 35
x = Parent, Vel X
y = 2.4

[State 3060, 1.2]
type = VelSet
trigger1 = Time > 168
x = Parent, Vel X
y = -0.15

[State 3060, 1.3]
type = VelSet
trigger1 = Time > 34
trigger1 = Time < 169
x = Parent, Vel X
y = 0

[State 3060, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Time < 169
trigger2 = Parent, Stateno != 3050
trigger3 = Parent, MoveType = H

;========================<MAX PROTON CANNON PROJECTILE>=============================
[Statedef 3065]
type = S
movetype = A
physics = S
juggle = 3
poweradd = 0
ctrl = 0
anim = 4089
sprpriority = 6

[State 3065, 1.1]
type = PlaySnd
trigger1 = Time = 0
value = 3000, 2
channel = 6

[State 3065, 1.2]
type = StopSnd
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 3050
channel = 6

[State 3065, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3065, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3065, 2]
type = HitDef
trigger1 = TimeMod = 4, 1
attr = S, SA
hitflag = MAFD
animtype = Hard
damage = ceil(ifElse(fvar(11) * 11 < 7, 7, fvar(11) * 11)), 8
guardflag = MA
pausetime = 0,ifElse((Root, var(20)), 6, 12)
priority = 7, Hit
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 16
ground.hittime  = 30
ground.velocity = -1, -3
guard.velocity = -9
air.type = High
air.velocity = -2, -3
air.hittime = 30
airguard.velocity = -5
fall = 1
fall.recover = 0
getpower = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3065, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 3065, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -94
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3065, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -94
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3065, 3]
type = BindToRoot
trigger1 = 1
pos = floor(70*const(size.xscale)), 0

[State 3065, 7]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent, StateNo != 3050

;========================<NANO ASSAULT PROJECTILE>=============================
[statedef 3105]
type = S
movetype = A
physics = N
juggle = 6
ctrl = 0
anim = 3151
sprpriority = 6

[State 3105, 1]
type = BindToParent
trigger1 = 1
pos = 0,-40

[State 3105, 3]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3105, 4]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 3105
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 3105, 5]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 3105, shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[state 3105, snd]
type = playsnd
triggerall = anim = 3105
trigger1 = animelem  = 1
trigger2 = animelem  = 2
trigger3 = animelem  = 3
trigger4 = animelem  = 4
trigger5 = animelem  = 5
value = 3100,0

[State 3105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[state 3105, hit]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 9
trigger4 = animelem = 12
trigger5 = animelem = 15
trigger6 = animelem = 18
trigger7 = animelem = 21
trigger8 = animelem = 24
attr = S, NA
damage   = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 8
hitflag = MAF
guardflag = MA
;snap = 15,0,0
pausetime = 0,0
sparkno = s30002
sparkxy = -10,-70
hitsound   = s2,6
ground.type = low
ground.slidetime = 15
ground.hittime = 20
ground.velocity = 1,-6
guard.velocity = -2
air.velocity = -1,-6
guard.ctrltime = 39
animtype = heavy
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
p2facing = 1
;yaccel = .43
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0,0
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 3105, HitSpark]
type = Helper
trigger1 = movehit = 1
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
persistent = 1
ignoreHitPause = 1

[State 3105, Counter FX]
type = Helper
trigger1 = movehit = 1 && var(9)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[state 3105, destroy]
type = Destroyself
trigger1 = time = 52

;========================<MAX NANO ASSAULT PROJECTILE>=============================
[statedef 3155]
type = S
movetype = A
physics = N
juggle = 6
ctrl = 0
anim = 3151
sprpriority = 6

[State 3155, 1]
type = BindToParent
trigger1 = 1
pos = 0,-40

[State 3155, 3]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3155, 4]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 3155
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 3155, 5]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 3155, shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[state 3155, snd]
type = playsnd
triggerall = anim = 3105
trigger1 = animelem  = 1
trigger2 = animelem  = 2
trigger3 = animelem  = 3
trigger4 = animelem  = 4
trigger5 = animelem  = 5
value = 3100,0

[State 3155, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3155, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[state 3155, hit]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 9
trigger4 = animelem = 12
trigger5 = animelem = 15
trigger6 = animelem = 18
trigger7 = animelem = 21
trigger8 = animelem = 24
attr = S, NA
damage   = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 8
hitflag = MAF
guardflag = MA
;snap = 15,0,0
pausetime = 0,0
sparkno = s30002
sparkxy = -10,-70
hitsound   = s2,6
ground.type = low
ground.slidetime = 15
ground.hittime = 20
ground.velocity = 1,-6
guard.velocity = -2
air.velocity = -1,-6
guard.ctrltime = 39
animtype = heavy
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
p2facing = 1
;yaccel = .43
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0,0
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 3155, HitSpark]
type = Helper
trigger1 = movehit = 1
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
persistent = 1
ignoreHitPause = 1

[State 3155, Counter FX]
type = Helper
trigger1 = movehit = 1 && var(9)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[state 3155, destroy]
type = Destroyself
trigger1 = time = 82

;========================<HEAVY ARTILLERY UNI BEAM PROJECTILE>=============================
[Statedef 3201]
type = S
movetype = A
physics = S
poweradd = 0
anim = 3301
sprpriority = 9

[State 3201, ]
type = VelSet
trigger1 = 1
x = 10

[State 3201, 0]
type = HitDef
trigger1 = time = 0
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
damage = 16, 1
pausetime = 0,9
sparkno = -1
sparkxy = -1
guard.sparkno = -1
hitsound = -1
guardsound = -1
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
getpower = 0,0

[State 3201, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 3201, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3201, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 3201, destroy]
type = changestate
trigger1 = movecontact = 1
value = 3208

[state 3201, destroy]
type = Destroyself
trigger1 = time = 50

;Destroy
[Statedef 3208]
type = S
movetype = A
physics = S
poweradd = 0
anim = 1
sprpriority = 4
velset = 0,0

[State 3208, med1]
type = Explod
trigger1 = time=0
anim = 3106
id = 3106
scale = 0.5, 0.5
pos = -50+ random%20,-85+ random%20
postype = p2
sprpriority = 6
ontop = 1
bindtime = -1
removeongethit = 1
removetime = 36
ownpal = 1

[state 3208, destroy]
type = Destroyself
trigger1 = time = 20

;========================<HEAVY ARTILLERY UNI BEAM PROJECTILE>=============================
;Misil Big
[Statedef 3202]
type = S
movetype = A
physics = S
poweradd = 0
anim = 3302
sprpriority = -6

[State 3202, ]
type = VelSet
trigger1 = 1
x = 10

[State 3202, fire]
type = Explod
triggerall = !NumExplod(3202)
trigger1 = StateNo = 3202
id = 3202
anim = 3303
bindtime = -1
removeongethit = 1

[State 3202, 0]
type = HitDef
trigger1 = time = 0
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
damage = 45, 3
pausetime = 0,9
sparkno = -1
sparkxy = -1
guard.sparkno = -1
hitsound = -1
guardsound = -1
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
getpower = 0,0

[State 3202, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 3202, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3202, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3202, explosive]
type = Explod
triggerall = !NumExplod(3106)
trigger1 = movehit = 1
anim = 3106
id = 3106
pos = -40, 0
scale = 0.5, 0.5
postype = p2
sprpriority = 6
ontop = 1
removeongethit = 1
bindtime = 999
removetime = 36
ownpal = 1

[State 3202, med1]
type = Explod
triggerall = !NumExplod(3106)
trigger1 = moveguarded = 1
anim = 3106
id = 3106
scale = 0.5, 0.5
;velocity = 0, 0
pos = -40, 0
postype = p2
sprpriority = 6
ontop = 1
removeongethit = 1
removetime = 36
ownpal = 1

[State 3202, sndx]
type = PlaySnd
trigger1 = moveguarded = 1 || movehit = 1
value = 3200,0

[state 3202, destroy]
type = Destroyself
trigger1 = movecontact = 1

[state 3202, destroy]
type = Destroyself
trigger1 = time = 50

;====================<ARMOR STATE>====================
[StateDef 6000]
ctrl=0
physics=N
velset=0
sprpriority=-5

[State 6000, Bind]
type=BindToRoot
trigger1=1
facing=1
pos=0,0

[State 6000, Hit]
type=ChangeAnim
trigger1=SelfAnimExist(Root,Anim)
value=Root,Anim
elem=Root,AnimElemNo(0)

[State 6000, STypsetS]
type=StateTypeSet
trigger1=Root,StateType=S
StateType=S

[State 6000, STypsetC]
type=StateTypeSet
trigger1=Root,StateType=C
StateType=C

[State 6000, STypsetA]
type=StateTypeSet
trigger1=Root,StateType=A
StateType=A

[State 6000, STypsetL]
type=StateTypeSet
trigger1=Root,StateType=L
StateType=L

[State 6000, MTypsetA]
type=StateTypeSet
trigger1=Root,MoveType=A
MoveType=A

[State 6000, MTypsetI]
type=StateTypeSet
trigger1=Root,MoveType=I
MoveType=I

[State 6000, MTypsetH]
type=StateTypeSet
trigger1=Root,MoveType=H
MoveType=H

[State 6000, No-show]
type=AssertSpecial
trigger1=1
flag=invisible
flag2=NoShadow
ignorehitpause=1

[State 6000, NotHitBy]
type = NotHitBy
trigger1 = parent, var(14) = 3
value = SCA
ignorehitpause = 1

[State 6000, NHB]
type = NotHitBy
trigger1 = 1
value = ,AT,SA,SP,HA,HP
time = -1
ignorehitpause = 1

[State 6000, HO]
type = HitOverride
trigger1 = 1
attr = SCA, AA,AP,AT
time = -1
stateno = 6005
ignorehitpause = 1

[State 0, destroyself]
type = destroyself
trigger1 = parent, stateno = [120,155]
trigger2 = parent,stateno = [5000,5150]
trigger3 = root,var(28)!=[1,3]
trigger4 = root,Movetype=H
ignorehitpause = 1

;Armor part 2
[StateDef 6005]
ctrl = 0
physics = N
velset = 0
sprpriority = -5

[State 6005, PVA]
type=ParentVarAdd
trigger1=!time
var(5)=1
ignorehitpause=1

[State 6005, PVA]
type=ParentVarAdd
trigger1=!time
var(14)=1
ignorehitpause=1

[State 6005, PVS]
type = ParentVarSet
triggerall=parent,var(14)!=3
trigger1=1
var(24)=GetHitVar(damage)
ignorehitpause=1

[State 6005, Change]
type = ChangeState
trigger1 = 1
value = 6000

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
pos = -10,0

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
vel = ((RootDist x + 9) / 32.0), ((RootDist y - 91) / 32.0)
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

[State 8600, Move Name: Proton Cannon]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Nano Assault]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Heavy Artillery Uni Beam]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Move Name: Rocket Launchers]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3300,3399])
var(0) = 5

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
