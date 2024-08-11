; _________________________________________
;| Batman by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<DARK SWARM>=============================
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
trigger1 = AnimElemTime(9) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
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

[State 3000, 1]
type = PlaySnd
trigger1 = time = 46
value = 193, 1
channel = 1

[State 3000,1]
type = playsnd
trigger1 = time = 73
value = 3000,0

[State 3000, 2]
type = Projectile
trigger1 = time = 73
projanim = 3005
projpriority = 4
projsprpriority = 5
projshadow = -1, 0, 0
projID = 3000
offset = 80, -65
velocity = 7
attr = S, SP
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 7
animtype  = hard
pausetime = 0,12
hitSound = s2,6
guardSound = s3,0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
guardflag = M
getpower = 0,0
ground.type = low
ground.slidetime = 12
ground.hittime = 14
ground.velocity = -5
air.animtype = Back
air.velocity = -2.5,-5
air.juggle = 3
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
p1stateno = 3001
p2stateno = 3015
Kill = 0

[State 3000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Crow Plague
[Statedef 3001]
type = S
movetype = A
physics = S
juggle = 4
velset = 0,0
anim = 3001
ctrl = 0
sprpriority = 2

[State 3001, pause]
type = pause
trigger1 = time = 0
time = 50
movetime = 50
ignorehitpause = 1
persistent = 0

[State 3001,1]
type = playsnd
trigger1 = time = 0
value = S3000,1

[State 3001, ]
type = ScreenBound
trigger1 = 1
value = 0

[State 3001, ]
type = VarRandom
trigger1 = 1
v = 5
range = -10, -120

[State 3001, crow]
type = Helper
triggerall = Time < 100
trigger1 = GameTime % 2 = 0 && NumHelper(3005) < 11
helpertype = normal
name = "crow"
ID = 3005
pos = -80, var(5)
postype = back
facing = 1
stateno = 3005
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 0.8
size.yscale = 0.8

[State 3001, 2]
type = ChangeState
trigger1 = AnimTime = 152
value = 0
ctrl = 1

;Player 2
[Statedef 3015]
type = A
movetype = H
physics = N
sprpriority = 1
anim = 5300

[State 3015, 1]
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < -1

[State 3015, 1]
type = VelSet
trigger1 = Time = 0
trigger2 = Vel Y > 0 && Pos Y >= 0
trigger3 = p2Stateno != 27100
x = 0
y = 0

[State 3015, 2]
type = VelAdd
triggerall = time >= 48;18
trigger1 = Pos Y <= 0
y = .3

[State 3015, 2]
type = PosSet
trigger1 = Vel Y > 0 && Pos Y >= 0
y = 0

;========================<MAX DARK SWARM>=============================
[StateDef 3050]
type = S
physics = S
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
trigger1 = AnimElemTime(9) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
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

[State 3050, 1]
type = PlaySnd
trigger1 = time = 46
value = 193, 1
channel = 1

[State 3050,1]
type = playsnd
trigger1 = time = 73
value = 3000,0

[State 3050, 2]
type = Projectile
trigger1 = time = 73
projanim = 3005
projpriority = 4
projsprpriority = 5
projshadow = -1, 0, 0
projID = 3000
offset = 80, -65
velocity = 7
attr = S, SP
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 7
animtype  = hard
pausetime = 0,12
hitSound = s2,6
guardSound = s3,0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -20
guardflag = M
getpower = 0,0
ground.type = low
ground.slidetime = 12
ground.hittime = 14
ground.velocity = -5
air.animtype = Back
air.velocity = -2.5,-5
air.juggle = 3
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
p1stateno = 3051
p2stateno = 3015
Kill = 0

[State 3050, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Crow Plague
[Statedef 3051]
type = S
movetype = A
physics = S
juggle = 4
velset = 0,0
anim = 3001
ctrl = 0
sprpriority = 2

[State 3051, pause]
type = pause
trigger1 = time = 0
time = 50
movetime = 50
ignorehitpause = 1
persistent = 0

[State 3051,1]
type = playsnd
trigger1 = time = 0
value = S3000,1

[State 3051, ]
type = ScreenBound
trigger1 = 1
value = 0

[State 3051, ]
type = VarRandom
trigger1 = 1
v = 5
range = -10, -120

[State 3051, crow]
type = Helper
triggerall = Time < 150
trigger1 = GameTime % 2 = 0 && NumHelper(3005) < 11
helpertype = normal
name = "crow"
ID = 3005
pos = -80, var(5)
postype = back
facing = 1
stateno = 3055
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 0.8
size.yscale = 0.8

[State 3051, 2]
type = ChangeState
trigger1 = AnimTime = 202
value = 0
ctrl = 1

;========================<DARK KNIGHT RIDE>=============================
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
trigger1 = AnimElemTime(8) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
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

[State 3100, Grapplefx]
type = PlaySnd
trigger1 = time = 46
value = 192,0

[State 3100, Grapplefx]
type = PlaySnd
trigger1 = time = 38
value = 3100,0

[State 3100, Grapplefx]
type = PlaySnd
trigger1 = time = 59
value = 1500,0

[State 3100, 2]
type = ScreenBound
trigger1 = Animelem = 7,>= 0
value = 0
movecamera = 0,0

[state 3100, AssertSpecial]
type = AssertSpecial
trigger1 = Animelem = 7,>= 0
flag = NoShadow

[State 3100, capefx]
type = PlaySnd
trigger1 = time = 64
value = 1700,0

[State 3100,sound2]
type = Playsnd
trigger1 = time = 76
value = 52,0
channel = 2

[State 3100, 1]
type = VelSet
trigger1 = Time >= 64
x = .1
y = -7

[State 3100, 1]
type = VelSet
trigger1 = Time >= 67
x = 0
y = -12

[State 3100,st ]
type = ChangeState
trigger1 = backedgedist < -220
trigger2 = time = 126
value = 3101

;Attack
[Statedef 3101]
type = S
movetype = A
physics = N
ctrl = 0
anim = 3105
velset = 20,0
sprpriority = 5
poweradd = 0
faceP2 = 1

[State 3101, 6]
type = AfterImage
trigger1 = time = 0
time = 100
TimeGap  = 1
FrameGap = 4
length = 15

[State 3101, capefx]
type = PlaySnd
trigger1 = time = 0
value = 3100,2
channel = 6

[State 3101, HitA]
type = HitDef
trigger1 = timemod = 2,0 && movehit = 0
attr = S, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 5
animtype = Hard
guardflag = M
hitflag = MAFD
priority = 4, Hit
getpower = 0,0
pausetime = 0,8
guard.pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -34
ground.type = High
air.animtype = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -8,-2
air.velocity = -8,-1
ground.cornerpush.veloff = -7
air.cornerpush.veloff = -4
air.fall = 1
fall.recover = 0
sprpriority = 5
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3101, HitA]
type = HitDef
triggerall = hitcount < 5
trigger1 = animelem = 1,>0 && timemod = 1,0 && movehit
attr = S, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 5
animtype = Hard
guardflag = M
hitflag = MAFD
priority = 4, Hit
getpower = 0,0
givepower = 0,8
pausetime = 8,6
guard.pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -34
ground.type = High
air.animtype = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -8,-2
air.velocity = -8,-1
ground.cornerpush.veloff = -7
air.cornerpush.veloff = -4
air.fall = 1
fall.recover = 0
sprpriority = 5
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3101, HitA]
type = HitDef
trigger1 = hitcount = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 5
animtype = Diagup
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 8,6
getpower = 0,0
givepower = 0,7
guard.pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -34
ground.type = High
air.animtype = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -5,-7
air.velocity = -6,-7
ground.cornerpush.veloff = -7
air.cornerpush.veloff = -4
fall = 1
fall.recover = 0
sprpriority = 5
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3101,va ]
type = VelAdd
trigger1 = hitcount = 5
x = 7

[State 3101, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 3101,sb ]
type = ScreenBound
trigger1 = time >= 0
value = 0
movecamera = 0,0

[State 3101,va ]
type = Velset
trigger1 = pos Y >= 0
y = 0

[State 3101,st ]
type = ChangeState
trigger1 = frontedgedist < -220
;value = 2102
trigger2 = time = 50
value = 3110

[State 3101, ex]
type = Explod
trigger1 = time = 0
ID = 3104
anim = 3104
pos = -420,-60
scale = 1, 1
bindtime = -1
removetime = -1
sprpriority = 8
ownpal = 1
ignorehitpause = 1
scale = 1,1

[State 3101, xmen]
type = Stopsnd
trigger1 = time = 100
channel = 6

;Finish
[Statedef 3110]
type = S
physics = S
ctrl = 0
velset = 0,0
anim = 3101
sprpriority = 2

[State 3101,re ]
type = RemoveExplod
trigger1 = time = 1
ID = 3104

[State 3110, 0]
type = ScreenBound
trigger1 = Animelem = 8,>= 0
value = 0
movecamera = 0,0

[State 3110, 0]
type = PosSet
trigger1 = time = 0
x = 100*-facing
y = 0

[State 3110, Batman]
type = Helper
trigger1 = time = 10
helpertype = normal
name = "Batman"
ID = 3111
pos = -70,-200
postype = back
stateno = 3111
ownpal = 1

[State 3110, end]
type = changestate
trigger1=!animtime
value = 0
ctrl = 1

;Fly
[Statedef 3111]
type = S
ctrl = 0
anim = 3102
velset = 0,0

[State 3111, 2]
type = ScreenBound
trigger1 = Animelem = 1,>= 0
value = 0
movecamera = 0,0

[State 3111, 1]
type = VelSet
trigger1 = Time = 0
x = 2
y = 3

[State 3111, ChangeState]
type = DestroySelf
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;========================<MAX DARK KNIGHT RIDE>=============================
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
trigger1 = AnimElemTime(8) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
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

[State 3150, Grapplefx]
type = PlaySnd
trigger1 = time = 46
value = 192,0

[State 3150, Grapplefx]
type = PlaySnd
trigger1 = time = 38
value = 3100,0

[State 3150, Grapplefx]
type = PlaySnd
trigger1 = time = 59
value = 1500,0

[State 3150, 2]
type = ScreenBound
trigger1 = Animelem = 7,>= 0
value = 0
movecamera = 0,0

[state 3150, AssertSpecial]
type = AssertSpecial
trigger1 = Animelem = 7,>= 0
flag = NoShadow

[State 3150, capefx]
type = PlaySnd
trigger1 = time = 64
value = 1700,0

[State 3150,sound2]
type = Playsnd
trigger1 = time = 76
value = 52,0
channel = 2

[State 3150, 1]
type = VelSet
trigger1 = Time >= 64
x = .1
y = -7

[State 3150, 1]
type = VelSet
trigger1 = Time >= 67
x = 0
y = -12

[State 3150,st ]
type = ChangeState
trigger1 = backedgedist < -220
trigger2 = time = 126
value = 3151

;Attack
[Statedef 3151]
type = S
movetype = A
physics = N
ctrl = 0
anim = 3105
velset = 20,0
sprpriority = 5
poweradd = 0
faceP2 = 1

[State 3151, 6]
type = AfterImage
trigger1 = time = 0
time = 100
TimeGap  = 1
FrameGap = 4
length = 15

[State 3151, capefx]
type = PlaySnd
trigger1 = time = 0
value = 3100,2
channel = 6

[State 3151, HitA]
type = HitDef
trigger1 = timemod = 2,0 && movehit = 0
attr = S, HA
damage = ceil(ifElse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 5
animtype = Hard
guardflag = M
hitflag = MAFD
priority = 4, Hit
getpower = 0,0
pausetime = 0,8
guard.pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -34
ground.type = High
air.animtype = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -8,-2
air.velocity = -8,-1
ground.cornerpush.veloff = -7
air.cornerpush.veloff = -4
air.fall = 1
fall.recover = 0
sprpriority = 5
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3151, HitA]
type = HitDef
triggerall = hitcount < 10
trigger1 = animelem = 1,>0 && timemod = 1,0 && movehit
attr = S, HA
damage = ceil(ifElse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 5
animtype = Hard
guardflag = M
hitflag = MAFD
priority = 4, Hit
getpower = 0,0
givepower = 0,8
pausetime = 8,6
guard.pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -34
ground.type = High
air.animtype = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -8,-2
air.velocity = -8,-1
ground.cornerpush.veloff = -7
air.cornerpush.veloff = -4
air.fall = 1
fall.recover = 0
sprpriority = 5
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3151, HitA]
type = HitDef
trigger1 = hitcount = 10
attr = S, HA
damage = ceil(ifElse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 5
animtype = Diagup
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 8,6
getpower = 0,0
givepower = 0,7
guard.pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -34
ground.type = High
air.animtype = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -5,-7
air.velocity = -6,-7
ground.cornerpush.veloff = -7
air.cornerpush.veloff = -4
fall = 1
fall.recover = 0
sprpriority = 5
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 3101,va ]
type = VelAdd
trigger1 = hitcount = 10
x = 7

[State 3151, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 3151,sb ]
type = ScreenBound
trigger1 = time >= 0
value = 0
movecamera = 0,0

[State 3151,va ]
type = Velset
trigger1 = pos Y >= 0
y = 0

[State 3151,st ]
type = ChangeState
trigger1 = frontedgedist < -220
;value = 2102
trigger2 = time = 50
value = 3110

[State 3151, ex]
type = Explod
trigger1 = time = 0
ID = 3104
anim = 3104
pos = -420,-60
scale = 1, 1
bindtime = -1
removetime = -1
sprpriority = 8
ownpal = 1
ignorehitpause = 1
scale = 1,1

[State 3151, xmen]
type = Stopsnd
trigger1 = time = 100
channel = 6

;========================<CRIME ALLEY VENGANCE>=============================
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
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(8 * const(size.xScale)), ceil(-64 * const(size.yScale))
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

[State 3200, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 3200, VelSet]
type = VelSet
trigger1 = animelem = 5
x = 18

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,20
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -5
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3200, 3]
type = PosAdd
trigger1 = AnimElem = 7
x = 12

[State 3200, 4]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = !movehit || moveguarded
value = 0
ctrl = 1

[State 3200, 4]
type = ChangeState
trigger1 = movehit && !moveguarded
value = 3210
ctrl = 0

;CRIME ALLEY VENGANCE
[Statedef 3210]
type = S
physics = S
movetype = A
anim = 3210
ctrl = 0
velset = 6,0
juggle = 15

[State 3210,00]
type = BGPalfx
trigger1 = 1
mul = 90,90,90
sinadd = 100, 100, 100
time = 1
ignorehitpause = 1

[State 3210, nhb]
type = nothitby
trigger1 = animelemtime(5)<0
time = 1
value = SCA

[State 3210, hit]
type = hitdef
trigger1 = animelem = 5
attr = S,HT
hitflag = M
priority = 7,Miss
numhits = 0
sparkNo = -1 + 0 * (var(33) := 0)
sparkxy = -1
hitSound = -1 + 0 * (var(31) := 800)
p1facing = 1
p2facing = 1
p1stateno = 3211
p2stateno = 3212
animtype = Up
ground.velocity = -2,-16
air.velocity = -2,-16
sprpriority = -1
fall = 1
fall.recover = 0
ID = 3210

[State 3210, end]
type = changestate
trigger1 =!animtime
value = 0
ctrl = 1

;Hit
[Statedef 3211]
type = S
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0
sprpriority = 3

[State 3211,00]
type = BGPalfx
trigger1 = time = 0
mul = 90,90,90
sinadd = 100, 100, 100
time = 94
ignorehitpause = 1

[State 3211, nom]
type = AssertSpecial
trigger1 = 1
flag = NoMusic
flag2 = NoFG

[State 3211,sound1]
type = Playsnd
trigger1 = time = 0
value = 3200,0

[State 3211, throw]
type = targetfacing
trigger1 =!time
value = -1

[State 3211, push]
type = playerpush
trigger1 = 1
value = 0

[State 3211, nothitby]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3211, 0]
type = PosSet
trigger1 = time = 90
x = 50*-facing
y = 0

[State 3211, bound]
type = screenbound
trigger1 = animelemtime(18)<0
value = 0

[State 3211, spr]
type = sprpriority
trigger1 = animelemtime(2)>=0
value = 1

[State 3211, fadeout]
type = allpalfx
trigger1 = animelemtime(4) = 45
time = 49
sinadd = -255,-255,-255,76

[State 3211, afterimage]
type = afterimagetime
trigger1 = animelemtime(15)<0
time = 0

[State 3211, bgpalfx]
type = bgpalfx
trigger1 = animelemtime(5)=-1||animelemtime(6)=-1||animelemtime(7)=-1||animelemtime(8)=-1||animelemtime(9)=-1||animelemtime(10)=-1
trigger2 = animelemtime(11)=-1||animelemtime(12)=-1||animelemtime(13)=-1||animelemtime(14)=-1||animelemtime(15)=-1||animelemtime(16)=-1
invertall = 1
add = 255,255,255
sinadd = -1000,-1000,-1000,80
color = 0
time = 50

[State 3211, exp]
type = Explod
trigger1 = time= 0
anim = 3215
id = 3215
pos = 0,0
postype = back
ownpal = 1
sprpriority = 5
supermovetime =999
pausemovetime =999
removetime = -2
removeongethit = 1
IgnoreHitPause = 1

[State 3211, palfx]
type = palfx
trigger1 = animelemtime(5)=-1||animelemtime(6)=-1||animelemtime(7)=-1||animelemtime(8)=-1||animelemtime(9)=-1||animelemtime(10)=-1
trigger2 = animelemtime(11)=-1||animelemtime(12)=-1||animelemtime(13)=-1||animelemtime(14)=-1||animelemtime(15)=-1||animelemtime(16)=-1
add = -50,-50,-50
sinadd = -155,-155,-155,150
color = 0
time = 180

[State 3211, palfx]
type = palfx
trigger1 = animelemtime(16)=-1
add = 0,0,0
sinadd = 0,0,0,1
time = 1

[State 3211, bgpalfx]
type = bgpalfx
trigger1 = animelemtime(21)=-1
add = 0,0,0
sinadd = 0,0,0,1
color = 256
time = 1

[State 3211, assert]
type = assertspecial
trigger1 = time >= 55 ;animelemtime(21)<0
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3211, bind]
type = targetbind
trigger1 =!time
pos = 45,0

[State 3211, hitadd]
type = hitadd
trigger1 = animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10||animelem=11||animelem=12||animelem=13||animelem=14||animelem=15
value = 1

[State 3211, hitdamage]
type = targetlifeadd
trigger1 = animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10||animelem=11||animelem=12||animelem=13||animelem=14||animelem=15
value = -30
kill = 0

[State 3211, hitdamagek]
type = targetlifeadd
trigger1 = animelem = 16
value = -45

[State 3211,env ]
type = EnvColor
trigger1 = AnimElem = 17
value = 255,255,255
time = 6
under = 0
ignorehitpause = 1
persistent = 0

[State 3211, snd]
type = playsnd
trigger1 = animelemtime(5)= 0||animelemtime(7)= 0||animelemtime(10)= 0||animelemtime(13)= 0||animelemtime(16)= 0
value = 1, 1

[State 3211, snd]
type = playsnd
trigger1 = animelemtime(6)= 0||animelemtime(9)= 0||animelemtime(14)= 0||animelemtime(17)= 0
value = 1, 2

[State 3211, snd]
type = playsnd
trigger1 = animelemtime(8)= 0||animelemtime(11)= 0||animelemtime(12)= 0||animelemtime(15)= 0
value = 1, 3

[State 3211, hitsnd]
type = playsnd
trigger1 = animelemtime(5)= 12||animelemtime(6)= 12||animelemtime(7)= 12||animelemtime(8)= 12||animelemtime(9)= 12||animelemtime(10)= 12||animelemtime(11)= 12||animelemtime(12)= 12||animelemtime(13)= 12||animelemtime(14)= 12||animelemtime(15)= 12
value = 2, ifelse(Random > 500, 1, 2)

[State 3211, hitsnd]
type = playsnd
trigger1 = animelemtime(16)= 10
value = 2, 2

[State 3211, voice]
type = playsnd
trigger1 = animelemtime(16)= 10
value = 4, 2
channel = 2

[State 3211, shake]
type = envshake
trigger1 = animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10||animelem=11||animelem=12||animelem=13||animelem=14||animelem=15||animelem=16
time = 2
freq = 90
ampl = -3

[State 3211, Hit Spark]
type = Helper
trigger1 = animelemtime(5)= 5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10||animelem=11||animelem=12||animelem=13||animelem=14||animelem=15||animelem=16
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P2
pos = -10+ random%20,-65+ random%20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3211, throw]
type = targetstate
trigger1 = animelemtime(16)>=0&&numtarget(3210)
value = 3213
persistent = 0

[State 3211, sts]
type = statetypeset
trigger1 = animelemtime(15)>=0
statetype = A
movetype = I
physics = N

[State 3211, gravity]
type = gravity
trigger1 = animelemtime(17)>=0

[State 3211, vel]
type = velset
trigger1 =!animelemtime(17)
x = -3
y = -8

[State 3211, end]
type = changestate
trigger1 = animelemtime(17)>0 && vel y>0 && pos y>=-5
value = 3215

;End
[Statedef 3215]
type = S
movetype = I
physics = S
anim = 3205
velset = 0,0
sprpriority = -1
ctrl = 0

[State 3215, pos]
type = posset
trigger1 = pos y
y = 0

[State 3215, snd]
type = playsnd
trigger1 = animelem = 5
value = 3200,1 ;194,0
channel = 0

[State 3215, snd]
type = playsnd
trigger1 = animelem = 3
value = 1,0

[State 3215, end]
type = changestate
trigger1 =!animtime
value = 0
ctrl = 1

;TARGET
[Statedef 3212]
type = S
physics = N
movetype = H
velset = 0,0
ctrl = 0

[State 3212, anim]
type = changeanim2
trigger1 =!time
value = 3212

[State 3212, 0]
type = PosSet
trigger1 = time = 0
y = -15

[State 3212, 0]
type = PosSet
trigger1 = time = 90
x = 10*-facing
y = 0

[State 3212, palfx]
type = palfx
trigger1 = animelemtime(6)=-1||animelemtime(7)=-1||animelemtime(8)=-1||animelemtime(9)=-1||animelemtime(10)=-1
trigger2 = animelemtime(11)=-1||animelemtime(12)=-1||animelemtime(13)=-1||animelemtime(14)=-1||animelemtime(15)=-1||animelemtime(16)=-1
add = -50,-50,-50
sinadd = -155,-155,-155,80
color = 0
time = 60 ;20

;Player 2
[Statedef 3213]
type = S
physics = N
movetype = H
velset = -2,-16
ctrl = 0

[State 3213, bgpalfx]
type = palfx
trigger1 =!time
add = 0,0,0
sinadd = 0,0,0,1
time = 1

[State 3213, end]
type = selfstate
trigger1 = time
value = 5020

;========================<THE BATMEN>=============================
[StateDef 3300]
type = S
physics = S
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
trigger1 = AnimElemTime(8) < 0
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
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
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

[State 3300, batmite]
type = Explod
trigger1 = time = 3
anim = 3395
ID = 3395
pos = 50,-140
postype = p1
bindtime = 999
removetime = 106
supermove = 106
pausemovetime = 106
sprpriority = 8

[State 3300, pause]
type=pause
trigger1=time=70
time=30
movetime=30 ;;  5 seconds
ignorehitpause=1
persistent=0
pausebg = 1

[State 3300, nofg]
type = AssertSpecial
trigger1 = Time > 70
flag = nobardisplay
flag2 = noFG

[State 3300, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 8

[State 3300, snd1]
type = PlaySnd
trigger1 = time = 70
value = 3300, 1
channel = 2

[State 3300, snd1]
type = PlaySnd
trigger1 = time = 70
value = 3300, 2
channel = 2

[State 3300, snd1]
type = PlaySnd
trigger1 = time = 4
value = 3300, 3
channel = 3

[State 3300, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 3, 4)

[State 3300, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 8
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p1stateno = 3310
p2stateno = 3320
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[state 3300, 5]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;The Batmen Attack!
[statedef 3310]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 3399

[State 3310, 0]
type = PosSet
trigger1 = time = 0
x = 50*-facing
y = 0

[State 3310, ]
type = Playerpush
trigger1 = 1
value = 0

[State 3310, bg]
Type = BGPalfx
Trigger1 = time = [0, 224]
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3310, nofg]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
flag3 = noBG

[State 3310, Helper]
type = Helper
trigger1 = time = 0
name = "sndhelper"
ID = 6105
stateno = 6105
keyctrl = 0
ownpal = 1

[State 3310, hitadd]
type = hitadd
trigger1 = TimeMod = 24,1
value = 1

[State 3310, Hit Spark]
type = Helper
trigger1 = TimeMod = 24,2
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = -10+ random%20,-75+ random%20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3310, hitdamage]
type = targetlifeadd
trigger1 = TimeMod = 24,1
value = -20
kill = 0

[State 3310, hitpower]
type = targetpoweradd
trigger1 = TimeMod = 24,1
value = 5

[state 3310, 2]
type = changestate
trigger1 = time = 224
value = 3311

;Batmen final hit
[Statedef 3311]
type = S
movetype = A
physics = S
anim = 3350
ctrl = 0
sprpriority = 2

[State 3311, 4]
type = NotHitBy
trigger1 = time = [0, 10]
value = , NT,ST,HT, SP, HP
time = 2

[State 3311, 2]
type = ReversalDef
trigger1 = time = [0, 10]
reversal.attr = SCA, NA, SA, HA, NP, SP, HP
numhits = 0
pausetime = 20, 45
sparkno = s30002

[State 3311, 1]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 8

[State 3311, 6]
type = AfterImage
trigger1 = time = 0
time = 30
TimeGap  = 1
FrameGap = 4
length = 15

[State 3311, 1]
type = Velset
trigger1 = time = [3, 7]
x = 3

[State 3311, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 15,15
guard.pauseTime = 15,15
animType = Diagup
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10, -6
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -10, -6
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3311,1]
type = Envcolor
triggerall = movehit = 1
trigger1 = time = 10
trigger2 = time = 12
trigger3 = time = 14
trigger4 = time = 16
trigger5 = time = 18
ignorehitpause = 1
value = 0, 0, 0
time = 1
under = 1
supermove = 1

[State 3311,1]
type = Envcolor
triggerall = movehit = 1
trigger1 = time = 11
trigger2 = time = 13
trigger3 = time = 15
trigger4 = time = 17
ignorehitpause = 1
value = 255, 255, 255
time = 1
under = 1
supermove = 1

[state 3311, 5]
type = changestate
trigger1 = animTime = 0
value = 0
ctrl = 1

;Batmen inv helper
[Statedef 6105]
ctrl = 0
type = S
movetype = I
physics = S
anim = 3399
sprpriority = -1

[State 6100, Helper]
type = Helper
trigger1 = time = 0
name = "batmen"
ID = 6300
stateno = 6300
keyctrl = 0
ownpal = 1

[State 6005, DestroySelf]
type = DestroySelf
trigger1 = time = 224

;p2state
[statedef 3320]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 3320,env ]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 12
under = 0
ignorehitpause = 1
persistent = 0

[State 3320, 0]
type = ChangeAnim2
trigger1 = time = 0
value = 6200+(random%4)

[State 3320, 0]
type = PosSet
trigger1 = time = 0
x = 50*-facing
y = 0

[State 3320, gr]
type = ChangeAnim
triggerall = AnimExist(5300)
trigger1 = (time = 224) && StateType != A
value = 5300

[state 3320,1]
type = selfstate
trigger1 = time >= 290
value = 0
ctrl = 1

;Batmen - Gaslight Batman
[Statedef 6300]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6100
sprpriority = -1

[State 6300, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6300, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6300,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6300, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6300, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Captain Leatherwing
[Statedef 6301]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6101
sprpriority = -1

[State 6301, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6301, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6301,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6301, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6301, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Wainwright Batman
[Statedef 6302]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6102
sprpriority = -1

[State 6302, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6302, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6302,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6302, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6302, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - BatMage
[Statedef 6303]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6103
sprpriority = -1

[State 6303, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6303, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,4
channel = 2

[State 6303,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6303, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6303, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batwoman
[Statedef 6304]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6104
sprpriority = -1

[State 6304, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,5

[State 6304, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,5
channel = 2

[State 6304,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6304, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6304, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - FrankenBat :P
[Statedef 6305]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6105
sprpriority = -1

[State 6305, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6305, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6305,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6305, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6305, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - French Revolution Batman
[Statedef 6306]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6106
sprpriority = -1

[State 6306, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6306, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6306,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6306, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6306, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Owlman
[Statedef 6307]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6107
sprpriority = -1

[State 6307, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6307, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6307,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6307, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6307, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Civil War Batman
[Statedef 6308]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6108
sprpriority = -1

[State 6308, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,0

[State 6308, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 6308,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6308, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6308, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Justice Rider Batman
[Statedef 6309]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6109
sprpriority = -1

[State 6309, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6309, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6309,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6309, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6309, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Tangent Batman
[Statedef 6310]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6110
sprpriority = -1

[State 6310, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6310, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6310,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6310, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6310, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Citizen Wayne Batman
[Statedef 6311]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6111
sprpriority = -1

[State 6311, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6311, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6311,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6311, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6311, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - JSA Batman
[Statedef 6312]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6112
sprpriority = -1

[State 6312, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6312, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6312,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6312, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6312, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Midnighter
[Statedef 6313]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6113
sprpriority = -1

[State 6313, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6313, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6313,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6313, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6313, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - OneMillion Batman
[Statedef 6314]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6114
sprpriority = -1

[State 6314, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6314, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6314,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6314, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6314, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - BatMouse
[Statedef 6315]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6115
sprpriority = -1

[State 6315, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,0

[State 6315, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 6315,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6315, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6315, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - DKRoundTable Batman
[Statedef 6316]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6116
sprpriority = -1

[State 6316, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6316, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6316, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 0,1
channel = 2

[State 6316,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6316, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6316, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Little Batman
[Statedef 6317]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6117
sprpriority = -1

[State 6317, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,0

[State 6317, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 6317,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6317, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6317, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Thrillkiller Batman
[Statedef 6318]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6118
sprpriority = -1

[State 6318, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6318, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6318,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6318, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6318, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Year 100 Batman
[Statedef 6319]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6119
sprpriority = -1

[State 6319, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,0

[State 6319, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 6319,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6319, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6319, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Berlin Batman
[Statedef 6320]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6120
sprpriority = -1

[State 6320, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6320, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6320,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6320, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6320, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Executioner Batwoman
[Statedef 6321]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6121
sprpriority = -1

[State 6321, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6321, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6321,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6321, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6321, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - King Batman
[Statedef 6322]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6122
sprpriority = -1

[State 6322, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6322, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6322,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6322, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6322, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Night Hawk
[Statedef 6323]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6123
sprpriority = -1

[State 6323, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,0

[State 6323, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 6323,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6323, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6323, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batman Of Arkham
[Statedef 6324]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6124
sprpriority = -1

[State 6324, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6324, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6324,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6324, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6324, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Aztec Batman
[Statedef 6325]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6125
sprpriority = -1

[State 6325, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6325, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6325,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6325, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6325, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Vampire Batman
[Statedef 6326]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6126
sprpriority = -1

[State 6326, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6326, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6326,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6326, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6326, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Stan Lee Batman
[Statedef 6327]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6127
sprpriority = -1

[State 6327, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6327, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6327,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6327, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6327, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Lantern Batman
[Statedef 6328]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6128
sprpriority = -1

[State 6328, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6328, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6328,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6328, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6328, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Classic 90's Batman
[Statedef 6329]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6129
sprpriority = -1

[State 6329, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6329, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6329,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6329, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6329, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Beyond Batman
[Statedef 6330]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6130
sprpriority = -1

[State 6330, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6330, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6330,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6330, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6330, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Adam West Batman
[Statedef 6331]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6131
sprpriority = -1

[State 6331, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6331, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6331,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6331, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6331, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Bizarro Batman
[Statedef 6332]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6132
sprpriority = -1

[State 6332, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,0

[State 6332, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 6332,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6332, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6332, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Dark Night Batman (Miller)
[Statedef 6333]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6133
sprpriority = -1

[State 6333, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6333, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6333,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6333, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6333, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batman Nazi
[Statedef 6334]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6134
sprpriority = -1

[State 6334, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6334, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6334,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6334, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6334, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Red Son Batman
[Statedef 6335]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6135
sprpriority = -1

[State 6335, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6335, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6335,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6335, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6335, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Reverend Batman
[Statedef 6336]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6136
sprpriority = -1

[State 6336, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6336, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6336,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6336, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6336, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batman Zebra
[Statedef 6337]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6137
sprpriority = -1

[State 6337, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6337, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6337,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6337, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6337, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Alien Batman
[Statedef 6338]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6138
sprpriority = -1

[State 6338, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6338, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6338,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6338, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6338, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Super Batman
[Statedef 6339]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6139
sprpriority = -1

[State 6339, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6339, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6339,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6339, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6339, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batman Dark Allegiances
[Statedef 6340]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6140
sprpriority = -1

[State 6340, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6340, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6340,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6340, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6340, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Ancient BatArmor
[Statedef 6341]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6141
sprpriority = -1

[State 6341, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6341, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6341,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6341, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6341, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batman Noir
[Statedef 6342]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6142
sprpriority = -1

[State 6342, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6342, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6342,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6342, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6342, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Scar Batman
[Statedef 6343]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6143
sprpriority = -1

[State 6343, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6343, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6343,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6343, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6343, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - ManBat
[Statedef 6344]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6144
sprpriority = -1

[State 6344, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6344, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6344,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6344, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6344, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - I Joker Batman (bad)
[Statedef 6345]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6145
sprpriority = -1

[State 6345, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6345, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6345,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6345, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6345, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Batman Pharaon
[Statedef 6346]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6146
sprpriority = -1

[State 6346, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6346, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6346,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6346, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6346, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Kingdom Come Batman
[Statedef 6347]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6147
sprpriority = -1

[State 6347, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6347, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6347,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6347, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6347, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Switch Batman
[Statedef 6348]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6148
sprpriority = -1

[State 6348, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6348, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6348,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6348, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6348, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - 40's Batman
[Statedef 6349]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6149
sprpriority = -1

[State 6349, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6349, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6349,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6349, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6349, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - BatWings
[Statedef 6350]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6150
sprpriority = -1

[State 6350, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6350, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6350,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6350, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6350, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - War Bat
[Statedef 6351]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6151
sprpriority = -1

[State 6351, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,2

[State 6351, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 2

[State 6351,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6351, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6351, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;Batmen - Golden Streets Batman
[Statedef 6352]
ctrl = 0
type = S
movetype = I
physics = S
anim = 6152
sprpriority = -1

[State 6352, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 2,1

[State 6352, hitsnd]
type = playsnd
trigger1 = AnimElem = 2
value = 1,1
channel = 2

[State 6352,env ]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 2
under = 0
ignorehitpause = 1
persistent = 0

[State 6352, DestroySelf]
type = DestroySelf
trigger1 = NumHelper(6105) = 0

[State 6352, ChangeState]
type = ChangeState
trigger1 = animTime = 0
value = 6300+(random%52)

;========================<MAX THE BATMEN>=============================
[StateDef 3350]
type = S
physics = S
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
trigger1 = AnimElemTime(8) < 0
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
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
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

[State 3350, batmite]
type = Explod
trigger1 = time = 3
anim = 3395
ID = 3395
pos = 50,-140
postype = p1
bindtime = 999
removetime = 106
supermove = 106
pausemovetime = 106
sprpriority = 8

[State 3350, pause]
type=pause
trigger1=time=70
time=30
movetime=30 ;;  5 seconds
ignorehitpause=1
persistent=0
pausebg = 1

[State 3350, nofg]
type = AssertSpecial
trigger1 = Time > 70
flag = nobardisplay
flag2 = noFG

[State 3350, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 13

[State 3350, snd1]
type = PlaySnd
trigger1 = time = 70
value = 3300, 1
channel = 2

[State 3350, snd1]
type = PlaySnd
trigger1 = time = 70
value = 3300, 2
channel = 2

[State 3350, snd1]
type = PlaySnd
trigger1 = time = 4
value = 3300, 3
channel = 3

[State 3350, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 3, 4)

[State 3350, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 8
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p1stateno = 3360
p2stateno = 3320
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[state 3350, 5]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;The Batmen Attack!
[statedef 3360]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 3399

[State 3360, 0]
type = PosSet
trigger1 = time = 0
x = 50*-facing
y = 0

[State 3360, ]
type = Playerpush
trigger1 = 1
value = 0

[State 3360, bg]
Type = BGPalfx
Trigger1 = time = [0, 224]
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3360, nofg]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
flag3 = noBG

[State 3360, Helper]
type = Helper
trigger1 = time = 0
name = "sndhelper"
ID = 6105
stateno = 6105
keyctrl = 0
ownpal = 1

[State 3360, hitadd]
type = hitadd
trigger1 = TimeMod = 14,1
value = 1

[State 3360, Hit Spark]
type = Helper
trigger1 = TimeMod = 14,2
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = -10+ random%20,-75+ random%20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3360, hitdamage]
type = targetlifeadd
trigger1 = TimeMod = 14,1
value = -18
kill = 0

[State 3360, hitpower]
type = targetpoweradd
trigger1 = TimeMod = 14,1
value = 5

[state 3360, 2]
type = changestate
trigger1 = time = 224
value = 3361

;Batmen final hit
[Statedef 3361]
type = S
movetype = A
physics = S
anim = 3350
ctrl = 0
sprpriority = 2

[State 3361, 4]
type = NotHitBy
trigger1 = time = [0, 10]
value = , NT,ST,HT, SP, HP
time = 2

[State 3361, 2]
type = ReversalDef
trigger1 = time = [0, 10]
reversal.attr = SCA, NA, SA, HA, NP, SP, HP
numhits = 0
pausetime = 20, 45
sparkno = s30002

[State 3361, 1]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 8

[State 3361, 6]
type = AfterImage
trigger1 = time = 0
time = 30
TimeGap  = 1
FrameGap = 4
length = 15

[State 3361, 1]
type = Velset
trigger1 = time = [3, 7]
x = 3

[State 3361, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 15,15
guard.pauseTime = 15,15
animType = Diagup
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10, -6
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -10, -6
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3361,1]
type = Envcolor
triggerall = movehit = 1
trigger1 = time = 10
trigger2 = time = 12
trigger3 = time = 14
trigger4 = time = 16
trigger5 = time = 18
ignorehitpause = 1
value = 0, 0, 0
time = 1
under = 1
supermove = 1

[State 3361,1]
type = Envcolor
triggerall = movehit = 1
trigger1 = time = 11
trigger2 = time = 13
trigger3 = time = 15
trigger4 = time = 17
ignorehitpause = 1
value = 255, 255, 255
time = 1
under = 1
supermove = 1

[state 3361, 5]
type = changestate
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<URBAN LEGEND>=============================
[StateDef 3400]
type = S
physics = S
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

[State 3400, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

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

[State 3400, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 8

[State 3400, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 3400, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 3400, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,20
guard.pauseTime = 12,20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p1stateno = 3401
p2stateno = 3405
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3400, 4]
type = SprPriority
trigger1 = AnimElem = 5
value = 2

[State 3400, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Continue
[Statedef 3401]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3401
velset = 3,0
juggle = 5
sprpriority = 1

[State 3401, nhb]
type = nothitby
trigger1 = anim = 3401 && animelemtime(1)>=3 && animelemtime(3)<0
time = 1
value = SCA
ignorehitpause = 1

[State 3401, 1]
type = TargetBind
trigger1 = time = [0,70]
pos = 100, 0

[State 3401, 0]
type = PosSet
trigger1 = time = 0
x = 50*-facing
y = 0
ignorehitpause = 1

[State 3401, 1]
type = PlaySnd
trigger1 = time = 6
value = 193, 0
channel = 1

[State 3401, sts]
type = statetypeset
trigger1 = anim = 3401 &&!animelemtime(29)
statetype = A
physics = N

[State 3401, anim]
type = changeanim
trigger1 = anim = 3401 && animelemtime(29)>0
trigger1 = vel y>0 && pos y>=-5
value = 3402
persistent = 0

[State 3401, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = anim=3401&&(animelem=3||animelem=9)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifelse((animelem=10),12,4),ifelse((animelem=10),12,4)
guard.pauseTime = 12,20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = ifelse((animelem=19),-4,-7),0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = ifelse((animelem=19),-1,-3),-3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3401, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = anim=3401&&animelem=15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -7,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -3, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3401, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 20
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 14,20
guard.pauseTime = 12,20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -8, -3
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -8, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -77
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3401, EnvShake]
type = EnvShake
trigger1 = animelem=3||animelem=9||animelem=15||animelem=20
time = 12
ampl = 6

[State 3401, hitadd]
type = hitadd
trigger1 = animelem=3||animelem=9||animelem=15||animelem=20
value = 1

[State 3401, hitdamage]
type = targetlifeadd
trigger1 = animelem=3||animelem=9||animelem=15||animelem=20
value = -40
kill = 0

[State 3401, hitpower]
type = targetpoweradd
trigger1 = animelem=3||animelem=9||animelem=15||animelem=20
value = 0

[State 3401, hitsnd]
type = playsnd
trigger1 = animelem=3||animelem=9||animelem=15||animelem=20
value = 2,ifelse(Random > 500, 1, 2)

[State 3401, hitsnd]
type = playsnd
trigger1 = animelem=24
value = 2,800

[State 3401, hitsnd]
type = playsnd
trigger1 = time = 93
value = 1500,0

[State 3401, move]
type = playsnd
trigger1 = time = 98
value = 1500,1
channel = 2

[State 3401, move]
type = playsnd
trigger1 = animelem=2||animelem=8||animelem=14||animelem=19
value = 1,ifelse(Random > 500, 1, 4)
channel = 2

[State 3401, Hit Spark]
type = Helper
trigger1 = animelem=3||animelem=9||animelem=15||animelem=20
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = -10+ random%20,-80+ random%20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3401,00]
type = BGPalfx
trigger1 = 1
mul = 0, 0, 0
time = 80
ignorehitpause = 1

[State 3401, 1]
type = TargetBind
trigger1 = time = [70,78]
pos = 28, 0

[State 3401, 15]
type = ChangeState
trigger1 = AnimTime = 0
value = 3402
;ctrl = 1

;Air Kick
[Statedef 3402]
type = S
physics = S
anim = 3402
sprpriority = 1
ctrl = 0

[State 3402, Grapplefx]
type = PlaySnd
trigger1 = time = 30
value = 1500,0

[State 13302, 1]
type = TargetBind
trigger1 = time = [3,5]
pos = 80, 0

[State 3402, T]
type = EnvShake
trigger1 = time = 6
freq = 50
ampl = 2
time = 22
persistent = 1
ignorehitpause = 1

[State 3402, 2]
type = ScreenBound
trigger1 = Animelem = 3,>= 0
value = 0
movecamera = 0,0

[state 3402, AssertSpecial]
type = AssertSpecial
trigger1 = time >= 15
flag = NoShadow

[State 3402, grapplefx]
type = PlaySnd
trigger1 = time = 5
value = 3400,0
channel = 1

[State 3402, hitsnd]
type = playsnd
trigger1 = time = 7
value = 1500,3

[State 3402, capefx]
type = PlaySnd
trigger1 = time = 6
value = 1700,0

[State 3402,sound2]
type = Playsnd
trigger1 = time = 5
value = 52,0
channel = 2

[State 3402, 1]
type = VelSet
trigger1 = Time >= 6
x = .1
y = -7

[State 3402, 1]
type = VelSet
trigger1 = Time >= 10
x = 0
y = -12

[State 3402,00]
type = BGPalfx
trigger1 = 1
mul = 0, 0, 0
time = 10
ignorehitpause = 1

[State 3402, 2]
type = ChangeState
trigger1 = Time >= 55
value = 3403

;Air Kick
[Statedef 3403]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1
poweradd = 0

[State 3403, 2]
type = ScreenBound
trigger1 = Animelem = 3,>= 0
value = 0
movecamera = 0,0

[state 3403, AssertSpecial]
type = AssertSpecial
trigger1 = Animelem = 3,>= 0
flag = NoShadow

[State 3403, Anim]
type = ChangeAnim
trigger1 = 1
postype = P2
value = 3404

[State 3403, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
attr = C, NA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -2
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.2, -3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
p2stateno = 3412
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3403, 1]
type = Sprpriority
trigger1 = 1
value = 5

[State 3403, 1]
type = posSet
trigger1 = Time = 0
x = 0
y = -300

[State 3403, 1]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 15

[State 3403,sound2]
type = Playsnd
trigger1 = time = 18
value = 52,0
channel = 2

[State 3403, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 3403, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 3404

;Jump Back
[Statedef 3404]
type = S
physics = S
anim = 1705
sprpriority = 1
ctrl = 0

[State 3404, pause]
type=pause
trigger1=time=20
time=50
movetime=50
ignorehitpause=1
persistent=0

[State 3404, sparks]
type = explod
trigger1 = time = 0
anim = 8005
ID = 8009
sprpriority = -1
postype = p2
pos = 0,0
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3404,sound2]
type = Playsnd
trigger1 = time = 0
value = 41,0
channel = 2

[State 3404, 0]
type = PosSet
trigger1 = time = 0
x = 5
y = -5

[State 3404, 1]
type = VelSet
trigger1 = Time >= 0
x = 0
y = -2

[State 3404, 1]
type = VelSet
trigger1 = Time >= 6
x = 0
y = 0

[State 3404, 1]
type = VelSet
trigger1 = Time >= 6
x = -3
y = -1

[State 3404, 1]
type = VelSet
trigger1 = Time >= 17
x = -2
y = 4

[State 3404, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 1602

;Opponent Thrown
[Statedef 3405]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 3405, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3405, changeanim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3410

[State 3405, 0]
type = PosSet
trigger1 = time = 0
x = 0
y = 0

[State 3405, 0]
type = PosSet
trigger1 = time = 1
;x = 50
x = 50*-facing
y = 0

[State 3405, 1]
type = TargetBind
trigger1 = time = [0,5]
pos = 44, 0

[State 3405, 1]
type = TargetBind
trigger1 = time = [5,10]
pos = 50, 0

[State 3405, 1]
type = TargetBind
trigger1 = time = [10,70]
pos = 52, 0

[State 3405, 0]
type = PosSet
trigger1 = time = 24
;x = 50
x = 50*-facing
y = 0

[State 3405, 1]
type = Sprpriority
trigger1 = time = [20,25]
value = 4

[State 3405, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3405, 5]
type = AssertSpecial
trigger1 = time = [269,469]
flag = noshadow
flag2 = invisible

[State 3405, changeanim2]
type = ChangeAnim2
trigger1 = time = 98
value = 3411

[State 3405, 1]
type = Sprpriority
trigger1 = time = [70,98]
value = -1

[State 3405, 1]
type = Sprpriority
trigger1 = time = [98,146]
value = 4

[State 3405, 1]
type = TargetBind
trigger1 = time = [98,101]
pos = 0, 0

[State 3405, 1]
type = TargetBind
trigger1 = time = [101,106]
pos = 0, 0

[State 3405, 0]
type = PosSet
trigger1 = time = 104
x = -0*-facing
y = 5

[State 3405, 0]
type = PosSet
trigger1 = time = 106
x = -0*-facing
y = 15

[State 3405, 2]
type = ScreenBound
trigger1 = Time >= 108
value = 0
movecamera = 0,0

[State 3405, 0]
type = PosSet
trigger1 = time = 108
x = -0*-facing
y = 20

[State 3405, 1]
type = VelSet
trigger1 = Time >= 106
x = .1
y = -7

[State 3405, 1]
type = VelSet
trigger1 = Time >= 108
x = 0
y = -12

[State 3405, 5]
type = AssertSpecial
trigger1 = Time >= 106
flag = noshadow

[State 3305, State End]
type = ChangeState
trigger1 = time >= 154
value = 3406

;Opponent Thrown
[Statedef 3406]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 3406, 1]
type = EnvShake
Trigger1 = time = 21
time = 37
ampl = -12
freq = 190
phase = 90

[State 3406, changeanim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3412

[State 3406, 2]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3406, 3]
type = AssertSpecial
trigger1 = time = [269,469]
flag = noshadow
flag2 = invisible

[State 3406, 4]
type = posSet
trigger1 = Time = 0
x = 0
y = -320

[State 3406, 5]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 15

[State 3406, 6]
type = AssertSpecial
trigger1 = time = [400,955]
flag = noshadow
flag2 = invisible

[State 3406, State End]
type = SelfState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 5100
ctrl = 1

;EX Imashime no Bohi - HITL_SHAKE
[Statedef 3412]
type = L
movetype = H
physics = N
velset = 0,0

[State 3412, 1] ;Set default anim
type = VarSet
trigger1 = time = 0
sysvar(2) = ifelse (GetHitVar(yvel) = 0, 5080, 5090)

[State 3412, 2]
type = VarAdd
trigger1 = time = 0
trigger1 = (anim = [5081,5089]) || (anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 3412, 3] ;If 5090 doesn't exist, default to 5030
type = VarSet
trigger1 = time = 0
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 3412, 3] ;Freeze
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 3412, 4]
type = ChangeState
trigger1 = HitShakeOver
value = 3413 ;HITL_SLIDE

;EX Imashime no Bohi - HITL_SLIDE
[Statedef 3413]
type = L
movetype = H
physics = C

[State 3413, 1] ;Don't show hit ground frame
type = VarSet
trigger1 = Time = 0
sysvar(0) = 1

[State 3413, 2] ;In case attacked doesn't finish
type = SelfState
trigger1 = Time = 20
value = 5110

;========================<MAX URBAN LEGEND>=============================
[StateDef 3450]
type = S
physics = S
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

[State 3450, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

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

[State 3450, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 13

[State 3450, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 3450, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 3450, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,20
guard.pauseTime = 12,20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p1stateno = 3451
p2stateno = 3455
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3450, 4]
type = SprPriority
trigger1 = AnimElem = 5
value = 2

[State 3450, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Continue
[Statedef 3451]
type = S
physics = S
movetype = A
ctrl=0
anim = 3451
velset = 3,0
juggle = 5
sprpriority = 1

[State 3451, nhb]
type = nothitby
trigger1 = anim = 3451 && animelemtime(1)>=3 && animelemtime(3)<0
time = 1
value = SCA
ignorehitpause = 1

[State 3451, 1]
type = TargetBind
trigger1 = time = [0,132]
pos = 100, 0

[State 3451, 0]
type = PosSet
trigger1 = time = 0
x = 50*-facing
y = 0
ignorehitpause = 1

[State 3451, 1]
type = PlaySnd
trigger1 = time = 6
value = 193, 0
channel = 1

[State 3451,1]
type = playsnd
trigger1 = time = 39
value = 3000,0

[State 3451, sts]
type = statetypeset
trigger1 = anim = 3451 &&!animelemtime(50)
statetype = A
physics = N

[State 3451, anim]
type = changeanim
trigger1 = anim = 3451 && animelemtime(50)>0
trigger1 = vel y>0 && pos y>=-5
value = 3402
persistent = 0

[State 3451, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = anim=3451&&(animelem=3||animelem=10||animelem=16||animelem=20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifelse((animelem=10),12,4),ifelse((animelem=10),12,4)
guard.pauseTime = 12,20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = ifelse((animelem=19),-4,-7),0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = ifelse((animelem=19),-1,-3),-3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3451, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = anim=3451&&(animelem=26||animelem=30||animelem=35)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -7,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -3, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3451, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 41
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 14,20
guard.pauseTime = 12,20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -8, -3
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -8, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -77
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3451, EnvShake]
type = EnvShake
trigger1 = animelem=3||animelem=10||animelem=15||animelem=20||animelem=26||animelem=30||animelem=35||animelem=41
time = 12
ampl = 6

[State 3451, hitadd]
type = hitadd
trigger1 = animelem=3||animelem=10||animelem=15||animelem=20||animelem=26||animelem=30||animelem=35||animelem=41
value = 1

[State 3451, hitdamage]
type = targetlifeadd
trigger1 = animelem=3||animelem=10||animelem=15||animelem=20||animelem=26||animelem=30||animelem=35||animelem=41
value = -34
kill = 0

[State 3451, hitpower]
type = targetpoweradd
trigger1 = animelem=3||animelem=10||animelem=15||animelem=20||animelem=26||animelem=30||animelem=35||animelem=41
value = 0

[State 3451, hitsnd]
type = playsnd
trigger1 = animelem=3||animelem=10||animelem=15||animelem=20||animelem=26||animelem=30||animelem=35||animelem=41
value = 2,ifelse(Random > 500, 1, 2)

[State 3451, hitsnd]
type = playsnd
trigger1 = animelem=45
value = 2,800

[State 3451, hitsnd]
type = playsnd
trigger1 = time = 155
value = 1500,0

[State 3451, move]
type = playsnd
trigger1 = time = 160
value = 1500,1
channel = 2

[State 3451, move]
type = playsnd
trigger1 = animelem=2||animelem=9||animelem=14||animelem=19||animelem=25||animelem=29||animelem=34||animelem=40
value = 1,ifelse(Random > 500, 1, 4)
channel = 2

[State 3451, Hit Spark]
type = Helper
trigger1 = animelem=3||animelem=10||animelem=15||animelem=20||animelem=26||animelem=30||animelem=35||animelem=41
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = -10+ random%20,-80+ random%20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3451,00]
type = BGPalfx
trigger1 = 1
mul = 0, 0, 0
time = 80
ignorehitpause = 1

[State 3451, 1]
type = TargetBind
trigger1 = time = [132,140]
pos = 28, 0

[State 3451, 15]
type = ChangeState
trigger1 = AnimTime = 0
value = 3452
;ctrl = 1

;Air Kick
[Statedef 3452]
type = S
physics = S
anim = 3402
sprpriority = 1
ctrl = 0

[State 3452, Grapplefx]
type = PlaySnd
trigger1 = time = 30
value = 1500,0

[State 3452, 1]
type = TargetBind
trigger1 = time = [3,5]
pos = 80, 0

[State 3452, T]
type = EnvShake
trigger1 = time = 6
freq = 50
ampl = 2
time = 22
persistent = 1
ignorehitpause = 1

[State 3452, 2]
type = ScreenBound
trigger1 = Animelem = 3,>= 0
value = 0
movecamera = 0,0

[state 3452, AssertSpecial]
type = AssertSpecial
trigger1 = time >= 15
flag = NoShadow

[State 3452, grapplefx]
type = PlaySnd
trigger1 = time = 5
value = 3400,0
channel = 1

[State 3452, hitsnd]
type = playsnd
trigger1 = time = 7
value = 1500,3

[State 3452, capefx]
type = PlaySnd
trigger1 = time = 6
value = 1700,0

[State 3452,sound2]
type = Playsnd
trigger1 = time = 5
value = 52,0
channel = 2

[State 3452, 1]
type = VelSet
trigger1 = Time >= 6
x = .1
y = -7

[State 3452, 1]
type = VelSet
trigger1 = Time >= 10
x = 0
y = -12

[State 3452,00]
type = BGPalfx
trigger1 = 1
mul = 0, 0, 0
time = 10
ignorehitpause = 1

[State 3452, 2]
type = ChangeState
trigger1 = Time >= 55
value = 3453

;Air Kick
[Statedef 3453]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1
poweradd = 0

[State 3453, 2]
type = ScreenBound
trigger1 = Animelem = 3,>= 0
value = 0
movecamera = 0,0

[state 3453, AssertSpecial]
type = AssertSpecial
trigger1 = Animelem = 3,>= 0
flag = NoShadow

[State 3453, Anim]
type = ChangeAnim
trigger1 = 1
postype = P2
value = 3404

[State 3453, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
attr = C, NA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -2
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.2, -3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
p2stateno = 3412
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3453, 1]
type = Sprpriority
trigger1 = 1
value = 5

[State 3453, 1]
type = posSet
trigger1 = Time = 0
x = 0
y = -300

[State 3453, 1]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 15

[State 3453,sound2]
type = Playsnd
trigger1 = time = 18
value = 52,0
channel = 2

[State 3453, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 3453, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 3454

;Jump Back
[Statedef 3454]
type = S
physics = S
anim = 1705
sprpriority = 1
ctrl = 0

[State 3454, pause]
type=pause
trigger1=time=20
time=50
movetime=50
ignorehitpause=1
persistent=0

[State 3454, sparks]
type = explod
trigger1 = time = 0
anim = 8005
ID = 8009
sprpriority = -1
postype = p2
pos = 0,0
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3454,sound2]
type = Playsnd
trigger1 = time = 0
value = 41,0
channel = 2

[State 3454, 0]
type = PosSet
trigger1 = time = 0
x = 5
y = -5

[State 3454, 1]
type = VelSet
trigger1 = Time >= 0
x = 0
y = -2

[State 3454, 1]
type = VelSet
trigger1 = Time >= 6
x = 0
y = 0

[State 3454, 1]
type = VelSet
trigger1 = Time >= 6
x = -3
y = -1

[State 3454, 1]
type = VelSet
trigger1 = Time >= 17
x = -2
y = 4

[State 3454, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 1602

;Opponent Thrown
[Statedef 3455]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 3455, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3455, changeanim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3410

[State 3455, 0]
type = PosSet
trigger1 = time = 0
x = 0
y = 0

[State 3455, 0]
type = PosSet
trigger1 = time = 1
;x = 50
x = 50*-facing
y = 0

[State 3455, 1]
type = TargetBind
trigger1 = time = [0,5]
pos = 44, 0

[State 3455, 1]
type = TargetBind
trigger1 = time = [5,10]
pos = 50, 0

[State 3455, 1]
type = TargetBind
trigger1 = time = [10,132]
pos = 52, 0

[State 3455, 0]
type = PosSet
trigger1 = time = 60
;x = 50
x = 50*-facing
y = 0

[State 3405, 1]
type = Sprpriority
trigger1 = time = [20,25]
value = 4

[State 3455, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3455, 5]
type = AssertSpecial
trigger1 = time = [269,469]
flag = noshadow
flag2 = invisible

[State 3455, changeanim2]
type = ChangeAnim2
trigger1 = time = 160
value = 3411

[State 3455, 1]
type = Sprpriority
trigger1 = time = [132,160]
value = -1

[State 3455, 1]
type = Sprpriority
trigger1 = time = [160,208]
value = 4

[State 3455, 1]
type = TargetBind
trigger1 = time = [160,163]
pos = 0, 0

[State 3455, 1]
type = TargetBind
trigger1 = time = [163,168]
pos = 0, 0

[State 3455, 0]
type = PosSet
trigger1 = time = 166
x = -0*-facing
y = 5

[State 3455, 0]
type = PosSet
trigger1 = time = 168
x = -0*-facing
y = 15

[State 3455, 2]
type = ScreenBound
trigger1 = Time >= 170
value = 0
movecamera = 0,0

[State 3455, 0]
type = PosSet
trigger1 = time = 170
x = -0*-facing
y = 20

[State 3455, 1]
type = VelSet
trigger1 = Time >= 168
x = .1
y = -7

[State 3455, 1]
type = VelSet
trigger1 = Time >= 170
x = 0
y = -12

[State 3455, 5]
type = AssertSpecial
trigger1 = Time >= 168
flag = noshadow

[State 3455, State End]
type = ChangeState
trigger1 = time >= 216
value = 3456

;Opponent Thrown
[Statedef 3456]
type = S
movetype = H
physics = S
velset = 0,0
ctrl = 0

[State 3456, 1]
type = EnvShake
Trigger1 = time = 21
time = 37
ampl = -12
freq = 190
phase = 90

[State 3456, changeanim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3412

[State 3456, 2]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3456, 3]
type = AssertSpecial
trigger1 = time = [269,469]
flag = noshadow
flag2 = invisible

[State 3456, 4]
type = posSet
trigger1 = Time = 0
x = 0
y = -320

[State 3456, 5]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 15

[State 3456, 6]
type = AssertSpecial
trigger1 = time = [400,955]
flag = noshadow
flag2 = invisible

[State 3456, State End]
type = SelfState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 5100
ctrl = 1
