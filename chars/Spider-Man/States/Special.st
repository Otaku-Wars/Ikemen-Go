; _________________________________________
;| Spiderman by varo_hades                 |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<WEB SHOT>==========================
[StateDef 1000]
type = S
physics = S
moveType = I
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

[State 1000, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1000, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,1

[State 1000, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 1
value = 1000,0

[State 1000, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 0
value = 11000,0

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1005
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1015
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1025
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX WEB SHOT>=============================
[StateDef 1030]
type = S
physics = S
moveType = I
anim = 1000
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
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1030, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,1

[State 1030, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 1
value = 1000,0

[State 1030, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 0
value = 11000,0

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1035
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=====================<AIR WEB SHOT>==========================
[StateDef 1050]
type = A
physics = A
moveType = I
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

[State 1050, ChangeAnim]
type = Velset
trigger1 = !Time
x = -1
y = ifElse(var(10) = 2, -5, ifElse(var(10) = 1, -4, -3))

[State 1050, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,1

[State 1050, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 1
value = 1000,0

[State 1050, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 0
value = 11000,0

[State 1050, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1055
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1050, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1065
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1050, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1075
ID = 1005
name = "Web Shot Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

;========================<EX AIR WEB SHOT>=============================
[StateDef 1080]
type = A
physics = A
moveType = I
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
pos = ceil(0 * const(size.xScale)), ceil(-90 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1080, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1080, ChangeAnim]
type = Velset
trigger1 = !Time
x = -1
y = -6

[State 1080, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,1

[State 1080, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 1
value = 1000,0

[State 1080, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 0
value = 11000,0

[State 1080, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1085
ID = 1005
name = "EX Web Shot Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

;========================<WEB BALL>=============================
[StateDef 1100]
type = S
physics = S
moveType = A
anim = 1000
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

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1100, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1100, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,1

[State 1100, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 1
value = 1000,0

[State 1100, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 0
value = 11000,0

[State 1100, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1105
ID = 1105
name = "Web Shot Projectile"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1100, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX WEB BALL>=============================
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1130, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,1

[State 1130, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 1
value = 1000,0

[State 1130, ]
type = PlaySnd
trigger1 = animelem = 5 && var(41) != 0
value = 11000,0

[State 1130, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1135
ID = 1105
name = "Web Shot Projectile"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1130, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1130, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<WALL CLING>=============================
[statedef 1200]
type = A
movetype = I
physics = A
anim = 1200
velset = 0,0
ctrl = 0

[State 1200, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 1

[State 1200, ]
type = PosFreeze
triggerall = Stateno = 1200
trigger1 = BackEdgeBodyDist < 2

[State 1200, ]
type = PlayerPush
trigger1 = Stateno = 1200
value = 0

[State 1200, ]
type = VelSet
trigger1 = BackEdgeBodyDist > 1
x = -5

[State 1200, ]
type = ScreenBound
trigger1 = Stateno = 1200
trigger1 = Pos Y > -180
movecamera = 1,0

[State 1200, ]
type = ChangeState
trigger1 = command != "holdfwd"
trigger2 = command = "holdback"
trigger2 = command != "holdfwd"
trigger3 = time >= 10
value = 1201

;Jump
[Statedef 1201]
type = A
movetype = I
physics = A
anim = 1201
velset = 4,-10
ctrl = 1

[State 1201, HitSound]
type = PlaySnd
trigger1 = Animelem = 2
value = 40,0

[State 1201, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 1

[State 1201, ]
type = PosSet
trigger1 = Pos Y >= 0
y = 0

[State 1201, ]
type = ChangeState
trigger1 = Pos Y >= 0
value = 52

;========================<WALL CLING>=============================
[Statedef 1210]
type = A
movetype = I
physics = N
anim = 1200
velset = 0,0
ctrl = 0

[State 1210, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 1

[State 1210, ]
type = Turn
trigger1 = time = 0

[State 1210, ]
type = PosFreeze
triggerall = Stateno = 1210
trigger1 = BackEdgeBodyDist < 2

[State 1210, ]
type = PlayerPush
trigger1 = Stateno = 1210
value = 0

[State 1210, ]
type = VelSet
trigger1 = BackEdgeBodyDist > 1
x = -5

[State 1210, ]
type = ScreenBound
trigger1 = Stateno = 1210
trigger1 = Pos Y > -180
movecamera = 1,0

[State 1210, ]
type = ChangeState
triggerall = time >= 1
trigger1 = command != "holdfwd"
trigger2 = command = "holdback"
trigger2 = command != "holdfwd"
trigger3 = time >= 10
value = 1201

;=====================<WEB SWING>==========================
[StateDef 1300]
type = A
physics = A
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
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(var(10) = 2, 3, ifElse(var(10) = 1, 2, 1))
y = ifElse(var(10) = 2, -15, ifElse(var(10) = 1, -10, -5))

[State 1300, ]
type = Width
trigger1 = time = [0,10]
edge = 50,10
player = 10,0

[State 1300, ]
type = PosFreeze
triggerall = var(10) = 0
trigger1 = time <= 54
value = 1

[State 1300, ]
type = PlayerPush
triggerall = var(10) = 0
trigger1 = time <= 54
value = 0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = animelem = 4 && var(41) != 1
value = S1300,0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = animelem = 4 && var(41) != 0
value = S11300,0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = animelem = 8
value = S1,5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = time = 0
y = -5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = animelem = 8
x = 3

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = animelem = 9
trigger2 = animelem = 10
trigger3 = animelem = 11
x = 5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = animelem = 12
trigger2 = animelem = 20
trigger3 = animelem = 21
trigger4 = animelem = 24
x = 10

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = animelem = 13
trigger2 = animelem = 26
x = 8

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = animelem = 14
trigger2 = animelem = 15
x = 9

[State 1300, ]
type = PosAdd
triggerall = var(10) = 0
trigger1 = animelem = 16
trigger2 = animelem = 17
trigger3 = animelem = 18
trigger4 = animelem = 19
trigger5 = animelem = 22
trigger6 = animelem = 23
trigger7 = animelem = 25
x = 12

[State 1300, ]
type = PosFreeze
triggerall = var(10) = 1
trigger1 = time <= 60
value = 1

[State 1300, ]
type = PlayerPush
triggerall = var(10) = 1
trigger1 = time <= 60
value = 0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = animelem = 6 && var(41) != 1
value = S1300,0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = animelem = 6 && var(41) != 0
value = S11300,0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = animelem = 11
value = S1,5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = time = 0
y = -5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 9
trigger2 = animelem = 13
trigger3 = animelem = 14
trigger4 = animelem = 29
x = 4

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 10
x = 3

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 11
trigger2 = animelem = 12
x = 5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 15
trigger2 = animelem = 16
x = 7

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 17
x = 9

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 18
x = 24

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 19
x = 16

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 20
trigger2 = animelem = 22
trigger3 = animelem = 24
trigger4 = animelem = 25
x = 12

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 21
x = 14

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 23
x = 10

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 26
x = 35

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 27
x = 6

[State 1300, ]
type = PosAdd
triggerall = var(10) = 1
trigger1 = animelem = 28
x = 8

[State 1300, ]
type = PosFreeze
triggerall = var(10) = 2
trigger1 = time <= 62
value = 1

[State 1300, ]
type = PlayerPush
triggerall = var(10) = 2
trigger1 = time <= 62
value = 0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = animelem = 7 && var(41) != 1
value = S1300,0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = animelem = 7 && var(41) != 0
value = S11300,0

[State 1300, ]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = animelem = 9
value = S1,5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = time = 0
y = -5

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 8
trigger2 = animelem = 13
trigger3 = animelem = 28
trigger4 = animelem = 30
x = 6

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 9
x = 10

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 10
trigger2 = animelem = 11
x = 4

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 12
x = 7

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 14
trigger2 = animelem = 15
trigger3 = animelem = 20
trigger4 = animelem = 21
trigger5 = animelem = 23
trigger6 = animelem = 26
x = 12

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 16
x = 11

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 17
trigger2 = animelem = 18
x = 16

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 19
trigger2 = animelem = 22
x = 14

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 24
x = 18

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 25
trigger2 = animelem = 27
x = 9

[State 1300, ]
type = PosAdd
triggerall = var(10) = 2
trigger1 = animelem = 29
x = 8

[State 1300, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = movecontact = 0
attr = A, SA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 130, ifElse(var(10), 120, 110)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 130, ifElse(var(10), 120, 110)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Medium
air.animType = Medium
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -4
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2stateno = 1350

[State 1300, ]
type = Explod
triggerall = var(10) = 0
trigger1 = animelem = 28
anim = 1301

[State 1300, ]
type = VelSet
triggerall = var(10) = 0
trigger1 = animelem = 28
x = 3
y = -3

[State 1300, ]
type = Explod
triggerall = var(10) = 1
trigger1 = animelem = 31
anim = 1311

[State 1300, ]
type = VelSet
triggerall = var(10) = 1
trigger1 = animelem = 31
x = 3
y = -7

[State 1300, ]
type = Explod
triggerall = var(10) = 2
trigger1 = animelem = 32
anim = 1321

[State 1300, ]
type = VelSet
triggerall = var(10) = 2
trigger1 = animelem = 32
x = 3
y = -9

[State 1300, end]
type = ChangeState
trigger1 = frontedgedist <= 0
trigger2 = AnimTime = 0
value = 1305;ifelse(var(25),701,1305)
ctrl = 0;ifelse((!var(20)||var(25)),1,0)

[Statedef 1302]
type = A
movetype = H
physics = A
ctrl = 0
sprpriority = 0

[State 1302, VelAdd]
type = VelAdd
trigger1 = time = 0
x = -4
y = -6

[State 1302, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
value = 5030
ignorehitpause = 1

[State 1302, SelfState]
type = SelfState
trigger1 = time = 2
value = 5030

;Finish
[statedef 1305]
type = A
movetype = A
physics = A
anim = 46
velset = 3,-8
ctrl = 0

[State 1305, ]
type = ChangeState
trigger1 = pos y >= 0
value = 52

;Player 2
[statedef 1350]
type = A
movetype = H
physics = N
ctrl = 0

[State 1350, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 1350, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5010
ignorehitpause = 1
persistent = 0

[State 1350, ChangeAnim]
type = ChangeState
trigger1 = hitshakeover
trigger2 = time >= 5
value = 1351
ignorehitpause = 0
persistent = 0

;Player 2
[Statedef 1351]
type = A
movetype = H
physics = N
ctrl = 0

[State 1351, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5030
ignorehitpause = 1
persistent = 0

[State 1351, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 1351, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 1351, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5030 && vel y >= 0
value = 5061
ignorehitpause = 1
persistent = 0

[State 1351, ChangeState]
type = ChangeState
triggerall = vel y< 0
trigger1 = backedgedist <= 5
trigger2 = frontedgedist <= 5
value = 1352
ctrl = 0

[State 1351, ChangeState]
type = SelfState
trigger1 = pos y >= 0 && vel y > 0
value = 5101
ctrl = 0

;Player 2
[statedef 1352]
type = A
movetype = H
physics = N
facep2 = 1
vel = 0,0
ctrl = 0

[State 1352, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 75
ampl = -8
phase = 90
ignorehitpause = 1
persistent = 0

[State 1352, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 1352, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 1352, Gravity]
type = Gravity
trigger1 = pos y < 0

[State 1352, PosFreeze]
type = PosFreeze
trigger1 = time = 0
value = 6
ignorehitpause = 1
persistent = 1

[State 1352, VelSet]
type = VelSet
trigger1 = time = 0
x = 2
y = -4
ignorehitpause = 1
persistent = 1

[State 1352, Explod]
type = Explod
trigger1 = time = 1
anim = f71
pos = -(backedgedist),const(size.mid.pos.y)
facing = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 1352, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5010
ignorehitpause = 1
persistent = 0

[State 1352, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5010 && time = 5
value = 5030
ignorehitpause = 1
persistent = 0

[State 1352, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5030 && vel y >= 0
value = 5061
ignorehitpause = 1
persistent = 0

[State 1352, ChangeState]
type = SelfState
trigger1 = pos y >= 0 && vel y > 0
value = 5101
ctrl = 0

;========================<EX WEB SWING>=============================
[StateDef 1330]
type = A
physics = A
moveType = A
anim = 1320
ctrl = 0
velSet = 3,-15
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 131

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, ]
type = Width
trigger1 = time = [0,10]
edge = 50,10
player = 10,0

[State 1330, ]
type = PosFreeze
trigger1 = time <= 62
value = 1

[State 1330, ]
type = PlayerPush
trigger1 = time <= 62
value = 0

[State 1330, ]
type = PlaySnd
trigger1 = animelem = 7 && var(41) != 1
value = S1300,0

[State 1330, ]
type = PlaySnd
trigger1 = animelem = 7 && var(41) != 0
value = S11300,0

[State 1330, ]
type = PlaySnd
trigger1 = animelem = 9
value = S1,5

[State 1330, ]
type = PosAdd
trigger1 = time = 0
y = -5

[State 1330, ]
type = PosAdd
trigger1 = animelem = 8
trigger2 = animelem = 13
trigger3 = animelem = 28
trigger4 = animelem = 30
x = 6

[State 1330, ]
type = PosAdd
trigger1 = animelem = 9
x = 10

[State 1330, ]
type = PosAdd
trigger1 = animelem = 10
trigger2 = animelem = 11
x = 4

[State 1330, ]
type = PosAdd
trigger1 = animelem = 12
x = 7

[State 1330, ]
type = PosAdd
trigger1 = animelem = 14
trigger2 = animelem = 15
trigger3 = animelem = 20
trigger4 = animelem = 21
trigger5 = animelem = 23
trigger6 = animelem = 26
x = 12

[State 1330, ]
type = PosAdd
trigger1 = animelem = 16
x = 11

[State 1330, ]
type = PosAdd
trigger1 = animelem = 17
trigger2 = animelem = 18
x = 16

[State 1330, ]
type = PosAdd
trigger1 = animelem = 19
trigger2 = animelem = 22
x = 14

[State 1330, ]
type = PosAdd
trigger1 = animelem = 24
x = 18

[State 1330, ]
type = PosAdd
trigger1 = animelem = 25
trigger2 = animelem = 27
x = 9

[State 1330, ]
type = PosAdd
trigger1 = animelem = 29
x = 8

[State 1330, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = time%6 = 0
attr = A, SA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Medium
air.animType = Medium
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -4
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2stateno = 1350

[State 1330, ]
type = Explod
trigger1 = animelem = 32
anim = 1321

[State 1330, ]
type = VelSet
trigger1 = animelem = 32
x = 3
y = -9

[State 1330, end]
type = ChangeState
trigger1 = frontedgedist <= 0
trigger2 = AnimTime = 0
value = 1305;ifelse(var(25),701,1305)
ctrl = 0;ifelse((!var(20)||var(25)),1,0)

;=====================<SPIDER STING>==========================
[StateDef 1400]
type = A
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Spider Sting Dust"
posType = P1
ownPal = 1

[State 1400, Helper]
type = Helper
trigger1 = anim = 1400 && AnimElem = 3 && var(41) != 0
stateno = 7000
size.xscale= .15 * const(size.xscale)
size.yscale= .20 * const(size.yscale)
ownpal = 1

[State 1400, ]
type = PosSet
trigger1 = time = 0
y = 0
ignorehitpause = 1

[State 1400, VelSet]
type = VelSet
trigger1 = time <= 6
y = 0
ignorehitpause = 1
persistent = 1

[State 1400, PosAdd]
type = PosAdd
trigger1 = time = 7
y = -2
ignorehitpause = 1
persistent = 0

[State 1400, ]
type = VelSet
trigger1 = animelem = 3
trigger2 = time > 6
x = ifElse(var(10) = 2, 12, ifElse(var(10) = 1, 10, 8))
y = ifElse(var(10) = 2, -12, ifElse(var(10) = 1, -9, -8))
ignorehitpause = 1
persistent = 0

[State 1400, ]
type = VelAdd
trigger1 = time > 10 && vel x > 0
x = -1

[State 1400, ]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 1400, Gravity]
type = StateTypeSet
trigger1 = animelem = 3
trigger2 = vel y != 0
trigger3 = vel y !=  0 && pos y <= 0
trigger4 = pos y != 0
trigger5 = time > 6
statetype = A
physics = A
ignorehitpause = 0

[State 1400, ]
type = PlaySnd
trigger1 = animelem = 2
value = S1,2

[State 1400, ]
type = PlaySnd
trigger1 = animelem = 2 && var(41) != 1
value = S1400,0

[State 1400, ]
type = PlaySnd
trigger1 = animelem = 2 && var(41) != 0
value = S11400,0

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = movecontact = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 65, ifElse(var(10), 60, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 65, ifElse(var(10), 60, 55)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, ifElse(var(10) = 2, -10, ifElse(var(10) = 1, -8, -6))
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.25, -4
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, ]
type = ChangeState
triggerall = hitcount = 1 && time >= 12 && vel y = [-3,3]
trigger1 = command = "x"
trigger2 = command = "y"
trigger3 = command = "z"
trigger4 = AILevel && random <=250
value = 1425

[State 1400, StateTypeSet]
type = Changestate
trigger1 = vel y > 0 && pos y > 0
value = 52
persistent = 1

;Finish
[statedef 1425]
type = A
movetype = A
physics = A
anim = 1405
velset = 0,-1
ctrl = 0

[State 1425, Helper]
type = Helper
trigger1 = anim = 1405 && AnimElem = 3 && var(41) != 0
stateno = 7001
size.xscale= .20 * const(size.xscale)
size.yscale= .25 * const(size.yscale)
ownpal = 1

[State 1425, ]
type = PosFreeze
trigger1 = time <= 12
value = 1

[State 1425, ]
type = PlaySnd
trigger1 = animelem = 3
value = 1,2

[State 1425, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = movehit = 0
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 65, ifElse(var(10), 60, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 65, ifElse(var(10), 60, 55)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, 6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2, 14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1425, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = movecontact = 0
trigger1 = animelem = 4
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 65, ifElse(var(10), 60, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 65, ifElse(var(10), 60, 55)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, 6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2, 14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1425, ]
type = ChangeState
trigger1 = animtime = 0
value = 50
ctrl = 0

;========================<EX SPIDER STING>=============================
[StateDef 1430]
type = A
physics = N
moveType = A
anim = 1430
ctrl = 0
velSet = 3,-15
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Spider Sting Dust"
posType = P1
ownPal = 1

[State 1430, Helper]
type = Helper
trigger1 = anim = 1430 && AnimElem = 3 && var(41) != 0
stateno = 7000
size.xscale= .15 * const(size.xscale)
size.yscale= .20 * const(size.yscale)
ownpal = 1

[State 1425, Helper]
type = Helper
trigger1 = anim = 1430 && AnimElem = 11 && var(41) != 0
stateno = 7001
size.xscale= .20 * const(size.xscale)
size.yscale= .25 * const(size.yscale)
ownpal = 1

[State 1430, ]
type = PosSet
trigger1 = time = 0
y = 0
ignorehitpause = 1

[State 1430, VelSet]
type = VelSet
trigger1 = time <= 6
y = 0
ignorehitpause = 1
persistent = 1

[State 1430, PosAdd]
type = PosAdd
trigger1 = time = 7
y = -2
ignorehitpause = 1
persistent = 0

[State 1430, ]
type = VelSet
trigger1 = animelem = 3
trigger2 = time > 6
x = 12
y = -12
ignorehitpause = 1
persistent = 0

[State 1430, ]
type = VelAdd
trigger1 = time > 10 && vel x > 0
x = -1

[State 1430, ]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 1430, Gravity]
type = StateTypeSet
trigger1 = animelem = 3
trigger2 = vel y != 0
trigger3 = vel y !=  0 && pos y <= 0
trigger4 = pos y != 0
trigger5 = time > 6
statetype = A
physics = A
ignorehitpause = 0

[State 1430, ]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 11
value = S1,2

[State 1430, ]
type = PlaySnd
trigger1 = animelem = 2 && var(41) != 1
value = S1400,0

[State 1430, ]
type = PlaySnd
trigger1 = animelem = 2 && var(41) != 0
value = S11400,0

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.25, -6
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.25, -6
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 4
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.25, -6
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 5
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.25, -6
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = animelem = 11
attr = A, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, 6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2, 14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, StateTypeSet]
type = Changestate
trigger1 = vel y > 0 && pos y > 0
value = 52
persistent = 1

;=====================<WEB THROW>==========================
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1500, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = 1500,0

[State 1500, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = 11500,0

[State 1500, ]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1

[State 1500, ]
type = HitDef
trigger1 = animelem = 4
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1501
p2stateno = 1508

[State 1500, ]
type = HitDef
trigger1 = animelem = 5
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1502
p2stateno = 1508

[State 1500, ]
type = HitDef
trigger1 = animelem = 6
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
guard.dist = 200
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1503
p2stateno = 1508

[State 1500, ]
type = HitDef
trigger1 = animelem = 7
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
guard.dist = 230
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1504
p2stateno = 1508

[State 1500, ]
type = HitDef
trigger1 = animelem = 8
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
guard.dist = 250
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1505
p2stateno = 1508

[State 1500, ]
type = Helper
trigger1 = animelem = 9
trigger1 = moveguarded = 0
helpertype = normal
name = "web-line"
ID = 1005
pos = 230,-52
postype = p1
facing = 1
stateno = 1506
ownpal = 1

[State 1500, ]
type = ChangeAnim
trigger1 = moveguarded = 1
value = 1500
elem = 9
ignorehitpause = 1
persistent = 0

[State 1500, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Throw
[statedef 1501]
type = S
movetype = A
physics = S
anim = 1501
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1501, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1501, ]
type = TargetBind
trigger1 = stateno = 1501
time = 1
pos = floor(-115*const(size.xscale)),-55

[State 1501, ]
type = ChangeState
trigger1 = animtime = 0
value = 1502

;Throw
[statedef 1502]
type = S
movetype = A
physics = S
anim = 1502
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1502, ]
type = TargetBind
trigger1 = stateno = 1502
time = 1
pos = floor(175*const(size.xscale)),-55

[State 1502, ]
type = ChangeState
trigger1 = animtime = 0
value = 1503

;Throw
[statedef 1503]
type = S
movetype = A
physics = S
anim = 1503
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1503, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1503, ]
type = TargetBind
trigger1 = stateno = 1503
time = 1
pos = floor(215*const(size.xscale)),-55

[State 1503, ]
type = ChangeState
trigger1 = animtime = 0
value = 1504

;Throw
[statedef 1504]
type = S
movetype = A
physics = S
anim = 1504
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1504, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1504, ]
type = TargetBind
trigger1 = stateno = 1504
time = 1
pos = floor(230*const(size.xscale)),-55

[State 1504, ]
type = ChangeState
trigger1 = animtime = 0
value = 1505

;Throw
[statedef 1505]
type = S
movetype = A
physics = S
anim = 1505
velset = 0,0
sprpriority = -1
ctrl = 0

[State 1505, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1505, Width]
type = Width
trigger1 = time >= 0
edge = ifelse(time>=10,60,100),ifelse(time<=24,20,ifelse(time <=28,60,130))

[State 1505, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1

[State 1505, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2

[State 1505, ]
type = PlaySnd
trigger1 = animelem = 12
value = S1,5

[State 1505, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 1
value = 4,4
channel = 1
lowpriority = 1

[State 1505, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 0
value = 10004,4
channel = 1
lowpriority = 1

[State 1505, ]
type = TargetFacing
trigger1 = animelem = 1
trigger2 = animelem = 11
value = 1

[State 1505, ]
type = TargetFacing
trigger1 = animelem = 7
value = -1

[State 1505, ]
type = SprPriority
trigger1 = animelem = 9
value = 1

[State 1505, ]
type = SprPriority
trigger1 = animelem = 13
value = -1

[State 1505, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(240*const(size.xscale)),-55

[State 1505, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = floor(220*const(size.xscale)),-60

[State 1505, ]
type = TargetBind
trigger1 = animelem = 3
time = 4
pos = floor(195*const(size.xscale)),-75

[State 1505, ]
type = TargetBind
trigger1 = animelem = 4
time = 4
pos = floor(180*const(size.xscale)),-85

[State 1505, ]
type = TargetBind
trigger1 = animelem = 5
time = 4
pos = floor(105*const(size.xscale)),-80

[State 1505, ]
type = TargetBind
trigger1 = animelem = 6
time = 4
pos = floor(25*const(size.xscale)),-80

[State 1505, ]
type = TargetBind
trigger1 = animelem = 7
time = 4
pos = floor(-105*const(size.xscale)),-80

[State 1505, ]
type = TargetBind
trigger1 = animelem = 8
time = 4
pos = floor(-155*const(size.xscale)),-95

[State 1505, ]
type = TargetBind
trigger1 = animelem = 9
time = 4
pos = floor(-110*const(size.xscale)),-110

[State 1505, ]
type = TargetBind
trigger1 = animelem = 10
time = 4
pos = floor(-5*const(size.xscale)),-120

[State 1505, ]
type = TargetBind
trigger1 = animelem = 11
time = 4
pos = floor(35*const(size.xscale)),-95

[State 1505, ]
type = TargetBind
trigger1 = animelem = 12
time = 4
pos = floor(140*const(size.xscale)),-80

[State 1505, ]
type = TargetBind
trigger1 = animelem = 13
time = 4
pos = floor(150*const(size.xscale)),-60

[State 1505, ]
type = TargetBind
trigger1 = animelem = 14
time = 4
pos = floor(20*const(size.xscale)),-45

[State 1505, ]
type = TargetBind
trigger1 = animelem = 15
time = 4
pos = floor(-140*const(size.xscale)),-45

[State 1505, ]
type = TargetLifeAdd
trigger1 = animelem = 16
value = -120

[State 1505, ]
type = TargetState
trigger1 = animelem = 16
value = 1509

[State 1505, ]
type = TargetDrop
trigger1 = animelem = 16

[State 1505, ]
type = Turn
trigger1 = animelem = 17

[State 1505, ]
type = ScreenBound
trigger1 = time >= 64
value = 0

[State 1505, ]
type = ChangeState
trigger1 = backedgedist <= -20
trigger1 = animtime = 0
value = 101
ctrl = 1

[State 1505, ChangeAnim2]
type = ChangeAnim
trigger1 = backedgedist > 0 && time >= 75
value = 1505
elem = 22
ignorehitpause = 1
persistent = 0

[State 1505, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Web
[Statedef 1506]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1506
velset = 7,0
sprpriority = 5

[State 1506, ]
type = Nothitby
trigger1 = stateno = 1506
value = SCA,NA,SA,HA,NT,ST,HT

[State 1506, ]
type = HitBy
trigger1 = stateno = 1506
value = SCA,NP,SP,HP
time = 10

[State 1506, ]
type = HitOverride
trigger1 = stateno = 1506
slot = 1
time = 1
stateno = 1507
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1506, ]
type = ScreenBound
trigger1 = stateno = 1506
value = 0

[State 1506, ]
type = VelSet
trigger1 = stateno = 1506
x = 6
y = 0

[State 1506, ]
type = AfterImage
trigger1 = time = 0
time = 999
length = 3
framegap = 1
palcolor = 38
trans = Add

[State 1506, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1506, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1506, ]
type = HitDef
trigger1 = stateno = 1506
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = light
ground.type = high
air.type = low
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
pausetime = 0,8
guard.pausetime = 4,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.slidetime = 25
guard.slidetime = 25
ground.hittime = 25
guard.hittime = 25
air.hittime = 25
ground.velocity = -1
guard.velocity = -3
air.velocity = -1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36

[State 1506, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1506, HitSpark]
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

[State 1506, ]
type = DestroySelf
trigger1 = frontedgedist <= -200

[State 1506, ]
type = Changestate
trigger1 = movehit = 1
trigger2 = movecontact = 1
trigger3 = time = 30
value = 1507

;Finish
[Statedef 1507]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1507
velset = 0,0
sprpriority = 5

[State 1507, ]
type = AfterImageTime
trigger1 = time = 0
time = 10

[State 1507, ]
type = DestroySelf
trigger1 = animtime = 0

;Player 2
[Statedef 1508]
type = A
movetype = H
physics = A
ctrl = 0
anim = 5000
velset = 0,0
sprpriority = 0

[State 1508, ]
type = ScreenBound
trigger1 = stateno = 1508
value = 0
movecamera = 1,0

[State 1508, ]
type = ChangeAnim2
trigger1 = time = 0
value = 1508

;Player 2
[Statedef 1509]
type = A
movetype = H
physics = A
ctrl = 0
anim = 5030
velset = -10,-1.25
sprpriority = 0

[State 1509, ]
type = ChangeAnim2
trigger1 = time = 0
value = 5030

[State 1509, ]
type = SelfState
trigger1 = time >= 1
value = 5050

;=====================<WEB THROW>==========================
[StateDef 1510]
type = S
physics = S
moveType = A
anim = 1510
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1510, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1510, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1510, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1510, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = 1500,0

[State 1510, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = 11500,0

[State 1510, ]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1

[State 1510, ]
type = HitDef
trigger1 = animelem = 4
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -85
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1511
p2stateno = 1508

[State 1510, ]
type = HitDef
trigger1 = animelem = 5
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -110
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1512
p2stateno = 1508

[State 1510, ]
type = HitDef
trigger1 = animelem = 6
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -140
guard.dist = 200
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1513
p2stateno = 1508

[State 1510, ]
type = HitDef
trigger1 = animelem = 7
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -165
guard.dist = 230
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1514
p2stateno = 1508

[State 1510, ]
type = HitDef
trigger1 = animelem = 8
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -190
guard.dist = 250
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1515
p2stateno = 1508

[State 1510, ]
type = Helper
trigger1 = animelem = 9
trigger1 = moveguarded = 0
helpertype = normal
name = "web-line"
ID = 1005
pos = floor(190*const(size.xscale)),-190
postype = p1
facing = 1
stateno = 1516
ownpal = 1

[State 1510, ]
type = ChangeAnim
trigger1 = moveguarded = 1
value = 1510
elem = 9
ignorehitpause = 1
persistent = 0

[State 1510, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Throw
[statedef 1511]
type = S
movetype = A
physics = S
anim = 1511
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1511, ]
type = TargetBind
trigger1 = stateno = 1511
time = 1
pos = floor(95*const(size.xscale)),-110

[State 1511, ]
type = ChangeState
trigger1 = animtime = 0
value = 1512

;Throw
[statedef 1512]
type = S
movetype = A
physics = S
anim = 1512
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1512, ]
type = TargetBind
trigger1 = stateno = 1512
time = 1
pos = floor(130*const(size.xscale)),-140

[State 1512, ]
type = ChangeState
trigger1 = animtime = 0
value = 1513

;Throw
[statedef 1513]
type = S
movetype = A
physics = S
anim = 1513
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1513, ]
type = TargetBind
trigger1 = stateno = 1513
time = 1
pos = floor(150*const(size.xscale)),-160

[State 1513, ]
type = ChangeState
trigger1 = animtime = 0
value = 1514

;Throw
[statedef 1514]
type = S
movetype = A
physics = S
anim = 1514
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1514, ]
type = TargetBind
trigger1 = stateno = 1514
time = 1
pos = floor(175*const(size.xscale)),-175

[State 1514, ]
type = ChangeState
trigger1 = animtime = 0
value = 1515

;Throw
[statedef 1515]
type = S
movetype = A
physics = S
anim = 1515
velset = 0,0
sprpriority = -1
ctrl = 0

[State 1515, Width]
type = Width
trigger1 = time >= 0
edge = ifelse(time>=10,60,100),ifelse(time<=25,20,ifelse(time >=28,100,60))

[State 1515, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1

[State 1515, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2

[State 1515, ]
type = PlaySnd
trigger1 = animelem = 12
value = S1,5

[State 1515, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 1
value = 4,2
channel = 1
lowpriority = 1

[State 1515, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 0
value = 10004,2
channel = 1
lowpriority = 1

[State 1515, ]
type = TargetFacing
trigger1 = animelem = 1
trigger2 = animelem = 11
value = 1

[State 1515, ]
type = TargetFacing
trigger1 = animelem = 7
value = -1

[State 1515, ]
type = SprPriority
trigger1 = animelem = 9
value = 1

[State 1515, ]
type = SprPriority
trigger1 = animelem = 13
value = -1

[State 1515, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(175*const(size.xscale)),-170

[State 1515, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = floor(160*const(size.xscale)),-160

[State 1515, ]
type = TargetBind
trigger1 = animelem = 3
time = 4
pos = floor(150*const(size.xscale)),-135

[State 1515, ]
type = TargetBind
trigger1 = animelem = 4
time = 4
pos = floor(145*const(size.xscale)),-120

[State 1515, ]
type = TargetBind
trigger1 = animelem = 5
time = 4
pos = floor(105*const(size.xscale)),-80

[State 1515, ]
type = TargetBind
trigger1 = animelem = 6
time = 4
pos = floor(25*const(size.xscale)),-80

[State 1515, ]
type = TargetBind
trigger1 = animelem = 7
time = 4
pos = floor(-105*const(size.xscale)),-80

[State 1515, ]
type = TargetBind
trigger1 = animelem = 8
time = 4
pos = floor(-155*const(size.xscale)),-95

[State 1515, ]
type = TargetBind
trigger1 = animelem = 9
time = 4
pos = floor(-110*const(size.xscale)),-110

[State 1515, ]
type = TargetBind
trigger1 = animelem = 10
time = 4
pos = floor(-5*const(size.xscale)),-120

[State 1515, ]
type = TargetBind
trigger1 = animelem = 11
time = 4
pos = floor(35*const(size.xscale)),-95

[State 1515, ]
type = TargetBind
trigger1 = animelem = 12
time = 4
pos = floor(140*const(size.xscale)),-80

[State 1515, ]
type = TargetBind
trigger1 = animelem = 13
time = 4
pos = floor(150*const(size.xscale)),-60

[State 1515, ]
type = TargetBind
trigger1 = animelem = 14
time = 4
pos = floor(20*const(size.xscale)),-45

[State 1515, ]
type = TargetBind
trigger1 = animelem = 15
time = 4
pos = floor(-140*const(size.xscale)),-45

[State 1515, ]
type = TargetLifeAdd
trigger1 = animelem = 16
value = -120

[State 1515, ]
type = TargetState
trigger1 = animelem = 16
value = 1509

[State 1515, ]
type = TargetDrop
trigger1 = animelem = 16

[State 1515, ]
type = Turn
trigger1 = animelem = 17

[State 1515, ]
type = ScreenBound
trigger1 = time >= 64
value = 0

[State 1515, ]
type = ChangeState
trigger1 = backedgedist <= -20
trigger1 = animtime = 0
value = 101
ctrl = 1

[State 1515, ChangeAnim2]
type = ChangeAnim
trigger1 = backedgedist > 10 && time >= 75
value = 1515
elem = 22
ignorehitpause = 1
persistent = 0

[State 1515, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Web
[Statedef 1516]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1516
velset = 5,-5
sprpriority = 5

[State 1516, ]
type = Nothitby
trigger1 = stateno = 1516
value = SCA,NA,SA,HA,NT,ST,HT

[State 1516, ]
type = HitBy
trigger1 = stateno = 1516
value = SCA,NP,SP,HP
time = 10

[State 1516, ]
type = HitOverride
trigger1 = stateno = 1516
slot = 1
time = 1
stateno = 1517
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1516, ]
type = ScreenBound
trigger1 = stateno = 1516
value = 0

[State 1516, ]
type = VelSet
trigger1 = stateno = 1516
x = 3.5
y = -3.5

[State 1516, ]
type = AfterImage
trigger1 = time = 0
time = 999
length = 3
framegap = 1
palcolor = 38
trans = Add

[State 1516, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1516, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1516, ]
type = HitDef
trigger1 = stateno = 1516
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = light
ground.type = high
air.type = low
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
pausetime = 0,8
guard.pausetime = 4,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.slidetime = 25
guard.slidetime = 25
ground.hittime = 25
guard.hittime = 25
air.hittime = 25
ground.velocity = -1
guard.velocity = -3
air.velocity = -1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36

[State 1516, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1516, HitSpark]
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

[State 1516, ]
type = DestroySelf
trigger1 = frontedgedist <= -200

[State 1516, ]
type = Changestate
trigger1 = movehit = 1
trigger2 = movecontact = 1
trigger3 = time = 30
value = 1517

;Finish
[Statedef 1517]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1517
velset = 0,0
sprpriority = 5

[State 1517, ]
type = AfterImageTime
trigger1 = time = 0
time = 10

[State 1517, ]
type = DestroySelf
trigger1 = animtime = 0

;=====================<WEB THROW>==========================
[StateDef 1520]
type = S
physics = S
moveType = A
anim = 1520
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1520, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1520, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1520, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1520, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = 1500,0

[State 1520, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = 11500,0

[State 1520, ]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1

[State 1520, ]
type = HitDef
trigger1 = animelem = 4
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -85
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1521
p2stateno = 1508

[State 1520, ]
type = HitDef
trigger1 = animelem = 5
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -110
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1522
p2stateno = 1508

[State 1520, ]
type = HitDef
trigger1 = animelem = 6
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -140
guard.dist = 200
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1523
p2stateno = 1508

[State 1520, ]
type = HitDef
trigger1 = animelem = 7
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -165
guard.dist = 230
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1524
p2stateno = 1508

[State 1520, ]
type = HitDef
trigger1 = animelem = 8
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -190
guard.dist = 250
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
p1stateno = 1515
p2stateno = 1508

[State 1520, ]
type = Helper
trigger1 = animelem = 9
trigger1 = moveguarded = 0
helpertype = normal
name = "web-line"
ID = 1005
pos = floor(20*const(size.xscale)),-265
postype = p1
facing = 1
stateno = 1526
ownpal = 1

[State 1520, ]
type = ChangeAnim
trigger1 = moveguarded = 1
value = 1520
elem = 9
ignorehitpause = 1
persistent = 0

[State 1520, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Throw
[statedef 1521]
type = S
movetype = A
physics = S
anim = 1521
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1521, ]
type = TargetBind
trigger1 = stateno = 1521
time = 1
pos = floor(20*const(size.xscale)),-110

[State 1521, ]
type = ChangeState
trigger1 = animtime = 0
value = 1522

;Throw
[statedef 1522]
type = S
movetype = A
physics = S
anim = 1522
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1522, ]
type = TargetBind
trigger1 = stateno = 1522
time = 1
pos = floor(20*const(size.xscale)),-145

[State 1522, ]
type = ChangeState
trigger1 = animtime = 0
value = 1523

;Throw
[statedef 1523]
type = S
movetype = A
physics = S
anim = 1523
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1523, ]
type = TargetBind
trigger1 = stateno = 1523
time = 1
pos = floor(20*const(size.xscale)),-195

[State 1523, ]
type = ChangeState
trigger1 = animtime = 0
value = 1524

;Throw
[statedef 1524]
type = S
movetype = A
physics = S
anim = 1524
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1524, ]
type = TargetBind
trigger1 = stateno = 1524
time = 1
pos = floor(20*const(size.xscale)),-255

[State 1524, ]
type = ChangeState
trigger1 = animtime = 0
value = 1515

;Web
[Statedef 1526]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1526
velset = 5,-5
sprpriority = 5

[State 1526, ]
type = Nothitby
trigger1 = stateno = 1526
value = SCA,NA,SA,HA,NT,ST,HT

[State 1526, ]
type = HitBy
trigger1 = stateno = 1526
value = SCA,NP,SP,HP
time = 10

[State 1526, ]
type = HitOverride
trigger1 = stateno = 1526
slot = 1
time = 1
stateno = 1517
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1526, ]
type = ScreenBound
trigger1 = stateno = 1526
value = 0

[State 1526, ]
type = VelSet
trigger1 = stateno = 1526
x = 0
y = -6

[State 1526, ]
type = AfterImage
trigger1 = time = 0
time = 999
length = 3
framegap = 1
palcolor = 38
trans = Add

[State 1526, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1526, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1526, ]
type = HitDef
trigger1 = stateno = 1526
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = light
ground.type = high
air.type = low
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
pausetime = 0,8
guard.pausetime = 4,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.slidetime = 25
guard.slidetime = 25
ground.hittime = 25
guard.hittime = 25
air.hittime = 25
ground.velocity = -1
guard.velocity = -3
air.velocity = -1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36

[State 1526, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1526, HitSpark]
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

[State 1526, ]
type = DestroySelf
trigger1 = frontedgedist <= -200

[State 1526, ]
type = Changestate
trigger1 = movehit = 1
trigger2 = movecontact = 1
trigger3 = time = 30
value = 1527

;Finish
[Statedef 1527]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1527
velset = 0,0
sprpriority = 5

[State 1527, ]
type = AfterImageTime
trigger1 = time = 0
time = 10

[State 1527, ]
type = DestroySelf
trigger1 = animtime = 0

;========================<EX WEB THROW>=============================
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
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1530, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = 1500,0

[State 1530, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = 11500,0

[State 1530, ]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1

[State 1530, ]
type = HitDef
trigger1 = animelem = 4
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
getpower = 0
givepower = 20
p1stateno = 1531
p2stateno = 1508

[State 1530, ]
type = HitDef
trigger1 = animelem = 5
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
getpower = 0
givepower = 20
p1stateno = 1532
p2stateno = 1508

[State 1530, ]
type = HitDef
trigger1 = animelem = 6
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
guard.dist = 200
getpower = 0
givepower = 20
p1stateno = 1533
p2stateno = 1508

[State 1530, ]
type = HitDef
trigger1 = animelem = 7
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
guard.dist = 230
getpower = 0
givepower = 20
p1stateno = 1534
p2stateno = 1508

[State 1530, ]
type = HitDef
trigger1 = animelem = 8
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -55
guard.dist = 250
getpower = 0
givepower = 20
p1stateno = 1535
p2stateno = 1508

[State 1530, ]
type = Helper
trigger1 = animelem = 9
trigger1 = moveguarded = 0
helpertype = normal
name = "web-line"
ID = 1005
pos = 230,-52
postype = p1
facing = 1
stateno = 1536
ownpal = 1

[State 1530, ]
type = ChangeAnim
trigger1 = moveguarded = 1
value = 1500
elem = 9
ignorehitpause = 1
persistent = 0

[State 1530, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Throw
[statedef 1531]
type = S
movetype = A
physics = S
anim = 1501
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1531, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1531, ]
type = TargetBind
trigger1 = stateno = 1501
time = 1
pos = floor(-115*const(size.xscale)),-55

[State 1531, ]
type = ChangeState
trigger1 = animtime = 0
value = 1532

;Throw
[statedef 1532]
type = S
movetype = A
physics = S
anim = 1502
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1532, ]
type = TargetBind
trigger1 = stateno = 1532
time = 1
pos = floor(175*const(size.xscale)),-55

[State 1532, ]
type = ChangeState
trigger1 = animtime = 0
value = 1533

;Throw
[statedef 1533]
type = S
movetype = A
physics = S
anim = 1503
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1533, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1533, ]
type = TargetBind
trigger1 = stateno = 1533
time = 1
pos = floor(215*const(size.xscale)),-55

[State 1533, ]
type = ChangeState
trigger1 = animtime = 0
value = 1534

;Throw
[statedef 1534]
type = S
movetype = A
physics = S
anim = 1504
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1534, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1534, ]
type = TargetBind
trigger1 = stateno = 1534
time = 1
pos = floor(230*const(size.xscale)),-55

[State 1534, ]
type = ChangeState
trigger1 = animtime = 0
value = 1535

;Throw
[statedef 1535]
type = S
movetype = A
physics = S
anim = 1505
velset = 0,0
sprpriority = -1
ctrl = 0

[State 1535, ]
type = ChangeState
trigger1 = numtarget <= 0
value = 0
ctrl = 1

[State 1535, Width]
type = Width
trigger1 = time >= 0
edge = ifelse(time>=10,60,100),ifelse(time<=24,20,ifelse(time <=28,60,130))

[State 1535, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1

[State 1535, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2

[State 1535, ]
type = PlaySnd
trigger1 = animelem = 12
value = S1,5

[State 1535, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 1
value = 4,4
channel = 1
lowpriority = 1

[State 1535, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 0
value = 10004,4
channel = 1
lowpriority = 1

[State 1535, ]
type = TargetFacing
trigger1 = animelem = 1
trigger2 = animelem = 11
value = 1

[State 1535, ]
type = TargetFacing
trigger1 = animelem = 7
value = -1

[State 1535, ]
type = SprPriority
trigger1 = animelem = 9
value = 1

[State 1535, ]
type = SprPriority
trigger1 = animelem = 13
value = -1

[State 1535, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(240*const(size.xscale)),-55

[State 1535, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = floor(220*const(size.xscale)),-60

[State 1535, ]
type = TargetBind
trigger1 = animelem = 3
time = 4
pos = floor(195*const(size.xscale)),-75

[State 1535, ]
type = TargetBind
trigger1 = animelem = 4
time = 4
pos = floor(180*const(size.xscale)),-85

[State 1535, ]
type = TargetBind
trigger1 = animelem = 5
time = 4
pos = floor(105*const(size.xscale)),-80

[State 1535, ]
type = TargetBind
trigger1 = animelem = 6
time = 4
pos = floor(25*const(size.xscale)),-80

[State 1535, ]
type = TargetBind
trigger1 = animelem = 7
time = 4
pos = floor(-105*const(size.xscale)),-80

[State 1535, ]
type = TargetBind
trigger1 = animelem = 8
time = 4
pos = floor(-155*const(size.xscale)),-95

[State 1535, ]
type = TargetBind
trigger1 = animelem = 9
time = 4
pos = floor(-110*const(size.xscale)),-110

[State 1535, ]
type = TargetBind
trigger1 = animelem = 10
time = 4
pos = floor(-5*const(size.xscale)),-120

[State 1535, ]
type = TargetBind
trigger1 = animelem = 11
time = 4
pos = floor(35*const(size.xscale)),-95

[State 1535, ]
type = TargetBind
trigger1 = animelem = 12
time = 4
pos = floor(140*const(size.xscale)),-80

[State 1535, ]
type = TargetBind
trigger1 = animelem = 13
time = 4
pos = floor(150*const(size.xscale)),-60

[State 1535, ]
type = TargetBind
trigger1 = animelem = 14
time = 4
pos = floor(20*const(size.xscale)),-45

[State 1535, ]
type = TargetBind
trigger1 = animelem = 15
time = 4
pos = floor(-140*const(size.xscale)),-45

[State 1535, ]
type = TargetLifeAdd
trigger1 = animelem = 16
value = -130

[State 1535, ]
type = TargetState
trigger1 = animelem = 16
value = 1509

[State 1535, ]
type = TargetDrop
trigger1 = animelem = 16

[State 1535, ]
type = Turn
trigger1 = animelem = 17

[State 1535, ]
type = ScreenBound
trigger1 = time >= 64
value = 0

[State 1535, ]
type = ChangeState
trigger1 = backedgedist <= -20
trigger1 = animtime = 0
value = 101
ctrl = 1

[State 1535, ChangeAnim2]
type = ChangeAnim
trigger1 = backedgedist > 0 && time >= 75
value = 1505
elem = 22
ignorehitpause = 1
persistent = 0

[State 1535, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Web
[Statedef 1536]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1506
velset = 7,0
sprpriority = 5

[State 1536, ]
type = Nothitby
trigger1 = stateno = 1536
value = SCA,NA,SA,HA,NT,ST,HT

[State 1536, ]
type = HitBy
trigger1 = stateno = 1536
value = SCA,NP,SP,HP
time = 10

[State 1536, ]
type = HitOverride
trigger1 = stateno = 1536
slot = 1
time = 1
stateno = 1537
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1536, ]
type = ScreenBound
trigger1 = stateno = 1536
value = 0

[State 1536, ]
type = VelSet
trigger1 = stateno = 1536
x = 6
y = 0

[State 1536, ]
type = AfterImage
trigger1 = time = 0
time = 999
length = 3
framegap = 1
palcolor = 38
trans = Add

[State 1536, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1536, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1536, ]
type = HitDef
trigger1 = stateno = 1536
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = light
ground.type = high
air.type = low
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
pausetime = 0,8
guard.pausetime = 4,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.slidetime = 25
guard.slidetime = 25
ground.hittime = 25
guard.hittime = 25
air.hittime = 25
ground.velocity = -1
guard.velocity = -3
air.velocity = -1
getpower = 0
givepower = 20

[State 1536, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1536, HitSpark]
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

[State 1536, ]
type = DestroySelf
trigger1 = frontedgedist <= -200

[State 1536, ]
type = Changestate
trigger1 = movehit = 1
trigger2 = movecontact = 1
trigger3 = time = 30
value = 1537

;Finish
[Statedef 1537]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1507
velset = 0,0
sprpriority = 5

[State 1537, ]
type = AfterImageTime
trigger1 = time = 0
time = 10

[State 1537, ]
type = DestroySelf
trigger1 = animtime = 0

;========================<EX WEB THROW>=============================
[StateDef 1540]
type = S
physics = S
moveType = A
anim = 1510
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1540, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1540, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1540, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1540, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1540, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1540, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1540, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = 1500,0

[State 1540, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = 11500,0

[State 1540, ]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1

[State 1540, ]
type = HitDef
trigger1 = animelem = 4
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -85
getpower = 0
givepower = 20
p1stateno = 1541
p2stateno = 1508

[State 1540, ]
type = HitDef
trigger1 = animelem = 5
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -110
getpower = 0
givepower = 20
p1stateno = 1542
p2stateno = 1508

[State 1540, ]
type = HitDef
trigger1 = animelem = 6
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -140
guard.dist = 200
getpower = 0
givepower = 20
p1stateno = 1513
p2stateno = 1508

[State 1540, ]
type = HitDef
trigger1 = animelem = 7
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -165
guard.dist = 230
getpower = 0
givepower = 20
p1stateno = 1544
p2stateno = 1508

[State 1540, ]
type = HitDef
trigger1 = animelem = 8
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -190
guard.dist = 250
getpower = 0
givepower = 20
p1stateno = 1545
p2stateno = 1508

[State 1540, ]
type = Helper
trigger1 = animelem = 9
trigger1 = moveguarded = 0
helpertype = normal
name = "web-line"
ID = 1005
pos = floor(190*const(size.xscale)),-190
postype = p1
facing = 1
stateno = 1546
ownpal = 1

[State 1540, ]
type = ChangeAnim
trigger1 = moveguarded = 1
value = 1510
elem = 9
ignorehitpause = 1
persistent = 0

[State 1540, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Throw
[statedef 1541]
type = S
movetype = A
physics = S
anim = 1511
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1541, ]
type = TargetBind
trigger1 = stateno = 1541
time = 1
pos = floor(95*const(size.xscale)),-110

[State 1541, ]
type = ChangeState
trigger1 = animtime = 0
value = 1542

;Throw
[statedef 1542]
type = S
movetype = A
physics = S
anim = 1512
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1542, ]
type = TargetBind
trigger1 = stateno = 1542
time = 1
pos = floor(130*const(size.xscale)),-140

[State 1542, ]
type = ChangeState
trigger1 = animtime = 0
value = 1543

;Throw
[statedef 1543]
type = S
movetype = A
physics = S
anim = 1513
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1543, ]
type = TargetBind
trigger1 = stateno = 1543
time = 1
pos = floor(150*const(size.xscale)),-160

[State 1543, ]
type = ChangeState
trigger1 = animtime = 0
value = 1544

;Throw
[statedef 1544]
type = S
movetype = A
physics = S
anim = 1514
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1544, ]
type = TargetBind
trigger1 = stateno = 1544
time = 1
pos = floor(175*const(size.xscale)),-175

[State 1514, ]
type = ChangeState
trigger1 = animtime = 0
value = 1545

;Throw
[statedef 1545]
type = S
movetype = A
physics = S
anim = 1515
velset = 0,0
sprpriority = -1
ctrl = 0

[State 1545, Width]
type = Width
trigger1 = time >= 0
edge = ifelse(time>=10,60,100),ifelse(time<=25,20,ifelse(time >=28,100,60))

[State 1545, ]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1

[State 1545, ]
type = PlaySnd
trigger1 = animelem = 5
value = S1,2

[State 1545, ]
type = PlaySnd
trigger1 = animelem = 12
value = S1,5

[State 1545, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 1
value = 4,4
channel = 1
lowpriority = 1

[State 1545, ]
type = PlaySnd
trigger1 = animelem = 13 && var(41) != 0
value = 10004,4
channel = 1
lowpriority = 1

[State 1545, ]
type = TargetFacing
trigger1 = animelem = 1
trigger2 = animelem = 11
value = 1

[State 1545, ]
type = TargetFacing
trigger1 = animelem = 7
value = -1

[State 1545, ]
type = SprPriority
trigger1 = animelem = 9
value = 1

[State 1545, ]
type = SprPriority
trigger1 = animelem = 13
value = -1

[State 1545, ]
type = TargetBind
trigger1 = animelem = 1
time = 4
pos = floor(175*const(size.xscale)),-170

[State 1545, ]
type = TargetBind
trigger1 = animelem = 2
time = 4
pos = floor(160*const(size.xscale)),-160

[State 1545, ]
type = TargetBind
trigger1 = animelem = 3
time = 4
pos = floor(150*const(size.xscale)),-135

[State 1545, ]
type = TargetBind
trigger1 = animelem = 4
time = 4
pos = floor(145*const(size.xscale)),-120

[State 1545, ]
type = TargetBind
trigger1 = animelem = 5
time = 4
pos = floor(105*const(size.xscale)),-80

[State 1545, ]
type = TargetBind
trigger1 = animelem = 6
time = 4
pos = floor(25*const(size.xscale)),-80

[State 1545, ]
type = TargetBind
trigger1 = animelem = 7
time = 4
pos = floor(-105*const(size.xscale)),-80

[State 1545, ]
type = TargetBind
trigger1 = animelem = 8
time = 4
pos = floor(-155*const(size.xscale)),-95

[State 1545, ]
type = TargetBind
trigger1 = animelem = 9
time = 4
pos = floor(-110*const(size.xscale)),-110

[State 1545, ]
type = TargetBind
trigger1 = animelem = 10
time = 4
pos = floor(-5*const(size.xscale)),-120

[State 1545, ]
type = TargetBind
trigger1 = animelem = 11
time = 4
pos = floor(35*const(size.xscale)),-95

[State 1545, ]
type = TargetBind
trigger1 = animelem = 12
time = 4
pos = floor(140*const(size.xscale)),-80

[State 1545, ]
type = TargetBind
trigger1 = animelem = 13
time = 4
pos = floor(150*const(size.xscale)),-60

[State 1545, ]
type = TargetBind
trigger1 = animelem = 14
time = 4
pos = floor(20*const(size.xscale)),-45

[State 1545, ]
type = TargetBind
trigger1 = animelem = 15
time = 4
pos = floor(-140*const(size.xscale)),-45

[State 1545, ]
type = TargetLifeAdd
trigger1 = animelem = 16
value = -130

[State 1545, ]
type = TargetState
trigger1 = animelem = 16
value = 1509

[State 1545, ]
type = TargetDrop
trigger1 = animelem = 16

[State 1545, ]
type = Turn
trigger1 = animelem = 17

[State 1545, ]
type = ScreenBound
trigger1 = time >= 64
value = 0

[State 1545, ]
type = ChangeState
trigger1 = backedgedist <= -20
trigger1 = animtime = 0
value = 101
ctrl = 1

[State 1545, ChangeAnim2]
type = ChangeAnim
trigger1 = backedgedist > 10 && time >= 75
value = 1515
elem = 22
ignorehitpause = 1
persistent = 0

[State 1545, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Web
[Statedef 1546]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1516
velset = 5,-5
sprpriority = 5

[State 1546, ]
type = Nothitby
trigger1 = stateno = 1546
value = SCA,NA,SA,HA,NT,ST,HT

[State 1546, ]
type = HitBy
trigger1 = stateno = 1546
value = SCA,NP,SP,HP
time = 10

[State 1546, ]
type = HitOverride
trigger1 = stateno = 1546
slot = 1
time = 1
stateno = 1547
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1546, ]
type = ScreenBound
trigger1 = stateno = 1546
value = 0

[State 1546, ]
type = VelSet
trigger1 = stateno = 1546
x = 3.5
y = -3.5

[State 1546, ]
type = AfterImage
trigger1 = time = 0
time = 999
length = 3
framegap = 1
palcolor = 38
trans = Add

[State 1546, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1546, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1546, ]
type = HitDef
trigger1 = stateno = 1546
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = light
ground.type = high
air.type = low
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
pausetime = 0,8
guard.pausetime = 4,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.slidetime = 25
guard.slidetime = 25
ground.hittime = 25
guard.hittime = 25
air.hittime = 25
ground.velocity = -1
guard.velocity = -3
air.velocity = -1
getpower = 0
givepower = 20

[State 1546, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1546, HitSpark]
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

[State 1546, ]
type = DestroySelf
trigger1 = frontedgedist <= -200

[State 1546, ]
type = Changestate
trigger1 = movehit = 1
trigger2 = movecontact = 1
trigger3 = time = 30
value = 1547

;Finish
[Statedef 1547]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1517
velset = 0,0
sprpriority = 5

[State 1547, ]
type = AfterImageTime
trigger1 = time = 0
time = 10

[State 1547, ]
type = DestroySelf
trigger1 = animtime = 0

;========================<EX WEB THROW>=============================
[StateDef 1550]
type = S
physics = S
moveType = A
anim = 1520
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1550, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1550, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1550, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1550, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1550, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1550, ]
type = PosSet
trigger1 = time = 0
y = 0

[State 1550, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 1
value = 1500,0

[State 1550, ]
type = PlaySnd
trigger1 = animelem = 3 && var(41) != 0
value = 11500,0

[State 1550, ]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1

[State 1550, ]
type = HitDef
trigger1 = animelem = 4
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -85
getpower = 0
givepower = 20
p1stateno = 1551
p2stateno = 1508

[State 1550, ]
type = HitDef
trigger1 = animelem = 5
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -110
getpower = 0
givepower = 20
p1stateno = 1552
p2stateno = 1508

[State 1550, ]
type = HitDef
trigger1 = animelem = 6
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -140
guard.dist = 200
getpower = 0
givepower = 20
p1stateno = 1553
p2stateno = 1508

[State 1550, ]
type = HitDef
trigger1 = animelem = 7
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -165
guard.dist = 230
getpower = 0
givepower = 20
p1stateno = 1554
p2stateno = 1508

[State 1550, ]
type = HitDef
trigger1 = animelem = 8
trigger1 = moveguarded = 0
attr = S,ST
hitflag = MAF
guardflag = MA
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -190
guard.dist = 250
getpower = 0
givepower = 20
p1stateno = 1545
p2stateno = 1508

[State 1550, ]
type = Helper
trigger1 = animelem = 9
trigger1 = moveguarded = 0
helpertype = normal
name = "web-line"
ID = 1005
pos = floor(20*const(size.xscale)),-265
postype = p1
facing = 1
stateno = 1556
ownpal = 1

[State 1550, ]
type = ChangeAnim
trigger1 = moveguarded = 1
value = 1520
elem = 9
ignorehitpause = 1
persistent = 0

[State 1550, ]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Throw
[statedef 1551]
type = S
movetype = A
physics = S
anim = 1521
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1551, ]
type = TargetBind
trigger1 = stateno = 1551
time = 1
pos = floor(20*const(size.xscale)),-110

[State 1551, ]
type = ChangeState
trigger1 = animtime = 0
value = 1552

;Throw
[statedef 1552]
type = S
movetype = A
physics = S
anim = 1522
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1552, ]
type = TargetBind
trigger1 = stateno = 1552
time = 1
pos = floor(20*const(size.xscale)),-145

[State 1552, ]
type = ChangeState
trigger1 = animtime = 0
value = 1553

;Throw
[statedef 1553]
type = S
movetype = A
physics = S
anim = 1523
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1553, ]
type = TargetBind
trigger1 = stateno = 1553
time = 1
pos = floor(20*const(size.xscale)),-195

[State 1553, ]
type = ChangeState
trigger1 = animtime = 0
value = 1554

;Throw
[statedef 1554]
type = S
movetype = A
physics = S
anim = 1524
sprpriority = -1
velset = 0,0
ctrl = 0

[State 1554, ]
type = TargetBind
trigger1 = stateno = 1554
time = 1
pos = floor(20*const(size.xscale)),-255

[State 1524, ]
type = ChangeState
trigger1 = animtime = 0
value = 1545

;Web
[Statedef 1556]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1526
velset = 5,-5
sprpriority = 5

[State 1556, ]
type = Nothitby
trigger1 = stateno = 1556
value = SCA,NA,SA,HA,NT,ST,HT

[State 1556, ]
type = HitBy
trigger1 = stateno = 1556
value = SCA,NP,SP,HP
time = 10

[State 1556, ]
type = HitOverride
trigger1 = stateno = 1556
slot = 1
time = 1
stateno = 1547
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1556, ]
type = ScreenBound
trigger1 = stateno = 1556
value = 0

[State 1556, ]
type = VelSet
trigger1 = stateno = 1556
x = 0
y = -6

[State 1556, ]
type = AfterImage
trigger1 = time = 0
time = 999
length = 3
framegap = 1
palcolor = 38
trans = Add

[State 1556, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1556, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1556, ]
type = HitDef
trigger1 = stateno = 1556
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = light
ground.type = high
air.type = low
priority = 5,Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 8
pausetime = 0,8
guard.pausetime = 4,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.slidetime = 25
guard.slidetime = 25
ground.hittime = 25
guard.hittime = 25
air.hittime = 25
ground.velocity = -1
guard.velocity = -3
air.velocity = -1
getpower = 0
givepower = 20

[State 1556, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1556, HitSpark]
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

[State 1556, ]
type = DestroySelf
trigger1 = frontedgedist <= -200

[State 1556, ]
type = Changestate
trigger1 = movehit = 1
trigger2 = movecontact = 1
trigger3 = time = 30
value = 1557

;Finish
[Statedef 1557]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1527
velset = 0,0
sprpriority = 5

[State 1557, ]
type = AfterImageTime
trigger1 = time = 0
time = 10

[State 1557, ]
type = DestroySelf
trigger1 = animtime = 0

;=====================<SPIDER PUNCH>==========================
[StateDef 1600]
type = S
physics = S
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1602, ifElse(var(10) = 1, 1601, 1600))

[State 1600, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1600, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 11600,0
volumescale = 255
channel = 0

[State 1600, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41, 0

[State 1600, Dust]
type = helper
trigger1 = AnimElem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1600, StateType]
type = StateTypeSet
trigger1 = AnimElem = 3
StateType = A
physics = N

[State 1600, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 3.5+(var(10)*1.5)
y = -4.7

[State 1600, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) > 0
y = .55

[State 1600, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(3) > 0
value = 1601

;Attack
[Statedef 1601]
type = S
movetype = A
physics = S
juggle = 8
ctrl = 0
anim = 1603
velset = 0,0

[State 1601, Width]
type = Width
trigger1 = time = 0
edge = 40,0

[State 1601, statetypeset]
type = statetypeset
trigger1 = AnimElem = 5
movetype = I

[State 1601, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 20, 10
ownPal = 1

[State 1601, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1601, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 2

[State 1601, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
ampl = 5

[State 1601, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, SA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = Ifelse(var(20),-1,-1.5),Ifelse(var(20),0,0)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20),-1,-1.5),Ifelse(var(20),5,10)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 1601, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX SPIDER PUNCH>=============================
[StateDef 1630]
type = S
physics = S
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
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1630, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 11600,0
volumescale = 255
channel = 0

[State 1630, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41, 0

[State 1630, Dust]
type = helper
trigger1 = AnimElem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1630, StateType]
type = StateTypeSet
trigger1 = AnimElem = 3
StateType = A
physics = N

[State 1630, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 8
y = -4.7

[State 1630, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) > 0
y = .55

[State 1630, VelMul]
type = VelMul
trigger1 =animelemtime(1)&&p2bodydist x<=20
x = .6

[State 1630, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(3) > 0
value = 1631

;Attack
[Statedef 1631]
type = S
movetype = A
physics = S
juggle = 8
ctrl = 0
anim = 1603
velset = 0,0

[State 1631, Width]
type = Width
trigger1 = time = 0
edge = 40,0

[State 1631, statetypeset]
type = statetypeset
trigger1 = AnimElem = 5
movetype = I

[State 1631, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 20, 10
ownPal = 1

[State 1631, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1631, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 2

[State 1631, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
ampl = 5

[State 1631, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 1
attr = S, SA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 79 < 7, 7, fvar(11) * 79)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2, 2
guard.pauseTime = 2, 2
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = Ifelse(var(20),-1,-1.5),Ifelse(var(20),0,0)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20),-1,-1.5),Ifelse(var(20),5,10)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 1631, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = Animelem = 2
attr = S, SA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 79 < 7, 7, fvar(11) * 79)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = Ifelse(var(20),-1,-1.5),Ifelse(var(20),0,0)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20),-1,-1.5),Ifelse(var(20),5,10)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 1631, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<SPIDER KICK>==========================
[StateDef 1700]
type = S
physics = N
moveType = A
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1700, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1700, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1700, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1702, ifElse(var(10) = 1, 1701, 1700))

[State 1700, 1]
type = statetypeset
trigger1 = AnimElem = 9
movetype = I

[State 1700, velset]
type = velset
trigger1 = Animelem = 4
x = 8+2*var(10)

[State 1700, velset]
type = velset
trigger1 = Animelem = 7
x = 3

[State 1700, velset]
type = velset
trigger1 = Animelem = 9
x = 0

[State 1700, Position]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
x = 8

[State 1700, Position]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 12
x = -8

[State 1700, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 11700,0
volumescale = 255
channel = 0

[State 1700, Whoosh 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5

[State 1700, Dust Helper]
type = Helper
trigger1 = Animelem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1700, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = Ifelse(var(20),-2.5,-6),Ifelse(var(20),-5.5,-2.5)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20),-1.2,-6),Ifelse(var(20),-3.5,-2.5)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1700, Landing Sound]
type = PlaySnd
trigger1 = Animelem = 14
value = 52,0

[State 1700, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 14
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1700, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX SPIDER KICK>=============================
[StateDef 1730]
type = S
physics = S
moveType = A
anim = 1703
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1730, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1730, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1730, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1730, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1730, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1730, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1730, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
value = SCA

[State 1730, 1]
type = statetypeset
trigger1 = AnimElem = 9
movetype = I

[State 1730, velset]
type = velset
trigger1 = Animelem = 4
x = 19

[State 1730, velset]
type = velset
trigger1 = Animelem = 7
x = 3

[State 1730, velset]
type = velset
trigger1 = Animelem = 9
x = 0

[State 1730, Position]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
x = 8

[State 1730, Position]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 12
x = -8

[State 1730, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 11700,0
volumescale = 255
channel = 0

[State 1730, Whoosh 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5

[State 1730, Dust Helper]
type = Helper
trigger1 = Animelem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1730, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 7
trigger2 = AnimElem = 8
attr = S, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = Ifelse(var(20),-2.5,-6),Ifelse(var(20),-2.5,-7.5)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20),-2.5,-6),Ifelse(var(20),-2.5,-7.5)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1730, Landing Sound]
type = PlaySnd
trigger1 = Animelem = 14
value = 52,0

[State 1730, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 14
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1730, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

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

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(41) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(41) != 0
value = 10004, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, Width]
type = Width
trigger1 = time = [6,21]
edge = 30,0
player = 30,-20
ignorehitpause = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 52 < 7, 7, fvar(11) * 52)), 0
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
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
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
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(41) != 1
value = 4, 4
channel = 0

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(41) != 0
value = 10004, 4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, Width]
type = Width
trigger1 = time = [6,26]
edge = 40,0
player = 40,-65
ignorehitpause = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 52 < 7, 7, fvar(11) * 52)), 0
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
sparkXY = -10 + 0 * (var(35) := 196), var(36) := -15
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
