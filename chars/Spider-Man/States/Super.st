; _________________________________________
;| Spiderman by varo_hades                 |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<CRAWLER ASSAULT>=============================
[StateDef 3000]
type = S
physics = S
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

[State 3000, Super Pause FX]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-25 * const(size.xScale)), ceil(-43 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, ]
type = StateTypeSet
trigger1 = animelem = 3
movetype = A

[State 3000, ]
type = VelSet
trigger1 = time = 55
x = 7

[State 3000, ]
type = VelSet
trigger1 = time >= 55
x = 4.5

[State 3000, ]
type = PlaySnd
trigger1 = animelem = 2
value = 190,0

[State 3000, ]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 11
channel = 3
value = 1,2

[State 3000, ]
type = PlaySnd
trigger1 = animelem = 13
channel = 4
value = 1,5

[State 3000, ]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 11
channel = 1
value = 4,3
channel = 1
lowpriority = 1

[State 3000, ]
type = PlaySnd
trigger1 = animelem = 13
channel = 2
value = 4,4
channel = 1
lowpriority = 1

[State 3000, ]
type = MoveHitReset
trigger1 = movecontact = 1
persistent = 1

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 5
trigger2 = animelem = 12
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 2,15
guard.pausetime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -2
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 14
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 2,15
guard.pausetime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -2
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, ]
type = ChangeState
trigger1 = animtime = 0
value = 3005

;Finish
[statedef 3005]
type = S
movetype = A
physics = S
anim = 3005
velset = 5,0
ctrl = 0

[State 3005, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3005, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3005, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3005, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 3005, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2
ignorehitpause = 1

[State 3005, ]
type = PlaySnd
trigger1 = animelem = 2
value = 4,4
channel = 1
lowpriority = 1

[State 3005, ]
type = ScreenBound
trigger1 = 1
value = 0

[State 3005, ]
type = VelSet
trigger1 = time = 0
x = 3

[State 3005, ]
type = PosAdd
trigger1 = movehit = 1
trigger1 = backedgedist <= -60
x = -100
ignorehitpause = 1

[State 3005, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pausetime = ifelse(frontedgedist <= 20,12,35),12
guard.pausetime = 4,3
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -8, -8
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -8, -8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, ]
type = ChangeState
trigger1 = animtime = 0
value = ifelse(backedgedist <=-20,3014,101)

;========================<MAX CRAWLER ASSAULT>=============================
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3050
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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-25 * const(size.xScale)), ceil(-43 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, ]
type = StateTypeSet
trigger1 = animelem = 3
movetype = A

[State 3050, ]
type = VelSet
trigger1 = time = 55
x = 7

[State 3050, ]
type = VelSet
trigger1 = time >= 55
x = 4.5

[State 3050, ]
type = PlaySnd
trigger1 = animelem = 2
value = 190,0

[State 3050, ]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 10
trigger3 = animelem = 18
trigger4 = animelem = 23
channel = 3
value = 1,2

[State 3050, ]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 15
trigger3 = animelem = 25
channel = 4
value = 1,5

[State 3050, ]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 10
trigger3 = animelem = 18
trigger4 = animelem = 23
channel = 1
value = 4,3
channel = 1
lowpriority = 1

[State 3050, ]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 15
trigger3 = animelem = 25
channel = 2
value = 4,4
channel = 1
lowpriority = 1

[State 3050, ]
type = MoveHitReset
trigger1 = movecontact = 1
persistent = 1

[State 3050, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 5
trigger2 = animelem = 11
trigger3 = animelem = 19
trigger4 = animelem = 24
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 2,15
guard.pausetime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -2
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 9
trigger2 = animelem = 16
trigger3 = animelem = 26
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 2,15
guard.pausetime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -2
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, ]
type = ChangeState
trigger1 = animtime = 0
value = 3055

;Finish
[statedef 3055]
type = S
movetype = A
physics = S
anim = 3005
velset = 5,0
ctrl = 0

[State 3055, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3055, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3055, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3055, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 3055, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2
ignorehitpause = 1

[State 3055, ]
type = PlaySnd
trigger1 = animelem = 2
value = 4,4
channel = 1
lowpriority = 1

[State 3055, ]
type = ScreenBound
trigger1 = 1
value = 0

[State 3055, ]
type = VelSet
trigger1 = time = 0
x = 3

[State 3055, ]
type = PosAdd
trigger1 = movehit = 1
trigger1 = backedgedist <= -60
x = -100
ignorehitpause = 1

[State 3055, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = ifelse(frontedgedist <= 20,12,35),12
guard.pausetime = 4,3
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -8, -8
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -8, -8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3055, ]
type = ChangeState
trigger1 = animtime = 0
value = ifelse(backedgedist <=-20,3014,101)

;Aerial
[Statedef 3014] ;jump down aerial rave
type = A
physics = N

[State 3014, 0]
type = VelSet
trigger1 = !time
x = 0
y = 0

[State 3014, 1a]
type = VarSet
trigger1 = !time
v = 1
value = 0
ignorehitpause = 1

[State 3014, a]
type = ChangeAnim
trigger1 = !Time
value = 51

[State 3014, 0]
type = ScreenBound
trigger1 = 1
value = 0

[State 3014, 1]
type = ChangeState
trigger1 = time>= 25
;trigger2 = (enemynear,vel x = [-3,3]) && (enemynear,vel y = 0)
value = 3015
ctrl = 0

;Aerial
[Statedef 3015];wait out screen
type = S
physics = S
anim = 100
sprpriority = 1
ctrl = 0

[State 3015, A7]
type = PosSet
trigger1 = !time
y = 0

[State 3015, 0]
type = VelSet
trigger1 = time>5
x = 25

[State 3015, 0]
type = ScreenBound
trigger1 = 1
value = 0

[State 3015, 1]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 3015, 2]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3015, 3]
type = ChangeState
trigger1 = p2bodydist x <= 230
;trigger2 = BackEdgeDist > -10
value = 101
ctrl = 0

;========================<ULTIMATE WEB THROW>=============================
[Statedef 3100]
type = S
movetype = I
physics = S
velset = 0,0
anim = 3100
ctrl = 0

[State 3100, ]
type = VelSet
trigger1 = animelem = 2
x = -2.5
y = -8

[State 3100, ]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = A

[State 3100, ]
type = ChangeState
trigger1 = time = 21
value = 3101

;Web
[StateDef 3101]
type = S
physics = N
moveType = A
anim = 3101
ctrl = 0
sprPriority = 1
velset = 0,0
powerAdd = -1000
faceP2 = 1

[State 3101, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3101, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3101, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3101, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3101, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3101, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3101, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3101, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) < 0
time = 1
value = SCA

[State 3101, Super Pause FX]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-90 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3101, SuperPause]
type = SuperPause
trigger1 = animelem = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3101, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = S4,4

[State 3101, ]
type = PlaySnd
trigger1 = animelem = 1 && var(41) != 0
value = S13100,0

[State 3101, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = S11500,0

[State 3101, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1000,1

[State 3101, ]
type = Projectile
trigger1 = animelem = 5
ProjID = 3105
projanim = 3105
projhitanim = 3106
projcancelanim = 3106
projremovetime = 16
projshadow = -1,-1,-1
projhits = 1
attr = A,HA
hitflag = MAF
guardflag = MA
offset  = 46,-62
pausetime = 5,5
guard.pausetime = 5,5
sparkno = s17030 + (random % 8)
sparkxy = 130,ceil(P2bodydist y)
guard.sparkno = s17001
hitsound = S6,1
guardsound = S5,8
ground.slidetime = 20
guard.slidetime = 20
ground.hittime = 20
guard.hittime = 20
air.hittime = 20
p2stateno = 3120
fall = 1
air.fall = 1
fall.recover = 0

[State 3101, HitSound]
type = PlaySnd
trigger1 = projhit = 1
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3101, HitSpark]
type = Helper
trigger1 = projhit = 1
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
persistent = 0
ignoreHitPause = 1

[State 3101, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3,0
channel = 3
persistent = 0
ignorehitPause = 1

[State 3101, HitSpark]
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
persistent = 0
ignoreHitPause = 1

[State 3101, HitOverride]
type = HitOverride
trigger1 = projhit = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 3110
time = 2
ignorehitpause = 1
persistent = 1

[State 3101, ]
type = ChangeState
trigger1 = projhit = 1
value = 3110

[State 3101, ]
type = TargetState
trigger1 = projhit = 1
value = 3120

[State 3101, ]
type = ChangeState
trigger1 = animtime = 0
value = 50

;Throw
[Statedef 3110]
type = A
movetype = A
physics = N
anim = 3110
velset = 1,-10
sprpriority = 1
ctrl = 0

[State 3110, ChangeState]
type = ChangeState
trigger1 = numtarget <= 0
value = 3130
ctrl = 0

[State 3110, Width]
type = Width
trigger1 = animelem = 1
edge = 50,50
player = 0,0

[State 3110, Width]
type = Width
trigger1 = time >= 10
edge = 100,100
player = 0,0

[State 3110, VelSet]
type = VelSet
trigger1 = !time
x = 1
y = -6
persistent = 0

[State 3110, VelAdd]
type = VelAdd
trigger1 = pos y <= 0
y = 0.24

[State 3110, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,5

[State 3110, ]
type = PlaySnd
trigger1 = animtime = 0
value = S1,5
persistent = 0

[State 3110, ]
type = TargetBind
trigger1 = animelem = 1
time = 10
pos = floor(130*const(size.xscale)),5

[State 3110, ]
type = TargetBind
trigger1 = animelem = 2
time = 2
pos = floor(55*const(size.xscale)),10

[State 3110, ]
type = TargetBind
trigger1 = animelem = 3
time = 2
pos = floor(25*const(size.xscale)),30

[State 3110, ]
type = TargetBind
trigger1 = animelem = 4
time = 2
pos = floor(-15*const(size.xscale)),30

[State 3110, ]
type = TargetBind
trigger1 = animelem = 5
time = 2
pos = floor(-20*const(size.xscale)),30

[State 3110, ]
type = TargetBind
trigger1 = animelem = 6
time = 2
pos = floor(-100*const(size.xscale)),-5

[State 3110, ]
type = TargetBind
trigger1 = animelem = 7
time = 2
pos = floor(-115*const(size.xscale)),-40

[State 3110, ]
type = TargetBind
trigger1 = animelem = 8
time = 2
pos = floor(-120*const(size.xscale)),-75

[State 3110, ]
type = TargetBind
trigger1 = animelem = 9
time = 2
pos = floor(-120*const(size.xscale)),-80

[State 3110, ]
type = TargetBind
trigger1 = animelem = 10
time = 2
pos = floor(-80*const(size.xscale)),-165

[State 3110, ]
type = TargetBind
trigger1 = animelem = 11
time = 2
pos = floor(-50*const(size.xscale)),-190

[State 3110, ]
type = TargetBind
trigger1 = animelem = 12
time = 2
pos = floor(-10*const(size.xscale)),-195

[State 3110, ]
type = TargetBind
trigger1 = animelem = 13
time = 2
pos = floor(-5*const(size.xscale)),-195

[State 3110, ]
type = TargetBind
trigger1 = animelem = 14
time = 2
pos = floor(100*const(size.xscale)),-175

[State 3110, ]
type = TargetBind
trigger1 = animelem = 15
time = 2
pos = floor(120*const(size.xscale)),-145

[State 3110, ]
type = TargetBind
trigger1 = animelem = 16
time = 2
pos = floor(130*const(size.xscale)),-105

[State 3110, ]
type = TargetBind
trigger1 = animelem = 17
time = 2
pos = floor(130*const(size.xscale)),-100

[State 3110, ]
type = TargetBind
trigger1 = animelem = 18
time = 2
pos = floor(105*const(size.xscale)),25

[State 3110, ]
type = TargetBind
trigger1 = animelem = 19
time = 2
pos = floor(65*const(size.xscale)),45

[State 3110, ]
type = TargetBind
trigger1 = animelem = 20
time = 2
pos = floor(35*const(size.xscale)),50

[State 3110, ]
type = TargetBind
trigger1 = animelem = 21
time = 2
pos = floor(30*const(size.xscale)),50

[State 3110, ]
type = TargetState
trigger1 = animelem = 1
trigger2 = animelem = 18
value = 3120

[State 3110, ]
type = TargetState
trigger1 = animelem = 3
value = 3121

[State 3110, ]
type = TargetState
trigger1 = animelem = 6
value = 3122

[State 3110, ]
type = TargetState
trigger1 = animelem = 8
value = 3123

[State 3110, ]
type = TargetState
trigger1 = animelem = 10
value = 3124

[State 3110, ]
type = TargetState
trigger1 = animelem = 12
value = 3125

[State 3110, ]
type = TargetState
trigger1 = animelem = 14
value = 3126

[State 3110, ]
type = TargetState
trigger1 = animelem = 16
value = 3127

[State 3110, ]
type = ChangeState
trigger1 = animtime = 0 && vel y >= 4
value = 3115

;Attack
[Statedef 3115]
type = A
movetype = A
physics = N
anim = 3115
velset = 1,-1
sprpriority = 1
ctrl = 0

[State 3115, ]
type = VarSet
trigger1 = Win
v =  1
value = 1

[State 3115, Gravity]
type = Gravity
trigger1 = 1

[State 3115, VelSet]
type = VelSet
trigger1 = animelem = 10
x = -0.25
y = -6
persistent = 0

[State 3115, PosFreeze]
type = PosFreeze
trigger1 = time = [17,36]
value = 1
persistent = 1

[State 3115, ]
type = PlaySnd
trigger1 = animelem = 1
value = S1,5

[State 3115, ]
type = PlaySnd
trigger1 = animelem = 7 && var(41) != 1
value = 4,4
channel = 1
lowpriority = 1

[State 3115, ]
type = PlaySnd
trigger1 = animelem = 7 && var(41) != 0
value = 10004,4
channel = 1
lowpriority = 1

[State 3115, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(25*const(size.xscale)),50

[State 3115, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = 0,45

[State 3115, ]
type = TargetBind
trigger1 = animelem = 3
time = 4
pos = floor(-50*const(size.xscale)),20

[State 3115, ]
type = TargetBind
trigger1 = animelem = 4
time = 4
pos = floor(-115*const(size.xscale)),-30

[State 3115, ]
type = TargetBind
trigger1 = animelem = 5
time = 2
pos = floor(-30*const(size.xscale)),-160

[State 3115, ]
type = TargetBind
trigger1 = animelem = 6
time = 2
pos = floor(40*const(size.xscale)),-185

[State 3115, ]
type = TargetBind
trigger1 = animelem = 7
time = 2
pos = floor(140*const(size.xscale)),-145

[State 3115, ]
type = TargetBind
trigger1 = animelem = 8
time = 2
pos = floor(130*const(size.xscale)),5

[State 3115, ]
type = TargetState
trigger1 = animelem = 1
trigger2 = animelem = 8
value = 3120

[State 3115, ]
type = TargetState
trigger1 = animelem = 2
value = 3121

[State 3115, ]
type = TargetState
trigger1 = animelem = 3
value = 3122

[State 3115, ]
type = TargetState
trigger1 = animelem = 4
value = 3123

[State 3115, ]
type = TargetState
trigger1 = animelem = 5
value = 3124

[State 3115, ]
type = TargetState
trigger1 = animelem = 6
value = 3125

[State 3115, ]
type = TargetState
trigger1 = animelem = 7
value = 3126

[State 3115, ]
type = TargetState
trigger1 = animelem = 8,2
value = 3128

[State 3115, ]
type = Null
trigger1 = animelem = 8
value = -360

[State 3115, ]
type = ChangeState
trigger1 = vel y > 0 && pos y >= 0
trigger2 = pos y >= 0
value = 3116
ctrl = 0

;Finish
[Statedef 3116]
type = S
movetype = I
physics = S
anim = 47
sprpriority = 1
ctrl = 0

[State 3116, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3116, VelSet]
type = VelSet
trigger1 = pos y >= 0
y = 0

[State 3116, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3116, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 47 && animtime = 0
value = 195

[State 3116, HitSound]
type = PlaySnd
trigger1 = !Time && var(41) != 1
value = 195,0

[State 3116, HitSound]
type = PlaySnd
trigger1 = !Time && var(41) != 0
value = 10195,0

[State 3116, ChangeState]
type = ChangeState
trigger1 = anim = 195 && animelem = 5; && time >= 60
value = 0
ctrl = 1

;Player 2
[Statedef 3120]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3120, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3120, ]
type = AfterImage
triggerall = prevstateno != 3120
triggerall = prevstateno != 3126
triggerall = prevstateno != 3127
trigger1 = time = 0
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1

[State 3120, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3120, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3120

[State 3120, ]
type = SelfState
trigger1 = time >= 10
value = 5000

;Player 2
[Statedef 3121]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3121, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3121, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3121

;Player 2
[Statedef 3122]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3122, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3122, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3122, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3122

;Player 2
[Statedef 3123]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3123, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3123, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3123, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3123

;Player 2
[Statedef 3124]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3124, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3124, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3124, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3124

;Player 2
[Statedef 3125]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3125, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3125, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3125, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3125

;Player 2
[Statedef 3126]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3126, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3126, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3126, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3126

;Player 2
[Statedef 3127]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3127, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3127, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3127, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3127

;Player 2
[Statedef 3128]
type = A
movetype = H
physics = N
velset = -5,15
sprpriority = 0
facep2 = 1
ctrl = 0

[State 3128, Gravity]
type = Gravity
trigger1 = 1

[State 3128, VelSet]
type = VelSet
trigger1 = !time
x = -4
y = 15
persistent = 0

[State 3128, ]
type = AfterImageTime
trigger1 = time = 0
time = 0

[State 3128, ]
type = ChangeAnim2
trigger1 = time = 0
value = 5050

[State 3128, ChangeState]
type = ChangeState
trigger1 = pos y >= 0 && anim = 5050
value = 3129
ctrl = 0

;Player 2
[Statedef 3129]
type = L
movetype = H
physics = C
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3129, Gravity]
type = Gravity
trigger1 = 1

[State 3129, LifeAdd]
type = LifeAdd
trigger1 = !time
value = -210
kill = 1
persistent = 0

[State 3129, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3129, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0
persistent = 0

[State 3129, ]
type = ChangeAnim2
trigger1 = time = 0
value = 5100

[State 3129, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60
pos = 0, 0
under = 1

[State 3129, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 61 + (sysvar(1) > 14)
pos = 0, 0
ontop = 1

[State 3129, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7,2; (sysvar(1) > 5) + (sysvar(1) > 14)

[State 3129, 11]
type = PosFreeze
trigger1 = 1

[State 3129, EnvShake]
type = EnvShake
trigger1 = !time
time = 20
freq = 120
ampl = -25
persistent = 0

[State 3129, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3130
ctrl = 0

;Player 2
[Statedef 3130]
type = A
movetype = H
physics = N
velset = -3,-12
sprpriority = 0
ctrl = 0

[State 3130, Gravity]
type = Gravity
trigger1 = 1

[State 3130, VelSet]
type = VelSet
trigger1 = time = 0
x = -3
y = -12
persistent = 0

[State 3130, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5050
persistent = 0

[State 3130, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5030 && animtime = 0 && vel y >= 3
value = 5050
persistent = 0

[State 3130, ]
type = SelfState
trigger1 = pos y >= 0 && vel y > 0 && anim = 5050
value = 5110

;========================<MAX ULTIMATE WEB THROW>=============================
[Statedef 3150]
type = S
movetype = I
physics = S
velset = 0,0
anim = 3100
ctrl = 0

[State 3150, ]
type = VelSet
trigger1 = animelem = 2
x = -2.5
y = -8

[State 3150, ]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = A

[State 3150, ]
type = ChangeState
trigger1 = time = 21
value = 3151

;Web
[StateDef 3151]
type = S
physics = N
moveType = A
anim = 3101
ctrl = 0
sprPriority = 1
velset = 0,0
powerAdd = -2000
faceP2 = 1

[State 3151, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3151, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3151, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3151, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3151, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3151, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3151, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3151, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) < 0
time = 1
value = SCA

[State 3151, Super Pause FX]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-90 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3151, SuperPause]
type = SuperPause
trigger1 = animelem = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3151, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = S4,4

[State 3151, ]
type = PlaySnd
trigger1 = animelem = 1 && var(41) != 0
value = S13100,0

[State 3151, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = S11500,0

[State 3151, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1000,1

[State 3151, ]
type = Projectile
trigger1 = animelem = 5
ProjID = 3105
projanim = 3105
projhitanim = 3106
projcancelanim = 3106
projremovetime = 16
projshadow = -1,-1,-1
projhits = 1
attr = A,HA
hitflag = MAF
guardflag = MA
offset  = 46,-62
pausetime = 5,5
guard.pausetime = 5,5
sparkno = s17030 + (random % 8)
sparkxy = 130,ceil(P2bodydist y)
guard.sparkno = s17001
hitsound = S6,1
guardsound = S5,8
ground.slidetime = 20
guard.slidetime = 20
ground.hittime = 20
guard.hittime = 20
air.hittime = 20
p2stateno = 3170
fall = 1
air.fall = 1
fall.recover = 0

[State 3151, HitSound]
type = PlaySnd
trigger1 = projhit = 1
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3151, HitSpark]
type = Helper
trigger1 = projhit = 1
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
persistent = 0
ignoreHitPause = 1

[State 3151, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3,0
channel = 3
persistent = 0
ignorehitPause = 1

[State 3151, HitSpark]
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
persistent = 0
ignoreHitPause = 1

[State 3151, HitOverride]
type = HitOverride
trigger1 = projhit = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 3160
time = 2
ignorehitpause = 1
persistent = 1

[State 3151, ]
type = ChangeState
trigger1 = projhit = 1
value = 3160

[State 3151, ]
type = TargetState
trigger1 = projhit = 1
value = 3170

[State 3151, ]
type = ChangeState
trigger1 = animtime = 0
value = 50

;Throw
[Statedef 3160]
type = A
movetype = A
physics = N
anim = 3110
velset = 1,-10
sprpriority = 1
ctrl = 0

[State 3160, ChangeState]
type = ChangeState
trigger1 = numtarget <= 0
value = 3130
ctrl = 0

[State 3160, Width]
type = Width
trigger1 = animelem = 1
edge = 50,50
player = 0,0

[State 3160, Width]
type = Width
trigger1 = time >= 10
edge = 100,100
player = 0,0

[State 3160, VelSet]
type = VelSet
trigger1 = !time
x = 1
y = -6
persistent = 0

[State 3160, VelAdd]
type = VelAdd
trigger1 = pos y <= 0
y = 0.24

[State 3160, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,5

[State 3160, ]
type = PlaySnd
trigger1 = animtime = 0
value = S1,5
persistent = 0

[State 3160, ]
type = TargetBind
trigger1 = animelem = 1
time = 10
pos = floor(130*const(size.xscale)),5

[State 3160, ]
type = TargetBind
trigger1 = animelem = 2
time = 2
pos = floor(55*const(size.xscale)),10

[State 3160, ]
type = TargetBind
trigger1 = animelem = 3
time = 2
pos = floor(25*const(size.xscale)),30

[State 3160, ]
type = TargetBind
trigger1 = animelem = 4
time = 2
pos = floor(-15*const(size.xscale)),30

[State 3160, ]
type = TargetBind
trigger1 = animelem = 5
time = 2
pos = floor(-20*const(size.xscale)),30

[State 3160, ]
type = TargetBind
trigger1 = animelem = 6
time = 2
pos = floor(-100*const(size.xscale)),-5

[State 3160, ]
type = TargetBind
trigger1 = animelem = 7
time = 2
pos = floor(-115*const(size.xscale)),-40

[State 3160, ]
type = TargetBind
trigger1 = animelem = 8
time = 2
pos = floor(-120*const(size.xscale)),-75

[State 3160, ]
type = TargetBind
trigger1 = animelem = 9
time = 2
pos = floor(-120*const(size.xscale)),-80

[State 3160, ]
type = TargetBind
trigger1 = animelem = 10
time = 2
pos = floor(-80*const(size.xscale)),-165

[State 3160, ]
type = TargetBind
trigger1 = animelem = 11
time = 2
pos = floor(-50*const(size.xscale)),-190

[State 3160, ]
type = TargetBind
trigger1 = animelem = 12
time = 2
pos = floor(-10*const(size.xscale)),-195

[State 3160, ]
type = TargetBind
trigger1 = animelem = 13
time = 2
pos = floor(-5*const(size.xscale)),-195

[State 3160, ]
type = TargetBind
trigger1 = animelem = 14
time = 2
pos = floor(100*const(size.xscale)),-175

[State 3160, ]
type = TargetBind
trigger1 = animelem = 15
time = 2
pos = floor(120*const(size.xscale)),-145

[State 3160, ]
type = TargetBind
trigger1 = animelem = 16
time = 2
pos = floor(130*const(size.xscale)),-105

[State 3160, ]
type = TargetBind
trigger1 = animelem = 17
time = 2
pos = floor(130*const(size.xscale)),-100

[State 3160, ]
type = TargetBind
trigger1 = animelem = 18
time = 2
pos = floor(105*const(size.xscale)),25

[State 3160, ]
type = TargetBind
trigger1 = animelem = 19
time = 2
pos = floor(65*const(size.xscale)),45

[State 3160, ]
type = TargetBind
trigger1 = animelem = 20
time = 2
pos = floor(35*const(size.xscale)),50

[State 3160, ]
type = TargetBind
trigger1 = animelem = 21
time = 2
pos = floor(30*const(size.xscale)),50

[State 3160, ]
type = TargetState
trigger1 = animelem = 1
trigger2 = animelem = 18
value = 3170

[State 3160, ]
type = TargetState
trigger1 = animelem = 3
value = 3171

[State 3160, ]
type = TargetState
trigger1 = animelem = 6
value = 3172

[State 3160, ]
type = TargetState
trigger1 = animelem = 8
value = 3173

[State 3160, ]
type = TargetState
trigger1 = animelem = 10
value = 3174

[State 3160, ]
type = TargetState
trigger1 = animelem = 12
value = 3175

[State 3160, ]
type = TargetState
trigger1 = animelem = 14
value = 3176

[State 3160, ]
type = TargetState
trigger1 = animelem = 16
value = 3177

[State 3160, ]
type = ChangeState
trigger1 = animtime = 0 && vel y >= 4
value = 3165

;Attack
[Statedef 3165]
type = A
movetype = A
physics = N
anim = 3115
velset = 1,-1
sprpriority = 1
ctrl = 0

[State 3165, ]
type = VarSet
trigger1 = Win
v =  1
value = 1

[State 3165, Gravity]
type = Gravity
trigger1 = 1

[State 3165, VelSet]
type = VelSet
trigger1 = animelem = 10
x = -0.25
y = -6
persistent = 0

[State 3165, PosFreeze]
type = PosFreeze
trigger1 = time = [17,36]
value = 1
persistent = 1

[State 3165, ]
type = PlaySnd
trigger1 = animelem = 1
value = S1,5

[State 3165, ]
type = PlaySnd
trigger1 = animelem = 7 && var(41) != 1
value = 4,4
channel = 1
lowpriority = 1

[State 3165, ]
type = PlaySnd
trigger1 = animelem = 7 && var(41) != 0
value = 10004,4
channel = 1
lowpriority = 1

[State 3165, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(25*const(size.xscale)),50

[State 3165, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = 0,45

[State 3165, ]
type = TargetBind
trigger1 = animelem = 3
time = 4
pos = floor(-50*const(size.xscale)),20

[State 3165, ]
type = TargetBind
trigger1 = animelem = 4
time = 4
pos = floor(-115*const(size.xscale)),-30

[State 3165, ]
type = TargetBind
trigger1 = animelem = 5
time = 2
pos = floor(-30*const(size.xscale)),-160

[State 3165, ]
type = TargetBind
trigger1 = animelem = 6
time = 2
pos = floor(40*const(size.xscale)),-185

[State 3165, ]
type = TargetBind
trigger1 = animelem = 7
time = 2
pos = floor(140*const(size.xscale)),-145

[State 3165, ]
type = TargetBind
trigger1 = animelem = 8
time = 2
pos = floor(130*const(size.xscale)),5

[State 3165, ]
type = TargetState
trigger1 = animelem = 1
trigger2 = animelem = 8
value = 3170

[State 3165, ]
type = TargetState
trigger1 = animelem = 2
value = 3171

[State 3165, ]
type = TargetState
trigger1 = animelem = 3
value = 3172

[State 3165, ]
type = TargetState
trigger1 = animelem = 4
value = 3173

[State 3165, ]
type = TargetState
trigger1 = animelem = 5
value = 3174

[State 3165, ]
type = TargetState
trigger1 = animelem = 6
value = 3175

[State 3165, ]
type = TargetState
trigger1 = animelem = 7
value = 3176

[State 3175, ]
type = TargetState
trigger1 = animelem = 8,2
value = 3178

[State 3165, ]
type = Null
trigger1 = animelem = 8
value = -360

[State 3165, ]
type = ChangeState
trigger1 = vel y > 0 && pos y >= 0
trigger2 = pos y >= 0
value = 3166
ctrl = 0

;Finish
[Statedef 3166]
type = S
movetype = I
physics = S
anim = 47
sprpriority = 1
ctrl = 0

[State 3166, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3166, VelSet]
type = VelSet
trigger1 = pos y >= 0
y = 0

[State 3166, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3166, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3166, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 47 && animtime = 0
value = 195

[State 3166, HitSound]
type = PlaySnd
trigger1 = !Time && var(41) != 1
value = 195,0

[State 3166, HitSound]
type = PlaySnd
trigger1 = !Time && var(41) != 0
value = 10195,0

[State 3166, ChangeState]
type = ChangeState
trigger1 = anim = 195 && animelem = 5; && time >= 60
value = 0
ctrl = 1

;Player 2
[Statedef 3170]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3170, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3170, ]
type = AfterImage
triggerall = prevstateno != 3170
triggerall = prevstateno != 3176
triggerall = prevstateno != 3177
trigger1 = time = 0
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1

[State 3170, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3170, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3120

[State 3170, ]
type = SelfState
trigger1 = time >= 10
value = 5000

;Player 2
[Statedef 3171]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3171, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3171, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3121

;Player 2
[Statedef 3172]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3172, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3172, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3172, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3122

;Player 2
[Statedef 3173]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3173, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3173, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3173, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3123

;Player 2
[Statedef 3174]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3174, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3174, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3174, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3124

;Player 2
[Statedef 3175]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3175, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3175, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3175, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3125

;Player 2
[Statedef 3176]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3176, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3176, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3176, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3126

;Player 2
[Statedef 3177]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3177, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3177, ]
type = ScreenBound
trigger1 = time >= 0
value = 0

[State 3177, ]
type = ChangeAnim2
trigger1 = time = 0
value = 3127

;Player 2
[Statedef 3178]
type = A
movetype = H
physics = N
velset = -5,15
sprpriority = 0
facep2 = 1
ctrl = 0

[State 3178, Gravity]
type = Gravity
trigger1 = 1

[State 3178, VelSet]
type = VelSet
trigger1 = !time
x = -4
y = 15
persistent = 0

[State 3178, ]
type = AfterImageTime
trigger1 = time = 0
time = 0

[State 3178, ]
type = ChangeAnim2
trigger1 = time = 0
value = 5050

[State 3178, ChangeState]
type = ChangeState
trigger1 = pos y >= 0 && anim = 5050
value = 3179
ctrl = 0

;Player 2
[Statedef 3179]
type = L
movetype = H
physics = C
velset = 0,0
sprpriority = 0
ctrl = 0

[State 3179, Gravity]
type = Gravity
trigger1 = 1

[State 3179, LifeAdd]
type = LifeAdd
trigger1 = !time
value = -310
kill = 1
persistent = 0

[State 3179, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3179, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0
persistent = 0

[State 3179, ]
type = ChangeAnim2
trigger1 = time = 0
value = 5100

[State 3179, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60
pos = 0, 0
under = 1

[State 3179, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 61 + (sysvar(1) > 14)
pos = 0, 0
ontop = 1

[State 3179, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7,2; (sysvar(1) > 5) + (sysvar(1) > 14)

[State 3179, 11]
type = PosFreeze
trigger1 = 1

[State 3179, EnvShake]
type = EnvShake
trigger1 = !time
time = 20
freq = 120
ampl = -25
persistent = 0

[State 3179, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3130
ctrl = 0

;========================<SEPERATION ANXIETY>=============================
[StateDef 3200]
type = S
physics = S
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
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-5 * const(size.xScale)), ceil(-45 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, ]
type = PlaySnd
trigger1 = animelem = 2
value = S190,0

[State 3200, ]
type = PlaySnd
trigger1 = animelem = 3
value = S1000,1

[State 3200, ]
type = Projectile
trigger1 = animelem = 3
ProjID = 3205
projanim = 3205
projremovetime = 8
projshadow = -1
projhits = 1
attr = A,HP
hitflag = MAF
guardflag = MA
pausetime = 15,15
guard.pausetime = 5,5
sparkno = s17030 + (random % 8)
sparkxy = 180,-35
guard.sparkno = s17001
hitsound = S6,1
guardsound = S5,8
ground.slidetime = 20
guard.slidetime = 20
ground.hittime = 20
guard.hittime = 20
air.hittime = 20
p2facing = 1
p1stateno = 3210
p2stateno = 6205
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3,0
channel = 3
persistent = 0
ignorehitPause = 1

[State 3200, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -35
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3200, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Conect
[Statedef 3210]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3210
ctrl = 0
sprpriority = 2

[State 3210, HitSound]
type = PlaySnd
trigger1 = time = 0
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3210, HitSpark]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -35
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3210, ]
type = Explod
trigger1 = time = 0
anim = 1007
ID = 1007
pos = 0,0
facing = -1
postype = p2
bindtime = 9999
removetime = -2
sprpriority = 0
shadow = -1
ownpal = 1

[State 3210, ]
type = TargetBind
trigger1 = time = 0
time = 1
pos = floor(180*const(size.xscale)),0

[State 3210, ]
type = PlaySnd
trigger1 = animelem = 2
value = S195,0

[State 3210, ]
type = ChangeState
trigger1 = animtime = 0
value = 3215

;Dash
[Statedef 3215]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3215
ctrl = 0
sprpriority = 2

[State 3215, ]
type = AfterImage
trigger1 = time = 0
time = 15
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State 3215, ]
type = PlaySnd
trigger1 = animelem = 3
value = S1,2

[State 3215, ]
type = PosAdd
trigger1 = animelem = 3
x = 80

[State 3215, ]
type = ChangeState
trigger1 = animtime = 0
value = 3220

;Attack
[Statedef 3220]
type = S
movetype = A
physics = S
velset = 5,0
anim = 3220
ctrl = 0
sprpriority = 2

[State 3220, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 3220, ]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 3220, ]
type = AfterImageTime
trigger1 = time = 0
time = 30

[State 3220, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2

[State 3220, ]
type = PlaySnd
trigger1 = animelem = 5
value = S2,2

[State 3220, ]
type = RemoveExplod
trigger1 = animelem = 5
ID = 1007

[State 3220, ]
type = Explod
trigger1 = animelem = 5
anim = 1008
ID = 1008
pos = 0,0
facing = -1
postype = p2
removetime = -2
sprpriority = 7
shadow = -1
ownpal = 1

[State 3220, HitSpark]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 10, -45
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3220, EnvShake]
type = EnvShake
trigger1 = animelem = 5
time = 18
ampl = 6
freq = 120

[State 3220, ]
type = HitAdd
trigger1 = animelem = 5
value = 1

[State 3220, ]
type = TargetLifeAdd
trigger1 = animelem = 5
value = -20
kill = 0

[State 3220, ]
type = TargetState
trigger1 = animelem = 5
value = 6220

[State 3220, ]
type = ChangeState
trigger1 = animtime = 0
value = 3230

;Attack
[Statedef 3230]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3230
ctrl = 0
sprpriority = 2

[State 3230, VelSet]
type = VelSet
trigger1 = 1
x = 2

[State 3230, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3230, ]
type = PlaySnd
trigger1 = time = 0
value = S4,3

[State 3230, ]
type = PlaySnd
trigger1 = animelem = 8
value = S1,5

[State 3230, ]
type = PlaySnd
trigger1 = animelem = 2
value = S2,5

[State 3230, ]
type = PlaySnd
trigger1 = animelem = 10
value = S2,5

[State 3230, ]
type = PlaySnd
trigger1 = animelem = 3
value = S1000,1

[State 3230, ]
type = PlaySnd
trigger1 = animelem = 4
value = S2,7

[State 3230, HitSpark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 5, -50
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3230, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 10
time = 18
ampl = 6
freq = 120

[State 3230, HitSpark]
type = Helper
trigger1 = animelem = 10
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = -20, 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3230, ]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 10
value = 1

[State 3230, ]
type = TargetLifeAdd
trigger1 = animelem = 2
value = -20
kill = 0

[State 3230, Width]
type = Width
trigger1 = time <= 15
edge = (time*10),0

[State 3230, TargetBind]
type = TargetBind
trigger1 = animelem = 4
time = 2
pos = floor(170*const(size.xscale)),-55

[State 3230, TargetBind]
type = TargetBind
trigger1 = animelem = 5
time = 2
pos = floor(170*const(size.xscale)),-40

[State 3230, TargetBind]
type = TargetBind
trigger1 = animelem = 6
time = 4
pos = floor(150*const(size.xscale)),-75

[State 3230, TargetBind]
type = TargetBind
trigger1 = animelem = 10
time = 4
pos = floor(50*const(size.xscale)),-20

[State 3230, ]
type = TargetState
trigger1 = animelem = 2
value = 6230

[State 3230, ]
type = TargetState
trigger1 = animelem = 4
value = 6231

[State 3230, ]
type = TargetState
trigger1 = animelem = 10
value = 6235

[State 3230, ]
type = ChangeState
trigger1 = animtime = 0
value = 3235

;Attack
[Statedef 3235]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3235
ctrl = 0
sprpriority = 2

[State 3235, VelSet]
type = VelSet
trigger1 = 1
x = 2

[State 3235, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3235, Width]
type = Width
trigger1 = time = 2
edge = 100,0
time = 2

[State 3235, Width]
type = Width
trigger1 = time = 4
edge = 200,0
time = 2

[State 3235, ]
type = PlaySnd
trigger1 = animelem = 1
value = S1000,1

[State 3235, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,7

[State 3235, ]
type = HitAdd
trigger1 = animelem = 3
value = 1
persistent = 0

[State 3235, TargetBind]
type = TargetBind
trigger1 = animelem = 3
time = 2
pos = floor(230*const(size.xscale)),-80

[State 3235, TargetBind]
type = TargetBind
trigger1 = animelem = 4
time = 2
pos = floor(230*const(size.xscale)),-75

[State 3235, TargetBind]
type = TargetBind
trigger1 = animelem = 5
time = 2
pos = floor(230*const(size.xscale)),-70

[State 3235, TargetBind]
type = TargetBind
trigger1 = animelem = 6
time = 4
pos = floor(225*const(size.xscale)),-60

[State 3235, TargetBind]
type = TargetBind
trigger1 = animelem = 7
time = 4
pos = floor(200*const(size.xscale)),-70

[State 3235, TargetBind]
type = TargetBind
trigger1 = animelem = 8
time = 4
pos = floor(120*const(size.xscale)),-60

[State 3235, ]
type = TargetState
trigger1 = animelem = 3
value = 6236
persistent = 0

[State 3235, ]
type = ChangeState
trigger1 = animtime = 0
value = 3240

;Attack
[Statedef 3240]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3240
ctrl = 0
sprpriority = 2

[State 3240, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3240, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3240, VelSet]
type = VelSet
trigger1 = time = 0
x = 8

[State 3240, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,5

[State 3240, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,5
persistent = 0

[State 3240, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = -15, 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3240, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3240, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3240, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -20
kill = 0

[State 3240, ]
type = TargetState
trigger1 = animelem = 3
value = 6240
persistent = 0

[State 3240, ]
type = TargetBind
trigger1 = animelem = 3
time = 12
pos = floor(75*const(size.xscale)),-25

[State 3240, ]
type = ChangeState
trigger1 = animtime = 0
value = 3250

;Attack
[Statedef 3250]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3250
ctrl = 0
sprpriority = 2

[State 3250, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3250, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3250, VelSet]
type = VelSet
trigger1 = time = 0
x = 8

[State 3250, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,2

[State 3250, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,2
persistent = 0

[State 3250, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 10, -70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3250, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3250, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3250, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -20
kill = 0

[State 3250, ]
type = TargetState
trigger1 = animelem = 3
value = 6250
persistent = 0

[State 3250, ]
type = TargetBind
trigger1 = animelem = 3
time = 10
pos = floor(70*const(size.xscale)),0

[State 3250, ]
type = ChangeState
trigger1 = animtime = 0
value = 3260

;Attack
[Statedef 3260]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3260
ctrl = 0
sprpriority = 2

[State 3260, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3260, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3260, VelSet]
type = VelSet
trigger1 = time = 0
x = 8

[State 3260, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,2

[State 3260, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,2
persistent = 0

[State 3260, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = -17, -65
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3260, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3260, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3260, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -20
kill = 0

[State 3260, ]
type = TargetState
trigger1 = animelem = 3
value = 6260
persistent = 0

[State 3260, ]
type = TargetBind
trigger1 = time = 0
time = 12
pos = floor(40*const(size.xscale)),0

[State 3260, ]
type = ChangeState
trigger1 = animtime = 0
value = 3270

;Attack
[Statedef 3270]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3270
ctrl = 0
sprpriority = 2

[State 3270, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3270, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3270, VelSet]
type = VelSet
trigger1 = time = 0
x = 8

[State 3270, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,5

[State 3270, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,5
persistent = 0

[State 3270, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = -10, -75
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3270, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3270, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3270, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -40
kill = 0

[State 3270, ]
type = TargetState
trigger1 = animelem = 3
value = 6270
persistent = 0

[State 3270, ]
type = TargetBind
trigger1 = time = 0
time = 10
pos = floor(70*const(size.xscale)),0

[State 3270, ]
type = ChangeState
trigger1 = animtime = 0
value = 3280

;Attack
[Statedef 3280]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3280
ctrl = 0
sprpriority = 0

[State 3280, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3280, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3280, VelSet]
type = VelSet
trigger1 = time = 0
x = 12

[State 3280, ]
type = PlaySnd
trigger1 = animelem = 3
value = S1,5

[State 3280, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,2

[State 3280, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 45, -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3280, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3280, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3280, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -5
kill = 0

[State 3280, ]
type = TargetState
trigger1 = animelem = 3
value = 6250
persistent = 0

[State 3280, ]
type = TargetBind
trigger1 = animelem = 4
time = 1
pos = floor(65*const(size.xscale)),0

[State 3280, ]
type = ChangeState
trigger1 = animtime = 0
value = 3290

;Attack
[Statedef 3290]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3290
ctrl = 0

[State 3290, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3290, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3290, VelSet]
type = VelSet
trigger1 = time = 0
x = 4

[State 3290, ]
type = PlaySnd
trigger1 = animelem = 3
value = S1,2

[State 3290, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,2

[State 3290, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 45, -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3290, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3290, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3290, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -5
kill = 0

[State 3290, ]
type = TargetState
trigger1 = animelem = 3
value = 6290
persistent = 0

[State 3290, ]
type = TargetBind
trigger1 = animelem = 4
time = 1
pos = floor(65*const(size.xscale)),0

[State 3290, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3295
ctrl = 1

;Attack
[Statedef 3295]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3295
ctrl = 0

[State 3295, Width]
type = Width
trigger1 = 1
edge = 105,10

[State 3295, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3295, VelSet]
type = VelSet
trigger1 = time = 0
x = 4

[State 3295, VelSet]
type = VelSet
trigger1 = animelem = 3
y = -8

[State 3295, StateTypeSet]
type = StateTypeSet
trigger1 = pos y < 0
statetype = A
physics = N

[State 3295, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3295, ]
type = PlaySnd
trigger1 = animelem = 3
value = S1,2

[State 3295, ]
type = PlaySnd
trigger1 = animelem = 3
value = S2,2

[State 3295, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 45, -60
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3295, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 18
ampl = 6
freq = 120

[State 3295, ]
type = HitAdd
trigger1 = animelem = 3
value = 1

[State 3295, ]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -5
kill = 0

[State 3295, ]
type = TargetState
trigger1 = animelem = 3
value = 6295
persistent = 0

[State 3295, ]
type = TargetBind
trigger1 = animelem = 4
time = 1
pos = floor(65*const(size.xscale)),0

[State 3295, ChangeState]
type = ChangeState
trigger1 = vel y > 0
value = 3299
ctrl = 0

;Final Throw!
[Statedef 3299]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3299
sprpriority = -2
ctrl = 0

[State 3299, ]
type = VarSet
trigger1 = Win
v =  1
value = 2

[State 3299, Turn]
type = Turn
trigger1 = !time
ignorehitpause = 0
persistent = 0

[State 3299, Width]
type = Width
trigger1 = 1
edge = 95,30

[State 3299, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3299, ]
type = AfterImageTime
trigger1 = time >= 0
time = 2

[State 3299, VelSet]
type = VelSet
trigger1 = animelem = 1
y = -5

[State 3299, VelSet]
type = VelSet
trigger1 = animelem = 3
x = -8
y = -8

[State 3299, StateTypeSet]
type = StateTypeSet
trigger1 = pos y < 0
statetype = A
physics = N

[State 3299, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3299, ]
type = PlaySnd
trigger1 = animelem = 1
value = S4,4

[State 3299, ]
type = PlaySnd
trigger1 = animelem = 1
value = S1000,1

[State 3299, ]
type = PlaySnd
trigger1 = animelem = 1
value = S2,7

[State 3299, ]
type = HitAdd
trigger1 = animelem = 1
value = 1

[State 3299, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 18
ampl = 6
freq = 120

[State 3299, ]
type = TargetLifeAdd
trigger1 = animelem = 1
value = -5
kill = 0

[State 3299, ]
type = TargetState
trigger1 = animelem = 1
value = 6231
persistent = 0

[State 3299, ]
type = TargetState
trigger1 = animelem = 4
value = 3208
persistent = 0

[State 3299, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(-65*const(size.xscale)),-85

[State 3299, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = floor(5*const(size.xscale)),-30

[State 3299, ]
type = TargetBind
trigger1 = animelem = 3
time = 3
pos = floor(160*const(size.xscale)),5

[State 3299, ]
type = TargetBind
trigger1 = animelem = 4
time = 1
pos = floor(175*const(size.xscale)),40

[State 3299, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 110
ctrl = 1

;Player 2
[Statedef 6205]
type = A
movetype = H
physics = A
ctrl = 0
velset = 0,0
anim = 5000
facep2 = 1
sprpriority = -1

[State 6205, ]
type = ChangeAnim2
trigger1 = time = 0
value = 6205

[State 6205, ]
type = StateTypeSet
trigger1 = pos y >= -5
statetype = S
physics = S

[State 6205, ]
type = PosSet
trigger1 = pos y >= -5
y = 0

[State 6205, ]
type = VelSet
trigger1 = pos y >= -5
y = 0

;Get Hit By
[Statedef 6220]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6220, ]
type = ChangeAnim2
trigger1 = time = 0
value = 6220

;Get Hit By
[Statedef 6230]
type = S
movetype = H
physics = S
velset = 0,0
facep2 = 1
ctrl = 0

[State 6230, ]
type = ChangeAnim2
trigger1 = time = 0
value = 6230

[State 6230, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignorehitpause = 1
persistent = 1

[State 6230, VelSet]
type = VelSet
trigger1 = 1
x = -8
y = 0

[State 6230, ]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = N

;Get Hit By
[Statedef 6231]
type = A
movetype = H
physics = N
velset = 0,-6
facep2 = -1
ctrl = 0

[State 6231, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignorehitpause = 1
persistent = 1

[State 6231, VelSet]
type = VelSet
trigger1 = 1
x = 7

[State 6231, VelSet]
type = VelSet
trigger1 = time = 8
y = -3

[State 6231, Gravity]
type = Gravity
trigger1 = 1

[State 6231, ]
type = ChangeAnim2
trigger1 = time = 0
value = 6231

;Get Hit By
[Statedef 6235]
type = S
movetype = H
physics = S
velset = 0,0
facep2 = 1
ctrl = 0

[State 6235, ]
type = ChangeAnim2
trigger1 = time = 0
value = 6230

[State 6235, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignorehitpause = 1
persistent = 1

[State 6235, VelSet]
type = VelSet
trigger1 = 1
x = -15
y = 0

[State 6235, ]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = N

;Get Hit By
[Statedef 6236]
type = A
movetype = H
physics = N
velset = 0,-6
facep2 = 1
ctrl = 0

[State 6236, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignorehitpause = 1
persistent = 1

[State 6236, ]
type = ChangeAnim2
trigger1 = time = 0
value = 6231

[State 6236, VelSet]
type = VelSet
trigger1 = 1
x = 6

[State 6236, VelSet]
type = VelSet
trigger1 = time = 18
y = -3

[State 6236, Gravity]
type = Gravity
trigger1 = 1

;Get Hit By
[Statedef 6240]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6240, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 6240, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 0, Gravity]
type = Gravity
trigger1 = time >= 8

[State 6240, VelSet]
type = VelSet
trigger1 = time >= 8
x = -2

[State 6240, ]
type = ChangeAnim
trigger1 = time = 0
value = 5011

;Get Hit By
[Statedef 6250]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6250, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 6250, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 6250, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3

[State 6250, ]
type = ChangeAnim
trigger1 = time = 0
value = 5001

;Get Hit By
[Statedef 6260]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6260, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 6260, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 6260, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3

[State 6260, ]
type = ChangeAnim
trigger1 = time = 0
value = 5002

;Get Hit By
[Statedef 6270]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6270, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 6270, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 6270, VelSet]
type = VelSet
trigger1 = time >= 8
x = -4

[State 6270, ]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(AnimExist(5035), 5035, 5050)

[State 6270, ]
type = ChangeAnim
trigger1 = animtime = 0 && anim != 5040
value = 5040

;Get Hit By
[Statedef 6290]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6290, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 6290, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 6290, VelSet]
type = VelSet
trigger1 = 1
x = 0

[State 6290, ]
type = ChangeAnim
trigger1 = time = 0
value = 5070

;Get Hit By
[Statedef 6295]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 6295, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 6295, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 6295, VelSet]
type = VelSet
trigger1 = time = 0
x = -1
y = -10

[State 6295, ]
type = ChangeAnim
trigger1 = time = 0
value = 5051

[State 6295, ]
type = ChangeAnim
triggerall = anim = 5051
trigger1 = vel y >=  1
value = ifelse(AnimExist(5035), 5035, 5061)

[State 6295, ]
type = ChangeAnim
trigger1 = animtime = 0 && anim = 5035
trigger2 = vel y >=  8
value = 5050

[State 6295, StateTypeSet]
type = StateTypeSet
trigger1 = pos y < 0
statetype = A
physics = N

[State 6295, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 6295, SelfState]
type = SelfState
trigger1 = anim = 5050 && pos y >= 0
value = 5100

;Get Hit By
[Statedef 3208]
type = A
movetype = H
physics = N
velset = 0,0
facep2 = 1
ctrl = 0

[State 3208, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 3208, VelSet]
type = VelSet
trigger1 = time = 0
x = -10
y = 8

[State 3208, ]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(animexist(5061),5061,5050)

[State 3208, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3208, SelfState]
type = ChangeState
trigger1 = pos y >= 0
value = 3209

;Get Hit By
[Statedef 3209]
type = L
movetype = H
physics = S
velset = 0,0
facep2 = 1
ctrl = 0

[State 3209, Width]
type = Width
trigger1 = 1
edge = 0,40

[State 3209, VelSet]
type = VelSet
trigger1 = 1
y = 0

[State 3209, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3209, ]
type = ChangeAnim
trigger1 = time = 0
value = 5100

[State 3209, ]
type = ChangeAnim
trigger1 = animtime = 0 && anim = 5100
value = 5110

[State 3209, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 40
freq = 180
ampl = -12

[State 3209, Explod]
type = Explod
trigger1 = time = 0
anim = F60
bindtime = 1
random = 10,0
scale = 1,1
sprpriority = -5
ontop = 0
shadow = -1,-1,-1
ownpal = 1
persistent = 0

[State 3209, Explod]
type = Explod
trigger1 = time = 0
anim = F61
bindtime = 1
random = 10,0
scale = 1.2,1
sprpriority = 0
ontop = 1
shadow = -1,-1,-1
ownpal = 1
persistent = 0

[State 3209, Explod]
type = Explod
trigger1 = time = 0
anim = F62
bindtime = 1
random = 10,0
scale = 1.4,1
sprpriority = 2
ontop = 1
shadow = -1,-1,-1
ownpal = 1
persistent = 0

[State 3209, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = F7,2
persistent = 0

[State 3209, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -240
kill = 1

[State 3209, SelfState]
type = SelfState
trigger1 = time = 75
value = ifelse(lose = 1,5150,5120)

;========================<MAXIMUM SPIDER>=============================
[Statedef 3300]
type = A
movetype = I
physics = N
velset = backedgedist/-5 * (.35),-10
anim = 3300
ctrl = 0
sprpriority = 2

[State 3300, ]
type = ScreenBound
trigger1 = time >= 0

[State 3300, ]
type = VelAdd
trigger1 = vel y <= 0
y = .6

[State 3300, ]
type = VelSet
trigger1 = vel x = 0
trigger1 = backedgedist < 25
x = .45

[State 3300, ]
type = changestate
trigger1 = pos y < -65
trigger1 = backedgebodydist <= 25
trigger2 = vel y > 1
value = 3301

[State 3300, ]
type = Playerpush
trigger1 = 1
value = 0

[State 3300, VarSet]
type = VarSet
trigger1 = 1
v = 12
value = 0
ignorehitpause = 0
persistent = 1

[State 3300, ]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 50

;Attack
[StateDef 3301]
type = A
physics = N
moveType = A
anim = 3301
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3301, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3301, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3301, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3301, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3301, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3301, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3301, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3301, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3301, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3301, SuperPause]
type = SuperPause
trigger1 = Time = 2
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3301, VarSet]
type = VarSet
trigger1 = 1
v = 12
value = 0
ignorehitpause = 0
persistent = 1

[State 3301, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3301, ]
type = PosFreeze
triggerall = Stateno = 3301
trigger1 = BackEdgeBodyDist < 2

[State 3301, ]
type = PlayerPush
trigger1 = Stateno = 3301
value = 0

[State 3301, ]
type = VelSet
trigger1 = BackEdgeBodyDist > 1
x = -5

[State 3301, ]
type = PlaySnd
trigger1 = time = 0 && var(41) != 1
value = S3300,0

[State 3301, ]
type = PlaySnd
trigger1 = time = 0 && var(41) != 0
value = S13300,0

[State 3301, Strength]
type = varset
trigger1 = var(42) != 5
var(42) = 5

[State 3301, ]
type = Changestate
triggerall = animtime = 0 && !AILevel
trigger1 = command = "holddown" && command != "holdup" && command != "holdfwd"
value = ifelse(p2bodydist x >= 60,3305,3325)

[State 3301, ]
type = Changestate
triggerall = animtime = 0 && !AILevel
trigger1 = command = "holdup" && command != "holdfwd" && command != "holddown"
value = ifelse(p2bodydist x >= 60,3310,3320)

[State 3301, ]
type = Changestate
triggerall = animtime = 0 && !AILevel
trigger1 = command = "holdfwd" && command != "holdup" && command != "holddown"
value = 3315

[State 3301, ]
type = Changestate
triggerall = animtime = 0
trigger1 = !AILevel && command = "holdfwd" && command != "holdup" && command != "holddown"
trigger2 = p2bodydist y = [-20,20]
trigger3 = enemynear,vel y >= -5 && (p2bodydist y = [-60,60]) && AILevel
trigger4 = p2dist x >= 150 && (p2bodydist y = [-60,60]) && AILevel
value = 3315

[State 3301, ]
type = Changestate
triggerall = animtime = 0
trigger1 = !AILevel && command = "holddown" && command != "holdup" && command != "holdfwd"
trigger2 = p2bodydist y > 20
value = ifelse(p2bodydist x >= 60,3305,3325)

[State 3301, ]
type = Changestate
triggerall = animtime = 0
trigger1 = !AILevel && command = "holdup" && command != "holdfwd" && command != "holddown"
trigger2 = p2bodydist y < -20
value = ifelse(p2bodydist x >= 60,3310,3320)

[State 3301, ]
type = Changestate
trigger1 = animtime = 0
value = 3315

;Prepared
[statedef 3302]
type = A
movetype = A
physics = N
anim = 3302
velset = 0,0
hitcountpersist = 1
ctrl = 0

[State 3302, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3302, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3302, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,0

[State 3302, ]
type = Turn
trigger1 = time = 0

[State 3302, ]
type = PosFreeze
triggerall = Stateno = 3302
trigger1 = BackEdgeBodyDist < 2

[State 3302, ]
type = PlayerPush
trigger1 = Stateno = 3302
value = 0

[State 3302, ]
type = VelSet
trigger1 = BackEdgeBodyDist > 1
x = -5

[State 3302, ]
type = AfterImageTime
trigger1 = stateno = 3302
time = 5

[State 3302, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist x > 20
trigger1 = p2bodydist y > 20
value = 3305
value = ifelse(p2bodydist x <= 80,3305,3325)

[State 3302, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist x > 20
trigger1 = p2bodydist y < -20
value = 3310

[State 3302, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist y = [-20,20]
value = 3315

[State 3302, ]
type = ChangeState
trigger1 = animtime = 0
trigger1 = p2bodydist x <= 20
trigger1 = p2bodydist y < -20
value = 3320

[State 3302, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist x <= 20
trigger1 = p2bodydist y > 20
value = 3325

[State 3302, ]
type = Changestate
trigger1 = p2statetype = L
trigger2 = hitcount = 0
trigger3 = var(12) = 0
value = 3330

;Prepared
[statedef 3303]
type = S
movetype = A
physics = S
anim = 3303
velset = 0,0
hitcountpersist = 1

[State 3303, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3303, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3303, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,0

[State 3303, ]
type = Width
trigger1 = 1
edge = -20,-30
player = -20,-30

[State 3303, ]
type = Turn
trigger1 = p2dist x < 0
persistent = 0

[State 3303, ]
type = AfterImageTime
trigger1 = stateno = 3303
time = 10

[State 3303, ]
type = Changestate
trigger1 = animtime = 0
value = ifelse(p2bodydist x >= 120,3315,ifelse(p2bodydist x >= 20 && p2bodydist y >= -100,3310,3320))

[State 3303, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist y = [-20,20]
value = 3315

[State 3303, ]
type = Changestate
trigger1 = p2statetype = L
trigger2 = hitcount = 0
trigger3 = var(12) = 0
value = 3330

;Prepared
[statedef 3304]
type = A
movetype = A
physics = N
anim = 3304
velset = 0,0
hitcountpersist = 1

[State 3304, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3304, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3304, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,0

[State 3304, ]
type = Width
trigger1 = 1
edge = -20,-30
player = -20,-30

[State 3304, ]
type = Turn
trigger1 = p2dist x < 0
persistent = 0

[State 3304, ]
type = PlayerPush
trigger1 = Stateno = 3304
value = 0

[State 3304, ]
type = AfterImageTime
trigger1 = stateno = 3304
time = 10

[State 3304, ]
type = VelSet
trigger1 = screenpos y >= 50
y = 0

[State 3304, ]
type = VelSet
trigger1 = screenpos y > 50
y = -5

[State 3304, ]
type = Changestate
trigger1 = animtime = 0
value = ifelse(p2bodydist x >= 20 && p2bodydist y <= 100,3305,3325)

[State 3304, ]
type = ChangeState
trigger1 = p2statetype = L
trigger2 = hitcount = 0
trigger3 = var(12) = 0
value = 3330

;Attack
[statedef 3305]
type = A
movetype = A
physics = N
anim = 3305
velset = 17,11
facep2 = 1
hitcountpersist = 1
ctrl = 0

[State 3305, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3305, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3305, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3305, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3305, VelAdd]
type = VelAdd
trigger1 = time = 0
y = (p2dist y/20)-5
x = (p2dist x/30)

[State 3305, VelSet]
type = VelSet
trigger1 = vel y <= 2
y = 2

[State 3305, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = .2

[State 3305, ]
type = ScreenBound
trigger1 = stateno = 3305
value = 1
movecamera = 0,0

[State 3305, ]
type = PlayerPush
trigger1 = stateno = 3305
value = 0

[State 3305, ]
type = AfterImageTime
trigger1 = stateno = 3305
time = 20

[State 3305, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3305, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3305, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3302

[State 3305, ]
type = ChangeState
trigger1 = pos y >= 0
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3303

[State 3305, ]
type = ChangeState
trigger1 = screenpos y >= 225
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3303

[State 3305, ]
type = Null
triggerall = frontedgedist <= 5 || pos y >= 0
trigger1 = prevstateno != 3301
trigger1 = p2statetype = L
value = 3330

;Attack
[statedef 3310]
type = A
movetype = A
physics = N
anim = 3310
velset = 18,-11
hitcountpersist = 1
ctrl = 0

[State 3310, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3310, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3310, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3310, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3310, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = -0.2

[State 3310, ]
type = ScreenBound
trigger1 = stateno = 3310
value = 1
movecamera = 0,0

[State 3310, ]
type = PlayerPush
trigger1 = stateno = 3310
value = 0

[State 3310, ]
type = AfterImageTime
trigger1 = stateno = 3310
time = 20

[State 3310, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3310, ]
type = ChangeState
triggerall = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3310, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3302

[State 3310, ]
type = ChangeState
trigger1 = screenpos y <= 0
;trigger1 = movehit = 1
;rigger2 = hitcount >= 1
value = 3304

[State 3310, ]
type = Null
triggerall = hitcount = 0
trigger1 = movehit = 0
trigger1 = frontedgedist <= 5
trigger2 = p2stateno = 5100
value = 3330

;Attack
[statedef 3315]
type = A
movetype = A
physics = N
anim = 3315
velset = 24,0
hitcountpersist = 1
ctrl = 0

[State 3315, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3315, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3315, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3315, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3315, VelAdd]
type = Null
trigger1 = time = 0
y = -1*(p2dist y/20)

[State 3315, VelSet]
type = VelSet
trigger1 = time = 0
y = ifelse(p2dist y > -10,3,ifelse(p2dist y <= -20,-3,0))
persistent = 0

[State 3315, ]
type = VelAdd
trigger1 = time >= 0
x = .2

[State 3315, ]
type = ScreenBound
trigger1 = stateno = 3315
value = 1
movecamera = 0,0

[State 3315, ]
type = PlayerPush
trigger1 = stateno = 3315
value = 0

[State 3315, ]
type = AfterImageTime
trigger1 = stateno = 3315
time = 20

[State 3315, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3315, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3315, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3302

[State 3315, ]
type = ChangeState
trigger1 = pos y >= 0
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3303

[State 3315, ]
type = ChangeState
trigger1 = screenpos y >= 225
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3303

[State 3315, ]
type = Null
triggerall = hitcount = 0
trigger1 = movehit = 0
trigger1 = frontedgedist <= 5
trigger2 = p2stateno = 5100
value = 3330

;Attack
[statedef 3320]
type = A
movetype = A
physics = N
anim = 3320
velset = 11,-17
hitcountpersist = 1
ctrl = 0

[State 3320, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3320, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3320, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3320, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3320, ]
type = VelSet
trigger1 = time = 0
trigger1 = p2bodydist x <= 0 && p2bodydist y <= -100
x = 0

[State 3320, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = -0.2

[State 3320, ]
type = ScreenBound
trigger1 = stateno = 3320
value = 1
movecamera = 0,0

[State 3320, ]
type = PlayerPush
trigger1 = stateno = 3320
value = 0

[State 3320, ]
type = AfterImageTime
trigger1 = stateno = 3320
time = 20

[State 3320, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3320, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3320, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3302

[State 3320, ]
type = ChangeState
trigger1 = screenpos y <= 50
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3304

[State 3320, ]
type = Null
triggerall = hitcount = 0
trigger1 = movehit = 0
trigger1 = frontedgedist <= 5
trigger2 = p2stateno = 5100
trigger3 = screenpos y <= 50 && movehit = 0 && hitcount = 0
value = 3330

;Attack
[statedef 3325]
type = A
movetype = A
physics = N
anim = 3325
velset = 11,17
hitcountpersist = 1
ctrl = 0

[State 3325, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3325, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3325, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3325, VelAdd]
type = VelAdd
trigger1 = p2dist x >= 10
x = 2
persistent = 0

[State 3325, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3325, ]
type = VelSet
trigger1 = time = 0
trigger1 = p2bodydist x <= 0 && p2bodydist y >= 100
x = 0

[State 3325, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = .2

[State 3325, ]
type = ScreenBound
trigger1 = stateno = 3325
value = 1
movecamera = 0,0

[State 3325, ]
type = PlayerPush
trigger1 = stateno = 3325
value = 0

[State 3325, ]
type = AfterImageTime
trigger1 = stateno = 3325
time = 20

[State 3325, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3325, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3325, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3302

[State 3325, ]
type = ChangeState
trigger1 = pos y >= 0
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3303

[State 3325, ]
type = ChangeState
trigger1 = screenpos y >= 225
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3303

[State 3325, ]
type = Null
trigger1 = prevstateno != 3301
trigger1 = p2statetype = L
value = 3330

;Final
[statedef 3330]
type = S
movetype = A
physics = N
facep2 = 1
hitcountpersist = 1
ctrl = 0

[State 3330, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3330, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3330, Gravity]
type = Gravity
trigger1 = time >= 0

[State 3330, VelSet]
type = VelSet
trigger1 = time = 0
x = -2
y = -8

[State 3330, ]
type = ChangeAnim
trigger1 = time = 0
trigger1 = hitcount = 0
value = 43

[State 3330, ScreenBound]
type = ScreenBound
trigger1 = hitcount > 0
value = 0
movecamera = 0,0

[State 3330, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && hitcount >= 1
value = 3330

[State 3330, ChangeState]
type = ChangeState
trigger1 = anim = 43
value = 50
ctrl = 0

[State 3330, ChangeState]
type = ChangeState
triggerall = anim != 43
trigger1 = pos y >= 0
value = 3331
ctrl = 0

;Finish
[statedef 3331]
type = S
movetype = I
physics = S
velset = 0,0
anim = 0
ctrl = 0

[State 3331, VelSet]
type = VelSet
trigger1 = 1
y = 0

[State 3331, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3331, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3331, ]
type = ChangeState
trigger1 = time = 40
trigger2 = backedgedist >= -25
value = 101

;Player 2
[statedef 3340]
type = A
movetype = H
physics = N
velset = 0,-10
ctrl = 0

[State 3340, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3340, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5010
ignorehitpause = 1
persistent = 0

[State 3340, ChangeAnim]
type = ChangeState
trigger1 = hitshakeover
trigger2 = time >= 20
value = 3341
ignorehitpause = 0
persistent = 0

;Player 2
[Statedef 3341]
type = A
movetype = H
physics = N
ctrl = 0

[State 3341, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5030
ignorehitpause = 1
persistent = 0

[State 3341, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 3341, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 3341, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5030 && vel y >= 0
value = 5061
ignorehitpause = 1
persistent = 0

[State 3341, ChangeState]
type = ChangeState
trigger1 = screenpos y <= 55
value = 3342
ctrl = 0

;[State 3341, ChangeState]
;type = ChangeState
;trigger1 = backedgedist <= 5
;trigger2 = frontedgedist <= 5
;value = 3343
;ctrl = 0

[State 3341, ChangeState]
type = ChangeState
trigger1 = pos y >= 0 && vel y > 0
value = 3344
ctrl = 0

;Player 2
[statedef 3342]
type = A
movetype = H
physics = N
vel = 0,0
ctrl = 0

[State 3342, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1
persistent = 0

[State 3342, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3342, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 3342, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 3342, PosFreeze]
type = PosFreeze
trigger1 = time = 0
value = 6
ignorehitpause = 1
persistent = 1

[State 3342, VelSet]
type = VelSet
trigger1 = time = 0
x = 0
y = -1
ignorehitpause = 1
persistent = 1

[State 3342, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5010
ignorehitpause = 1
persistent = 0

[State 3342, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5010 && time = 5
value = 5030
ignorehitpause = 1
persistent = 0

[State 3342, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5030 && vel y >= 0
value = 5061
ignorehitpause = 1
persistent = 0

[State 3342, ChangeState]
type = ChangeState
trigger1 = pos y >= 0 && vel y > 0
value = 3344
ctrl = 0

;Player 2
[statedef 3343]
type = A
movetype = H
physics = N
facep2 = 1
vel = 0,0
ctrl = 0

[State 3343, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 75
ampl = -8
phase = 90
ignorehitpause = 1
persistent = 0

[State 3343, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 3343, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 3343, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3343, PosFreeze]
type = PosFreeze
trigger1 = time = 0
value = 6
ignorehitpause = 1
persistent = 1

[State 3343, VelSet]
type = VelSet
trigger1 = time = 0
x = 1
y = -6
ignorehitpause = 1
persistent = 1

[State 3343, Explod]
type = Explod
trigger1 = time = 1
anim = f71
postype = back
pos = 0,pos y + const(size.mid.pos.y)
facing = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 3343, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5010
ignorehitpause = 1
persistent = 0

[State 3343, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5010 && time = 5
value = 5030
ignorehitpause = 1
persistent = 0

[State 3343, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5030 && vel y >= 0
value = 5061
ignorehitpause = 1
persistent = 0

[State 3343, ChangeState]
type = ChangeState
trigger1 = pos y >= 0 && vel y > 0
value = 3344
ctrl = 0

;Player 2
[statedef 3344]
type = L
movetype = H
physics = N
facep2 = 1
vel = 0,0
ctrl = 0

[State 3344, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60
pos = 0, 0
under = 1

[State 3344, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 61 + (sysvar(1) > 14)
pos = 0, 0
ontop = 1

[State 3344, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 3344, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 3344, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 75
ampl = -8
phase = 90
ignorehitpause = 1
persistent = 0

[State 3344, VelSet]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 3344, PosSet]
type = PosSet
trigger1 = pos y >= 0
y = 0
ignorehitpause = 1
persistent = 1

[State 3344, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 3344, PosFreeze]
type = PosFreeze
trigger1 = time = 0
value = 6
ignorehitpause = 1
persistent = 1

[State 3344, VelSet]
type = VelSet
trigger1 = anim = 5090
x = -1
y = -6
ignorehitpause = 1
persistent = 0

[State 3344, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5100
ignorehitpause = 1
persistent = 0

[State 3344, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5100 && animtime = 0
value = ifelse(selfanimexist(5090),5090,5030)
ignorehitpause = 1
persistent = 0

[State 3344, SelfState]
type = SelfState
trigger1 = anim = 5090
trigger2 = anim = 5030
value = 5101

;========================<MAX MAXIMUM SPIDER>=============================
[Statedef 3350]
type = A
movetype = I
physics = N
velset = backedgedist/-5 * (.35),-10
anim = 3300
ctrl = 0
sprpriority = 2

[State 3350, ]
type = ScreenBound
trigger1 = time >= 0

[State 3350, ]
type = VelAdd
trigger1 = vel y <= 0
y = .6

[State 3350, ]
type = VelSet
trigger1 = vel x = 0
trigger1 = backedgedist < 25
x = .45

[State 3350, ]
type = changestate
trigger1 = pos y < -65
trigger1 = backedgebodydist <= 25
trigger2 = vel y > 1
value = 3351

[State 3350, ]
type = Playerpush
trigger1 = 1
value = 0

[State 3350, VarSet]
type = VarSet
trigger1 = 1
v = 12
value = 0
ignorehitpause = 0
persistent = 1

[State 3350, ]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 50

;Attack
[StateDef 3351]
type = A
physics = N
moveType = A
anim = 3301
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3351, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3351, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3351, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3351, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3351, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3351, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3351, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3351, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3351, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3351, SuperPause]
type = SuperPause
trigger1 = Time = 2
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3351, VarSet]
type = VarSet
trigger1 = 1
v = 12
value = 0
ignorehitpause = 0
persistent = 1

[State 3351, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3351, ]
type = PosFreeze
triggerall = Stateno = 3351
trigger1 = BackEdgeBodyDist < 2

[State 3351, ]
type = PlayerPush
trigger1 = Stateno = 3351
value = 0

[State 3351, ]
type = VelSet
trigger1 = BackEdgeBodyDist > 1
x = -5

[State 3351, ]
type = PlaySnd
trigger1 = time = 0 && var(41) != 1
value = S3300,0

[State 3351, ]
type = PlaySnd
trigger1 = time = 0 && var(41) != 0
value = S13300,0

[State 3351, Strength]
type = varset
trigger1 = var(42) != 5
var(42) = 5

[State 3351, ]
type = Changestate
triggerall = animtime = 0 && !AILevel
trigger1 = command = "holddown" && command != "holdup" && command != "holdfwd"
value = ifelse(p2bodydist x >= 60,3355,3375)

[State 3351, ]
type = Changestate
triggerall = animtime = 0 && !AILevel
trigger1 = command = "holdup" && command != "holdfwd" && command != "holddown"
value = ifelse(p2bodydist x >= 60,3360,3370)

[State 3351, ]
type = Changestate
triggerall = animtime = 0 && !AILevel
trigger1 = command = "holdfwd" && command != "holdup" && command != "holddown"
value = 3365

[State 3351, ]
type = Changestate
triggerall = animtime = 0
trigger1 = !AILevel && command = "holdfwd" && command != "holdup" && command != "holddown"
trigger2 = p2bodydist y = [-20,20]
trigger3 = enemynear,vel y >= -5 && (p2bodydist y = [-60,60]) && AILevel
trigger4 = p2dist x >= 150 && (p2bodydist y = [-60,60]) && AILevel
value = 3365

[State 3351, ]
type = Changestate
triggerall = animtime = 0
trigger1 = !AILevel && command = "holddown" && command != "holdup" && command != "holdfwd"
trigger2 = p2bodydist y > 20
value = ifelse(p2bodydist x >= 60,3355,3375)

[State 3351, ]
type = Changestate
triggerall = animtime = 0
trigger1 = !AILevel && command = "holdup" && command != "holdfwd" && command != "holddown"
trigger2 = p2bodydist y < -20
value = ifelse(p2bodydist x >= 60,3360,3370)

[State 3351, ]
type = Changestate
trigger1 = animtime = 0
value = 3365

;Prepared
[statedef 3352]
type = A
movetype = A
physics = N
anim = 3302
velset = 0,0
hitcountpersist = 1
ctrl = 0

[State 3352, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3352, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3352, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,0

[State 3352, ]
type = Turn
trigger1 = time = 0

[State 3352, ]
type = PosFreeze
triggerall = Stateno = 3352
trigger1 = BackEdgeBodyDist < 2

[State 3352, ]
type = PlayerPush
trigger1 = Stateno = 3352
value = 0

[State 3302, ]
type = VelSet
trigger1 = BackEdgeBodyDist > 1
x = -5

[State 3352, ]
type = AfterImageTime
trigger1 = stateno = 3352
time = 5

[State 3352, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist x > 20
trigger1 = p2bodydist y > 20
value = 3355
value = ifelse(p2bodydist x <= 80,3355,3375)

[State 3352, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist x > 20
trigger1 = p2bodydist y < -20
value = 3360

[State 3352, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist y = [-20,20]
value = 3365

[State 3352, ]
type = ChangeState
trigger1 = animtime = 0
trigger1 = p2bodydist x <= 20
trigger1 = p2bodydist y < -20
value = 3370

[State 3352, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist x <= 20
trigger1 = p2bodydist y > 20
value = 3375

[State 3352, ]
type = Changestate
trigger1 = p2statetype = L
trigger2 = hitcount = 0
trigger3 = var(12) = 0
value = 3330

;Prepared
[statedef 3353]
type = S
movetype = A
physics = S
anim = 3303
velset = 0,0
hitcountpersist = 1

[State 3353, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3353, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3353, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,0

[State 3353, ]
type = Width
trigger1 = 1
edge = -20,-30
player = -20,-30

[State 3353, ]
type = Turn
trigger1 = p2dist x < 0
persistent = 0

[State 3353, ]
type = AfterImageTime
trigger1 = stateno = 3353
time = 10

[State 3353, ]
type = Changestate
trigger1 = animtime = 0
value = ifelse(p2bodydist x >= 120,3365,ifelse(p2bodydist x >= 20 && p2bodydist y >= -100,3360,3370))

[State 3353, ]
type = Changestate
trigger1 = animtime = 0
trigger1 = p2bodydist y = [-20,20]
value = 3365

[State 3353, ]
type = Changestate
trigger1 = p2statetype = L
trigger2 = hitcount = 0
trigger3 = var(12) = 0
value = 3330

;Prepared
[statedef 3354]
type = A
movetype = A
physics = N
anim = 3304
velset = 0,0
hitcountpersist = 1

[State 3354, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3354, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3354, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,0

[State 3354, ]
type = Width
trigger1 = 1
edge = -20,-30
player = -20,-30

[State 3354, ]
type = Turn
trigger1 = p2dist x < 0
persistent = 0

[State 3354, ]
type = PlayerPush
trigger1 = Stateno = 3354
value = 0

[State 3354, ]
type = AfterImageTime
trigger1 = stateno = 3354
time = 10

[State 3354, ]
type = VelSet
trigger1 = screenpos y >= 50
y = 0

[State 3354, ]
type = VelSet
trigger1 = screenpos y > 50
y = -5

[State 3354, ]
type = Changestate
trigger1 = animtime = 0
value = ifelse(p2bodydist x >= 20 && p2bodydist y <= 100,3355,3375)

[State 3354, ]
type = ChangeState
trigger1 = p2statetype = L
trigger2 = hitcount = 0
trigger3 = var(12) = 0
value = 3330

;Attack
[statedef 3355]
type = A
movetype = A
physics = N
anim = 3305
velset = 17,11
facep2 = 1
hitcountpersist = 1
ctrl = 0

[State 3355, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3355, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3355, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3355, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3355, VelAdd]
type = VelAdd
trigger1 = time = 0
y = (p2dist y/20)-5
x = (p2dist x/30)

[State 3355, VelSet]
type = VelSet
trigger1 = vel y <= 2
y = 2

[State 3355, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = .2

[State 3355, ]
type = ScreenBound
trigger1 = stateno = 3355
value = 1
movecamera = 0,0

[State 3355, ]
type = PlayerPush
trigger1 = stateno = 3355
value = 0

[State 3355, ]
type = AfterImageTime
trigger1 = stateno = 3355
time = 20

[State 3355, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3355, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3355, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3352

[State 3355, ]
type = ChangeState
trigger1 = pos y >= 0
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3353

[State 3355, ]
type = ChangeState
trigger1 = screenpos y >= 225
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3353

[State 3355, ]
type = Null
triggerall = frontedgedist <= 5 || pos y >= 0
trigger1 = prevstateno != 3351
trigger1 = p2statetype = L
value = 3330

;Attack
[statedef 3360]
type = A
movetype = A
physics = N
anim = 3310
velset = 18,-11
hitcountpersist = 1
ctrl = 0

[State 3360, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3360, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3360, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3360, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3360, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = -0.2

[State 3360, ]
type = ScreenBound
trigger1 = stateno = 3360
value = 1
movecamera = 0,0

[State 3360, ]
type = PlayerPush
trigger1 = stateno = 3360
value = 0

[State 3360, ]
type = AfterImageTime
trigger1 = stateno = 3360
time = 20

[State 3360, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3360, ]
type = ChangeState
triggerall = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3360, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3352

[State 3360, ]
type = ChangeState
trigger1 = screenpos y <= 0
;trigger1 = movehit = 1
;rigger2 = hitcount >= 1
value = 3354

[State 3360, ]
type = Null
triggerall = hitcount = 0
trigger1 = movehit = 0
trigger1 = frontedgedist <= 5
trigger2 = p2stateno = 5100
value = 3330

;Attack
[statedef 3365]
type = A
movetype = A
physics = N
anim = 3315
velset = 24,0
hitcountpersist = 1
ctrl = 0

[State 3365, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3365, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3365, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3365, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3365, VelAdd]
type = Null
trigger1 = time = 0
y = -1*(p2dist y/20)

[State 3365, VelSet]
type = VelSet
trigger1 = time = 0
y = ifelse(p2dist y > -10,3,ifelse(p2dist y <= -20,-3,0))
persistent = 0

[State 3365, ]
type = VelAdd
trigger1 = time >= 0
x = .2

[State 3365, ]
type = ScreenBound
trigger1 = stateno = 3365
value = 1
movecamera = 0,0

[State 3365, ]
type = PlayerPush
trigger1 = stateno = 3365
value = 0

[State 3365, ]
type = AfterImageTime
trigger1 = stateno = 3365
time = 20

[State 3365, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3365, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3365, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3352

[State 3365, ]
type = ChangeState
trigger1 = pos y >= 0
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3353

[State 3365, ]
type = ChangeState
trigger1 = screenpos y >= 225
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3353

[State 3365, ]
type = Null
triggerall = hitcount = 0
trigger1 = movehit = 0
trigger1 = frontedgedist <= 5
trigger2 = p2stateno = 5100
value = 3330

;Attack
[statedef 3370]
type = A
movetype = A
physics = N
anim = 3320
velset = 11,-17
hitcountpersist = 1
ctrl = 0

[State 3370, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3370, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3370, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3370, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3370, ]
type = VelSet
trigger1 = time = 0
trigger1 = p2bodydist x <= 0 && p2bodydist y <= -100
x = 0

[State 3370, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = -0.2

[State 3370, ]
type = ScreenBound
trigger1 = stateno = 3370
value = 1
movecamera = 0,0

[State 3370, ]
type = PlayerPush
trigger1 = stateno = 3370
value = 0

[State 3370, ]
type = AfterImageTime
trigger1 = stateno = 3370
time = 20

[State 3370, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3370, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3370, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3352

[State 3370, ]
type = ChangeState
trigger1 = screenpos y <= 50
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3354

[State 3370, ]
type = Null
triggerall = hitcount = 0
trigger1 = movehit = 0
trigger1 = frontedgedist <= 5
trigger2 = p2stateno = 5100
trigger3 = screenpos y <= 50 && movehit = 0 && hitcount = 0
value = 3330

;Attack
[statedef 3375]
type = A
movetype = A
physics = N
anim = 3325
velset = 11,17
hitcountpersist = 1
ctrl = 0

[State 3375, VarAdd]
type = VarAdd
trigger1 = movehit
v = 12
value = 1
ignorehitpause = 1
persistent = 0

[State 3375, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA,NA,NP,NP,NT,ST
time = 2
ignorehitpause = 1
persistent = 1

[State 3375, HitBy]
type = HitBy
trigger1 = time >= 0
value = SCA,SA,HA,HP,HT
time = 2
ignorehitpause = 1
persistent = 1

[State 3375, VelAdd]
type = VelAdd
trigger1 = p2dist x >= 10
x = 2
persistent = 0

[State 3375, ]
type = VarSet
trigger1 = movehit =1
trigger1 = Win
v =  1
value = 1

[State 3375, ]
type = VelSet
trigger1 = time = 0
trigger1 = p2bodydist x <= 0 && p2bodydist y >= 100
x = 0

[State 3375, ]
type = VelAdd
trigger1 = time >= 5
x = .2
y = .2

[State 3375, ]
type = ScreenBound
trigger1 = stateno = 3375
value = 1
movecamera = 0,0

[State 3375, ]
type = PlayerPush
trigger1 = stateno = 3375
value = 0

[State 3375, ]
type = AfterImageTime
trigger1 = stateno = 3375
time = 20

[State 3375, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = movehit = 0
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 5+((hitcount>=4)*20),5+((hitcount>=4)*20)
guard.pausetime = 5,5
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0-((hitcount>=4)*10),-10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3340

[State 3375, ]
type = ChangeState
trigger1 = movehit = 1
trigger1 = hitcount = 5
trigger2 = moveguarded = 1
trigger3 = var(12) >= 5
value = 3330

[State 3375, ]
type = ChangeState
trigger1 = frontedgedist <= 5
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3352

[State 3375, ]
type = ChangeState
trigger1 = pos y >= 0
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3353

[State 3375, ]
type = ChangeState
trigger1 = screenpos y >= 225
;trigger1 = movehit = 1
;trigger2 = hitcount >= 1
value = 3353

[State 3375, ]
type = Null
trigger1 = prevstateno != 3351
trigger1 = p2statetype = L
value = 3330

;========================<MAXIMUM WEB BALL>=============================
[StateDef 3400]
type = S
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-10 * const(size.xScale)), ceil(-50 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, Width]
type = Width
trigger1 =animelemtime(5)>=0&&animelemtime(18)<0
player = 20,0
edge = 90,0

[State 3400, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(41) != 1
value = 181,0
volumescale = 255
channel = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(41) != 0
value = 13400,0
volumescale = 255
channel = 0

[State 3400, FX]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000, 1

[State 3400,Super]
type = Helper
trigger1 = AnimElem = 7
helpertype = normal
stateno = 3405
id = 3405
name = "Maximum Web Ball Projectile"
pos = floor(45*const(size.xscale)),floor(-7*const(size.yscale)-45)
postype = P1
size.xscale= 0.75 * const(size.xscale)
size.yscale= 0.75* const(size.yscale)
ignorehitpause = 1
keyctrl = 0
ownpal = 1

[State 3400, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAX MAXIMUM WEB BALL>=============================
[StateDef 3450]
type = S
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3450, Super Pause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-10 * const(size.xScale)), ceil(-50 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3450, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3450, Width]
type = Width
trigger1 =animelemtime(5)>=0&&animelemtime(18)<0
player = 20,0
edge = 90,0

[State 3450, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(41) != 1
value = 181,0
volumescale = 255
channel = 0

[State 3450, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(41) != 0
value = 13400,0
volumescale = 255
channel = 0

[State 3450, FX]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000, 1

[State 3450,Super]
type = Helper
trigger1 = AnimElem = 7
helpertype = normal
stateno = 3455
id = 3405
name = "Maximum Web Ball Projectile"
pos = floor(45*const(size.xscale)),floor(-7*const(size.yscale)-45)
postype = P1
size.xscale= 0.75 * const(size.xscale)
size.yscale= 0.75* const(size.yscale)
ignorehitpause = 1
keyctrl = 0
ownpal = 1

[State 3450, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAXIMUM ASSAULT>=============================
[StateDef 3500]
type = S
physics = N
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(1) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(2 * const(size.xScale)), ceil(-76 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, velset]
type = velset
trigger1 = Animelem = 3
x = 20

[State 3500, VelSet]
type = VelSet
trigger1 = Animelem = 5
x = 5

[State 3500, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 0

[State 3500, Dust Helper]
type = Helper
trigger1 = Animelem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3500, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3500, Width]
type = Width
trigger1 = 1
value = 20,0

[State 3500, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 13500, 0
volumescale = 255
channel = 0

[State 3500, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 13500, 1
volumescale = 255

[State 3500,1]
type = PlaySnd
trigger1 = Animelem = 4
value = s10004,2
volumescale = 255
channel = 0

[State 3500,1]
type = PlaySnd
trigger1 = Animelem = 4
value = s1,2

[State 3500,1]
type = PlaySnd
trigger1 = Animelem = 3
value = s1,5

[State 3500, HitDef]
type = HitDef
attr = S, HA
trigger1 = AnimElem = 4
animtype = Hard
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getpower = 0,0
givepower = 36, 36
priority=4, hit
guardflag = MA
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = high
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0
guard.velocity = -5
air.velocity = 0,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time = 10
envshake.ampl = 5
kill = 0

[State 3500, Throw]
type = TargetState
trigger1 = time > 1 && movehit && numtarget
value = 3906
ignorehitpause = 1
persistent = 0

[State 3500, 5]
type = ChangeState
trigger1 = MoveHit = 1
value = 3501
ctrl = 0

[State 3500, 6]
type = ChangeState
trigger1 = MoveGuarded = 1
value = 1305
ctrl = 0

[State 3500, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 1305
ctrl = 1

;Connect
[Statedef 3501]
type = S
movetype = A
physics = N
anim = 3501
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2

[State 3501,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 3501,1]
type = TargetBind
trigger1 = !time
pos = 60,0
time = 5

[State 3501, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 3501, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 10004, 2
volumescale = 255

[State 3501, Helper]
type = Helper
trigger1 = AnimElem = 3
stateno = 7430
ownpal = 1
supermovetime = 20
size.xscale= .25 * const(size.xscale)
size.yscale= .25 * const(size.yscale)

[State 3501, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3501, Helper]
type = Helper
trigger1 = movehit = 1
stateno = 7431
ownpal = 1
pos = 60,0
supermovetime = 20
size.xscale= .25 * const(size.xscale)
size.yscale= .25 * const(size.yscale)

[State 3501, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, HA
animtype = Heavy
air.animtype = Up
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
priority = 7, Hit
hitflag = MAF
guardflag = M
pausetime = 0,13
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
ground.type = Low
ground.slidetime = 33
ground.hittime = 33
guard.ctrltime = 20
ground.velocity = 0,-9.5
guard.velocity = -8
air.velocity = 0,-9.5
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = .00000001
air.cornerpush.veloff = 0
envshake.time = 12
envshake.ampl = 5
fall = 1
fall.recover = 0
air.fall = 1
yaccel = .5
persistent = 0
getpower = 0,0
givepower = 35, 35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
forcestand = 1
kill = 0
p2facing = 1
snap = 50,0
envshake.time = 10
envshake.ampl = 5

[State 3501, Throw]
type = TargetState
trigger1 = time > 1  && numtarget
value = 3820
ignorehitpause = 0
persistent = 0

[State 3501, 4]
type = ChangeState
trigger1 = AnimElemTime(8) = 8
trigger1 = numtarget
value = 3502

[State 3501, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Attack
[Statedef 3502]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 3502

[State 3502, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41, 0

[State 3502, StateType]
type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
physics = N

[State 3502, Velocity]
type = VelSet
trigger1 = AnimElem = 2
y = -12

[State 3502, Velocity]
type = VelSet
trigger1 = AnimElem = 4
y = 0

[State 3502, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 0
trigger1 = AnimElemTime(4) < 0
y = .49

[State 3502, Gravity]
type = Veladd
trigger1 = AnimElemTime(12) > 0
y = .66

[State 3502, Dust]
type = helper
trigger1 = AnimElem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1
pauseMoveTime = 999
superMoveTime = 999

[State 3502, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3502, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 5
channel = 1

[State 3502, Flipping]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 13
trigger3 = AnimElem = 17
value = 1,5

[State 3502, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 10004, 4
volumescale = 255

[State 3502, 1]
type = Hitdef
trigger1 = AnimElem = 4
attr = A, HA
hitflag = MAF
guardflag = HA
animtype = Heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
pausetime = 0,13
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -40
ground.type = High
ground.slidetime = 33
ground.hittime = 33
air.hittime = 33
guard.ctrltime = 20
ground.velocity = 0,10
guard.velocity = -8
air.velocity = 0,10
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = .00000001
air.cornerpush.veloff = 0
envshake.time = 12
envshake.ampl = 5
getpower = 0,0
givepower = 35, 35
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
palfx.time = 12*((var(0)&2**12)/2**12)
palfx.add = 255,255,255
palfx.mul = 128,128,128
yaccel = .5
kill = 0

[State 3502, HitPause]
type = PosFreeze
trigger1 = time = 0
ignorehitpause = 1

[State 3502, Throw]
type = TargetState
trigger1 = time > 1 && numtarget
value = 3820
ignorehitpause = 0
persistent = 0

[State 3502, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(12) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3503

;Attack
[Statedef 3503]
type = S
movetype = A
physics = S
juggle = 0
ctrl = 0
anim = 3503
velset = 0,0

[State 3503, Voice]
type = PlaySnd
trigger1 =!time
value = 10004, 3
volumescale = 255

[State 3503, Spark]
type = Explod
trigger1 = Time = 0
Anim = 7500
ID = 7999
pos = 55, 0
postype = p1
ownpal = 1
bindtime = 1
scale = .3,.4
sprpriority = 3
pauseMoveTime = 999
superMoveTime = 999

[State 3503, Spark]
type = Explod
trigger1 = Time = 0
Anim = 7501
ID = 7999
pos = 55, 0
postype = p1
ownpal = 1
bindtime = 1
scale = .3,.4
sprpriority = 3
pauseMoveTime = 999
superMoveTime = 999

[State 3503, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3503, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 2

[State 3403, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 3

[State 3503, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
ampl = 5

[State 3503, Dust Helper]
type = Helper
trigger1 = Animelem = 1
trigger2 = Animelem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3503, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3503, HitDef]
type = HitDef
trigger1 = time = 0
attr = S, HA
animtype = Heavy
air.animtype = Back
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
priority = 7, Hit
hitflag = MAFD
guardflag = HA
pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -5
ground.type = Low
ground.slidetime = 17
ground.hittime  = 17
guard.ctrltime = 17
ground.velocity = -5.5,-6.5
guard.velocity = -8
air.velocity = -5.5,-6.5
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = .00000001
air.cornerpush.veloff = 0
envshake.time = 12
envshake.ampl = 3
fall = 1
fall.recover = 0
air.fall = 1
yaccel = .5
persistent = 0
getpower = 0,0
givepower = 35, 35
givepower = 35, 35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
forcestand = 1
p2stateno = 3880
fall.envshake.time = 15
fall.envshake.ampl = 5

[State 3503, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAX MAXIMUM ASSAULT>=============================
[StateDef 3550]
type = S
physics = N
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(1) < 0
time = 1
value = SCA

[State 3550, Super Pause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(2 * const(size.xScale)), ceil(-76 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3550, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3550, velset]
type = velset
trigger1 = Animelem = 3
x = 30

[State 3550, VelSet]
type = VelSet
trigger1 = Animelem = 5
x = 5

[State 3550, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 0

[State 3550, Dust Helper]
type = Helper
trigger1 = Animelem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3550, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3550, Width]
type = Width
trigger1 = 1
value = 20,0

[State 3550, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 13500, 0
volumescale = 255
channel = 0

[State 3550, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 13500, 1
volumescale = 255

[State 3550,1]
type = PlaySnd
trigger1 = Animelem = 4
value = s10004,2
volumescale = 255
channel = 0

[State 3550,1]
type = PlaySnd
trigger1 = Animelem = 4
value = s1,2

[State 3550,1]
type = PlaySnd
trigger1 = Animelem = 3
value = s1,5

[State 3450, HitDef]
type = HitDef
attr = S, HA
trigger1 = AnimElem = 4
animtype = Hard
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getpower = 0,0
givepower = 36, 36
priority = 4, hit
guardflag = MA
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = high
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0
guard.velocity = -5
air.velocity = 0,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time = 10
envshake.ampl = 5
kill = 0

[State 3550, Throw]
type = TargetState
trigger1 = time > 1 && movehit && numtarget
value = 3906
ignorehitpause = 1
persistent = 0

[State 3550, 5]
type = ChangeState
trigger1 = MoveHit = 1
value = 3551
ctrl = 0

[State 3500, 6]
type = ChangeState
trigger1 = MoveGuarded = 1
value = 1305
ctrl = 0

[State 3500, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 1305
ctrl = 1

;Conect
[Statedef 3551]
type = S
movetype = A
physics = N
anim = 3501
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2

[State 3551,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 3551,1]
type = TargetBind
trigger1 = !time
pos = 60,0
time = 5

[State 3551, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 3551, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 10004, 2
volumescale = 255

[State 3551, Helper]
type = Helper
trigger1 = AnimElem = 3
stateno = 7430
ownpal = 1
supermovetime = 20
size.xscale= .25 * const(size.xscale)
size.yscale= .25 * const(size.yscale)

[State 3551, Helper]
type = Helper
trigger1 = movehit = 1
stateno = 7431
ownpal = 1
pos = 60,0
supermovetime = 20
size.xscale= .25 * const(size.xscale)
size.yscale= .25 * const(size.yscale)

[State 3551, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3451, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, HA
animtype = Heavy
air.animtype = Up
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
priority = 7, Hit
hitflag = MAF
guardflag = M
pausetime = 0,13
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
ground.type = Low
ground.slidetime = 33
ground.hittime = 33
guard.ctrltime = 20
ground.velocity = 0,-9.5
guard.velocity = -8
air.velocity = 0,-9.5
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = .00000001
air.cornerpush.veloff = 0
envshake.time = 12
envshake.ampl = 5
fall = 1
fall.recover = 0
air.fall = 1
yaccel = .5
persistent = 0
getpower = 0,0
givepower = 35, 35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
forcestand = 1
kill = 0
p2facing = 1
snap = 50,0
envshake.time = 10
envshake.ampl = 5

[State 3551, Throw]
type = TargetState
trigger1 = time > 1  && numtarget
value = 3820
ignorehitpause = 0
persistent = 0

[State 3551, 4]
type = ChangeState
trigger1 = AnimElemTime(8) = 8
trigger1 = numtarget
value = 3552

[State 3551, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Attack
[Statedef 3552]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 3502

[State 3552, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41, 0

[State 3552, StateType]
type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
physics = N

[State 3552, Velocity]
type = VelSet
trigger1 = AnimElem = 2
y = -12

[State 3552, Velocity]
type = VelSet
trigger1 = AnimElem = 4
y = 0

[State 3552, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 0
trigger1 = AnimElemTime(4) < 0
y = .49

[State 3552, Gravity]
type = Veladd
trigger1 = AnimElemTime(12) > 0
y = .66

[State 3552, Dust]
type = helper
trigger1 = AnimElem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1
pauseMoveTime = 999
superMoveTime = 999

[State 3552, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3552, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 5
channel = 1

[State 3552, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 10004, 4
volumescale = 255

[State 3552, Flipping]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 13
trigger3 = AnimElem = 17
value = 1,5

[State 3452, 1]
type = Hitdef
trigger1 = AnimElem = 4
attr = A, HA
hitflag = MAF
guardflag = HA
animtype = Heavy
air.animtype = back
fall.animtype = back
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
pausetime = 0,13
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -40
ground.type = High
ground.slidetime = 33
ground.hittime = 33
air.hittime = 33
guard.ctrltime = 20
ground.velocity = 0,10
guard.velocity = -8
air.velocity = 0,10
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = .00000001
air.cornerpush.veloff = 0
envshake.time = 12
envshake.ampl = 5
getpower = 0,0
givepower = 35, 35
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
palfx.time = 12*((var(0)&2**12)/2**12)
palfx.add = 255,255,255
palfx.mul = 128,128,128
yaccel = .5
kill = 0

[State 3552, HitPause]
type = PosFreeze
trigger1 = time = 0
ignorehitpause = 1

[State 3552, Throw]
type = TargetState
trigger1 = time > 1 && numtarget
value = 3820
ignorehitpause = 0
persistent = 0

[State 3552, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(12) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3553

;Attack
[Statedef 3553]
type = S
movetype = A
physics = S
juggle = 0
ctrl = 0
anim = 3503
velset = 0,0

[State 3553, Varset]
type = Varset
trigger1 =!time
var(2) = 0

[State 3553, Varadd]
type = Varadd
trigger1 = movecontact
var(2) = 1

[State 3553, Voice]
type = PlaySnd
trigger1 =!time
value = 10004, 3
volumescale = 255

[State 3553, Spark]
type = Explod
trigger1 = Animelem = 1
Anim = 7502
ID = 7999
pos = 55, 0
postype = p1
ownpal = 1
bindtime = 1
scale = .3,.4
sprpriority = 3
ignorehitpause = 1
pauseMoveTime = 999
superMoveTime = 999

[State 3553, Spark]
type = Explod
trigger1 = Animelem = 1
Anim = 7501
ID = 7999
pos = 55, 0
postype = p1
ownpal = 1
bindtime = 1
scale = .3,.4
sprpriority = 3
ignorehitpause = 1
pauseMoveTime = 999
superMoveTime = 999

[State 3553, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3553, RemoveExplod]
type = RemoveExplod
trigger1 = Animelem = 6
id = 7999
ignorehitpause = 1

[State 3553, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3553, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 2

[State 3453, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 3

[State 3553, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
ampl = 5

[State 3553, Dust Helper]
type = Helper
trigger1 = Animelem = 1
trigger2 = Animelem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3453, HitDef]
type = HitDef
trigger1 = var(2)<=6
attr = S, HA
animtype = Heavy
air.animtype = Back
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 7
priority = 7, Hit
hitflag = MAFD
guardflag = HA
pausetime = 4*(var(2)<6),4
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := 0
ground.type = Low
ground.slidetime = 30
ground.hittime  = 30
guard.ctrltime = 30
ground.velocity = ifelse(var(2)<6, 0, -5.5),ifelse(var(2)<6, -6.5, -6.5)
guard.velocity = -8
air.velocity = ifelse(var(2)<6, 0, -5.5),ifelse(var(2)<6, 0, -6.5)
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = .00000001
air.cornerpush.veloff = 0
envshake.time = 12
envshake.ampl = 4
fall = (var(2)>=6)
fall.recover = 0
air.fall = 1
yaccel = .5
getpower = 0,0
givepower = 35, 35
givepower = 35, 35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
forcestand = 1
p2stateno = 3880
fall.envshake.time = 15
fall.envshake.ampl = 5

[State 3553, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<SPIDER MEN>=============================
[StateDef 3600]
type = S
physics = N
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
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
trigger1 = 1
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
trigger1 = animelem = 1
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(2 * const(size.xScale)), ceil(-76 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3600, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3600,PlaySnd]
type = PlaySnd
trigger1 = time=0
value = 13600, 0
channel = 7

[State 3600, velset]
type = velset
trigger1 = Animelem = 3
x = 20

[State 3600, VelSet]
type = VelSet
trigger1 = Animelem = 5
x = 5

[State 3600, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 0

[State 3600,00]
type = BGPalfx
trigger1 = 1
mul = 0, 0, 0
time = 80
ignorehitpause = 1

[State 3600,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 3600, Dust Helper]
type = Helper
trigger1 = Animelem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3600, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3600, Width]
type = Width
trigger1 = 1
value = 20,0

[State 3600, HitDef]
type = HitDef
attr = S, HA
trigger1 = AnimElem = 4
damage = 10, 5
getpower = 0,0
ground.type = Low
air.type = Low
givepower = 36, 36
priority = 4, hit
guardflag = MA
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -70
ground.type = high
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0
guard.velocity = -5
air.velocity = 0,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time = 10
envshake.ampl = 5
kill = 0
p2stateno = 5300

[State 3600, Throw]
type = TargetState
trigger1 = time > 1 && movehit && numtarget
value = 3605
ignorehitpause = 1
persistent = 0

[State 3600, 5]
type = ChangeState
trigger1 = MoveHit = 1
value = 3601
ctrl = 0

[State 3400, 6]
type = ChangeState
trigger1 = MoveGuarded = 1
value = 1305
ctrl = 0

[State 3400, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 1305
ctrl = 1

;Conect
[Statedef 3601]
type = S
movetype = A
physics = N
anim = 3601
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 1

[State 3601,00]
type = BGPalfx
trigger1 = 1
mul = 0, 0, 0
time = 80
ignorehitpause = 1

[State 3601, PosSet]
type = PosSet
trigger1 = 1
x = 0

[State 3601, ]
type = TargetBind
trigger1 = animelem = 1
time = 10
pos = floor(65*const(size.xscale)),0

[State 3601, 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 10190, 0
volumescale = 255
channel = 0

[State 3601, Helper]
type = Helper
trigger1 = animelem = 1
stateno = 6050
pos = 85,-168
ownpal = 1
postype = p1
facing = -1

[State 3601, Helper]
type = Helper
trigger1 = animelem = 1
stateno = 6053
pos = -150,-168
ownpal = 1
postype = p1

[State 3601, Helper]
type = Helper
trigger1 = animelem = 1
stateno = 6056
pos = -80,-168
postype = p1
ownpal = 1

[State 3601, c4]
type = ChangeState
trigger1 = !animtime
value = 3602
ctrl = 0

;Attack
[Statedef 3602]
type = S
physics = S
movetype = A
anim = 3602
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = 0

[State 3602, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 200

[State 3602,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 3602, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 3602,1]
type = TargetBind
trigger1 = !time
pos = 50,0
time = 1

[State 3602, Voice 1-3]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 19 || AnimElem = 43
value = 10004, 0
volumescale = 255
channel = 0

[State 3602, Voice 1-3]
type = PlaySnd
trigger1 =  AnimElem = 8 || AnimElem = 14 || AnimElem = 32 || AnimElem = 39|| AnimElem = 77|| AnimElem = 71
value = 10004, 0
volumescale = 255
channel = 0

[State 3602, Voice 1-3]
type = PlaySnd
trigger1 = AnimElem = 25 || AnimElem = 33 || AnimElem = 49 || AnimElem = 55 || AnimElem = 63 || AnimElem = 85
value = 10004, 0
volumescale = 255
channel = 0

[State 3602, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 19 || AnimElem = 39|| AnimElem = 43
value = 10004, 0
channel = 1

[State 3602, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 32 || AnimElem = 49 || AnimElem = 55 || AnimElem = 63 || AnimElem = 71 || AnimElem = 77|| AnimElem = 85
value = 10004, 0
channel = 1

[State 3602, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3602, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 8
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Med
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 40 + 2 * var(9)
ground.slidetime = 40 + 2 * var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -85
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 14
trigger2 = animelem = 32
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 40 + 3*var(9)
ground.slidetime = 40 + 3*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 19
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 26
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 39
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 3*var(9)
ground.slidetime = 40 + 3*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 43
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 3*var(9)
ground.slidetime = 40 + 3*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 49
trigger2 = animelem = 55
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = medium
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 53
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = heavy
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -90
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 63
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = heavy
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -82
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 67
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Med
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 40 + 2 * var(9)
ground.slidetime = 40 + 2 * var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -88
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 72
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 78
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 4,4
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 50 + 3*var(9)
ground.slidetime = 50 + 3*var(9)
guard.hittime = 50
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 84
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 3602, Hit]
type = hitdef
trigger1 = animelem = 93
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, -12
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = 0, -12
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
fall.recover = 0
fall.recovertime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0
p2stateno = 3603

[State 3602, c4]
type = ChangeState
trigger1 = !animtime
value = 3604
ctrl = 0

;Attack
[Statedef 3603]
type = A
movetype = H
ctrl = 0
velset = 0,-5

[State 3603, a3]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3603, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 3662
ignorehitpause =1
;persistent =

[State 3603, VelAdd]
type = VelAdd
trigger1 =time>=25
x = 0
y = .1

[State 3603]
type = selfstate
trigger1 = time >= 250
trigger2 = Vel Y > -5
trigger2 = Pos Y >= -5
value = 5050

;Attack
[Statedef 3604]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3607
sprpriority = 5
facep2 = 1

[State 3604,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 80
name = "helper1"
id = 6002
pos = 0,0
postype = p1
stateno = 6002
helpertype = normal
ownpal = 1
keyctrl = 1

[State 3604]
type = Helper
trigger1 = AnimElem = 24
stateno = 6183

[State 3604, 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 2, 7
volumescale = 255

[State 3604, 2]
type = PlaySnd
trigger1 = AnimElem = 35
value = 13600, 1
volumescale = 255

[State 3604, 2]
type = PlaySnd
trigger1 = time= 230
value = 13600, 2
volumescale = 255

[State 3604, 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 11000, 0
volumescale = 255

[State 3604, 2]
type = PlaySnd
trigger1 = AnimElem = 18
value = 1, 0
volumescale = 255

[State 3604]
type = Helper
trigger1 = AnimElem = 7
stateno = 3615
id = 3615
ownpal = 1
pos = 15,-100

[State 3604]
type = VarAdd
;trigger1 = !MoveContact
trigger1 = AnimElem = 12, >= 0
var(9) = 1
ignorehitpause = 1
persistent = 0

[State 3604]
type = Velset
trigger1 = AnimElem = 15
x = -15

[State 3604]
type = Velset
trigger1 = AnimElem = 20
x = 0

[State 3604]
type = Velset
trigger1 = AnimElem = 28
x = 8

[State 3604]
type = Velset
trigger1 = AnimElem = 30
x = 0

[State 3604]
type = null;VelAdd
trigger1 = StateType = A
trigger1 = Time > 20
y = 0.1

[State 3604]
type = null;VelSet
trigger1 = StateType = A
trigger1 = Pos Y > -20
y = 0

[State 3604]
type = ChangeState
trigger1 = AnimTime = 0; && StateType != A
value = 0
ctrl = 1

[State 3604]
type = null;ChangeState
trigger1 = AnimTime = 0 && StateType = A
value = 1320
ctrl = 0

;Player 2
[Statedef 3605]
type = S
movetype = H
physics = N
velset = 0,0

[State 3605, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 3605, 0]
type = HitFallSet
trigger1 = time = 0
value = 0

[State 3605, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
value = 5300

[State 3605, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 3605, 6]
type = ChangeState
trigger1 = HitShakeOver
value = 3606 ;HITG_SLIDE

;HITG_SLIDE_High
[Statedef 3606]
type = S
movetype = H
physics = S

[State 3606, 1]
type = HitVelSet
trigger1 = Time = 0
x = 0

[State 3606, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5300

[State 3606, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 3606, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 3606, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3606, Anim]
type = ChangeAnim
trigger1 = !Time
value = 5300

;Attack
[Statedef 3615]
type = U
movetype = A
physics = N
;anim = 1005
ctrl = 0
sprpriority = 2
velset = 0,0
;hitcountpersist = 1

[State 3615]
type = ChangeAnim
trigger1 = Time = 0 && Anim != 3607
value = 1115

[State 3615]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3615]
type = HitBy
trigger1 = 1
value = SCA,AP

[State 3615]
type = HitOverride
trigger1 = 1
stateno = 1006
attr = SCA,AA,AP,AT
slot = 0
time = -1

[State 3615]
type = VarSet
trigger1 = Time = 0 && Parent,stateno = 3604
var(1) = 300

[State 3615]
type = VelSet
trigger1 = Time = 0
x = 0
y = -10

[State 3615]
type = HitDef
attr = S, HP
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = 10,5
animtype = Light
priority  = 5, Hit
guardflag = MA
pausetime = 0,7
sparkxy = -10,-10
hitsound   = S1450,2
guardsound = S4,0
sparkno = -1
guard.sparkno = -1
ground.type = High
ground.slidetime = 10
ground.hittime  = 25
ground.velocity = 0
air.velocity = 0
guard.velocity = -7
airguard.velocity = -7
;fall.xvelocity = -3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
fall = 1
air.fall = 0
fall.recover = 0
;fall.animtype = Up
;p2stateno = 9020
getpower = 0,0
;palfx.time = 1
;palfx.add = 256,256,256
sprpriority = 2
p1stateno = 3616
p2stateno = 3617
id = 21450

[State 3615, HitSpark]
type = Helper
trigger1 = movecontact=1 && numtarget
trigger1 = (enemynear, movetype=H) && !(target, time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = ceil(p2dist x-70),-50
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 3615]
type = null;ChangeState
trigger1 = var(0) < 1 || hitcount > 2
trigger2 = Time > 50
value = 1006
ignorehitpause  = 1

[State 3615]
type = ChangeState;DestroySelf
trigger1 = MoveGuarded
ignorehitpause = 1
value = 1006

[State 3615]
type = ChangeState;DestroySelf
trigger1 = MoveReversed
ignorehitpause = 1
value = 1006

[State 3615]
type = DestroySelf
trigger1 = FrontEdgeDist < -100
trigger2 = Time > 240

;Attack
[Statedef 3616]
type = S
movetype = A
physics = S
anim = 1116
;poweradd = 60
juggle  = 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 3616]
type = PosSet
trigger1 = Time = 0
y = enemynear,pos y
x = enemynear,pos x

[State 3616]
type = null;Explod
trigger1 = Time = 0
anim = 7515
ontop = 1
ownpal = 1
pos = 77,-62

[State 3616]
type = null;PlayerPush
trigger1 = 1
value = 0

[State 3616]
type = null;NotHitBy
trigger1 = 1
value = SCA

[State 3616]
type = null;ScreenBound
trigger1 = 1
value = 0
movecamera = 1,1

[State 3616]
type = null;AngleDraw
trigger1 = 1
value = 0

[State 3616]
type = TargetBind
trigger1 = 1
pos = 0,0

[State 3616]
type = VelAdd
trigger1 = Pos Y < 0
y = 0.4

[State 3616]
type = PosSet
trigger1 = Pos Y >= 0 && Vel Y > 0
y = 0

[State 3616]
type = VelSet
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
y = 0

[State 3616]
type = TargetState
trigger1 = Time >= var(1)
value = 10001

[State 3616]
type = ChangeState
trigger1 = Time >= var(1)
value = 1008
ctrl = 0

[State 3616, 2]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2, 7
volumescale = 255

[State 3616]
type = ChangeState
trigger1 = !NumTarget(21450)
value = 1008
ctrl = 1

;Attack
[Statedef 3617]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 3617]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 3617]
type = null;SprPriority
trigger1 = AnimElem = 2
value = -1

[State 3617]
type = ChangeAnim2
trigger1 = Time = 0
value = 5003

[State 3617]
type = AssertSpecial
trigger1 = Time > 4
flag = invisible

[State 3617]
type = null;Turn
trigger1 = facing = enemynear,facing

[State 3617]
type = null;PalFx
trigger1 = AnimElemNo(0) = [4,7]
color = 0
time = 15
add = 64,-128,64

[State 3617]
type = null;SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 3617]
type = DestroySelf
trigger1 = ishelper

;Spiderman
[Statedef 6050]
type = A
physics = N
ctrl = 0
velset = 0,3
anim = 3604
sprpriority = 4

[State 6050, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 10185, 1

[State 6050, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(34) > 0
value = 6051

;Spiderman
[Statedef 6051]
type = S
movetype = I
physics = S
ctrl = 0
anim = 3605
sprpriority = 2
velset = 0,0

[State 6051, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 40,0

[State 6051, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 6051, c4]
type = ChangeState
trigger1 = !animtime
value = 6052
ctrl = 0

;Spiderman
[Statedef 6052]
type = S
physics = S
movetype = A
anim = 3606
ctrl = 0
velset = 0,0
sprpriority = 20
poweradd = 0

[State 6052, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 250

[State 6052, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 6052]
type = Velset
trigger1 = AnimElem = 110
x = 20

[State 6052,1]
type = TargetBind
trigger1 = !time
pos = 50,0
time = 1

[State 6052, Voice 1-3]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 19 || AnimElem = 43
value = 4, 0
volumescale = 255
channel = 0

[State 6052, Voice 1-3]
type = PlaySnd
trigger1 =  AnimElem = 8 || AnimElem = 14 || AnimElem = 32 || AnimElem = 39|| AnimElem = 77|| AnimElem = 71
value = 4, 0
volumescale = 255
channel = 0

[State 6052, Voice 1-3]
type = PlaySnd
trigger1 = AnimElem = 25 || AnimElem = 33 || AnimElem = 49 || AnimElem = 55 || AnimElem = 63 || AnimElem = 85
value = 4, 0
volumescale = 255
channel = 0

[State 6052, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 19 || AnimElem = 39|| AnimElem = 43
value = 4, 0
channel = 1

[State 6052, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 32 || AnimElem = 49 || AnimElem = 55 || AnimElem = 63 || AnimElem = 71 || AnimElem = 77|| AnimElem = 85
value = 4, 0
channel = 1

[State 6052, 2]
type = PlaySnd
trigger1 = AnimElem = 110
value = 1, 2
volumescale = 255

[State 6052, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 6052, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2,2
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 6
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Med
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 40 + 2 * var(9)
ground.slidetime = 40 + 2 * var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -85
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 6
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 12
trigger2 = animelem = 19
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 40 + 3*var(9)
ground.slidetime = 40 + 3*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=92), var(36):=-78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 12
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 19
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 25
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=60), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 25
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 30
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=88), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 30
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 36
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 3*var(9)
ground.slidetime = 40 + 3*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkXY=-10 + 0 * (var(35) := 85), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 36
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 42
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 3*var(9)
ground.slidetime = 40 + 3*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkXY=-10 + 0 * (var(35) := 90), var(36) := -50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 42
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 49
trigger2 = animelem = 53
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = medium
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkXY=-10 + 0 * (var(35) := 80), var(36) := -60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 49
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 53
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 56
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = heavy
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=75), var(36):=-90
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 56
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 59
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = heavy
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=80), var(36):=-82
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 59
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 64
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Med
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 40 + 2 * var(9)
ground.slidetime = 40 + 2 * var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -88
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 64
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 67
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=110), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 67
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 74
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 50 + 3*var(9)
ground.slidetime = 50 + 3*var(9)
guard.hittime = 50
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 2
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=30), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 74
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 78
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=110), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 78
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 82
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=110), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 82
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, Hit]
type = hitdef
trigger1 = animelem = 87
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,5
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = low
air.type = Low
ground.hittime = 40 + 2*var(9)
ground.slidetime = 40 + 2*var(9)
guard.hittime = 40
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2, 5
guardsound = S3,0
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=110), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6052, HitSpark]
type = Helper
trigger1 = animelem = 87
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(45*const(size.xscale)),ceil(-40*const(size.yscale))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6052, p2state]
type = targetstate
trigger1 = movehit && numtarget(3600)
trigger1 = target(3600),Movetype=H
ID = 3500
value = 4040
ignorehitpause = 1

[State 6052, c4]
type = ChangeState
trigger1 = !animtime
value = 6065
ctrl = 0

;Spiderman
[Statedef 6053]
type = A
physics = N
ctrl = 0
velset = 0,3
anim = 3610
sprpriority = 4

[State 6053, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 13600, 3

[State 6053, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(30) > 0
value = 6054

;Spiderman
[Statedef 6054]
type = S
movetype = I
physics = S
ctrl = 0
anim = 3611
sprpriority = 2
velset = 0,0

[State 6054, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 40,0

[State 6054, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 6054, c4]
type = ChangeState
trigger1 = !animtime
value = 6055
ctrl = 0

;Spiderman
[Statedef 6055]
type = S
movetype = A
physics = N
ctrl = 0
anim = 3612
sprpriority = 2
ctrl = 0
velset = 0,0

[State 6055, Varset]
type = Varset
trigger1 =!time
var(2) = 0

[State 6055, Varadd]
type = Varadd
trigger1 = movecontact
var(2) = 1

[State 6055, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 6055, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 6055, NotHitBy]
type = NotHitBy
trigger1 = animelem = 13,< 0
value = SCA

[State 6055, Width]
type = Width
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
player = 9,0

[State 6055, Width]
type = Width
trigger1 = animelem = 18
player = 0,3

[State 6055, Width]
type = Width
trigger1 = animelem = 19
player = 0,9

[State 6055, Width]
type = Width
trigger1 = animelem = 21
player = 0,15

[State 6055, Dust Helper]
type = Helper
trigger1 = Animelem = 13
trigger2 = AnimElem = 15
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6055, Dust Helper]
type = Helper
trigger1 = time = 80
trigger2 = time = 90
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(3) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(5) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(7) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(9) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(11) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(13) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(15) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(17) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(19) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(21) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(23) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(25) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(27) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(29) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(31) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(33) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(35) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(37) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(39) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(41) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(43) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(45) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(47) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(49) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(51) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(53) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(55) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(57) = 0
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, Projectile 3]
type = Helper
trigger1 = AnimElemTime(59) = 4
helperType = Normal
stateNo = 3625
ID = 3625
name = "Bullet"
posType = P1
pos = 40, -40
size.xscale= 0.25 * const(size.xscale)
size.yscale= 0.25* const(size.yscale)
keyctrl = 1
ownpal= 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 6055, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 6064
ctrl = 1

;Spiderman
[Statedef 6056]
type = A
physics = N
ctrl = 0
velset = 0,3
anim = 3613
sprpriority = 15

[State 6056, Effect]
type = PlaySnd
trigger1 = AnimElem = 24
value = 13600, 4

[State 6056, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(30) > 0
value = 6057

;Spiderman
[Statedef 6057]
type = S
movetype = I
physics = S
ctrl = 0
anim = 3614
sprpriority = 15
velset = 0,0

[State 6057, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 40,0

[State 6057, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 6057, c4]
type = ChangeState
trigger1 = !animtime
value = 6058
ctrl = 0

;Spiderman
[Statedef 6058]
type = S
physics = S
movetype = A
anim = 3615
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 6058, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 200

[State 6058, Position]
type = PosSet
trigger1 = Time = 0

[State 6058, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = 35

[State 6058, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 6058, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 6058, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6058, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 6058, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10004, 1

[State 6058, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 10

[State 6058, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 6058, Turn]
type = Turn
trigger1 = animelem = 4

[State 6058, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 5,7
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2,10
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6058, Blood]
type = helper
trigger1 = movehit
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 8051
ID = 8051
name = "Blood"
postype = p2
pos = (target, const(size.ground.front) -20), (target, const(size.mid.pos.y))
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1
pauseMovetime = 255

[State 6058, HitSpark]
type = Helper
trigger1 = movecontact=1 && numtarget
trigger1 = (enemynear, movetype=H) && !(target, time)
helperType = Normal
stateNo = 8017
ID=  8015
name = "slashSpark"
postype = p2
pos = ceil(p2dist x-90),-40
ownPal = 1
size.xScale = 0.75
size.yScale = 0.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 6058, p2state]
type = targetstate
trigger1 = movehit && numtarget(3600)
trigger1 = target(3600),Movetype=H
ID = 3500
value = 4040
ignorehitpause = 1

[State 6058, c4]
type = ChangeState
trigger1 = !animtime
value = 6059
ctrl = 0

;Spiderman
[Statedef 6059]
type = S
physics = S
movetype = A
anim = 3615
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 6059, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 200

[State 6059, Position]
type = PosSet
trigger1 = Time = 0

[State 6059, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = 35

[State 6059, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 6059, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 6059, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6059, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 6059, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10004, 4

[State 6059, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 11

[State 6059, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 6059, Turn]
type = Turn
trigger1 = animelem = 4

[State 6059, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 8,7
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2,10
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6059, Blood]
type = helper
trigger1 = movehit
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 8051
ID = 8051
name = "Blood"
postype = p2
pos = (target, const(size.ground.front) -20), (target, const(size.mid.pos.y))
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1
pauseMovetime = 255

[State 6059, HitSpark]
type = Helper
trigger1 = movecontact = 1 && numtarget
trigger1 = (enemynear, movetype=H) && !(target, time)
helperType = Normal
stateNo = 8017
ID = 8015
name = "slashSpark"
postype = p2
pos = ceil(p2dist x-90),-40
ownPal = 1
size.xScale = 0.75
size.yScale = 0.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 6059, p2state]
type = targetstate
trigger1 = movehit && numtarget(3600)
trigger1 = target(3600),Movetype=H
ID = 3500
value = 4040
ignorehitpause = 1

[State 6059, c4]
type = ChangeState
trigger1 = !animtime
value = 6060
ctrl = 0

;Spiderman
[Statedef 6060]
type = S
physics = S
movetype = A
anim = 3615
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 6060, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 200

[State 6060, Position]
type = PosSet
trigger1 = Time = 0

[State 6060, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = 35

[State 6060, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 6060, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 6060, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6060, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 6060, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10004, 4

[State 6060, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 11

[State 6060, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 6060, Turn]
type = Turn
trigger1 =animelem=4

[State 6060, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 8,7
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2,10
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6060, Blood]
type = helper
trigger1 = movehit
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 8051
ID = 8051
name = "Blood"
postype = p2
pos = (target, const(size.ground.front) -20), (target, const(size.mid.pos.y))
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1
pauseMovetime = 255

[State 6060, HitSpark]
type = Helper
trigger1 = movecontact=1 && numtarget
trigger1 = (enemynear, movetype=H) && !(target, time)
helperType = Normal
stateNo = 8017
ID = 8015
name = "slashSpark"
postype = p2
pos= ceil(p2dist x-90),-40
ownPal = 1
size.xScale = 0.75
size.yScale = 0.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 6060, p2state]
type=targetstate
trigger1= movehit && numtarget(3600)
trigger1= target(3600),Movetype=H
ID = 3500
value = 4040
ignorehitpause = 1

[State 6060, c4]
type = ChangeState
trigger1 = !animtime
value = 6061
ctrl = 0

;Spiderman
[Statedef 6061]
type = S
physics = S
movetype = A
anim = 3615
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 6061, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 200

[State 6061, Position]
type = PosSet
trigger1 = Time = 0

[State 6061, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = 35

[State 6061, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 6061, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 6061, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6061, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 6061, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10004, 4

[State 6061, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 11

[State 6061, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 6061, Turn]
type = Turn
trigger1 = animelem = 4

[State 6061, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 8,7
getpower = 0, 0
givepower = 36, 36
pausetime = 6,6
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = S2,10
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 6061, Blood]
type = helper
trigger1 = movehit
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 8051
ID = 8051
name = "Blood"
postype = p2
pos = (target, const(size.ground.front) -20), (target, const(size.mid.pos.y))
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1
pauseMovetime=255

[State 6061, HitSpark]
type = Helper
trigger1 = movecontact=1 && numtarget
trigger1 = (enemynear, movetype=H) && !(target, time)
helperType = Normal
stateNo = 8017
ID = 8015
name = "slashSpark"
postype = p2
pos = ceil(p2dist x-90),-40
ownPal = 1
size.xScale = 0.75
size.yScale = 0.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 6061, p2state]
type = targetstate
trigger1 = movehit && numtarget(3600)
trigger1 = target(3600),Movetype=H
ID = 3500
value = 4040
ignorehitpause = 1

[State 6061, c4]
type = ChangeState
trigger1 = !animtime
value = 6062
ctrl = 0

;Spiderman
[Statedef 6062]
type = S
movetype = I
physics = S
ctrl = 0
anim = 3616
sprpriority = 2
velset = 0,0

[State 6062, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 40,0

[State 6062, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 6062]
type = Velset
trigger1 = AnimElem = 18
x = -5

[State 6062, 2]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1, 1
volumescale = 255

[State 6062, c4]
type = ChangeState
trigger1 = !animtime
value = 6063
ctrl = 0

;Spiderman
[Statedef 6063]
type = A
physics = N
ctrl = 0
velset = 0,-5
anim = 3617
sprpriority = 15

[State 6063, c4]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 0

;Spiderman
[Statedef 6064]
type = A
physics = N
ctrl = 0
velset = -5,0
anim = 3618
sprpriority = 15

[State 6064, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 13600, 5

[State 6064, c4]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 0

;Spiderman
[Statedef 6065]
type = A
physics = N
ctrl = 0
velset = 8,-5
anim = 3619
sprpriority = 15

[State 6065, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 13600, 6

[State 6065, c4]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 0

;Spiderman
[Statedef 6066]
type = A
physics = N
ctrl = 0
velset = 0,-5
anim = 10085
sprpriority = 15

[State 6066, c4]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 0

;Win 3 Helper
[Statedef 6183]
type = S
movetype = I
physics = N
anim = 10084
ctrl = 0
sprpriority = -1
velset = 0,0

[State 6183]
type = varset
trigger1 = Time = 0
var(2) = parent,stateno

[State 6183]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6183, 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 182, 1
volumescale = 255

[State 6183, EX FX]
type = Explod
trigger1 = animelem = 9
anim = 8500
ID = 8500
sprPriority = 10
posType = p1
pos = 10, -110
scale = 0.3, 0.3
pausemovetime = 999
supermovetime = 999
ownPal = 1

[State 6183, EX FX]
type = Explod
trigger1 = animelem = 10
anim = 10086
ID = 186
sprPriority = 10
posType = p1
pos = 0,0
scale = 1, 1
pausemovetime = 999
supermovetime = 999
ownPal = 1

[State 6183]
type = PlaySnd
trigger1 = AnimElem = 3, = 1
value = 182,0

[State 6183, c4]
type = ChangeState
trigger1 = !animtime
value = 6066
ctrl = 0

;Player 2
[Statedef 4040]
type = S
movetype = H
physics = S
juggle = 1
ctrl = 0
velset = 10,0
poweradd = 0
sprpriority = 0

[State 4040, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 4040, HitBy]
type = HitBy
trigger1 = 1
value = SCA,HA,HP,HT
time = 1
ignorehitpause = 1

[State 4040, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 4058  ;<=======custom animation

[State 4040, SelfState]
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1
