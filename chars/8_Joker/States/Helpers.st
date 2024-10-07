; _________________________________________
;| Joker by varo_hades                     |
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

;=====================<GAS FLOWER PROJECTILE>=========================
[statedef 1001]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1001
;velset = 8,0
sprpriority = 6

[State 1001, 3]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1001, 4]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1004
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1001, 5]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1001, shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[state 1001, hit]
type = HitDef
trigger1 = movecontact = 0
attr = S, SP
damage = 75,10
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFP
;hitsound   = S3,1
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
guard.sparkno = S10003
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1
p2stateno = 7670

[State 1001, gas]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = movehit = 1
anim = 1007
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
bindtime = 999
velocity = 1.5, 0
removetime = 20
ownpal = 1

[State 1001, med1]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = moveguarded = 1
anim = 1007
velocity = 1.5, 0
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
removetime = 20
ownpal = 1

[State 1001, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1010)
trigger1 = Movehit = 1
anim = 1010
id= 1010
postype = P2
pos = -15,-80
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1001, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1020)
trigger1 = Movehit = 1
anim = 1020
id= 1020
postype = P2
pos = -15,-80
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1001, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1011)
trigger1 = Movehit = 1
anim = 1011
id= 1011
postype = P2
pos = 20,-60
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1001, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1021)
trigger1 = Movehit = 1
anim = 1021
id= 1021
postype = P2
pos = 20,-60
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1001, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1012)
trigger1 = Movehit = 1
anim = 1012
id= 1012
postype = P2
pos = 25,-100
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1001, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1022)
trigger1 = Movehit = 1
anim = 1022
id= 1022
postype = P2
pos = 25,-100
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[state 1001, sndx]
type = playsnd
trigger1 = movehit = 1
value = 30,10

[state 1001, destroy]
type = Destroyself
trigger1 = movecontact = 1

[state 1001, destroy]
type = Destroyself
trigger1 = time = 39

;Hit by Gas
[Statedef 7670]
type = A
physics = N
movetype = H
ctrl = 0
anim = 5300

[State 7670, ]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 7670, ]
type = PowerAdd
trigger1 = 1
value = -5

[State 7670, Electrocuted FXs]
type = PalFX
trigger1 = Time % 4
trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7670, Electrocuted FXs]
type = PalFX
trigger1 = Time % 6
trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7670, Electrocuted_Anim]
type = Changestate;Anim
trigger1 = AnimExist(7128)
trigger1 = Anim != 7128
value = 27699

[State 7670, 6]
type = SelfState
trigger1 = Time = 82
ctrl = 1
value = 5070

;=====================<WATER FLOWER PROJECTILE>=========================
[StateDef 1003]
type = S
moveType = A
ctrl = 0
sprPriority = 4

[State 1003, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
slot = 0
stateNo = 1003
ignoreHitPause = 1

[State 1003, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 1003, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1003
value = 1003

[State 1003, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1003, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1003, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1003, First 11 Hits]
type = HitDef
trigger1 = Root, StateNo = 1000
trigger1 = ((Time = 0 && PrevStateNo = 1004) || (Time = 0 && !var(14))) && (var(13) < 6)
attr = S, HP
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
getPower = ifElse(!(Root, var(13)), 14, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 1,9
guard.pauseTime = 1,9
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
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 1003, Final Hit]
type = HitDef
trigger1 = Root, StateNo = 1000
trigger1 = (Time = 0 && PrevStateNo = 1004) && (var(13) = 6)
attr = S, HP
hitFlag = MAFP
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
getPower = ifElse(!(Root, var(13)), 14, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 1,9
guard.pauseTime = 1,9
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15
ground.slideTime = 15
guard.hitTime = 15
air.hitTime = 60
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 1003, Miss]
type = HitDef
trigger1 = (Root, var(16)) || (Root, var(15) >= (7 + HitCount) && Parent, StateNo = 1000)
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 1003, End]
type = ChangeState
trigger1 = MoveContact
value = 1004
ignoreHitPause = 1

[State 1003, End]
type = ChangeState
trigger1 = Root, MoveType = H
trigger2 = Time = 50 + var(13) * 3
trigger3 = var(14) >= 7
value = 1009
ignoreHitPause = 1

;Hit Pause
[StateDef 1004]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 1004, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1004, VarSet]
type = VarAdd
trigger1 = 1
var(14) = 1

[State 1004, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignoreHitPause = 1

[State 1004, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8010)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1004, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -80
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1004, Parent Hit Count]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1004, Self Hit Count]
type = VarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1004, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1004, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1004, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = 1000
var(18) = 1

[State 1004, End]
type = ChangeState
trigger1 = Time >= 0
value = 1003

;=====================<POISON FLOWER PROJECTILE>=========================
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
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

[State 1005, VelSet]
type = VelSet
trigger1 = 1
x = 12

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
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 8
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
trigger1 = pos x != [-200,200]

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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), -80
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), -80
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
;anim = 1006
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, exp]
type = Explod
;triggerall = !NumExplod(1006)
trigger1 = 1
anim = 1006
id = 1006
pos = 40,0
postype = p2
sprpriority = 6
bindtime = 1

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

;Disappear
[StateDef 1009]
type = A
physics = N
moveType = A
anim = 1008
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1009, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1009, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;=====================<EX GAS FLOWER PROJECTILE>=========================
[statedef 1031]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1001
;velset = 8,0
sprpriority = 6

[State 1031, 3]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1031, 4]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1004
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1031, 5]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1031, shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[state 1031, hit]
type = HitDef
trigger1 = movecontact = 0
attr = S, SP
damage = 90,10
getPower = 0,0
givePower = 36, 36
hitflag = MAFP
;hitsound   = S3,1
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
guard.sparkno = S10003
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1
p2stateno = 7671

[State 1031, gas]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = movehit = 1
anim = 1007
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
bindtime = 999
velocity = 1.5, 0
removetime = 20
ownpal = 1

[State 1031, med1]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = moveguarded = 1
anim = 1007
velocity = 1.5, 0
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
removetime = 20
ownpal = 1

[State 1031, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1010)
trigger1 = Movehit = 1
anim = 1010
id= 1010
postype = P2
pos = -15,-80
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1031, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1020)
trigger1 = Movehit = 1
anim = 1020
id= 1020
postype = P2
pos = -15,-80
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1031, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1011)
trigger1 = Movehit = 1
anim = 1011
id= 1011
postype = P2
pos = 20,-60
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1031, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1021)
trigger1 = Movehit = 1
anim = 1021
id= 1021
postype = P2
pos = 20,-60
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1031, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1012)
trigger1 = Movehit = 1
anim = 1012
id= 1012
postype = P2
pos = 25,-100
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[State 1031, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1022)
trigger1 = Movehit = 1
anim = 1022
id= 1022
postype = P2
pos = 25,-100
supermove = 1
ontop = 1
removetime = 70
bindtime = -1

[state 1031, sndx]
type = playsnd
trigger1 = movehit = 1
value = 30,10

[state 1031, destroy]
type = Destroyself
trigger1 = movecontact = 1

[state 1031, destroy]
type = Destroyself
trigger1 = time = 39

;Hit by Gas
[Statedef 7671]
type = A
physics = N
movetype = H
ctrl = 0
anim = 5300

[State 7671, ]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 7671, ]
type = PowerAdd
trigger1 = 1
value = -10

[State 7671, Electrocuted FXs]
type = PalFX
trigger1 = Time % 4
trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7671, Electrocuted FXs]
type = PalFX
trigger1 = Time % 6
trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7671, Electrocuted_Anim]
type = Changestate;Anim
trigger1 = AnimExist(7128)
trigger1 = Anim != 7128
value = 27699

[State 7671, 6]
type = SelfState
trigger1 = Time = 102
ctrl = 1
value = 5070

;=====================<EX WATER FLOWER PROJECTILE>=========================
[StateDef 1033]
type = S
moveType = A
ctrl = 0
sprPriority = 4

[State 1033, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
slot = 0
stateNo = 1033
ignoreHitPause = 1

[State 1033, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 1033, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1003
value = 1003

[State 1033, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1033, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1033, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1033, First 11 Hits]
type = HitDef
trigger1 = Root, StateNo = 1030
trigger1 = ((Time = 0 && PrevStateNo = 1034) || (Time = 0 && !var(14))) && (var(13) < 7)
attr = S, HP
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,9
guard.pauseTime = 1,9
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
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 1003, Final Hit]
type = HitDef
trigger1 = Root, StateNo = 1030
trigger1 = (Time = 0 && PrevStateNo = 1034) && (var(13) = 7)
attr = S, HP
hitFlag = MAFP
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,9
guard.pauseTime = 1,9
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15
ground.slideTime = 15
guard.hitTime = 15
air.hitTime = 60
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 1033, Miss]
type = HitDef
trigger1 = (Root, var(16)) || (Root, var(15) >= (8 + HitCount) && Parent, StateNo = 1030)
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 1003, End]
type = ChangeState
trigger1 = MoveContact
value = 1034
ignoreHitPause = 1

[State 1033, End]
type = ChangeState
trigger1 = Root, MoveType = H
trigger2 = Time = 50 + var(13) * 3
trigger3 = var(14) >= 8
value = 1039
ignoreHitPause = 1

;Hit Pause
[StateDef 1034]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 1034, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1034, VarSet]
type = VarAdd
trigger1 = 1
var(14) = 1

[State 1034, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignoreHitPause = 1

[State 1034, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8010)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1034, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -80
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1034, Parent Hit Count]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1034, Self Hit Count]
type = VarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1034, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1034, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1034, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = 1030
var(18) = 1

[State 1034, End]
type = ChangeState
trigger1 = Time >= 0
value = 1033

;=====================<EX POISON FLOWER PROJECTILE>=========================
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifElse(var(2) < 2, 1035, 1007)
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005 && !PrevStateNo
value = 1005

[State 1035, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 1035, VelSet]
type = VelSet
trigger1 = 1
x = 12

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

[State 1035, Hit 1]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) < 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 8
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

[State 1035, Hit 2]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) >= 2
attr = S, SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 8
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
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), -80
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
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

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(var(2) < 2, 1035, 1007)
ignoreHitPause = 1

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1035, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;Disappear
[StateDef 1039]
type = A
physics = N
moveType = A
anim = 1008
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1039, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1039, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;=====================<GUNSHOT PROJECTILE>=========================
[StateDef 1105]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1101
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
trigger1 = Anim != 1101
value = 1101

[State 1105, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1105, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 1105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1105, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

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
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 30, ifElse(var(10), 56, 49)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 30, ifElse(var(10), 56, 49)))), ifElse(var(10) >= 2, 8, 7)
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

[State 1105, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1105, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1107
ignoreHitPause = 1

[State 1105, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

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
pos = ceil(P2Dist x), -80
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
pos = ceil(P2Dist x), -80
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
value = 1107

;Disappear
[StateDef 1107]
type = A
physics = N
moveType = A
anim = 1008
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

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

;=====================<EX GUNSHOT PROJECTILE>=========================
[StateDef 1135]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1101
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

[State 1135, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1101
value = 1101

[State 1135, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1135, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 1135, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1135, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1135, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1135, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1135, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 8
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

[State 1135, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1135, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1107
ignoreHitPause = 1

[State 1135, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<TEETH PROJECTILE>=========================
[statedef 1202]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1202
velset = ifElse(root,var(10) = 2, 3, ifElse(root,var(10) = 1, 2, 1)),0
sprpriority = 6

[state 1202, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1203

[State 1202,sound]
type = Playsnd
trigger1 = animelem = 1
trigger2 = animelem = 5
value = 60,17
channel = 8

[state 1202, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 85,15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

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
pos = ceil(P2Dist x), 0
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
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1202, med1]
type = Explod
triggerall = !NumExplod(1203)
trigger1 = moveguarded = 1
anim = 1203
velocity = -2.5, 0
pos = 0, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
removetime = 20
ownpal = 1

[State 1202, med1]
type = Explod
triggerall = !NumExplod(1204)
trigger1 = movehit = 1
anim = 1204
scale = .5,.5
pos = 15, 0
postype = p2
sprpriority = 6
ontop = 1
bindtime= -1
facing= -1
removetime = 60
ownpal = 1

[State 1202, med1]
type = Explod
triggerall = !NumExplod(1205)
trigger1 = movehit = 1
anim = 1205
pos = 90, 80
postype = p2
sprpriority = 6
ontop = 1
facing= -1
bindtime = -1
removetime = 28
ownpal = 1

[state 1202, sndx]
type = playsnd
trigger1 = movehit = 1
value = 0,4

;[state 1202, destroy]
;type = Destroyself
;trigger1 = movecontact = 1

[State 1202, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1107
ignoreHitPause = 1

[state 1202, destroy]
type = changestate
trigger1 = time = 160
value = 1203

;Teeth Gethit
[statedef 1203]
type = S
movetype = I
physics = S
anim = 1203

[state 1203, destroy]
type = Destroyself
trigger1 = animtime = 0

;=====================<EX TEETH PROJECTILE>=========================
[statedef 1232]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1202
velset = 4,0
sprpriority = 6

[state 1232, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1203

[State 1232,sound]
type = Playsnd
trigger1 = animelem = 1
trigger2 = animelem = 5
value = 60,17
channel = 8

[state 1232, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 50,15
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,28
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

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
pos = ceil(P2Dist x), 0
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
pos = ceil(P2Dist x), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1232, med1]
type = Explod
triggerall = !NumExplod(1203)
trigger1 = moveguarded = 1
anim = 1203
velocity = -2.5, 0
pos = 0, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
removetime = 20
ownpal = 1

[State 1232, med1]
type = Explod
triggerall = !NumExplod(1204)
trigger1 = movehit = 1
anim = 1204
scale = .5,.5
pos = 15, 0
postype = p2
sprpriority = 6
ontop = 1
bindtime= -1
facing= -1
removetime = 60
ownpal = 1

[State 1232, med1]
type = Explod
triggerall = !NumExplod(1205)
trigger1 = movehit = 1
anim = 1205
pos = 90, 80
postype = p2
sprpriority = 6
ontop = 1
facing= -1
bindtime = -1
removetime = 28
ownpal = 1

[state 1232, sndx]
type = playsnd
trigger1 = movehit = 1
value = 0,4

[state 1232, destroy]
type = Destroyself
trigger1 = movecontact = 1

[state 1232, destroy]
type = changestate
trigger1 = time = 160
value = 1203

;=====================<TOY BOX PROJECTILE>=========================
[statedef 1301]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 6

[state 1301, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1302

[state 1301, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 5,6
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

[State 1301, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1301, HitSpark]
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

[State 1301, Counter FX]
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

[state 1301, sndx]
type = playsnd
trigger1 = movehit = 1
value = 60,8

[state 1301, destroy]
type = Changestate
trigger1 = movecontact = 1
trigger2 = time = 120
value = 1302

;Toy box part 2
[statedef 1302]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1302
velset = 0,0
sprpriority = 6

[state 1302, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 80,10
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
animtype = Heavy
hitsound  = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -15,-50
guardflag = MA
pausetime = 0,9
sparkno = S10006
ground.type = low
ground.slidetime = 0
ground.hittime  = 16
ground.velocity = -5,0
air.animtype = Back
air.velocity = -5,0
down.velocity = -2,1
persistent = 1

[State 1302, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1302, HitSpark]
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

[State 1302, Counter FX]
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

[State 1302, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[state 1302, sndx]
type = playsnd
trigger1 = time = 1
value = 60,3

[state 1302, sndx]
type = playsnd
trigger1 = animelem = 13
value = 60,2

[state 1302, destroy]
type = Changestate
trigger1 = animtime = 0
value = 1306

;Toy box part 1
[statedef 1304]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 6

[state 1304, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1307

[state 1304, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 5,7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

[State 1304, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1304, HitSpark]
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

[State 1304, Counter FX]
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

[state 1304, sndx]
type = playsnd
trigger1 = movehit = 1
value = 60,8

[state 1304, destroy]
type = Changestate
trigger1 = movecontact = 1
trigger2 = time = 120
value = 1307

;Toybox Destroy
[statedef 1306]
type = S
movetype = I
physics = S
anim = 1305

[State 1306, med1]
type = Explod
trigger1 = animelem = 6
anim = 3106
pos = 0, 0
scale = 0.5,0.5
postype = p1
sprpriority = 6
ontop = 1
bindtime = -1
facing = 1
removetime = 15
ownpal = 1

[state 1306, destroy]
type = Destroyself
trigger1 = animtime = 0

;Toy box part 2
[statedef 1307]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1303
velset = 0,0
sprpriority = 6

[state 1307, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 80,10
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
animtype = Heavy
hitsound  = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -15,-50
guardflag = MA
pausetime = 0,9
sparkno = S10006
ground.type = low
ground.slidetime =0
ground.hittime  = 16
ground.velocity = -7,-6
air.animtype = Back
air.velocity = -7,-6
down.velocity = -7,-6
persistent =1
fall = 1
air.fall = 1

[State 1307, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1307, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -130
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1307, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -130
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1307, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[state 1307, sndx]
type = playsnd
trigger1 = time = 1
value = 60,3

[state 1307, sndx]
type = playsnd
trigger1 = animelem = 13
value = 60,2

[state 1307, destroy]
type = Changestate
trigger1 = animtime = 0
value = 1306

;Toy box part 1
[statedef 1309]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 6

[state 1309, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1310

[state 1309, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 5,7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

[State 1309, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1309, HitSpark]
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

[State 1309, Counter FX]
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

[state 1309, sndx]
type = playsnd
trigger1 = movehit = 1
value = 60,8

[state 1309, destroy]
type = Changestate
trigger1 = movecontact = 1
trigger2 = time = 120
value = 1310

;Toy box part 2
[statedef 1310]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1304
velset = 0,0
sprpriority = 6

[state 1310, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 80,10
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
animtype = Heavy
hitsound  = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -15,-50
guardflag = MA
pausetime = 0,9
sparkno = S10006
ground.type = low
ground.slidetime = 0
ground.hittime  = 16
ground.velocity = -12,-3
air.animtype = Back
air.velocity =  -12,-4
down.velocity =  -12,-3
persistent = 1
fall = 1
air.fall = 1

[State 1310, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1310, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1310, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -80
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1310, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[state 1310, sndx]
type = playsnd
trigger1 = time = 1
value = 60,3

[state 1310, sndx]
type = playsnd
trigger1 = animelem = 13
value = 60,2

[state 1310, destroy]
type = Changestate
trigger1 = animtime = 0
value = 1306

;=====================<EX TOY BOX PROJECTILE>=========================
[statedef 1331]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 6

[state 1331, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1332

[state 1331, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 10,7
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

[State 1331, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1331, HitSpark]
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

[State 1331, Counter FX]
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

[state 1331, sndx]
type = playsnd
trigger1 = movehit = 1
value = 60,8

[state 1331, destroy]
type = Changestate
trigger1 = movecontact = 1
trigger2 = time = 120
value = 1332

;Toy box part 2
[statedef 1332]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1302
velset = 0,0
sprpriority = 6

[state 1332, hit]
type = HitDef
trigger1 = time%5 = 0
attr = S, SP
damage = 25,10
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
animtype = Heavy
hitsound  = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -15,-50
guardflag = MA
pausetime = 0,9
sparkno = S10006
ground.type = low
ground.slidetime = 0
ground.hittime  = 16
ground.velocity = -5,0
air.animtype = Back
air.velocity = -5,0
down.velocity = -2,1
persistent = 1

[State 1332, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1332, HitSpark]
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

[State 1332, Counter FX]
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

[State 1332, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[state 1332, sndx]
type = playsnd
trigger1 = time = 1
value = 60,3

[state 1332, sndx]
type = playsnd
trigger1 = animelem = 13
value = 60,2

[state 1332, destroy]
type = Changestate
trigger1 = animtime = 0
value = 1336

;Toy box part 1
[statedef 1334]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 6

[state 1334, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1337

[state 1334, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 10,7
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

[State 1334, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1334, HitSpark]
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

[State 1334, Counter FX]
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

[state 1334, sndx]
type = playsnd
trigger1 = movehit = 1
value = 60,8

[state 1334, destroy]
type = Changestate
trigger1 = movecontact = 1
trigger2 = time = 120
value = 1337

;Toybox Destroy
[statedef 1336]
type = S
movetype = I
physics = S
anim = 1305

[State 1336, med1]
type = Explod
trigger1 = animelem = 6
anim = 3106
pos = 0, 0
scale = 0.5,0.5
postype = p1
sprpriority = 6
ontop = 1
bindtime = -1
facing = 1
removetime = 15
ownpal = 1

[state 1336, destroy]
type = Destroyself
trigger1 = animtime = 0

;Toy box part 2
[statedef 1337]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1303
velset = 0,0
sprpriority = 6

[state 1337, hit]
type = HitDef
trigger1 = time%5 = 0
attr = S, SP
damage = 40,10
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
animtype = Heavy
hitsound  = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -15,-50
guardflag = MA
pausetime = 0,9
sparkno = S10006
ground.type = low
ground.slidetime =0
ground.hittime  = 16
ground.velocity = -2,-6
air.animtype = Back
air.velocity = -2,-6
down.velocity = -7,-6
persistent =1
fall = 1
air.fall = 1

[State 1337, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1337, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -130
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1337, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -130
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1337, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[state 1337, sndx]
type = playsnd
trigger1 = time = 1
value = 60,3

[state 1337, sndx]
type = playsnd
trigger1 = animelem = 13
value = 60,2

[state 1337, destroy]
type = Changestate
trigger1 = animtime = 0
value = 1336

;Toy box part 1
[statedef 1339]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 6

[state 1339, gethit]
type = hitoverride
trigger1 = time = 0
time = -1
attr = SCA, AA, AT, AP
slot = 0
stateno = 1340

[state 1339, hit]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 10,7
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
hitsound  = S2,1
guardsound = S3,0
sparkno = S10006
guardflag = MA
pausetime = 0,9
sparkno = S10006
sparkxy = -15,-20
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1

[State 1339, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1339, HitSpark]
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

[State 1339, Counter FX]
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

[state 1339, sndx]
type = playsnd
trigger1 = movehit = 1
value = 60,8

[state 1339, destroy]
type = Changestate
trigger1 = movecontact = 1
trigger2 = time = 120
value = 1340

;Toy box part 2
[statedef 1340]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1304
velset = 0,0
sprpriority = 6

[state 1340, hit]
type = HitDef
trigger1 = time%5 = 0
attr = S, SP
damage = 25,10
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
animtype = Heavy
hitsound  = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -15,-50
guardflag = MA
pausetime = 0,9
sparkno = S10006
ground.type = low
ground.slidetime = 0
ground.hittime  = 16
ground.velocity = -12,-3
air.animtype = Back
air.velocity =  -12,-4
down.velocity =  -12,-3
persistent = 1
fall = 1
air.fall = 1

[State 1340, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1340, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -80
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1340, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -80
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1340, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[state 1340, sndx]
type = playsnd
trigger1 = time = 1
value = 60,3

[state 1340, sndx]
type = playsnd
trigger1 = animelem = 13
value = 60,2

[state 1340, destroy]
type = Changestate
trigger1 = animtime = 0
value = 1336

;=====================<CARDS PROJECTILE>=========================
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

[State 1405,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 1405, VelSet]
type = VelSet
trigger1 = 1
x = 9

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
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 25, ifElse(var(10), 30, 49)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 25, ifElse(var(10), 30, 49)))), ifElse(var(10) >= 2, 8, 7)
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
pos = ceil(P2Dist x), ceil(P2Dist y-80)
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
pos = ceil(P2Dist x), ceil(P2Dist y-80)
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
value = 1407

;Disappear
[StateDef 1407]
type = A
physics = N
moveType = A
anim = 1406
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1407, med1]
type = Explod
trigger1 = !Time
anim = 1102
velocity = 0, 0
pos = 60, 0
postype = p2
sprpriority = 6
ontop = 1
bindtime =-1
removetime = 12
ownpal = 1

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

;=====================<CARDS PROJECTILE>=========================
[StateDef 1415]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 1415, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1417
ignoreHitPause = 1

[State 1415, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1415, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 1415, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1415,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 1415, VelSet]
type = VelSet
trigger1 = 1
x = 9

[State 1415, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1415, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1415, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1415, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1415, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 25, ifElse(var(10), 30, 49)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 25, ifElse(var(10), 30, 49)))), ifElse(var(10) >= 2, 8, 7)
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
ground.velocity = -9, -3
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -9.5, -5
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
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1415, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1416
ignoreHitPause = 1

[State 1415, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1417
ignoreHitPause = 1

[State 1415, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;Hit Pause
[StateDef 1416]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1416, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1416, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1416, HitSpark]
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

[State 1416, Counter FX]
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

[State 1416, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1416, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1416, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1416, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1400,1430]
var(18) = 1

[State 1416, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1435, 1417)

;Disappear
[StateDef 1417]
type = A
physics = N
moveType = A
anim = 1407
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1417, med1]
type = Explod
trigger1 = !Time
anim = 3106
velocity = 0, 0
pos = 0, -90
scale = 0.5,0.5
postype = p2
sprpriority = 6
ontop = 1
bindtime = -1
removetime = 12
ownpal = 1

[State 1417, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1417, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1417, End]
type = ChangeState
trigger1 = !AnimTime
value = 1418

;Wait
[StateDef 1418]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1418, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX CARDS PROJECTILE>=========================
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
stateno = 1407
ignoreHitPause = 1

[State 1435, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1435, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 1435, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1435,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 1435, VelSet]
type = VelSet
trigger1 = 1
x = 12

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

[State 1435, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 28
guard.pauseTime = 0, 12
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

[State 1435, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 1435, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 1435, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<CAKE PROJECTILE>=========================
[Statedef 1501]
type = S
movetype = A
physics = N
anim = 1505
velset = ifElse(root,var(10) = 2, 6, ifElse(root,var(10) = 1, 5, 4)),-1

[State 1501,sound]
type = Playsnd
trigger1 = time = 4
value = 0,3

[State 1501,0]
type = Gravity
trigger1 = 1

[State 1501,1]
type = ChangeAnim
;triggerall = anim != 1202
trigger1 = time = 15
value = 1506

[State 1501, HitDef]
type = HitDef
trigger1 = Time = 0
attr = S, SP
damage   = 55,15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 0,10
hitsound = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -20,-95
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4
fall = 0
air.animtype = Back
air.velocity = -2.5,-5
air.juggle = 3
air.fall = 1
down.velocity = -5,-6
down.hittime = 30
down.bounce = 0

[State 1501, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1501, HitSpark]
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

[State 1501, Counter FX]
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

[State 1501, med1]
type = Explod
triggerall = !NumExplod(1508)
trigger1 = movecontact = 1
anim = 1508
id = 1508
velocity = 0, 0
pos = 80, 200
postype = p2
sprpriority = 6
ontop = 1
facing = -1
bindtime = -1
removetime = 20
ownpal = 1

[State 1501,sound]
type = Playsnd
trigger1 = movecontact = 1
value = 60,22

[State 1501, ]
type = DestroySelf
trigger1 = time = 100

;[State 1501, destroy]
;type = Destroyself
;trigger1 = Movecontact

[State 1501, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1107
ignoreHitPause = 1

[State 1501, changestate]
type = ChangeState
trigger1 = Pos Y >= 105
value = 1502
ctrl = 1

;Cake on the ground finish
[StateDef 1502]
type = S
movetype = A
physics = S
anim = 1509
velset = 0,0

[State 1502, pSnd]
type = PlaySnd
trigger1 = Time = 0
value = 60,22
channel = 7

[State 1502, 3]
type = HitDef
trigger1 = IsHelper
attr = C, NA
damage    = 60
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
hitflag = MAFD
guardflag = L
pausetime = 12,12
sparkno = S10006
sparkxy = -5,-10
hitsound = S60,21
guardsound = S3,0
ground.type = Trip
ground.slidetime = 10
ground.hittime  = 15
ground.velocity = 2.5,-2
down.velocity = 2.5,-2
air.velocity = 1.2,-3
guard.velocity = -5
fall = 1

[State 1502, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1502, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-10)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1502, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-10)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1502, destroy]
type = Destroyself
trigger1 = Movecontact

[State 1502, DestroySelf]
type = DestroySelf
trigger1 = time = 80

;=====================<EX CAKE PROJECTILE>=========================
[Statedef 1531]
type = S
movetype = A
physics = N
anim = 1505
velset = 6,-1

[State 1531,sound]
type = Playsnd
trigger1 = time = 4
value = 0,3

[State 1531,0]
type = Gravity
trigger1 = 1

[State 1531,1]
type = ChangeAnim
;triggerall = anim != 1202
trigger1 = time = 15
value = 1506

[State 1531, HitDef]
type = HitDef
trigger1 = Time = 0
attr = S, SP
damage   = 55,15
getPower = 0,0
givePower = 36, 36
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 0,10
hitsound = S2,2
guardsound = S3,0
sparkno = S10006
sparkxy = -20,-95
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4
fall = 0
air.animtype = Back
air.velocity = -2.5,-5
air.juggle = 3
air.fall = 1
down.velocity = -5,-6
down.hittime = 30
down.bounce = 0

[State 1531, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1531, HitSpark]
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

[State 1531, Counter FX]
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

[State 1531,sound]
type = Playsnd
trigger1 = movecontact = 1
value = 60,22

[State 1531, ]
type = DestroySelf
trigger1 = time = 100

[State 1531, destroy]
type = velset
trigger1 = Movecontact
x = 0

[State 1531, changestate]
type = ChangeState
trigger1 = Pos Y >= 105
value = 1532
ctrl = 1

;Cake on the ground finish
[StateDef 1532]
type = S
movetype = A
physics = S
anim = 1509
velset = 0,0

[State 1532, pSnd]
type = PlaySnd
trigger1 = Time = 0
value = 60,22
channel = 7

[State 1532, 3]
type = HitDef
trigger1 = IsHelper
attr = C, NA
damage    = 60,8
getPower = 0,0
givePower = 36, 36
hitflag = MAFD
guardflag = L
pausetime = 12,12
sparkno = S10006
sparkxy = -5,-10
hitsound = S60,21
guardsound = S3,0
ground.type = Trip
ground.slidetime = 10
ground.hittime  = 15
ground.velocity = 2.5,-2
down.velocity = 2.5,-2
air.velocity = 1.2,-3
guard.velocity = -5
fall = 1

[State 1532, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1532, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-10)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1532, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-10)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1532, destroy]
type = Destroyself
trigger1 = Movecontact

[State 1532, DestroySelf]
type = DestroySelf
trigger1 = time = 80

;=====================<IMPERIAL ROYAL FLUSH PROJECTILE>=========================
[StateDef 3005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 3005,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 3005, VelSet]
type = VelSet
trigger1 = 1
x = 9

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 8
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

[State 3005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 3005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 3005, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<IMPERIAL ROYAL FLUSH PROJECTILE>=========================
[StateDef 3006]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 3006, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 3006, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3006, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 3006,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 3006, VelSet]
type = VelSet
trigger1 = 1
x = 9

[State 3006, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3006, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3006, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3006, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3006, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 8
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

[State 3006, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 3006, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 3006, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<IMPERIAL ROYAL FLUSH PROJECTILE>=========================
[StateDef 3007]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 3007, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 3007, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3007, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 3007,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 3007, VelSet]
type = VelSet
trigger1 = 1
x = 9

[State 3007, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3007, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3007, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3007, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
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

[State 3007, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 3007, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 3007, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<IMPERIAL ROYAL FLUSH PROJECTILE>=========================
[StateDef 3008]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 3008, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 3008, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3008, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 3008,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 3008, VelSet]
type = VelSet
trigger1 = 1
x = 9

[State 3008, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3008, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3008, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3008, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3008, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
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

[State 3008, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 3008, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[State 3008, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<IMPERIAL ROYAL FLUSH PROJECTILE>=========================
[StateDef 3009]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1405
sprPriority = 3

[State 3009, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1417
ignoreHitPause = 1

[State 3009, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3009, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1405
value = 1405

[State 3009,sound]
type = Playsnd
trigger1 = time = 1
value = 60,18

[State 3009, VelSet]
type = VelSet
trigger1 = 1
x = 9

[State 3009, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3009, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3009, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3009, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3009, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
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
ground.velocity = -9, -3
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -9.5, -5
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
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 3009, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1416
ignoreHitPause = 1

[State 3009, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1417
ignoreHitPause = 1

[State 3009, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<JOKER VENOM GAS PROJECTILE>=========================
[statedef 3111]
type = S
movetype = A
physics = N
ctrl = 0
anim = 3115
;velset = 8,0
sprpriority = 6

[State 3111, shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[state 3111, hit]
type = HitDef
trigger1 = movecontact = 0
attr = S, SP
damage = 75,10
getPower = 0,0
givePower = 36, 36
hitflag = MAFP
;hitsound   = S3,1
sparkno = S10006
guard.sparkno = S10003
guardflag = MA
pausetime = 0,9
sparkno = S10006
guard.sparkno = S10003
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1
p2stateno = 7682

[State 3111, gas]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = movecontact = 1
anim = 1007
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
bindtime = 999
velocity = 1.5, 0
removetime = 40
ownpal = 1

[State 3111, med1]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = moveguarded = 1
anim = 1007
velocity = 1.5, 0
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
removetime = 30
ownpal = 1

[state 3111, sndx]
type = playsnd
trigger1 = movehit = 1
value = 30,10

[State 3111, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1010)
trigger1 = Movehit = 1
anim = 1010
id = 1010
postype = P2
pos = -15,-70
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1020)
trigger1 = Movehit = 1
anim = 1020
id = 1020
postype = P2
pos = -15,-70
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1011)
trigger1 = Movehit = 1
anim = 1011
id = 1011
postype = P2
pos = -30,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1021)
trigger1 = Movehit = 1
anim = 1021
id = 1021
postype = P2
pos = -30,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1012)
trigger1 = Movehit = 1
anim = 1012
id = 1012
postype = P2
pos = 20,-50
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1022)
trigger1 = Movehit = 1
anim = 1022
id = 1022
postype = P2
pos = 20,-50
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1013)
trigger1 = Movehit = 1
anim = 1013
id = 1013
postype = P2
pos = 25,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1023)
trigger1 = Movehit = 1
anim = 1023
id = 1023
postype = P2
pos = 25,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3111, Bat]
type = ParentVarSet
trigger1 = Movehit
var(24) = 1

[state 3111, destroy]
type = Destroyself
trigger1 = movehit = 1

[state 3111, destroy]
type = Destroyself
trigger1 = time = 52

;=====================<MAX JOKER VENOM GAS PROJECTILE>=========================
[statedef 3161]
type = S
movetype = A
physics = N
ctrl = 0
anim = 3115
;velset = 8,0
sprpriority = 6

[State 3161, shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[state 3161, hit]
type = HitDef
trigger1 = movecontact = 0
attr = S, SP
damage = 75,10
getPower = 0,0
givePower = 36, 36
hitflag = MAFP
;hitsound   = S3,1
sparkno = S10006
guard.sparkno = S10003
guardflag = MA
pausetime = 0,9
sparkno = S10006
guard.sparkno = S10003
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -2
air.animtype = Back
air.velocity = -2.5,-5
persistent = 1
p2stateno = 7682

[State 3161, gas]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = movecontact = 1
anim = 1007
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
bindtime = 999
velocity = 1.5, 0
removetime = 40
ownpal = 1

[State 3161, med1]
type = Explod
triggerall = !NumExplod(1007)
trigger1 = moveguarded = 1
anim = 1007
velocity = 1.5, 0
pos = 120, 0
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
removetime = 30
ownpal = 1

[state 3161, sndx]
type = playsnd
trigger1 = movehit = 1
value = 30,10

[State 3161, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1010)
trigger1 = Movehit = 1
anim = 1010
id = 1010
postype = P2
pos = -15,-70
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1020)
trigger1 = Movehit = 1
anim = 1020
id = 1020
postype = P2
pos = -15,-70
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1011)
trigger1 = Movehit = 1
anim = 1011
id = 1011
postype = P2
pos = -30,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1021)
trigger1 = Movehit = 1
anim = 1021
id = 1021
postype = P2
pos = -30,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1012)
trigger1 = Movehit = 1
anim = 1012
id = 1012
postype = P2
pos = 20,-50
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1022)
trigger1 = Movehit = 1
anim = 1022
id = 1022
postype = P2
pos = 20,-50
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = -1
triggerall = !NumExplod(1013)
trigger1 = Movehit = 1
anim = 1013
id = 1013
postype = P2
pos = 25,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, sign]
type = Explod
triggerall = Facing = 1
triggerall = !NumExplod(1023)
trigger1 = Movehit = 1
anim = 1023
id = 1023
postype = P2
pos = 25,-90
supermove = 1
ontop = 1
removetime = 200
bindtime = -1

[State 3161, Bat]
type = ParentVarSet
trigger1 = Movehit
var(27) = 1

[state 3161, destroy]
type = Destroyself
trigger1 = movehit = 1

[state 3161, destroy]
type = Destroyself
trigger1 = time = 52

;Hit by Gas   Hyper
[Statedef 7682]
type = A
physics = N
movetype = H
ctrl = 0
anim = 5300

[State 7682, ]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 7682, ]
type = PowerAdd
trigger1 = 1
value = -15

[State 7682, Electrocuted FXs]
type = PalFX
trigger1 = Time % 4
trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7682, Electrocuted FXs]
type = PalFX
trigger1 = Time % 6
trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7682, Electrocuted_Anim]
type = Changestate;Anim
trigger1 = AnimExist(7128)
trigger1 = Anim != 7128
value = 7683

[State 7682, 6]
type = SelfState
trigger1 = Time = 300
ctrl = 1
value = 5070

;Part 2
[Statedef 7683]
type = A
physics = N
movetype = H
ctrl = 0
anim = 7128

[State 7683, ]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 7683, ]
type = PowerAdd
trigger1 = 1
value = -15

[State 7683, Electrocuted FXs]
type = PalFX
trigger1 = Time % 4
;trigger1 = !AnimExist(7128)
time = 1
time = 82
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,10
color = 0

[State 7683, 6]
type = SelfState
trigger1 = Time = 300
ctrl = 1
value = 5070

;=====================<JOKER VENOM GAS PROJECTILE>=========================
[StateDef 3105]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3105
sprPriority = 3

[State 3105, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1107
ignoreHitPause = 1

[State 3105, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3105, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 3105
value = 3105

[State 3105, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 3105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3105, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3105, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3105, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 4 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 8
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
ground.velocity = -11,-3
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -11,-3
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
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 3105, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 3105, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1107
ignoreHitPause = 1

[State 3105, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<MAX JOKER VENOM GAS PROJECTILE>=========================
[StateDef 3155]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3105
sprPriority = 3

[State 3155, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1107
ignoreHitPause = 1

[State 3155, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3155, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 3105
value = 3105

[State 3155, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 3155, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3155, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3155, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3155, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3155, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 4 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 210 < 7, 7, fvar(11) * 210)), 8
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
ground.velocity = -11,-3
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -11,-3
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
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 3155, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 3155, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1107
ignoreHitPause = 1

[State 3155, End]
type = DestroySelf
trigger1 = pos x != [-200,200]

;=====================<BUZZER PROJECTILE>=========================
[Statedef 3310]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3301
ctrl = 0
juggle = 6
sprpriority = 9

[State 3310, ontop]
type = SprPriority
trigger1 = 1
value = 9

[State 3310, 6]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3310, PosSet]
type = PosSet
trigger1 = 1
x = parent, Pos X + (0 * parent, facing)
y = parent, Pos Y + 0

[State 3310, HitDef]
type = HitDef
trigger1 = Time % 6 = 0 && Time < 117
attr = S, HA
damage = 12,3
getPower = 0, 0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,11
hitsound = S2,2
guardsound = S3,0
sparkno = S10006
guard.sparkno = S10003
sparkxy = -15,-95
animtype = Heavy
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1,-1
guard.velocity = -2
air.velocity = -1,-1
down.velocity = -1,-1
priority.hit = 12;,Hit
fall = 1
air.fall = 1
palfx.time = 25
palfx.color = 64
palfx.invertall = 1
palfx.add = 1,1,128
palfx.mul = 256,256,256

[State 3310, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3310, HitSpark]
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
persistent = 1
ignoreHitPause = 1

[State 3310, Counter FX]
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

[State 3310,snd]
type = PlaySnd
trigger1 = movehit || MoveGuarded
value = 60,20
channel = 4

[State 3310, gas]
type = Explod
triggerall = !NumExplod(3302)
trigger1 = movehit || MoveGuarded
anim = 3302
id = 3302
pos = 0,-25
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
bindtime = 999
velocity = 1.5, 0
removetime = 34
ownpal = 1

[State 3310,1]
type = Destroyself
trigger1 = time = 116

;=====================<MAX BUZZER PROJECTILE>=========================
[Statedef 3360]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3301
ctrl = 0
juggle = 6
sprpriority = 9

[State 3360, ontop]
type = SprPriority
trigger1 = 1
value = 9

[State 3360, 6]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3360, PosSet]
type = PosSet
trigger1 = 1
x = parent, Pos X + (0 * parent, facing)
y = parent, Pos Y + 0

[State 3360, HitDef]
type = HitDef
trigger1 = Time % 4 = 0 && Time < 117
attr = S, HA
damage = 12,3
getPower = 0, 0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,11
hitsound = S2,2
guardsound = S3,0
sparkno = S10006
guard.sparkno = S10003
sparkxy = -15,-95
animtype = Heavy
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1,-1
guard.velocity = -2
air.velocity = -1,-1
down.velocity = -1,-1
priority.hit = 12;,Hit
fall = 1
air.fall = 1
palfx.time = 25
palfx.color = 64
palfx.invertall = 1
palfx.add = 1,1,128
palfx.mul = 256,256,256

[State 3360, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3360, HitSpark]
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
persistent = 1
ignoreHitPause = 1

[State 3360, Counter FX]
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

[State 3360,snd]
type = PlaySnd
trigger1 = movehit || MoveGuarded
value = 60,20
channel = 4

[State 3360, gas]
type = Explod
triggerall = !NumExplod(3302)
trigger1 = movehit || MoveGuarded
anim = 3302
id = 3302
pos = 0,-25
postype = p2
sprpriority = 6
ontop = 1
;removeongethit = 1
bindtime = 999
velocity = 1.5, 0
removetime = 34
ownpal = 1

[State 3360,1]
type = Destroyself
trigger1 = time = 116

;=====================<FLAMES PROJECTILE>=========================
[Statedef 3410]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3401
ctrl = 0
juggle = 6
sprpriority = 9

[State 3410, ontop]
type = SprPriority
trigger1 = 1
value = 9

[State 3410, 6]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3410, PosSet]
type = PosSet
trigger1 = 1
x = parent, Pos X + (0 * parent, facing)
y = parent, Pos Y + 0

[State 3410, HitDef]
type = HitDef
trigger1 = Time % 6 = 0 && Time < 117
attr = S, HA
damage = 13,3
getPower = 0, 0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,11
hitsound = S60,23
guardsound = S3,0
sparkno = S10006
guard.sparkno = S10003
sparkxy = -15,-45
animtype = Heavy
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1,-1
guard.velocity = -2
air.velocity = -1,-1
down.velocity = -1,-1
priority.hit = 12;,Hit
fall = 1
air.fall = 1
palfx.time = 25
palfx.add = 40,-60,-150
palfx.sinadd = 60,25,0,10
palfx.color = 0
palfx.invertall = 1

[State 3410, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3410, HitSpark]
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
persistent = 1
ignoreHitPause = 1

[State 3410, Counter FX]
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

[State 3410, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3410,snd]
type = PlaySnd
trigger1 = movehit || MoveGuarded
value = 60,23
channel = 4

[State 3410,1]
type = Destroyself
trigger1 = time = 116

;=====================<MAX FLAMES PROJECTILE>=========================
[Statedef 3460]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3401
ctrl = 0
juggle = 6
sprpriority = 9

[State 3460, ontop]
type = SprPriority
trigger1 = 1
value = 9

[State 3460, 6]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 3460, PosSet]
type = PosSet
trigger1 = 1
x = parent, Pos X + (0 * parent, facing)
y = parent, Pos Y + 0

[State 3460, HitDef]
type = HitDef
trigger1 = Time % 4 = 0 && Time < 117
attr = S, HA
damage = 13,3
getPower = 0, 0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,11
hitsound = S60,23
guardsound = S3,0
sparkno = S10006
guard.sparkno = S10003
sparkxy = -15,-45
animtype = Heavy
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1,-1
guard.velocity = -2
air.velocity = -1,-1
down.velocity = -1,-1
priority.hit = 12;,Hit
fall = 1
air.fall = 1
palfx.time = 25
palfx.add = 40,-60,-150
palfx.sinadd = 60,25,0,10
palfx.color = 0
palfx.invertall = 1

[State 3460, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3460, HitSpark]
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
persistent = 1
ignoreHitPause = 1

[State 3460, Counter FX]
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

[State 3460, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3460,snd]
type = PlaySnd
trigger1 = movehit || MoveGuarded
value = 60,23
channel = 4

[State 3460,1]
type = Destroyself
trigger1 = time = 116

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

;========================<FLAMES>=============================
[StateDef 8150]
type = A
velSet = 0,0
anim = 1

[State 8150, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 8150, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.mid.pos.y))

[State 8150, PosSet (Laying Down)]
type = PosSet
trigger1 = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) - 20

[State 8150, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 8150, Flame Explod 1]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8150
sprPriority = 3
posType = P1
random = 40,40
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, Flames Explod 2]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8150
sprPriority = 3
posType = P1
random = 60,60
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, End]
type = DestroySelf
trigger1 = Time >= 600
trigger2 = !PlayerIDexist(var(0))

[State 8150, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), Movetype != H || PlayerID(var(0)), StateNo = 5300
trigger3 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])
trigger4 = Root, MoveHit

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
vel = ((RootDist x - 9) / 32.0), ((RootDist y - 71) / 32.0)
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

[State 8600, Move Name: Imperial Royal Flush]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Joker Venom Gas]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Death in the Family]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Move Name: Buzzer]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3300,3399])
var(0) = 5

[State 8600, Move Name: Flames]
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
