; _________________________________________
;| Elektrosoldat by Saikou Shiva           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------
; Größer Flak Tritt
[StateDef 3000]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -ifelse(var(53) > 0, 0, 1000)
faceP2 = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
trigger1 = Time = 2
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-20 * const(size.xScale)), ceil(-9 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = -1;s8500,0
darken = 0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0
value = 20,0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0
channel = 0

[State 3000, Slash Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 1

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Flak Tritt FX]
type = Explod
trigger1 = Animelem = 5
anim = 1105
pos = 9, -75
postype = p1
facing = 1
scale = 1.4, 1.5
removetime = -2
sprpriority = 5
bindtime = 9999
ignorehitpause = 0

[State 3000, Velocity]
type = VelSet
trigger1 = time = 43
x = 3

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 3.0
y = -4.9

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.58

[State 3000, HitDef 1]
type = HitDef
trigger1 = !AILevel
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -6.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 1]
type = HitDef
trigger1 = AILevel
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -6.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -5.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -4.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3001

;--------------------------------------------------------------
; Flak Tritt
[StateDef 3001]
type = S
anim = 3001
physics = N
moveType = A
velSet = 0,0

[State 3001, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3001, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0
value = 20,0

[State 3001, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3001, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,0
channel = 0

[State 3001, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 1

[State 3001, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 3001, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Flak Tritt FX]
type = Explod
trigger1 = Animelem = 4
anim = 1105
pos = 9, -75
postype = p1
facing = 1
scale = 1.4, 1.5
removetime = -2
sprpriority = 5
bindtime = 9999
ignorehitpause = 0

[State 3001, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 1.333
y = -9.333

[State 3001, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
y = 0.58

[State 3001, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -3.16, -6.81
air.cornerPush.velOff = 0
yAccel = 0.54
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3001, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -9.81
ground.cornerPush.velOff = 0
guard.velocity = -6.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -9.81
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3001, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.16, -6.81
ground.cornerPush.velOff = 0
guard.velocity = -6.64
guard.cornerPush.velOff = 0
air.velocity = -3.16, -6.81
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3001, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3001, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3002

;--------------------------------------------------------------
;Landing
[StateDef 3002]
type = S
anim = 1101
physics = N
moveType = I
velSet = 0,0

[State 3002, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 3002, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3002, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3002, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3002, End]
type = ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 3002, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------
; MAX Größer Flak Tritt
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -ifelse(var(53) > 0, 1000, 2000)
faceP2 = 1

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 2
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-20 * const(size.xScale)), ceil(-9 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, Flak Tritt FX]
type = Explod
trigger1 = Animelem = 5
anim = 1105
pos = 9, -75
postype = p1
facing = 1
scale = 1.4, 1.5
removetime = -2
sprpriority = 5
bindtime = 9999
ignorehitpause = 0

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = -1;s8500,0
darken = 0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0
value = 20,0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0
channel = 0

[State 3050, Slash Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 1

[State 3050, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3050, Velocity]
type = VelSet
trigger1 = time = 43
x = 5

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 3.0
y = -4.9

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.58

[State 3050, HitDef 1]
type = HitDef
trigger1 = !AILevel
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -6.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 1]
type = HitDef
trigger1 = AILevel
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -5.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -4.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3051

;--------------------------------------------------------------
; Flak Tritt [1]
[StateDef 3051]
type = S
anim = 3001
physics = N
moveType = A
velSet = 0,0

[State 3051, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3051, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0
value = 20,0

[State 3051, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3051, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 3051, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,1
channel = 1

[State 3051, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 3051, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Flak Tritt FX]
type = Explod
trigger1 = Animelem = 4
anim = 1105
pos = 9, -75
postype = p1
facing = 1
scale = 1.4, 1.5
removetime = -2
sprpriority = 5
bindtime = 9999
ignorehitpause = 0

[State 3051, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 3.0
y = -4.9

[State 3051, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
y = 0.58

[State 3051, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -6.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3051, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -5.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3051, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32,0
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -4.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3051, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3052

;--------------------------------------------------------------
; Flak Tritt [2]
[StateDef 3052]
type = S
anim = 3005
physics = N
moveType = A
velSet = 0,0

[State 3052, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3052, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0
value = 20,0

[State 3052, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3052, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,0
channel = 0

[State 3052, Slash Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1100,1
channel = 1

[State 3052, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 3052, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Flak Tritt FX]
type = Explod
trigger1 = Animelem = 5
anim = 1105
pos = 9, -75
postype = p1
facing = 1
scale = 1.4, 1.5
removetime = -2
sprpriority = 5
bindtime = 9999
ignorehitpause = 0

[State 3052, Fwd Momentum]
type = VelSet
trigger1 = AnimElem = 2
x = 3.5

[State 3052, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 1.333
y = -9.333

[State 3052, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.58

[State 3052, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -3.16, -6.81
air.cornerPush.velOff = 0
yAccel = 0.54
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -42
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3052, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 11
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -5.16
guard.cornerPush.velOff = 0
air.velocity = -1.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.59
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3052, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 12
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -9.81
ground.cornerPush.velOff = 0
guard.velocity = -6.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -9.81
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 85), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3052, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 13
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -11.81
ground.cornerPush.velOff = 0
guard.velocity = -6.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -9.81
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 85), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3052, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 14
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.16, -6.81
ground.cornerPush.velOff = 0
guard.velocity = -6.64
guard.cornerPush.velOff = 0
air.velocity = -3.16, -6.81
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 85), var(36) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3052, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3052, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3002

;--------------------------------------------------------------
; Größer Blitzkugel
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
poweradd = -ifelse(var(53) > 0, 0, 1000)
sprpriority = 1
facep2 = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3100, EX reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Voice]
type = playsnd
trigger1 = animelem = 3
value = 4 , 3
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1000, 1

[State 3100, Super Pause FX]
type = helper
trigger1 = time = 2
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 28, -77
ownpal = 1
persistent = 0
supermovetime = 9999
size.xScale = 1
size.yScale = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = time = 2
time = 45
movetime = 45
anim = -1
sound = -1;s8500,0
p2defmul = 1
darken = 0

[State 3100, Corner Push]
type = varset
trigger1 = animelem = 1
fvar(5) = 0

[State 3100, NotHitBy]
type = nothitby
trigger1 = animelemtime(3) < 1
time = 1
value = SCA

[State 3100, Grosse Kugel Proj]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 3105
ID = 3105
name = "Kugel Projectile"
postype = p1
pos = 30, -77
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3100, Dust]
type = explod
trigger1 = animelem = 3
vel = 0, 0
anim = 8106
ID = 8106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--------------------------------------------------------------
; MAX Größer Blitzkugel
[Statedef 3150]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
poweradd = -ifelse(var(53) > 0, 1000, 2000)
sprpriority = 1
facep2 = 1

[State 3150, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3150, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)

[State 3150, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3150, EX reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Voice]
type = playsnd
trigger1 = animelem = 3
value = 4 , 3
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1000, 1

[State 3150, Super Pause FX]
type = helper
trigger1 = time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = 28, -77
ownpal = 1
persistent = 0
supermovetime = 9999
size.xScale = 1
size.yScale = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = time = 2
time = 45
movetime = 45
anim = -1
sound = -1;s8500,0
p2defmul = 1
darken = 0

[State 3150, Corner Push]
type = varset
trigger1 = animelem = 1
fvar(5) = 0

[State 3150, NotHitBy]
type = nothitby
trigger1 = animelemtime(3) < 3
time = 1
value = SCA

[State 3150, Grosse Kugel Proj]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 3155
ID = 3155
name = "Kugel Projectile"
postype = p1
pos = 30, -77
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3150, Dust]
type = explod
trigger1 = animelem = 3
vel = 0, 0
anim = 8106
ID = 8106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3150, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------
;Blitzbombe
[StateDef 3300]
type = S
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -ifelse(var(53) > 0, 1000, 3000)
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3300, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3300, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 3300, NotHitBy (Projectiles)]
type= NotHitBy
trigger1 = AnimElemTime(6) > 1
trigger1 = AnimElemTime(34) < 0
value = , AP
time = 1

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 0, -78
facing = facing
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = -1;s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000, 0
channel = 1

[State 3300, Elctrcty Snd]
type = PlaySnd
trigger1 = Animelem = 6 || Animelem = 9 || Animelem = 12 || Animelem = 15
trigger2 = Animelem = 18 || Animelem = 21 || Animelem = 24
trigger3 = Animelem = 27 || Animelem = 30 || Animelem = 33
value = 1000, 1

[State 3300, Shock FX]
type = Explod
trigger1 = AnimElem = 5
anim = 3310
ID = 3310
sprPriority = 2
bindtime = -1
removeTime = -1
posType = P1
pos = -6, 0
scale = 0.75, 0.5
removeOnGetHit = 1
ignoreHitPause = 0
supermovetime = 12
ownPal = 1

[State 3300, Electricity FX]
type = Explod
trigger1 = AnimElem = 5
anim = 3315
ID = 3315
sprPriority = 1
bindtime = -1
removeTime = -1
posType = P1
pos = 0, 0
scale = 1.25, 1.5
removeOnGetHit = 1
ignoreHitPause = 0
supermovetime = 12
ownPal = 1

[State 3300, RemoveExplod Shock]
type = RemoveExplod
trigger1 = AnimElemTime(35) = 3
ID = 3310

[State 3300, RemoveExplod Electricity]
type = RemoveExplod
trigger1 = AnimElemTime(35) = 3
ID = 3315

[State 3300, HitDef 1]
type = HitDef
triggerAll = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 7
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 2]
type = HitDef
triggerAll = !var(16) && (var(15) < 8 || var(20))
trigger1 = AnimElem = 9
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 3]
type = HitDef
triggerAll = !var(16) && (var(15) < 9 || var(20))
trigger1 = AnimElem = 12
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 4]
type = HitDef
triggerAll = !var(16) && (var(15) < 10 || var(20))
trigger1 = AnimElem = 15
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 5]
type = HitDef
triggerAll = !var(16) && (var(15) < 11 || var(20))
trigger1 = AnimElem = 18
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 6]
type = HitDef
triggerAll = !var(16) && (var(15) < 12 || var(20))
trigger1 = AnimElem = 21
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 7]
type = HitDef
triggerAll = !var(16) && (var(15) < 13 || var(20))
trigger1 = AnimElem = 24
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 8]
type = HitDef
triggerAll = !var(16) && (var(15) < 14 || var(20))
trigger1 = AnimElem = 27
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.32
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.61
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 9]
type = HitDef
triggerAll = !var(16) && (var(15) < 15 || var(20))
trigger1 = AnimElem = 30
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 0, 8
guard.pauseTime = 0, 8
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4.32, -6
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -4.32, -6
air.cornerPush.velOff = 0
yAccel = 0.69
fall = 1
air.fall = 1
fall.recover = 0
kill = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := ceil(P2Dist x - 10)), var(36) := ceil(P2Dist y - 65)
palfx.time = 80
palfx.sinadd = 120,120,120,12
palfx.add = -100,-20,60
palfx.color = 0
palfx.invertall = 1
envShake.time = 46
envShake.ampl = 6
envShake.freq = 120

[State 3300, Shock Particles]
type = Helper
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(34) >= 0
moveType = I

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1