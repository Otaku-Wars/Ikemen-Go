; _________________________________________
;| Superman by varo_hades                  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<LASER VISION>==========================
[StateDef 1000]
type = S
physics = N
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

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
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1000, Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 8
anim = 32707
ID = 1004
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1000, Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 11
anim = 32706
ID = 1004
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1000, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 12
anim = 32703
ID = 1004
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1000, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000,0

[State 1000, 6]
type = PlaySnd
trigger1 = Time = 20
value = 1000,1

[State 1000, 0]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7
helpertype = normal
name = "H_RAY"
id = 1005
postype = p1
pos = 0,0
stateno = 1005
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1000, 0]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 7
helpertype = normal
name = "H_RAY"
id = 1015
postype = p1
pos = 0,0
stateno = 1015
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1000, 0]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helpertype = normal
name = "H_RAY"
id = 1025
postype = p1
pos = 0,0
stateno = 1025
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1000, 8]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;========================<EX LASER VISION>=============================
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1020
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Explod]
type = Explod
trigger1 = animelem = 12
anim = 32703
ID = 1004
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1030, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000,0

[State 1030, 6]
type = PlaySnd
trigger1 = Time = 20
value = 1000,1

[State 1030, 0]
type = Helper
trigger1 = AnimElem = 8
helpertype = normal
name = "H_RAY"
id = 1035
postype = p1
pos = 0,0
stateno = 1035
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1030, 8]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;=====================<AIR LASER VISION>==========================
[StateDef 1050]
type = A
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, Explod]
type = Explod
trigger1 = animelem = 10
anim = 32702
ID = 1050
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1050, 1]
type = VelMul
trigger1 = Time = 0
x = .05
y = .04

[State 1050, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000,0

[State 1050, 6]
type = PlaySnd
trigger1 = Time = 20
value = 1000,1

[State 1050, 0]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal
name = "H_RAY"
id = 1055
postype = p1
pos = 0,0
stateno = 1055
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1050, 8]
type = ChangeState
trigger1 = Pos Y >= 5
trigger1 = Vel Y > 0
trigger1 = AnimTime = 0
value = 52

[State 1050, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<EX AIR LASER VISION>=============================
[StateDef 1080]
type = A
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1080, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1080, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1080, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1080, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1080, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1080, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1080, Explod]
type = Explod
trigger1 = animelem = 10
anim = 32702
ID = 1080
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1080, 1]
type = VelMul
trigger1 = Time = 0
x = .05
y = .04

[State 1080, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000,0

[State 1080, 6]
type = PlaySnd
trigger1 = Time = 20
value = 1000,1

[State 1080, 0]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal
name = "H_RAY"
id = 1085
postype = p1
pos = 0,0
stateno = 1085
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1080, 8]
type = ChangeState
trigger1 = Pos Y >= 5
trigger1 = Vel Y > 0
trigger1 = AnimTime = 0
value = 52

[State 1080, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<DRILL PUNCH>=============================
[StateDef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, 6]
type = PlaySnd
trigger1 = Time = 12
value = 1100,0

[State 1100, 6]
type = PlaySnd
trigger1 = animelem= 5
value = 1100,1;73

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 22, ifElse(var(10), 22, 22)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 22, ifElse(var(10), 22, 22)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = animelem = 8
time = 25
value = SCA
ignorehitpause = 1

[State 1100, 2]
type = Explod
trigger1 = Time = 33
anim = 1105
sprpriority = 3

[State 1100, 6]
type = PlaySnd
trigger1 = Time = 33
value = 1100,2

[State 1100, 3]
type = ChangeState
trigger1 = Animtime = 0
value = 1110

;Attack
[Statedef 1110]
type = A
movetype = A
physics = N
juggle = 1
anim = 1110
poweradd = 0
ctrl = 0

[State 1110, 2]
type = PosAdd
trigger1 = var(10) = 0
trigger1 = AnimElem = 1
x = 100

[State 1110, 2]
type = PosAdd
trigger1 = var(10) = 1
trigger1 = AnimElem = 1
x = 150

[State 1110, 2]
type = PosAdd
trigger1 = var(10) = 2
trigger1 = AnimElem = 1
x = 200

[State 1110, 2]
type = Explod
trigger1 = Time = 1
anim = 1104
sprpriority = 3

[State 1110, 2]
type = VelSet
trigger1 = AnimElem = 5
x = 0
y = -6

[State 1110, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Drill Dust"
posType = P1
ownPal = 1

[State 1110, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
trigger4 = AnimElem = 5
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 29, ifElse(var(10), 27, 25)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 29, ifElse(var(10), 27, 25)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = UP
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1110, 2]
type = VelSet
trigger1 = AnimElem = 6
y = 0.25

[State 1110, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 50
ctrl = 1

;========================<EX DRILL PUNCH>=============================
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, 6]
type = PlaySnd
trigger1 = Time = 12
value = 1100,0

[State 1130, 6]
type = PlaySnd
trigger1 = animelem= 5
value = 1100,1;73

[State 1130, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = animelem = 8
time = 25
value = SCA
ignorehitpause = 1

[State 1130, 2]
type = Explod
trigger1 = Time = 33
anim = 1105
sprpriority = 3

[State 1130, 6]
type = PlaySnd
trigger1 = Time = 33
value = 1100,2

[State 1130, 3]
type = ChangeState
trigger1 = Animtime = 0
value = 1140

;Attack
[Statedef 1140]
type = A
movetype = A
physics = N
juggle = 1
anim = 1110
poweradd = 0
ctrl = 0

[State 1140, 2]
type = PosAdd
trigger1 = AnimElem = 1
x = (p2dist X)

[State 1140, 2]
type = Explod
trigger1 = Time = 1
anim = 1104
sprpriority = 3

[State 1140, 2]
type = VelSet
trigger1 = AnimElem = 5
x = 0
y = -6

[State 1140, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Drill Dust"
posType = P1
ownPal = 1

[State 1140, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
trigger4 = AnimElem = 5
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 31 < 7, 7, fvar(11) * 31)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = UP
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1140, 2]
type = VelSet
trigger1 = AnimElem = 6
y = 0.25

[State 1140, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 50
ctrl = 1

;========================<ICE BREATH>=============================
[StateDef 1200]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, 1]
type = Helper
trigger1 = AnimElem = 7
ID = 1205
pos = 30,-90;25,-88;Mymugensize
postype = p1
facing = 1
stateno = 1205
helpertype = normal
name = "Soplo"
keyctrl = 0
ownpal = 1

[State 1200, 6]
type = PlaySnd
trigger1 = animelem = 6
value = 1200,0

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

;========================<EX ICE BREATH>=============================
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, 1]
type = Helper
trigger1 = AnimElem = 7
ID = 1235
pos = 25,-85 ;30,-90
postype = p1
facing = 1
stateno = 1235
helpertype = normal
name = "Soplo2"
keyctrl = 0
ownpal = 1

[State 1230, 6]
type = PlaySnd
trigger1 = animelem = 6
value = 1200,0

[State 1230, 3]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

;=====================<ANGLED AIR LASER VISION>==========================
[StateDef 1300]
type = A
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, 1]
type = VelMul
trigger1 = Time = 0
x = .06
y = .07

[State 1300, 2]
type = VelAdd
trigger1 = animelemtime(6)>0
y = .04

[State 1300, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000,0

[State 1300, 6]
type = PlaySnd
trigger1 = Time = 20
value = 1000,1

[State 1300, 0]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal
name = "H_RAY"
id = 1305
postype = p1
pos = 0,0
stateno = 1305
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1300, Explod]
type = Explod
trigger1 = animelem = 9
anim = 32704
ID = 1300
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1300, 8]
type = ChangeState
trigger1 = Pos Y >= 5
trigger1 = Vel Y > 0
trigger1 = AnimTime = 0
value = 52

[State 1300, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<EX ANGLED AIR LASER VISION>=============================
[StateDef 1330]
type = A
physics = N
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Explod]
type = Explod
trigger1 = animelem = 9
anim = 32705
ID = 1330
pos = 0,0
postype = p1
bindtime = -1
scale = const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1330, 1]
type = VelMul
trigger1 = Time = 0
x = .06
y = .07

[State 1330, 2]
type = VelAdd
trigger1 = animelemtime(6)>0
y = .04

[State 1330, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1000,0

[State 1330, 6]
type = PlaySnd
trigger1 = Time = 20
value = 1000,1

[State 1330, 0]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal
name = "H_RAY"
id = 1335
postype = p1
pos = 0,0
stateno = 1335
keyctrl = 0
ownpal = 0
sprpriority = 1
priority = 3

[State 1330, 8]
type = ChangeState
trigger1 = Pos Y >= 5
trigger1 = Vel Y > 0
trigger1 = AnimTime = 0
value = 52

[State 1330, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<SLIDE KICK>=============================
[StateDef 1400]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1400, 1]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElem = 3
x = 8

[State 1400, 1]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElem = 3
x = 10

[State 1400, 1]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElem = 3
x = 12

[State 1400, 6]
type = PlaySnd
trigger1 = animelem = 2
value = 1400,0

[State 1400, 3]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
trigger4 = AnimElem = 6
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 24, 22)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 24, 22)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -15
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 1410

;Attack
[Statedef 1410]
type = S
movetype = A
physics = N
velset = 0,0
juggle = 1
anim = 1410
poweradd = 0
ctrl = 0

[State 1410, 6]
type = PlaySnd
trigger1 = Animelem = 2
value = 1400,1

[State 1410, Wind]
type = Explod
trigger1 = animelem = 2
anim = 1405
ID = 1405
pos = 15,0
postype = p1
bindtime = -1
scale = .5,.5;const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1410, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 1
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 24, 22)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 24, 22)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -12
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1410, 6]
Type = Changestate
Trigger1 = Time > 38
Value = 20
Ctrl = 1

;========================<EX SLIDE KICK>=============================
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, 1]
type = VelSet
trigger1 = AnimElem = 3
x = 16

[State 1430, 6]
type = PlaySnd
trigger1 = animelem = 2
value = 1400,0

[State 1430, 3]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
trigger4 = AnimElem = 6
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -15
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, 6]
type = ChangeState
trigger1 = Animtime = 0
value = 1440

;Attack
[Statedef 1440]
type = S
movetype = A
physics = N
velset = 0,0
juggle = 1
anim = 1410
poweradd = 0
ctrl = 0

[State 1440, 6]
type = PlaySnd
trigger1 = Animelem = 2
value = 1400,1

[State 1440, Wind]
type = Explod
trigger1 = animelem = 2
anim = 1405
ID = 1405
pos = 15,0
postype = p1
bindtime = -1
scale = .5,.5;const(size.xscale),Const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1440, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 2
trigger2 = Animelem = 3
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = High
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -12
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1440, 6]
Type = Changestate
Trigger1 = Time > 38
Value = 20
Ctrl = 1

;========================<FLIGHT ATTACK>=============================
[StateDef 1500]
type = S
physics = S
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1500, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1, 2

[State 1500, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1500, 0

[State 1500, 2]
type = Explod
trigger1 = Time = 14
anim = 1505
scale = .7,.7
pos = -20,10
sprpriority = 3

[State 1500, 1st Boom]
type = Explod
trigger1 = Animelem = 6
anim = 1236
pos = 0,-150
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 1500, 2st Boom]
type = Explod
trigger1 = Animelem = 8
anim = 1236
pos = 20,-120
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .4,.4

[State 1500, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, HP
hitFlag = MAFD
guardFlag = HALM
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -10, -3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -10, -3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1500, Change to Fall]
type = ChangeState
trigger1 = AnimTime = 0
value = 1510

;Finish
[Statedef 1510]
type = S
physics = S
ctrl = 0
anim = 47

[State 1510, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 1510, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1510, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1510, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1510, 3]
type = CtrlSet
trigger1 = Time = 1
value = 0

[State 1510, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX FLIGHT ATTACK>=============================
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1530, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1530, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1530, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1530, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1, 2

[State 1530, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1500, 0

[State 1530, 2]
type = Explod
trigger1 = Time = 14
anim = 1505
scale = .7,.7
pos = -20,10
sprpriority = 3

[State 1530, 1st Boom]
type = Explod
trigger1 = Animelem = 6
anim = 1236
pos = 0,-150
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 1530, 2st Boom]
type = Explod
trigger1 = Animelem = 8
anim = 1236
pos = 20,-120
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .4,.4

[State 1530, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = time%9 = 0
attr = S, HP
hitFlag = MAFD
guardFlag = HALM
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -10, -3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -10, -3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1530, Change to Fall]
type = ChangeState
trigger1 = AnimTime = 0
value = 1510

;========================<AIR FLIGHT ATTACK>=============================
[StateDef 1550]
type = A
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1550, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1550, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1550, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1, 2

[State 1550, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1500, 0

[State 1550, 1st Boom]
type = Explod
trigger1 = Animelem = 6
anim = 1236
pos = 0,-150
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 1550, 2st Boom]
type = Explod
trigger1 = Animelem = 8
anim = 1236
pos = 20,-120
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .4,.4

[State 1550, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, HP
hitFlag = MAFD
guardFlag = HALM
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -10, -3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -10, -3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1550, x]
type = PosFreeze
trigger1 = time = [0,15]

[State 1550, y]
type = VelMul
trigger1 = Time > 15
x = .02
y = .05

[State 1550, Change to Fall]
type = ChangeState
trigger1 = AnimTime = 0
value = 1510

;========================<EX AIR FLIGHT ATTACK>=============================
[StateDef 1580]
type = A
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1580, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1580, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1580, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1580, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1580, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1580, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1580, 6]
type = PlaySnd
trigger1 = Time = 0
value = 1, 2

[State 1580, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1500, 0

[State 1580, 1st Boom]
type = Explod
trigger1 = Animelem = 6
anim = 1236
pos = 0,-150
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 1580, 2st Boom]
type = Explod
trigger1 = Animelem = 8
anim = 1236
pos = 20,-120
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .4,.4

[State 1580, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = time%9 = 0
attr = S, HP
hitFlag = MAFD
guardFlag = HALM
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -10, -3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -10, -3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1580, x]
type = PosFreeze
trigger1 = time = [0,15]

[State 1580, y]
type = VelMul
trigger1 = Time > 15
x = .02
y = .05

[State 1580, Change to Fall]
type = ChangeState
trigger1 = AnimTime = 0
value = 1510

;========================<FLY ASSAULT>=============================
[StateDef 1600]
type = A
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1600, flightwind]
type = Explod
trigger1 = Animelem = 3
anim = 1602
pos = 0,15
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7

[State 1600, a4]
type = Velset
trigger1 = animelem = 3
x = -5
y = -6

[State 1600, a5]
type = Veladd
trigger1 = animelem = 3
y = -3

[State 1600, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1600, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1600, 0

[State 1600, 9]
type = ChangeState
trigger1 = time > 25
value = 1601

[State 1600, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;Quick Super Flight Attack
[Statedef 1601]
type = A
movetype = A
physics = N
juggle = 1
anim = 1605
poweradd = 0
ctrl = 0

[State 1601, 1]
type = PosAdd
trigger1 = Time = 0
X = 10
Y = -111

[State 1601, 6]
type = PlaySnd
trigger1 = animelem= 2
value = 1600,1;73

[State 1601, 1]
type = VelSet
trigger1 = Time = 15
X = 8
Y = 8

[State 1601, 2]
type = VelAdd
trigger1 = Time >= 15
X = 1
Y = 1

[State 1601, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAFD
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1601, 8]
type = ChangeState
trigger1 = MoveContact && HitOver = 1
value = 1602

[State 1601, 9]
type = ChangeState
trigger1 = Pos Y >= 0
value = 1605

;Hit
[Statedef 1602]
type = A
movetype = I
physics = N
anim = 1606
velset = -2,-7.2
ctrl = 1

[State 1602, 1]
type = VelAdd
trigger1 = Time >= 5
Y = 0.4

[State 1602, b3 ]
type = PlaySnd
trigger1 = time = 3
value = 1600, 2

[State 1602, 9]
type = ChangeState
trigger1 = Time > 0 && Pos Y >= 0
value = 52

;No Hit!!
[Statedef 1605]
type = C
movetype = I
physics = N
anim = 1607

[State 1605, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1605, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1605, 1]
type = PosSet
trigger1 = Time = 0
Y = 0

[State 1605, 2]
type = VelSet
trigger1 = Time = 0
Y = 0

[State 1605, 3]
type = VelMul
trigger1 = Time >= 0
X = 0 ;0.9<--for sliding effect

[State 1605, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX FLY ASSAUL>=============================
[StateDef 1630]
type = A
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1630, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1630, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1630, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1630, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1630, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, flightwind]
type = Explod
trigger1 = Animelem = 3
anim = 1602
pos = 0,15
postype = p1
sprpriority = 5
supermove = 1
bindtime = 1
scale = .7,.7
ctrl = 0

[State 1630, a4]
type = Velset
trigger1 = animelem = 3
x = -7
y = -7

[State 1630, a5]
type = Veladd
trigger1 = animelem = 3
y = -3

[State 1630, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1630, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1600, 0

[State 1630, 9]
type = ChangeState
trigger1 = time > 25
value = 1631

[State 1630, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;Diagonal Super Flight Attack
[Statedef 1631]
type = A
movetype = A
physics = N
juggle = 1
anim = 1635
poweradd = 0
ctrl = 0

[State 1631, 1]
type = VelSet
trigger1 = Time = 15
X = 9
Y = 9

[State 1631, 2]
type = VelAdd
trigger1 = Time >= 13
X = 1
Y = 1

[State 1631, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1500, 0

[State 1631, 3]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0

[State 1631, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = A, NA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -15
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1631 , a9]
type = ChangeState
trigger1 = Pos Y >= 15
value = 1632

;Attack
[Statedef 1632]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 6

[State 1632, ch]
type = afterimagetime
trigger1 = time = 0
value = 1

[State 1632, ch]
type = ChangeAnim
trigger1 = prevstateno != 9000
trigger1 = time = 0
value = 1636
ctrl = 1

[State 1632, a1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1632, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = Time = 0
attr = C, SA
hitFlag = MAFD
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -8
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1632, Landing Dust Explod]
type = Explod
trigger1 = Time = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1632, b1] ;explod
type = Explod
trigger1 = Time = 7
anim = 1105
postype = p1
pos = 12, 5
sprpriority = -3
removetime = -2
persistent = 0

[State 1632, b1] ;explod
type = Explod
trigger1 = Time = 7
anim = 1675
postype = p1
pos = 12, 5
sprpriority = -3
removetime = -2
persistent = 0

[State 1632, b2]
type = EnvShake
trigger1 = time = 8
time = 35
ampl = -9

[State 1632, b3 ]
type = PlaySnd
trigger1 = time = 4
value = 1, 6

[State 1632, b3 ]
type = PlaySnd
trigger1 = time = 5
value = 1600, 3

[State 1632, b4]
type = ChangeState
trigger1 = AnimTime = 0
value = 1635
ctrl = 1

;Finish
[Statedef 1635];Spring up animation
type = A
movetype = I
physics = N
anim = 1637
ctrl = 0
velset = -2,-7.2

[State 1635, b3 ]
type = PlaySnd
trigger1 = time = 3
value = 1600, 2

[State 1635, 1]
type = VelAdd
trigger1 = Time >= 5
Y = .8;.4
x = -.1

[State 1635, 9]
type = ChangeState
trigger1 = Time > 0 && Pos Y >= 0
value = 52

;========================<AIR FLY ASSAULT>=============================
[StateDef 1650]
type = A
physics = N
moveType = A
anim = 1605
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1650, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1650, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1650, 1]
type = PosAdd
trigger1 = Time = 0
X = 10
Y = -111

[State 1650, 6]
type = PlaySnd
trigger1 = animelem= 2
value = 1600,0;73

[State 1650, 1]
type = VelSet
trigger1 = Time = 15
X = 8
Y = 8

[State 1650, 2]
type = VelAdd
trigger1 = Time >= 15
X = 1
Y = 1

[State 1650, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAFD
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1650, 8]
type = ChangeState
trigger1 = MoveContact && HitOver = 1
value = 1602

[State 1650, 9]
type = ChangeState
trigger1 = Pos Y >= 0
value = 1605

;========================<EX AIR FLY ASSAUL>=============================
[StateDef 1680]
type = A
physics = N
moveType = A
anim = 1635
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1680, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1680, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1680, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1680, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1680, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1680, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1680, 1]
type = VelSet
trigger1 = Time = 15
X = 9
Y = 9

[State 1680, 2]
type = VelAdd
trigger1 = Time >= 13
X = 1
Y = 1

[State 1680, 6]
type = PlaySnd
trigger1 = Animelem = 1
value = 1500, 0

[State 1680, 3]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0

[State 1680, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = A, NA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.2, -3.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -15
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1680 , a9]
type = ChangeState
trigger1 = Pos Y >= 15
value = 1632

;========================<PUNCH ZERO COUNTER>=============================
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<KICK ZERO COUNTER>=============================
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 196), var(36) := 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
