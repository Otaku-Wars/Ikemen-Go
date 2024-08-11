; _________________________________________
;| Superman by varo_hades                  |
; ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<SUPER PUNCH>=============================
[StateDef 3000]
type = S
physics = N
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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
trigger1 = Time = 3
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-81 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3000, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 8

[State 3000, 6]
type = PlaySnd
trigger1 = animelem = 3
value = 1400,0

[State 3000, 3]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 3000, 6]
type = PlaySnd
trigger1 = Time = 0
value = 3000,0

[State 3000, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 3005

;Attack
[Statedef 3005]
type = S
movetype = A
physics = N
velset = 0,0
juggle = 1
anim = 3005
poweradd = 0
ctrl = 0

[State 3005,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3005, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 1
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 250 < 7, 7, fvar(11) * 250)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10,-5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -10, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3010

[State 3005, Landing Dust Explod]
type = Explod
trigger1 = animelem = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3005, Wind];dust
type = Explod
trigger1 = animelem = 1
anim = 3003
ID = 3005
pos = 65,0
postype = p1
bindtime = 1
scale = .6,.6;const(size.xscale),Const(size.yscale)
sprpriority = 8
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 3005, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3010]
type = A
movetype = H
physics = N

[State 3010]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3010, ステート変更]
type = ChangeState
triggerall = PrevStateno =[3011,3012]
trigger1 = Time = 0
value = 3012

[State 3010, 3]
type = PlayerPush
trigger1 = 1
value = 0

[State 3010, 制御した相手のアニメ変更]
type = ChangeAnim
Trigger1 = Time = 0
value = ifelse(SelfAnimExist(5052) = 1,5052,5030)

[State 3010, 速度加算]
type = VelAdd
trigger1 = BackEdgeBodyDist >= 10
trigger2 = FrontEdgeBodyDist >= 10
x = -2

[State 3010, 速度加算]
type = Velset
trigger1 = time = 0
y = 0

[State 3010, ステート変更] ;壁に当たる時のステートに行く
type = ChangeState
trigger1 = BackEdgeBodyDist <= 10
trigger2 = FrontEdgeBodyDist <= 10
value = 3011

[State 3010, 制御解除して相手のステートに戻す]
type = SelfState
trigger1 = time = 100
value = 5100

;Player 2
[Statedef 3011]
type = A
movetype = H
physics = N

[State 3011]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3011, 移動速度]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 3011, 移動速度]
type = Veladd
trigger1 = Time = 0
x = 0
y = 0

[State 3011, 制御した相手のアニメ変更]
type = ChangeAnim
Trigger1 = Time = 0
value = 5000

[State 3011, 振り返る]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 20)

[State 3011, 軸位置移動]
type = PosAdd
trigger1 = Time = 0
x = 15 - BackEdgeBodyDist
y = -10

[State 3011, 移動を止める]
type = PosFreeze
trigger1 = 1
x = 0
y = 0

[State 3011, カメラスクロールの有無]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3011, 3]
type = EnvShake
Trigger1 = Time = 0
time = 20
freq = 60
ampl = -4
phase = 120

[State 3011, ステート変更]
type = ChangeState
trigger1 = Time = 5
value = 3012

;Player 2
[Statedef 3012]
type = A
movetype = H
physics = N

[State 3012, 3]
type = PlayerPush
trigger1 = 1
value = 0

[State 3012, 移動速度]
type = VelSet
trigger1 = Time = 0
x = 1
y = -4

[State 3012, 重力代わり]
type = VelAdd
trigger1 = 1
y = .33

[State 3012, アニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse(SelfAnimExist(5052) = 1,5052,5050)

[State 3012, 相手ステートに戻す]
type = SelfState
trigger1 = (Vel Y > 0) && (Pos Y >= 0)
value = 5100

;========================<MAX SUPER PUNCH>=============================
[StateDef 3050]
type = S
physics = N
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
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
trigger1 = Time = 3
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-81 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3050, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 8

[State 3050, 6]
type = PlaySnd
trigger1 = animelem = 3
value = 1400,0

[State 3050, 3]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 3050, 6]
type = PlaySnd
trigger1 = Time = 0
value = 3000,0

[State 3050, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 3055

;Attack
[Statedef 3055]
type = S
movetype = A
physics = N
velset = 0,0
juggle = 1
anim = 3005
poweradd = 0
ctrl = 0

[State 3055,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3055, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Animelem = 1
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 175 < 7, 7, fvar(11) * 175)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,12
guard.pauseTime = 3,12
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10,-5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -10, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3055, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = Animelem = 2
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 175 < 7, 7, fvar(11) * 175)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10,-5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -10, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3010

[State 3055, Landing Dust Explod]
type = Explod
trigger1 = animelem = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3055, Wind];dust
type = Explod
trigger1 = animelem = 1
anim = 3003
ID = 3005
pos = 65,0
postype = p1
bindtime = 1
scale = .6,.6;const(size.xscale),Const(size.yscale)
sprpriority = 8
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 3055, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;========================<NO MERCY>=============================
[StateDef 3100]
type = S
physics = S
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3100, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3100, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-91 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3100, 2]
type = PlaySnd
trigger1 = Time = 3
value = 3100,0

[State 3100, 1]
type = VelSet
trigger1 = AnimElem = 5
x = 10

[State 3100, flash]
type = explod
trigger1 = animelem = 5
anim = 3111
postype = p1
pos = -75, -94
sprpriority = 2
ignorehitpause = 1
ownpal = 1
supermove = 1

[State 3100, 6]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,1

[State 3100, 1]
type = HitDef
trigger1 = Time = 0
attr = S, NT
hitflag = MAF
guardflag =
priority = 1
pausetime = 0,10
snap = -40, 0, 0
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := -1)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -107
p2facing = 1
p1stateno = 3101
p2stateno = 3102

[State 3100, 3]
type = VelSet
trigger1 = time = 50
x = 0

[State 3100, 4]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p1 grab animation
[Statedef 3101]
type = S
movetype = A
physics = N
anim = 3101
sprpriority = 5

[State 3101, 3]
type = VelSet
trigger1 = time = 0
x = 0

[State 3101,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3101, 6]
type = PlaySnd
trigger1 = time = 0
value = 800,0

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 1
pos = 80,-16
time = 26

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 2
pos = 16,-40
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 3
pos = 4,-21
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 4
pos = -22,-19
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 5
pos = -4,-111
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 6
pos = 1,-8
time = 4

[State 3101, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 6
value = -50

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = Time = 50
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, 6]
type = PlaySnd
trigger1 = Time = 50
value = 1100,1

[State 3101, Kaboom]
type = Explod
trigger1 = Time = 50
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 7
pos = 15,-5
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 8
pos = 20,0
time = 2

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 9
pos = 20,-4
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 10
pos = 20,-4
time = 4

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 11
pos = -4,-111
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 12
pos = 1,-8
time = 4

[State 3101, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 12
value = -50

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = Time = 72
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, 6]
type = PlaySnd
trigger1 = Time = 72
value = 1100,1

[State 3101, Kaboom]
type = Explod
trigger1 = Time = 72
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 13
pos = 15,-5
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 14
pos = 20,0
time = 2

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 15
pos = 20,-4
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 16
pos = 20,-4
time = 4

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 17
pos = -4,-111
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 18
pos = 1,-8
time = 4

[State 3101, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 18
value = -50

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = Time = 93
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, 6]
type = PlaySnd
trigger1 = Time = 93
value = 1100,1

[State 3101, Kaboom]
type = Explod
trigger1 = Time = 93
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 19
pos = 15,-5
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 20
pos = 20,0
time = 2

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 21
pos = 20,-4
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 22
pos = 20,-4
time = 4

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 23
pos = -4,-111
time = 5

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 24
pos = 1,-8
time = 4

[State 3101, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 24
value = -50

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = Time = 109
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, 6]
type = PlaySnd
trigger1 = Time = 109
value = 1100,1

[State 3101, Kaboom]
type = Explod
trigger1 = Time = 109
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 25
pos = 15,-5
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 26
pos = 20,0
time = 2

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 27
pos = 20,-4
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 28
pos = 20,-4
time = 4

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 29
pos = 24,-101
time = 8

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 30
pos = -4,-111
time = 2

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 31
pos = 1,-8
time = 2

[State 3101, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 31
value = -50

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = Time = 133
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, 6]
type = PlaySnd
trigger1 = Time = 133
value = 1100,1

[State 3101, 6]
type = PlaySnd
trigger1 = Time = 133
value = 1,6

[State 3101, Kaboom]
type = Explod
trigger1 = Time = 133
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 32
pos = 1,-8
time = 2

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 33
pos = 1,-8
time = 7

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 34
pos = 15,-5
time = 6

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 35
pos = 20,0
time = 6

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 36
pos = 20,-4
time = 6

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 37
pos = 20,-4
time = 4

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 38
pos = 20,-4
time = 4

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 39
pos = -16,-2
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 40
pos = -47,-124
time = 10

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 41
pos = -20,-2
time = 3

[State 3101, 2]
type = TargetBind
Trigger1 = animelem = 42
pos = 79,-24
time = 1

[State 3101, 9]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;state for p2 when grab
[Statedef 3102]
type = A
movetype = H
physics = N
anim = 5050
ctrl = 0
velset = 0,0
sprpriority = 6

[State 3102, 2]
type = SprPriority
trigger1 = animelem = 29
value = 4

[State 3102, 2]
type = SprPriority
trigger1 = animelem = 30
value = 6

[State 3102, 9]
type = Changeanim2
Trigger1 = Time = 0
value = 3103
ctrl = 0

[State 213, 1]
type = VelAdd
trigger1 = animelem = 42
x = -55

[State 2111, 6]
type = ScreenBound
trigger1 = Time = 168
Trigger2 = MoveHit
value = 100

[State 213, 4]
type = changestate
trigger1 = animtime = 0
value = 3103

;Player 2
[Statedef 3103]
type = A
movetype = H ;Get hit
physics = N
lifeadd = -100

[State 3103, Sacudida]
type = EnvShake
Trigger1 = Time = 0
time = 15
ampl = -3
freq = 90
phase = 90

[State 3103,19]
type = GameMakeAnim
trigger1 = time = 0
value = 72
postype = p2

[State 3103, 4]
type = SelfState
trigger1 = Time = 0
value = 5050
;end for p2

;========================<MAX NO MERCY>=============================
[StateDef 3150]
type = S
physics = S
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3150, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3150, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3150, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3150, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-91 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3150, 2]
type = PlaySnd
trigger1 = Time = 3
value = 3100,0

[State 3150, 1]
type = VelSet
trigger1 = AnimElem = 5
x = 10

[State 3150, flash]
type = explod
trigger1 = animelem = 5
anim = 3111
postype = p1
pos = -75, -94
sprpriority = 2
ignorehitpause = 1
ownpal = 1
supermove = 1

[State 3150, 6]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,1

[State 3150, 1]
type = HitDef
trigger1 = Time = 0
attr = S, NT
hitflag = MAF
guardflag =
priority = 1
pausetime = 0,10
snap = -40, 0, 0
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := -1)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -107
p2facing = 1
p1stateno = 3151
p2stateno = 3102

[State 3150, 3]
type = VelSet
trigger1 = time = 50
x = 0

[State 3150, 4]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p1 grab animation
[Statedef 3151]
type = S
movetype = A
physics = N
anim = 3101
sprpriority = 5

[State 3151, 3]
type = VelSet
trigger1 = time = 0
x = 0

[State 3151,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3151, 6]
type = PlaySnd
trigger1 = time = 0
value = 800,0

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 1
pos = 80,-16
time = 26

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 2
pos = 16,-40
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 3
pos = 4,-21
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 4
pos = -22,-19
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 5
pos = -4,-111
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 6
pos = 1,-8
time = 4

[State 3151, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 6
value = -70

[State 3151, Landing Dust Explod]
type = Explod
trigger1 = Time = 50
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3151, 6]
type = PlaySnd
trigger1 = Time = 50
value = 1100,1

[State 3151, Kaboom]
type = Explod
trigger1 = Time = 50
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 7
pos = 15,-5
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 8
pos = 20,0
time = 2

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 9
pos = 20,-4
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 10
pos = 20,-4
time = 4

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 11
pos = -4,-111
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 12
pos = 1,-8
time = 4

[State 3151, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 12
value = -70

[State 3151, Landing Dust Explod]
type = Explod
trigger1 = Time = 72
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3151, 6]
type = PlaySnd
trigger1 = Time = 72
value = 1100,1

[State 3151, Kaboom]
type = Explod
trigger1 = Time = 72
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 13
pos = 15,-5
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 14
pos = 20,0
time = 2

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 15
pos = 20,-4
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 16
pos = 20,-4
time = 4

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 17
pos = -4,-111
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 18
pos = 1,-8
time = 4

[State 3151, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 18
value = -70

[State 3151, Landing Dust Explod]
type = Explod
trigger1 = Time = 93
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3151, 6]
type = PlaySnd
trigger1 = Time = 93
value = 1100,1

[State 3151, Kaboom]
type = Explod
trigger1 = Time = 93
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 19
pos = 15,-5
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 20
pos = 20,0
time = 2

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 21
pos = 20,-4
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 22
pos = 20,-4
time = 4

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 23
pos = -4,-111
time = 5

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 24
pos = 1,-8
time = 4

[State 3151, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 24
value = -70

[State 3151, Landing Dust Explod]
type = Explod
trigger1 = Time = 109
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3151, 6]
type = PlaySnd
trigger1 = Time = 109
value = 1100,1

[State 3151, Kaboom]
type = Explod
trigger1 = Time = 109
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
removetime = 27
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 25
pos = 15,-5
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 26
pos = 20,0
time = 2

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 27
pos = 20,-4
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 28
pos = 20,-4
time = 4

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 29
pos = 24,-101
time = 8

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 30
pos = -4,-111
time = 2

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 31
pos = 1,-8
time = 2

[State 3151, 7]
type = TargetLifeAdd
Trigger1 = AnimElem = 31
value = -70

[State 3151, Landing Dust Explod]
type = Explod
trigger1 = Time = 133
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3151, 6]
type = PlaySnd
trigger1 = Time = 133
value = 1100,1

[State 3151, 6]
type = PlaySnd
trigger1 = Time = 133
value = 1,6

[State 3151, Kaboom]
type = Explod
trigger1 = Time = 133
anim = 3209
pos = 10,9
postype = p1
sprpriority = 7
supermove = 1
bindtime = 1
scale = 1.5,1

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 32
pos = 1,-8
time = 2

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 33
pos = 1,-8
time = 7

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 34
pos = 15,-5
time = 6

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 35
pos = 20,0
time = 6

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 36
pos = 20,-4
time = 6

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 37
pos = 20,-4
time = 4

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 38
pos = 20,-4
time = 4

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 39
pos = -16,-2
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 40
pos = -47,-124
time = 10

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 41
pos = -20,-2
time = 3

[State 3151, 2]
type = TargetBind
Trigger1 = animelem = 42
pos = 79,-24
time = 1

[State 3151, 9]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<SUPERMAN JUSTICE>=============================
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-5 * const(size.xScale)), ceil(-81 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3200, 2]
type = PlaySnd
trigger1 = Time = 3
value = 3200,0

[State 3200, 3]
type = VelAdd
trigger1 = 1
trigger1 = Pos Y < 0
y = .02

[State 3200, 4]
type = PosSet
trigger1 = Pos Y >= -1
y = 0

[State 3200, 5]
type = VelSet
trigger1 = Pos Y >= -1
y = 0

[State 3200, 6]
type = PlaySnd
trigger1 = animelem = 4
value = 3200, 1

[State 3200, 1]
type = VelSet
trigger1 = AnimElem = 4
x = 20

[State 3200, VelSet]
type = VelSet
trigger1 = p2bodydist x <= 40
x = 0

[State 3200, 1]
type = HitDef
trigger1 = Animelem = 11
attr = S, HT
;hitflag = M
;guardflag = M
pausetime = 1, 1
priority = 1, Miss
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := -1)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -107
p1stateno = 3201
p2stateno = 3215
p2facing = -1
fall = 1

[State 3200, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Throw
[Statedef 3201]
type = S
movetype = I
physics = N
ctrl = 0
anim = 3201
velset = 0, 0
sprpriority = 2

[State 3201,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3201, 3]
type = TargetBind
trigger1 = AnimElem = 1
pos = 60, 0
time = 2

[State 3201, 5]
type = TargetBind
trigger1 = AnimELem = 2
pos = 50, 0
time = 3

[State 3201, 7]
type = TargetBind
trigger1 = AnimElem = 3
pos = 39,-40;39,-20 ;39, -81
time = 18

[State 3201, 8]
type = VelSet
trigger1 = AnimElem = 3
y = -6; -11.5
x = 1.3

[State 3201, 9]
type = Gravity
trigger1 = AnimElemNo(0) = [3,8]

[State 3201, 10]
type = VelSet
trigger1 = AnimElem = 9
y = 0

[State 3201, 11]
type = TargetBind
trigger1 = AnimElem = 9
pos = 56,-40 ;56,-20;56, -73
time = 5

[State 3201, 15]
type = Gravity
trigger1 = AnimElemNo(0) = 11

[State 3201, 16]
type = ChangeState
trigger1 = AnimElemNo(0) = 10
;trigger1 = Pos Y >= 0
value = 3202

;Being Grabbed state
[Statedef 3215]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State 3215,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3215, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 3215;805

[State 3215, 2]
type = ScreenBound
trigger1 = 1
value = 0

;Attack
[StateDef 3202]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 3202
poweradd = 0
sprpriority = 2

[State 3202,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3202, 6]
type = PlaySnd
trigger1 = Animelem = 5
value = 1, 6

[State 3202, superpause]
type = SuperPause
trigger1 = AnimElem = 1
time = 40
sound = S10,1
anim = -1
;pos = -45,-98 ;-45,-95:MyMugenscale
;darken = 1

[State 3202, flash]
type = explod
trigger1 = AnimElem = 1
anim = 3208
postype = p1
pos = -49,-98
sprpriority = 9
ignorehitpause = 1
removetime = 40
removeongethit = 1
ownpal = 1
supermove = 1
scale = 1.25,1.25

[State 3202, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 5
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3202, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3202, Shock wave]
type = Explod
trigger1 = Animelem = 5;Movecontact = 1
anim = 3211
pos = 30,-55
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 3202, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3202, Rocks Boom]
type = Explod
trigger1 = Animelem = 5;Movecontact = 1
anim = 3209
pos = -10,90
postype = p2
sprpriority = 5
supermove = 1
bindtime = 1
scale = 1,1

[State 3202, 1]
type = HitDef
trigger1 = AnimElem = 6
attr = S, HA
damage = ceil(ifElse(fvar(11) * 200 < 7, 7, fvar(11) * 200)), 7
animtype = up
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 10, 10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -96
ground.type = High
ground.slidetime = 10
ground.hittime  = 20
ground.velocity = 0,-25
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -2,25
air.hittime = 20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
getpower = 0
fall = 1
fall.recover = 0
kill = 0
p2stateno = 3216

[State 3202, Epileptastic]
type = EnvColor
trigger1 = Movecontact = 1
value = 240,240,240
time = 1

[State 3202, end]
type = ChangeState
trigger1 = hitcount > 0 && animelem = 8
value = 3203
ctrl = 0

[State 3202, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;CustomState
[StateDef 3216]
type = A
movetype = H
physics = A
juggle = 1
velset = 0,-40
ctrl = 0
poweradd = 0
sprpriority = 1

[State 3216,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
;ignorehitpause =
;persistent =

[State 3216, Land]
type= changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100

;Follow
[Statedef 3203]
type = S
movetype = A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 3203

[State 3203,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3203, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N         ;A,C,S,N
;ignorehitpause =
;persistent =

[State 3203, VelSet]
type = VelSet
trigger1 = animelem = 2
y = -20
;ignorehitpause =
;persistent =

[State 3203, PlaySnd]
type = PlaySnd
trigger1 = time = 9
value = 1600,3

[State 3203, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
;ignorehitpause =
;persistent =

[State 3203, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1400,0;S9,1
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 3203, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, HT
hitflag = MAF
priority = 1, Miss
hitSound = -1 + 0 * (var(31) := -1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := -1)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -107
sprpriority = 1
p2facing = 1
p1stateno = 3204
p2stateno = 3217
fall = 1
fall.recover = 0
fall.damage = 150
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
numhits = 0

;Atmosphere Smash
[Statedef 3204]
type = A
movetype = A
physics = N
anim = 3204
poweradd = 0
velset = 0,0
sprpriority = 3

[State 3204, 2] ;Maximum Justice shout
type = PlaySnd
trigger1 = animelem = 2
value = 3200,2

[State 3204, AssertSpecial]
type = AssertSpecial
trigger1 = numexplod(3279) = 1
flag = nofg
flag2 = nobg
flag3 = nobardisplay

[State 3204, superpause]
type = SuperPause
trigger1 = Time = 1;AnimElem = 1
time = 101;115;80
sound = S10,1
pos = -10,-45
darken = 1

[State 3204, Explod]
type = Explod
trigger1 = time = 1
anim = 3279
ID = 3260
pos = -21,-95
;postype = left  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2 ;240
supermovetime = 999999
pausemovetime = 999999
scale = .5,.5
sprpriority = 2
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 0 ;1

[State 3204, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 20
id = 3279
;ignorehitpause =
;persistent =

[State 3204, HitSpark]
type = Helper
trigger1 = animelem = 20
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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

[State 3204, AssertSpecial]
type = AssertSpecial
trigger1 = numexplod(3260) = 1
flag = nofg
flag2 = nobg
flag3 = nobardisplay

[State 3204, HitAdd]
type = HitAdd
trigger1 = animelem = 19
value = 1
;ignorehitpause =
;persistent =

[State 3204, AllPalFX]
type = AllPalFX
trigger1 = time = 0
time = 2
add = 256,256,256

[State 3204, AllPalFX]
type = AllPalFX
trigger1 = animelem = 20
time = 2
add = 256,256,256

[State 3204, PlaySnd]
type = PlaySnd
trigger1 = animelem = 19
value = 2,2;S5,5
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0

[State 3204, PlaySnd]
type = PlaySnd
trigger1 = animelem = 18
value = S1,2
volume = 0
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0

[State 3204, Explod]
type = Explod
trigger1 = time = 1
anim = 3260
ID = 3260
pos = 0,100
postype = left  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0.2
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 3204, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 20
id = 3260
;ignorehitpause =
;persistent =

[State 3204, PosSet]
type = Posset
trigger1 = time = 0
x = 0
y = 150
;ignorehitpause =
;persistent =

[State 3204, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
;ignorehitpause =
;persistent =

[State 3204, Bind 1]
type = TargetBind
trigger1 = time = 0
pos = 30, -80

[State 3204, VelSet]
type = VelSet
trigger1 = time = 1
y = -5
;ignorehitpause =
;persistent =

[State 3204, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && time = [2,20]
y = .1
;ignorehitpause =
;persistent =

[State 3204, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && time = [40,70]
y = .15
;ignorehitpause =
;persistent =

[State 3204, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 19
value = -300
kill = 0

[State 3204, Throw]
type = TargetState
trigger1 = AnimElem = 20
value = 3218

[State 3204, PosAdd]
type = PosAdd
trigger1 = animelem = 20
x = -100
y = -500
;ignorehitpause =
;persistent =

[State 3204, VelAdd]
type = VelAdd
trigger1 = time > 83
y = .05
;ignorehitpause =
;persistent =

[State 3204, Helper]
type = Helper
triggerall = numhelper(3206) = 0
trigger1 = enemy, pos y = 0
helpertype = normal ;player
name = "splode"
ID = 3206
stateno = 3206
pos = 0,0
postype = p2    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermove
pausemove

[State 3204, Explod]
type = Explod
triggerall = numexplod(3218) = 0
trigger1 = enemy, pos y = 0
anim = 3218
ID = 3218
pos = 30,5
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 3204, Explod]
type = Explod
triggerall = numexplod(32188) = 0
trigger1 = enemy, pos y = 0
anim = 3218
ID = 32188
pos = 0,10
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 3204, Explod]
type = Explod
triggerall = numexplod(3219) = 0
trigger1 = enemy, pos y = 0
anim = 3218
ID = 3219
pos = -30,5
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 3204, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3205

;Land
[StateDef 3205]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 47;1055
poweradd = 0
sprpriority = 2

[State 3205, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3205, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1600,2 ;0,203;S40,0
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 3205, PosSet]
type = PosSet
trigger1 = time = 0
y = 0
;ignorehitpause =
;persistent =

[State 3205, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3217]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 3

[State 3217, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
;ignorehitpause =
;persistent =

[State 3217, VelSet]
type = VelSet
trigger1 = time = 1
y = -6
;ignorehitpause =
;persistent =

[State 3217, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && time = [2,30]
y = .2
;ignorehitpause =
;persistent =

[State 3217, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3250

;Player 2
[Statedef 3218]
type = A
movetype = H
physics = N
velset = 0,0
poweradd = 40

[State 3218, VelSet]
type = VelSet
trigger1 = time = 60
y = 30
;ignorehitpause =
;persistent =

[State 3218, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
;ignorehitpause =
;persistent =

[State 3218, PosAdd]
type = PosAdd
trigger1 = time = 0
y = -500
;ignorehitpause =
;persistent =

[State 3218, 4] ;Hit ground
type = changestate
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3219 ;Hit ground

;HitGround
[StateDef 3219]
type = S
movetype = H
physics = N
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2

[State 3219, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -350
kill = 1
absolute = 0
;ignorehitpause =
;persistent =

[State 3219, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3255
;elem = 1
;ignorehitpause =
;persistent =

[State 3219, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 60
freq = 80
ampl = 17
phase = 90
;ignorehitpause =
;persistent =

[State 3219, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 3219, end]
type = Selfstate
trigger1 = AnimTime = 0 && alive = 1
value = 5120
ctrl = 0

[State 3219, end]
type = Selfstate
trigger1 = AnimTime = 0 && alive != 1
value = 5150
ctrl = 0

;Splode
[StateDef 3206]
type = S
movetype = I
physics = N
velset = 0,0
ctrl = 0
anim = 3261
sprpriority = 2

[State 3206, Explod]
type = Explod
trigger1 = animelem = 1
anim = 3261
scale = 1.5,1.5
ID = 30006
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = 1,1
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0

[State 3206, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 1
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 1
anim = 3219
pos = 12,9
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 3
anim = 3212
pos = -100,0
postype = p2
sprpriority = 11
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 3
anim = 1675
pos = 26,9
scale = 1.3
postype = p2
sprpriority = 1
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 1
anim = 3212
pos = 0,0
postype = p2
sprpriority = 11;-1
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 3
anim = 3212
pos = 150,0
postype = p2
sprpriority = 11;-1
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 3
anim = 3212
pos = 50,-30
postype = p2
sprpriority = -1
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 3
anim = 3212
pos = -50,-30
postype = p2
sprpriority = -1
supermove = 1
bindtime = 1

[State 3206, Kaboom]
type = Explod
trigger1 = Time = 3
anim = 3212
pos = 100,-30
postype = p2
sprpriority = -1
supermove = 1
bindtime = 1

[State 3206, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3200,3;S9,6
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 3206, PosAdd]
type = PosAdd
trigger1 = time = 0
y = 20
;ignorehitpause =
;persistent =

[State 3206, end]
type = destroyself
trigger1 = time = 122

;========================<MEGA LASER VISION>=============================
[StateDef 3300]
type = A
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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
trigger1 = Time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

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
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3300, 1]
type = VelMul
trigger1 = Time = 0
x = .05
y = .02

[State 3300, 6]
type = PlaySnd
trigger1 = Time = 3
value = 3300,0

[State 3300, 6]
type = PlaySnd
trigger1 = Time = 20
value = 3300,1

[State 3300, 0]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal
name = "M_RAY"
id = 3305
postype = p1
pos = 17,13
stateno = 3305
keyctrl = 0
ownpal = 0
priority = 3

[State 3300 Pal FX]
type = BGPalfx
trigger1 = animelem = 13
sinadd = -205,-205,-205,180
add = 155,-55,-55
ignorehitpause = 1
time = 83
invertall = 1

[State 3300, 8]
type = ChangeState
trigger1 = Pos Y >= 5
trigger1 = Vel Y > 0
trigger1 = Time = 125
value = 52

[State 3300, 7]
type = ChangeState
trigger1 = Time = 125
value = 50
ctrl = 1

;========================<MAX MEGA LASER VISION>=============================
[StateDef 3350]
type = A
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3350, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3350, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3350, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3350, Corner Push]
type = VarSet
trigger1 = time = 3
fvar(5) = 0

[State 3350, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3350, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3350, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3350, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3350, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3350,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3350, 1]
type = VelMul
trigger1 = Time = 0
x = .05
y = .02

[State 3350, 6]
type = PlaySnd
trigger1 = Time = 3
value = 3300,0

[State 3350, 6]
type = PlaySnd
trigger1 = Time = 20
value = 3300,1

[State 3350, 0]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal
name = "M_RAY"
id = 3355
postype = p1
pos = 17,13
stateno = 3355
keyctrl = 0
ownpal = 0
priority = 3

[State 3350 Pal FX]
type = BGPalfx
trigger1 = animelem = 13
sinadd = -205,-205,-205,180
add = 155,-55,-55
ignorehitpause = 1
time = 83
invertall = 1

[State 3350, 8]
type = ChangeState
trigger1 = Pos Y >= 5
trigger1 = Vel Y > 0
trigger1 = Time = 185
value = 52

[State 3350, 7]
type = ChangeState
trigger1 = Time = 185
value = 50
ctrl = 1

;========================<HYPER FLY ASSAULT>=============================
[StateDef 3400]
type = A
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3400, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3400, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3400, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3400, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3400, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3400, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, 1]
type = VelMul
trigger1 = Time = 0
x = .05
y = .01

[State 3400, 6]
type = PlaySnd
trigger1 = Time = 0
value = 3000,0

[State 3400,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3400, 6]
type = PlaySnd
trigger1 = Time = 30
value = 3100,1

[State 3400, 6]
type = PlaySnd
trigger1 = Time = 31
value = 3100,1

[State 3400, Break]
type = Explod
trigger1 = Time = 30
anim = 3408
pos = 80,-140
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1

[State 3400, 6]
type = PlaySnd
trigger1 = animelem = 12
value = 3100,1

[State 3400, 1]
type = VelSet
trigger1 = AnimElem = 12
x = 20
y = 20

[State 3400, 3]
type = HitDef
trigger1 = Animelem = 9
trigger2 = Animelem = 10
trigger3 = Animelem = 11
trigger4 = Animelem = 12
trigger4 = Animelem = 13
trigger4 = Animelem = 14
trigger4 = Animelem = 15
trigger4 = Animelem = 16
attr = A, NA
animtype = Heavy
damage = ceil(ifElse(fvar(11) * 230 < 7, 7, fvar(11) * 230)), 7
getPower = 0,0
givePower = 36, 36
hitflag = AMFD
guardflag = MA
pausetime = 0,0 ;45,45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -16, 0
air.velocity = 0,0
fall = 0
Palfx.time = ifelse(P2StateType = A , 40 ,30)
Palfx.add = 210,10,-200
Palfx.mul = 200,200,200
Palfx.sinadd = 60,40,50,20
Palfx.color = 0
palfx.invertall = 1
p2stateno = 3410
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3400, 3]
type = VelSet
trigger1 = AnimElem = 16
x = 0

[State 3400, 3]
type = SuperPause
trigger1 = Movecontact = 1
time = 40 ;20
anim = -1
pos = -10,-45;only if i enable animation
sound = S0,81

[State 3400, 1st Boom]
type = Explod
trigger1 = Movecontact = 1
anim = 3211
pos = 25,0
postype = p2
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 3400, 8]
type = ChangeState
trigger1 = MoveContact && HitOver = 1
value = 3402

[State 3400, 9]
type = ChangeState
trigger1 = Pos Y >= 0
value = 3401

;No Hit!! Deep Slide
[Statedef 3401]
type = A
movetype = H
physics = N
anim = 1607
velset = 30, 0

[State 3401, 1]
type = HitDef
trigger1 = Animelem = 1
attr = A, NA
animtype = High
damage = ceil(ifElse(fvar(11) * 230 < 7, 7, fvar(11) * 230)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 4, 4
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := 0
ground.type = Low
ground.slidetime = 50
ground.hittime = 15
ground.velocity = 5, -7
air.velocity = 0, 2
P2state = 3413
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3401, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 5)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3401, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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
persistent = 0
ignoreHitPause = 1

[State 3401, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 3401, 1]
type = PosSet
trigger1 = Time = 0
Y = 0

[State 3401, 2]
type = VelSet
trigger1 = Time = 0
Y = 0

[State 3401, 3]
type = VelMul
trigger1 = Time >= 3
X = 0.9

[State 3401, Rocks]
type = Explod
trigger1 = Time = 2
anim = 3409
sprpriority = 4
scale = 0.85,0.85

[State 3401, Rocks]
type = Explod
trigger1 = Time = 5
anim = 3409
sprpriority = 4

[State 3401, Rocks]
type = Explod
trigger1 = Time = 10
anim = 3409
sprpriority = 4
scale = 0.75,0.75

[State 3401, Rocks]
type = Explod
trigger1 = Time = 15
anim = 3409
sprpriority = 4
scale = 0.5,0.5

[State 3401, Rocks]
type = Explod
trigger1 = Time = 20
anim = 3409
sprpriority = 4
scale = 0.25,0.25

[State 3401, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Hit !!! Explosive Impact
[Statedef 3402]
type = A
movetype = I
physics = N
anim = 1606
velset = -2,-7.2

[State 3402, 2nd Boom]
type = Explod
trigger1 = time = 1
anim = 3498
pos = -10,-90
postype = p2
sprpriority = 5
supermove = 1
bindtime = 1
scale = 1.5,1.5

[State 3402, 2nd Boom]
type = Explod
trigger1 = time = 2
anim = 3498
pos = -30,-82
postype = p2
sprpriority = 3
supermove = 1
bindtime = 1
scale = 1.2,1.2

[State 3402, 2nd Boom]
type = Explod
trigger1 = time = 3
anim = 3498
pos = -20,-90
postype = p2
sprpriority = 3
supermove = 1
bindtime = 1

[State 3402, 1]
type = VelAdd
trigger1 = Time >= 0
Y = 0.5

[State 3402, 9]
type = ChangeState
trigger1 = Time > 0 && Pos Y >= 0
value = 52

[State 3402, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;Hit by power move (shaking)
[Statedef 3410]
type = A
movetype = H ;Get hit
physics = N

[State 3410, 0]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0
z = 0

[State 3410, 1]
type = NotHitBy
trigger1 = 1
value = SCA
Time = 1

[State 3410, 2]
type = PosAdd
trigger1 = Time = 0
y = -20

[State 3410, 3]
type = ChangeAnim2
Trigger1 = Time >= 0
value = 5050

[State 3410, 4]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 3411

;Hit by power move (flying)
[Statedef 3411]
type = A
movetype = H ;Get hit
physics = N

[State 3411, 0]
type = NotHitBy
trigger1 = 1
value = SCA
Time = 1

[State 3411, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5005

[State 3411, 2]
type = VelSet
trigger1 = Time = 0
x = -20
y = -2

[State 3411, 5]
type = ChangeState
trigger1 = backedgedist <= 5
value = 3412

;Hit by power move (hitting the wall)
[Statedef 3412]
type = A
movetype = H ;Get hit
physics = N

[State 3412, 0]
type = PlaySnd
Trigger1 = Time = 0
value = F5,4

[State 3412, 1]
type = PosAdd
trigger1 = Time = 0
y = -20

[State 3412, 2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5090

[State 3412, 3]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0
z = 0

[State 3412, 4]
type = EnvShake
Trigger1 = Time = 0
time = 15
ampl = -3
freq = 90
phase = 90

[State 3412, 5]
type = NotHitBy
trigger1 = 1
value = SCA
Time = 1

[State 3412,19]
type = GameMakeAnim
trigger1 = Time = 0
value = 72
pos = -10, -50

[State 3412, 6]
type = ChangeState
trigger1 = Time = 10
value = 3413

;Hit by power move (falling to the ground)
[Statedef 3413]
type = A
movetype = H ;Get hit
physics = N

[State 3413, 0]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5110

[State 3413, 1]
type = Gravity
trigger1 = Time >= 0

[State 3413, 2]
type = NotHitBy
trigger1 = 1
value = SCA
Time = 35

[State 3413, 5]
type = SelfState
trigger1 = Pos Y > 10
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;========================<MAX HYPER FLY ASSAULT>=============================
[StateDef 3450]
type = A
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3450, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3450, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3450, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3450, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3450, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3450, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3450, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3450, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3450, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3450, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3450, 1]
type = VelMul
trigger1 = Time = 0
x = .05
y = .01

[State 3450, 6]
type = PlaySnd
trigger1 = Time = 0
value = 3000,0

[State 3450,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3450, 6]
type = PlaySnd
trigger1 = Time = 30
value = 3100,1

[State 3450, 6]
type = PlaySnd
trigger1 = Time = 31
value = 3100,1

[State 3450, Break]
type = Explod
trigger1 = Time = 30
anim = 3408
pos = 80,-140
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1

[State 3450, 6]
type = PlaySnd
trigger1 = animelem = 12
value = 3100,1

[State 3450, 1]
type = VelSet
trigger1 = AnimElem = 12
x = 20
y = 20

[State 3450, 3]
type = HitDef
trigger1 = Animelem = 9
trigger2 = Animelem = 10
trigger3 = Animelem = 11
trigger4 = Animelem = 12
trigger4 = Animelem = 13
trigger4 = Animelem = 14
trigger4 = Animelem = 15
trigger4 = Animelem = 16
attr = A, NA
animtype = Heavy
damage = ceil(ifElse(fvar(11) * 330 < 7, 7, fvar(11) * 330)), 7
getPower = 0,0
givePower = 36, 36
hitflag = AMFD
guardflag = MA
pausetime = 0,0 ;45,45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -16, 0
air.velocity = 0,0
fall = 0
Palfx.time = ifelse(P2StateType = A , 40 ,30)
Palfx.add = 210,10,-200
Palfx.mul = 200,200,200
Palfx.sinadd = 60,40,50,20
Palfx.color = 0
palfx.invertall = 1
p2stateno = 3410
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3450, 3]
type = VelSet
trigger1 = AnimElem = 16
x = 0

[State 3450, 3]
type = SuperPause
trigger1 = Movecontact = 1
time = 40 ;20
anim = -1
pos = -10,-45;only if i enable animation
sound = S0,81

[State 3450, 1st Boom]
type = Explod
trigger1 = Movecontact = 1
anim = 3211
pos = 25,0
postype = p2
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 3450, 8]
type = ChangeState
trigger1 = MoveContact && HitOver = 1
value = 3402

[State 3450, 9]
type = ChangeState
trigger1 = Pos Y >= 0
value = 3451

;No Hit!! Deep Slide
[Statedef 3451]
type = A
movetype = H
physics = N
anim = 1607
velset = 30, 0

[State 3451, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = time%4 = 0
attr = A, NA
animtype = High
damage = ceil(ifElse(fvar(11) * 165 < 7, 7, fvar(11) * 165)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 1, 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := 0
ground.type = Low
ground.slidetime = 50
ground.hittime = 15
ground.velocity = 5, -7
air.velocity = 0, 2
P2state = 3413
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3451, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 5)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3451, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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
persistent = 0
ignoreHitPause = 1

[State 3451, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 3451, 1]
type = PosSet
trigger1 = Time = 0
Y = 0

[State 3451, 2]
type = VelSet
trigger1 = Time = 0
Y = 0

[State 3451, 3]
type = VelMul
trigger1 = Time >= 3
X = 0.9

[State 3451, Rocks]
type = Explod
trigger1 = Time = 2
anim = 3409
sprpriority = 4
scale = 0.85,0.85

[State 3451, Rocks]
type = Explod
trigger1 = Time = 5
anim = 3409
sprpriority = 4

[State 3451, Rocks]
type = Explod
trigger1 = Time = 10
anim = 3409
sprpriority = 4
scale = 0.75,0.75

[State 3451, Rocks]
type = Explod
trigger1 = Time = 15
anim = 3409
sprpriority = 4
scale = 0.5,0.5

[State 3451, Rocks]
type = Explod
trigger1 = Time = 20
anim = 3409
sprpriority = 4
scale = 0.25,0.25

[State 3451, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<SUPER GROUND BREAKER>=============================
[StateDef 3500]
type = S
physics = S
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(12) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3500, Wave]
type = Explod
trigger1 = Time = 79
anim = 3528
pos = 40,0
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3500, Wave]
type = Explod
trigger1 = Time = 79
anim = 3523
pos = -40,0
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3500, Kaboom]
type = Explod
trigger1 = Time = 79
anim = 3540
pos = 12,9
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3500, Kaboom]
type = Explod
trigger1 = Time = 79
anim = 3509
pos = 12,9
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -50,0
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -83,-5
sprPriority = -3
posType = P1
scale = 1.5,1.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -112,-8
sprPriority = -3
posType = P1
scale = 2,2
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -161,-11
sprPriority = -3
posType = P1
scale = 2.75,2.75
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, Kaboom]
type = Explod
trigger1 = Time = 79
anim = 3209
pos = 10,9
postype = p1
sprpriority = 3
supermove = 1
bindtime = 1

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 3
value = 3000,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 73
value = 1,6

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 84
value = 3500,0

[State 3500, 1]
type = Projectile
trigger1 = time = 84
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 150,60
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 2]
type = Projectile
trigger1 = time = 84
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -130,60
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
x = -1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 94
value = 3500,0

[State 3500, 1]
type = Projectile
trigger1 = time = 94
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 175,50
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 2]
type = Projectile
trigger1 = time = 94
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -155,50
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 104
value = 3500,0

[State 3500, 3]
type = Projectile
trigger1 = time = 104
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 200,40
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 3]
type = Projectile
trigger1 = time = 104
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -180,40
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 114
value = 3500,0

[State 3500, 4]
type = Projectile
trigger1 = time = 114
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 250,30
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 4]
type = Projectile
trigger1 = time = 114
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -230,30
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 124
value = 3500,0

[State 3500, 5]
type = Projectile
trigger1 = time = 124
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 330,20
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 5]
type = Projectile
trigger1 = time = 124
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -310,20
velocity = 0
attr = S, SP
damage = 50,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 134
value = 3500,0

[State 3500, 6]
type = Projectile
trigger1 = time = 134
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 410,10
velocity = 0
attr = S, SP
damage = 40,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = Projectile
trigger1 = time = 134
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -430,10
velocity = 0
attr = S, SP
damage = 40,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = ScreenBound
trigger1 = AnimElemTime(6) >=5
Trigger2 = MoveHit
value = 0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 144
value = 3500,0

[State 3500, 7]
type = Projectile
trigger1 = time = 144
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 500,5
velocity = 0
attr = S, SP
damage = 40,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 7]
type = Projectile
trigger1 = time = 144
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -500,5
velocity = 0
attr = S, SP
damage = 40,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 6]
type = PlaySnd
trigger1 = Time = 154
value = 3500,0

[State 3500, 7]
type = Projectile
trigger1 = time = 154
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 600,5
velocity = 0
attr = S, SP
damage = 40,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, 7]
type = Projectile
trigger1 = time = 154
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -600,5
velocity = 0
attr = S, SP
damage = 40,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3500, HitSound]
type = PlaySnd
trigger1 = projhit = 1 && NumTarget
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3500, HitSpark]
type = Helper
trigger1 = projhit = 1 && NumTarget
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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
persistent = 1
ignoreHitPause = 1

[State 3500, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3, 0
channel = 3
persistent = 1
ignorehitPause = 1

[State 3500, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
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
persistent = 1
ignoreHitPause = 1

[State 3500, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 3500, 10]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = FrontEdgeDist < 200
value = 0
ctrl = 1

[State 3500, 10]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = FrontEdgeDist > 200
value = 3503
ctrl = 1

;Follow
[Statedef 3503] ;Follow up from Super Ground Break
type = S
physics = N
anim = 3501

[State 3503, 1]
type = ScreenBound
trigger1 = Movehit
value = 0

[State 3503, 2]
type = PosAdd
trigger1 = BackEdgeDist < -5
x = -5 - BackEdgeDist

[State 3503, 3]
type = VelSet
trigger1 = 1
trigger1 = AnimElem = 5, < 0
x = ifelse (BackEdgeDist < -50, 9, 7)

[State 3503, 4]
type = VelMul
trigger1 = AnimElem = 2, >= 0
x = .9

[State 3503, 5]
type = VelMul
trigger1 = AnimElem = 3, >= 0
x = .9

[State 3503, 6]
type = MakeDust
trigger1 = Time = 1
pos = -25,-2
spacing = 1

[State 3503, 7]
type = MakeDust
trigger1 = AnimElem = 2, >= 0
pos = -15,-2

[State 3503, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAX SUPER GROUND BREAKER>=============================
[StateDef 3550]
type = S
physics = S
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3550, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3550, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3550, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3550, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3550, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3550, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3550, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3550, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(12) < 0
time = 1
value = SCA

[State 3550, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3550, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3550,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3550, Wave]
type = Explod
trigger1 = Time = 79
anim = 3528
pos = 40,0
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3550, Wave]
type = Explod
trigger1 = Time = 79
anim = 3523
pos = -40,0
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3550, Kaboom]
type = Explod
trigger1 = Time = 79
anim = 3540
pos = 12,9
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3550, Kaboom]
type = Explod
trigger1 = Time = 79
anim = 3509
pos = 12,9
postype = p1
sprpriority = -1
supermove = 1
bindtime = 1

[State 3550, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -50,0
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3550, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -83,-5
sprPriority = -3
posType = P1
scale = 1.5,1.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3550, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -112,-8
sprPriority = -3
posType = P1
scale = 2,2
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3550, Landing Dust Explod]
type = Explod
trigger1 = Time = 79
anim = 8102
pos = -161,-11
sprPriority = -3
posType = P1
scale = 2.75,2.75
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3550, Kaboom]
type = Explod
trigger1 = Time = 79
anim = 3209
pos = 10,9
postype = p1
sprpriority = 3
supermove = 1
bindtime = 1

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 3
value = 3000,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 73
value = 1,6

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 84
value = 3500,0

[State 3550, 1]
type = Projectile
trigger1 = time = 84
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 150,60
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 2]
type = Projectile
trigger1 = time = 84
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -130,60
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
x = -1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 1]
type = Projectile
trigger1 = time = 84
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 200,60
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 2]
type = Projectile
trigger1 = time = 84
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -180,60
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
x = -1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 94
value = 3500,0

[State 3550, 1]
type = Projectile
trigger1 = time = 94
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 175,50
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 2]
type = Projectile
trigger1 = time = 94
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -155,50
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 1]
type = Projectile
trigger1 = time = 94
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 225,50
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 2]
type = Projectile
trigger1 = time = 94
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -205,50
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 104
value = 3500,0

[State 3550, 3]
type = Projectile
trigger1 = time = 104
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 200,40
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 3]
type = Projectile
trigger1 = time = 104
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -180,40
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 3]
type = Projectile
trigger1 = time = 104
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 250,40
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 3]
type = Projectile
trigger1 = time = 104
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -230,40
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 114
value = 3500,0

[State 3550, 4]
type = Projectile
trigger1 = time = 114
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 250,30
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 4]
type = Projectile
trigger1 = time = 114
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -230,30
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 4]
type = Projectile
trigger1 = time = 114
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 300,30
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 4]
type = Projectile
trigger1 = time = 114
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -280,30
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 124
value = 3500,0

[State 3550, 5]
type = Projectile
trigger1 = time = 124
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 330,20
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 5]
type = Projectile
trigger1 = time = 124
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -310,20
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 5]
type = Projectile
trigger1 = time = 124
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 380,20
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 5]
type = Projectile
trigger1 = time = 124
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -360,20
velocity = 0
attr = S, SP
damage = 30,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 134
value = 3500,0

[State 3550, 6]
type = Projectile
trigger1 = time = 134
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 410,10
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = Projectile
trigger1 = time = 134
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -430,10
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = Projectile
trigger1 = time = 134
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 460,10
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = Projectile
trigger1 = time = 134
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -480,10
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-1.1
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = ScreenBound
trigger1 = AnimElemTime(6) >=5
Trigger2 = MoveHit
value = 0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 144
value = 3500,0

[State 3550, 7]
type = Projectile
trigger1 = time = 144
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 500,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 7]
type = Projectile
trigger1 = time = 144
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -500,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 7]
type = Projectile
trigger1 = time = 144
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 550,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 7]
type = Projectile
trigger1 = time = 144
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -550,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 6]
type = PlaySnd
trigger1 = Time = 154
value = 3500,0

[State 3550, 7]
type = Projectile
trigger1 = time = 154
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 600,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 7]
type = Projectile
trigger1 = time = 154
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -600,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 7]
type = Projectile
trigger1 = time = 154
projanim = 3502
projremovetime = 2
projhitanim = 3502
projpriority = 1
projshadow = -1
offset = 650,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, 7]
type = Projectile
trigger1 = time = 154
projanim = 3529
projremovetime = 2
projhitanim = 3529
projpriority = 1
projshadow = -1
offset = -650,5
velocity = 0
attr = S, SP
damage = 29,8
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 7,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, -1.1
ground.cornerpush.veloff = 0
air.velocity = -15,-9
guard.velocity = -10
air.juggle = 1
air.fall = 1
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3550, HitSound]
type = PlaySnd
trigger1 = projhit = 1 && NumTarget
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3550, HitSpark]
type = Helper
trigger1 = projhit = 1 && NumTarget
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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
persistent = 1
ignoreHitPause = 1

[State 3550, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3, 0
channel = 3
persistent = 1
ignorehitPause = 1

[State 3500, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
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
persistent = 1
ignoreHitPause = 1

[State 3550, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 3550, 10]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = FrontEdgeDist < 200
value = 0
ctrl = 1

[State 3550, 10]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = FrontEdgeDist > 200
value = 3503
ctrl = 1

;========================<SUPER TSUNAMI>=============================
[StateDef 3600]
type = S
physics = S
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3600, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3600, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3600, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3600, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3600, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3600, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3600, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3600, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3600, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3600, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3600,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3600, 0]
type = HitDef
trigger1 = animtime = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 7, Hit
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = 0
airguard.velocity = -1.9,-.8
air.velocity = 0.5, -4
air.type = Low
air.hittime = 12
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
fall = 1
getpower = 0,0

[State 3600, 3]
type = Projectile
trigger1 = animelem = 12
projanim = 3607
projremovetime = 225
projpriority = 1
projshadow = -1
offset = -20,-20
velocity = 0
attr = S, SP
damage = 40,5
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 0
sparkno = -1
sparkxy = -10,0
guardsound = 6,0
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, 0
air.velocity = 0,-15
guard.velocity = -10
air.juggle = 1
air.fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3600, 6]
type = PlaySnd
trigger1 = Time = 3
value = 3600,0

[State 3600, MoveP2]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "MoveP2"
id = 3605
pos = -30,0
postype = p2
stateno = 3605
ownpal = 1
size.height = 200
size.ground.back = 30
size.ground.front = 30

[State 3600, Twister]
type = helper
trigger1 = animelem = 8
helpertype = normal
name = "Twister"
id = 3602
pos = 22,0
postype = p1
stateno = 3602
ownpal = 0

[State 3600, 6]
type = PlaySnd
trigger1 = animelem = 9
value = 3600,1

[State 3600, 6]
type = PlaySnd
trigger1 = time = 88
value = 1200,0

[State 3600, 6]
type = PlaySnd
trigger1 = time = 138
value = 1200,0

[State 3600, Twister0]
type = Explod
trigger1 = animelem = 12
trigger1= stateno = 3600
anim = 3601
pos = 35,0
postype = p1
removetime = 55
sprpriority = 3
supermove = 0
scale = 1.25,1.5

[State 3600, Twister1]
type = Explod
trigger1 = animelem = 8
trigger1= stateno = 3600
anim = 3602
id = 3602
pos = 40,0
postype = p1
removetime = 90
sprpriority = 3
supermove = 0
scale = 2.5,0.75

[State 3600, Twister2]
type = Explod
trigger1 = animelem = 8
trigger1= stateno = 3600
anim = 3603
pos = 40,-30
postype = p1
removetime = 90
sprpriority = 3
supermove = 0
scale = 2.5,0.75

[State 3600, 0]
type = ChangeState
trigger1 = time = 103
value = 3604
ctrl = 1

;Twister
[Statedef 3602, Twister]
type = S
movetype = A
velset = 0,0
ctrl = 0
anim = 3601
sprpriority = 3
poweradd = 0

[State 3602,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3602, 0]
type = HitDef
triggerall = stateno = 3600
trigger1 = stateno != [5000,5210]
trigger1 = animtime = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 7, Hit
pausetime = 5, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = 0
airguard.velocity = -1.9,-.8
air.velocity = -0.5, -3
air.type = Low
air.hittime = 12
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
fall = 1
getpower = 0,0

[State 3602, 2]
type = destroyself
trigger1 = time = 50
trigger2 = root, stateno != 3600
trigger3 = root, stateno = 3600

;Player 2
[Statedef 3605]
type = S
movetype = I
physics = N
ctrl = 0
anim = 3608
sprpriority = 5
velset = 0,0

[State 3605, NotHitBy]
type = Playerpush
trigger1 = 1
value = 1

[State 3605, NotHitBy]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA
ignorehitpause = 1

[State 3605, VelSet 1]
type = VelSet
trigger1 = Time = [0,20]
x = 2

[State 3605, VelSet 2]
type = VelSet
trigger1 = Time = [20,40]
x = 3

[State 3605, VelSet 2]
type = VelSet
trigger1 = Time = [40,60]
x = 5

[State 3605, VelSet 2]
type = VelSet
trigger1 = Time = [60,80]
x = 6

[State 3605, VelSet 2]
type = VelSet
trigger1 = Time >= 80
x = 7

[State 3605, End]
type = Destroyself
trigger1 = time = 90
trigger2 = root, stateno != 3600
trigger3 = root, stateno = 3600
trigger3 = root, MoveContact

;Finish
[Statedef 3604]
type = S
movetype = A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 3605

[State 3604, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAX SUPER TSUNAMI>=============================
[StateDef 3650]
type = S
physics = S
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3650, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3650, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3650, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3650, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3650, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3650, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3650, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3650, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3650, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3650, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3650,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3650, 0]
type = HitDef
trigger1 = animtime = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 7, Hit
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = 0
airguard.velocity = -1.9,-.8
air.velocity = 0.5, -3
air.type = Low
air.hittime = 12
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
fall = 1
getpower = 0,0

[State 3650, 3]
type = Projectile
trigger1 = animelem = 12
projanim = 3607
projremovetime = 225
projpriority = 1
projshadow = -1
offset = -20,-20
velocity = 0
attr = S, SP
damage = 40,5
animtype = back
guardflag = MA
hitflag = MAFDP
pausetime = 0
sparkno = -1
sparkxy = -10,0
guardsound = 6,0
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -15, 0
air.velocity = 0,-8
guard.velocity = -10
air.juggle = 1
air.fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3650, 6]
type = PlaySnd
trigger1 = Time = 3
value = 3600,0

[State 3650, MoveP2]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "MoveP2"
id = 3605
pos = -30,0
postype = p2
stateno = 3655
ownpal = 1
size.height = 200
size.ground.back = 30
size.ground.front = 30

[State 3650, Twister]
type = helper
trigger1 = animelem = 8
helpertype = normal
name = "Twister"
id = 3602
pos = 22,0
postype = p1
stateno = 3652
ownpal = 0

[State 3650, 6]
type = PlaySnd
trigger1 = animelem = 9
value = 3600,1

[State 3650, 6]
type = PlaySnd
trigger1 = time = 88
value = 1200,0

[State 3650, 6]
type = PlaySnd
trigger1 = time = 138
value = 1200,0

[State 3650, Twister0]
type = Explod
trigger1 = animelem = 12
trigger1= stateno = 3650
anim = 3601
pos = 35,0
postype = p1
removetime = 125
sprpriority = 3
supermove = 0
scale = 1.25,1.5

[State 3650, Twister1]
type = Explod
trigger1 = animelem = 8
trigger1= stateno = 3650
anim = 3602
id = 3602
pos = 40,0
postype = p1
removetime = 160
sprpriority = 3
supermove = 0
scale = 2.5,0.75

[State 3650, Twister2]
type = Explod
trigger1 = animelem = 8
trigger1= stateno = 3650
anim = 3603
pos = 40,-30
postype = p1
removetime = 160
sprpriority = 3
supermove = 0
scale = 2.5,0.75

[State 3650, 0]
type = ChangeState
trigger1 = time = 173
value = 3604
ctrl = 1

;Twister
[Statedef 3652, Twister]
type = S
movetype = A
velset = 0,0
ctrl = 0
anim = 3601
sprpriority = 3
poweradd = 0

[State 3652,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3652, 0]
type = HitDef
triggerall = stateno = 3650
trigger1 = stateno != [5000,5210]
trigger1 = animtime = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 7, Hit
pausetime = 5, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = 0
airguard.velocity = -1.9,-.8
air.velocity = -0.5, -3
air.type = Low
air.hittime = 12
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
fall = 1
getpower = 0,0

[State 3652, 2]
type = destroyself
trigger1 = time = 120
trigger2 = root, stateno != 3650
trigger3 = root, stateno = 3650

;Player 2
[Statedef 3655]
type = S
movetype = I
physics = N
ctrl = 0
anim = 3608
sprpriority = 5
velset = 0,0

[State 3655, NotHitBy]
type = Playerpush
trigger1 = 1
value = 1

[State 3655, NotHitBy]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA
ignorehitpause = 1

[State 3655, VelSet 1]
type = VelSet
trigger1 = Time = [0,33]
x = 2

[State 3655, VelSet 2]
type = VelSet
trigger1 = Time = [33,53]
x = 3

[State 3655, VelSet 2]
type = VelSet
trigger1 = Time = [53,73]
x = 5

[State 3655, VelSet 2]
type = VelSet
trigger1 = Time = [73,93]
x = 6

[State 3655, VelSet 2]
type = VelSet
trigger1 = Time >= 90
x = 7

[State 3655, End]
type = Destroyself
trigger1 = time = 103
trigger2 = root, stateno != 3650
trigger3 = root, stateno = 3650
trigger3 = root, MoveContact

;========================<SPEED FURY>=============================
[StateDef 3700]
type = S
physics = S
moveType = A
anim = 3700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3700, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3700, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3700, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3700, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3700, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3700, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3700, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3700, NotHitBy]
type = NotHitBy
trigger1 = Time = 0
time = 41
value = SCA

[State 3700, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3700, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3700,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3700, 3]
type = HitDef
trigger1 = AnimTime = 46
attr = A,NA
animtype = Heavy
damage = 5
getpower = 0
guardflag = MA
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -2
air.velocity = -2, 0
ignorehitpause = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3700, 2]
type = PlaySnd
trigger1 = Time = 3
value = 3700,0

[State 3700, 3]
type = VelAdd
trigger1 = 1
trigger1 = Pos Y < 0
y = .02

[State 3700, 4]
type = PosSet
trigger1 = Pos Y >= -1
y = 0

[State 3700, 5]
type = VelSet
trigger1 = Pos Y >= -1
y = 0

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 40
value = 1, 0

[State 3700, 6]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,10
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3710
offset = 100, 0
velocity = 13, 0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,10
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3710
offset = 0, 0
velocity = 8, 0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 55
value = 1, 0

[State 3700, 6]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,30
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3711
offset = 100, 0
velocity = 12,0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,30
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3711
offset = -45, 0
velocity = 9,0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 70
value = 1, 0

[State 3700, 6]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,10
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3712
offset = 100, 0
velocity = 13, 0
projremovetime = 16
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,10
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3712
offset = -50, 0
velocity = 10, 0
projremovetime = 16
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 85
value = 1, 0

[State 3700, 2]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,0
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3713
offset = 100, 0
velocity = 14, 0
projremovetime = 15
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 2]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,0
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3713
offset = -45, 0
velocity = 8, 0
projremovetime = 15
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 100
value = 1, 0

[State 3700, 2]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,15
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3714
offset = 100, 0
velocity = 13,0
projremovetime = 14
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 2]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,15
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3714
offset = 0, 0
velocity = 10,0
projremovetime = 14
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 115
value = 1, 0

[State 3700, 2]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,0
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3715
offset = 100, 0
velocity = 12,0
projremovetime = 13
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, 2]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,0
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3715
offset = 0, 0
velocity = 9,0
projremovetime = 13
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3700, HitSound]
type = PlaySnd
trigger1 = projhit = 1 && NumTarget
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 2)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3700, HitSpark]
type = Helper
trigger1 = projhit = 1 && NumTarget
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3700, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3, 0
channel = 3
persistent = 1
ignorehitPause = 1

[State 3700, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3700, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -70
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3700, 6]
type = PlaySnd
trigger1 = Time = 130
value = 1, 0

[State 3700, flash]
type = explod
trigger1 = animelem = 61
anim = 3208
postype = p1
pos = -38, -76
sprpriority = 2
ignorehitpause = 1
removetime = 40
removeongethit = 1
ownpal = 1
supermove = 1
scale = 1.25,1.25

[State 3700, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 3701

;Finish
[Statedef 3701,FinalPunch]
type = S
movetype = A
physics = N
velset = 0,0
juggle = 1
anim = 3716
poweradd = 0
ctrl = 0

[State 3701, 1]
type = VelSet
trigger1 = AnimElem = 4
x = 20

[State 3701, flash]
type = explod
trigger1 = animelem = 9
anim = 3111
postype = p1
pos = -10, -85
sprpriority = 2
ignorehitpause = 1
ownpal = 1
supermove = 1

[State 3701, 6]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,1

[State 3701, 3]
type = HitDef
trigger1 = Animelem = 4
trigger2 = Animelem = 5
trigger3 = Animelem = 6
trigger4 = Animelem = 7
attr = A, NA
animtype = High
damage = 20,2
getpower = 0
guardflag = MA
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = 10, -5
air.velocity = -10,-5
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3701, 4]
type = HitDef
trigger1 = Animelem = 9
trigger2 = Animelem = 10
trigger3 = Animelem = 11
attr = S, HA
animtype = High
damage = 20,2
getpower = 0
guardflag = MA
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = 10, -25
air.velocity = -10,-5
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3701, 3]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 3701, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAX SPEED FURY>=============================
[StateDef 3750]
type = S
physics = S
moveType = A
anim = 3700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3750, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3750, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3750, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3750, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3750, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3750, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3750, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3750, NotHitBy]
type = NotHitBy
trigger1 = Time = 0
time = 41
value = SCA

[State 3750, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3750, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3750,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3750, 3]
type = HitDef
trigger1 = AnimTime = 46
attr = A,NA
animtype = Heavy
damage = 5
getpower = 0
guardflag = MA
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -2
air.velocity = -2, 0
ignorehitpause = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3750, 2]
type = PlaySnd
trigger1 = Time = 3
value = 3700,0

[State 3750, 3]
type = VelAdd
trigger1 = 1
trigger1 = Pos Y < 0
y = .02

[State 3750, 4]
type = PosSet
trigger1 = Pos Y >= -1
y = 0

[State 3750, 5]
type = VelSet
trigger1 = Pos Y >= -1
y = 0

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 40
value = 1, 0

[State 3750, 6]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 20,10
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3710
offset = 100, 0
velocity = 13, 0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 20,10
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3710
offset = 0, 0
velocity = 8, 0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 55
value = 1, 0

[State 3750, 6]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 20,30
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3711
offset = 100, 0
velocity = 12,0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 20,30
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3711
offset = -45, 0
velocity = 9,0
projremovetime = 17
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 70
value = 1, 0

[State 3750, 6]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 20,10
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3712
offset = 100, 0
velocity = 13, 0
projremovetime = 16
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 20,10
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3712
offset = -50, 0
velocity = 10, 0
projremovetime = 16
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 85
value = 1, 0

[State 3750, 2]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 10,0
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3713
offset = 100, 0
velocity = 14, 0
projremovetime = 15
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 2]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 10,0
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3713
offset = -45, 0
velocity = 8, 0
projremovetime = 15
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 100
value = 1, 0

[State 3750, 2]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 30,15
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3714
offset = 100, 0
velocity = 13,0
projremovetime = 14
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 2]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 30,15
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3714
offset = 0, 0
velocity = 10,0
projremovetime = 14
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 115
value = 1, 0

[State 3750, 2]
type = Projectile
triggerall = p2dist X >=120
trigger1 = TimeMod = 15,0
trigger1 = Time >= 50
projanim = 3703
projremanim = -1
projhitanim = 3715
offset = 100, 0
velocity = 12,0
projremovetime = 13
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, 2]
type = Projectile
triggerall = p2dist X <120
trigger1 = TimeMod = 15,0
trigger1 = Time >= 50
projanim = 3706
projremanim = -1
projhitanim = 3715
offset = 0, 0
velocity = 9,0
projremovetime = 13
projhits = 1
projpriority = 1
numhits = 1
attr = S, SA
damage = 5,2
getpower = 0
guardflag = MA
animtype = Heavy
pausetime = 0,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 14
ground.hittime = 15
guard.velocity = -7
ground.velocity = -7
air.animtype = back
air.velocity = -3,-1
airguard.velocity = -0.5

[State 3750, HitSound]
type = PlaySnd
trigger1 = projhit = 1 && NumTarget
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 2)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3750, HitSpark]
type = Helper
trigger1 = projhit = 1 && NumTarget
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3750, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3, 0
channel = 3
persistent = 1
ignorehitPause = 1

[State 3750, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3750, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), -70
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3750, 6]
type = PlaySnd
trigger1 = Time = 130
value = 1, 0

[State 3750, flash]
type = explod
trigger1 = animelem = 61
anim = 3208
postype = p1
pos = -38, -76
sprpriority = 2
ignorehitpause = 1
removetime = 40
removeongethit = 1
ownpal = 1
supermove = 1
scale = 1.25,1.25

[State 3750, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 3751

;Finish
[Statedef 3751,FinalPunch]
type = S
movetype = A
physics = N
velset = 0,0
juggle = 1
anim = 3716
poweradd = 0
ctrl = 0

[State 3751, 1]
type = VelSet
trigger1 = AnimElem = 4
x = 20

[State 3751, flash]
type = explod
trigger1 = animelem = 9
anim = 3111
postype = p1
pos = -10, -85
sprpriority = 2
ignorehitpause = 1
ownpal = 1
supermove = 1

[State 3751, 6]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,1

[State 3751, 3]
type = HitDef
trigger1 = Animelem = 4
trigger2 = Animelem = 5
trigger3 = Animelem = 6
trigger4 = Animelem = 7
attr = A, NA
animtype = High
damage = 25,2
getpower = 0
guardflag = MA
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = 10, -5
air.velocity = -10,-5
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3751, 4]
type = HitDef
trigger1 = Animelem = 9
trigger2 = Animelem = 10
trigger3 = Animelem = 11
attr = S, HA
animtype = High
damage = 25,2
getpower = 0
guardflag = MA
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = 10, -25
air.velocity = -10,-5
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3751, 3]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 3751, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
