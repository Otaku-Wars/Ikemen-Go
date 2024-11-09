; _________________________________________
;| Batman by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<NORMAL BATARANG>==========================
[StateDef 1000]
type = S
physics = S
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

[State 1000,sound]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 21
value = 9,1

[State 1000,sound]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 25
value = 1000,0
channel = 1

[State 1000, Spark]
type = Explod
trigger1 = var(10) = 0
trigger1 = ProjContact1005 = 1
anim = 1008
pos = 0, -85
postype = p2
sprpriority = 3
bindtime = 1
ownpal = 1
ontop = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1005
ID = 1005
name = "Normal Batarang Projectile"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-75 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Spark]
type = Explod
trigger1 = var(10) = 1
trigger1 = time = 0
anim = 1013
pos = 0, 0
postype = p1
sprpriority = 5
bindtime = 1
removetime = 21
ownpal = 1
ontop = 1

[State 1000,soundc]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = time = 12
value = 9,1

[State 1000,sound]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = time = 22
value = 1000,0
channel = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1015
ID = 1005
name = "Electric Batarang Projectile"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-62 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Spark]
type = Explod
trigger1 = var(10) = 1
trigger1 = ProjContact1015 = 1
trigger1 = !AnimExist(7696)
anim = 1016
pos = -50, -105
postype = p2
sprpriority = 3
bindtime = -1
ownpal = 1
ontop = 1
persistent = 0

[State 1000,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 10
value = 9,1

[State 1000,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 27
value = 1000,0
channel = 1

[State 1000, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = AnimElem = 1
anim = 6004
pos = -32, -90
ontop = 1

[State 1000, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = AnimElem = 1
anim = 6004
pos = 50, -90
ontop = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1025
ID = 1005
name = "Explosive Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(7) = 0
value = 30,0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX NORMAL BATARANG>=============================
[StateDef 1030]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1030, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1030, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1030,sound]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 21
value = 9,1

[State 1030,sound]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 25
value = 1000,0
channel = 1

[State 1030, Spark]
type = Explod
trigger1 = var(10) = 0
trigger1 = ProjContact1005 = 1
anim = 1008
pos = 0, -85
postype = p2
sprpriority = 3
bindtime = 1
ownpal = 1
ontop = 1

[State 1030, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1035
ID = 1005
name = "Normal Batarang Projectile"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-75 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1035
ID = 1005
name = "Normal Batarang Projectile"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-75 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Spark]
type = Explod
trigger1 = var(10) = 1
trigger1 = time = 0
anim = 1013
pos = 0, 0
postype = p1
sprpriority = 5
bindtime = 1
removetime = 21
ownpal = 1
ontop = 1

[State 1030,soundc]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = time = 12
value = 9,1

[State 1030,sound]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = time = 22
value = 1000,0
channel = 1

[State 1030, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1045
ID = 1005
name = "Electric Batarang Projectile"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-62 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1045
ID = 1005
name = "Electric Batarang Projectile"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-62 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Spark]
type = Explod
trigger1 = var(10) = 1
trigger1 = ProjContact1015 = 1
trigger1 = !AnimExist(7696)
anim = 1016
pos = -50, -105
postype = p2
sprpriority = 3
bindtime = -1
ownpal = 1
ontop = 1
persistent = 0

[State 1030,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 10
value = 9,1

[State 1030,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 27
value = 1000,0
channel = 1

[State 1030, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = AnimElem = 1
anim = 6004
pos = -32, -90
ontop = 1

[State 1030, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = AnimElem = 1
anim = 6004
pos = 50, -90
ontop = 1

[State 1030, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1055
ID = 1005
name = "Explosive Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1055
ID = 1005
name = "Explosive Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(7) = 0
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=====================<AIR NORMAL BATARANG>==========================
[StateDef 1050]
type = A
physics = S
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

[State 1050, VelSet]
type = VelSet
trigger1 = 1
y = .4

[State 1050,sound]
type = Playsnd
trigger1 = time = 10
value = 9,1

[State 1050,sound]
type = Playsnd
trigger1 = time = 15
value = 1000,0
channel = 1

[State 1050, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1005
name = "Normal Batarang Projectile"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-110 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1050, Spark]
type = Explod
trigger1 = ProjContact1005 = 1
anim = 1008
pos = 0, -85
postype = p2
sprpriority = 3
bindtime = 1
ownpal = 1
ontop = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1050, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 0

;========================<EX AIR NORMAL BATARANG>=============================
[StateDef 1080]
type = A
physics = S
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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

[State 1080, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1080, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1080, VelSet]
type = VelSet
trigger1 = 1
y = .4

[State 1080,sound]
type = Playsnd
trigger1 = time = 10
value = 9,1

[State 1080,sound]
type = Playsnd
trigger1 = time = 15
value = 1000,0
channel = 1

[State 1080, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1035
ID = 1005
name = "Normal Batarang Projectile"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-110 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1080, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1035
ID = 1005
name = "Normal Batarang Projectile"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-110 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1080, Spark]
type = Explod
trigger1 = ProjContact1005 = 1
anim = 1008
pos = 0, -85
postype = p2
sprpriority = 3
bindtime = 1
ownpal = 1
ontop = 1

[State 1080, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1080, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 0

;=====================<RAZOR BATARANG>==========================
[StateDef 1100]
type = S
physics = S
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100,sound]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 21
value = 1100,0

[State 1100,sound2]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 25
value = 1000,0
channel = 1

[State 1100, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1105
ID = 1105
name = "Razor Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-52 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1100, Spark]
type = Explod
trigger1 = var(10) = 0
trigger1 = ProjContact1005 = 1
anim = 1008
pos = 0, -85
postype = p2
sprpriority = 3
bindtime = 1
ownpal = 1
ontop = 1

[State 1100,sound]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = AnimElem = 8 || AnimElem = 15
value = 1100,0

[State 1100,sound]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = AnimElem = 8 || AnimElem = 15
value = 1000,0
channel = 1

[State 1100, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1115
ID = 1105
name = "Double Batarang Projectile"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-60 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1100, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 15
helperType = Normal
stateNo = 1115
ID = 1105
name = "Double Batarang Projectile"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-85 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1100,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 25
value = 1000,0
channel = 1

[State 1100,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 25
value = 1000,0
channel = 2

[State 1100,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 25
value = 1000,0
channel = 3

[State 1100, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1125
ID = 1105
name = "Triple Mini Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-79 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1100, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1125
ID = 1105
name = "Triple Mini Batarang Projectile"
posType = P1
pos = ceil(95 * const(size.xScale)), ceil(-70 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1100, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1125
ID = 1105
name = "Triple Mini Batarang Projectile"
posType = P1
pos = ceil(88 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1100, Width]
type = Width
trigger1 = AnimElemTime(7) = 0
value = 30,0

[State 1100, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX RAZOR BATARANG>=============================
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1100
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
var(25) = 124

[State 1130, EX FX]
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

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1130, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1130, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1130,sound]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 21
value = 1100,0

[State 1130,sound2]
type = Playsnd
trigger1 = var(10) = 0
trigger1 = time = 25
value = 1000,0
channel = 1

[State 1130, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1135
ID = 1105
name = "Razor Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-52 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1130, Spark]
type = Explod
trigger1 = var(10) = 0
trigger1 = ProjContact1005 = 1
anim = 1008
pos = 0, -85
postype = p2
sprpriority = 3
bindtime = 1
ownpal = 1
ontop = 1

[State 1130,sound]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = AnimElem = 8 || AnimElem = 15
value = 1100,0

[State 1130,sound]
type = Playsnd
trigger1 = var(10) = 1
trigger1 = AnimElem = 8 || AnimElem = 15
value = 1000,0
channel = 1

[State 1130, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1145
ID = 1105
name = "Double Batarang Projectile"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-60 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1130, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 15
helperType = Normal
stateNo = 1145
ID = 1105
name = "Double Batarang Projectile"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-85 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1130,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 25
value = 1000,0
channel = 1

[State 1130,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 25
value = 1000,0
channel = 2

[State 1130,sound]
type = Playsnd
trigger1 = var(10) = 2
trigger1 = time = 25
value = 1000,0
channel = 3

[State 1130, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1155
ID = 1105
name = "Triple Mini Batarang Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-79 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1130, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1155
ID = 1105
name = "Triple Mini Batarang Projectile"
posType = P1
pos = ceil(95 * const(size.xScale)), ceil(-70 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1130, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 1155
ID = 1105
name = "Triple Mini Batarang Projectile"
posType = P1
pos = ceil(88 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1130, Width]
type = Width
trigger1 = AnimElemTime(7) = 0
value = 30,0

[State 1130, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<AIR EXPLOSIVE BATARANG>==========================
[StateDef 1150]
type = A
physics = A
moveType = I
anim = 1150
ctrl = 0
velSet = -1,-5
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1150, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1150,sound]
type = Playsnd
trigger1 = time = 2
value = 9,1

[State 1150,sound]
type = Playsnd
trigger1 = time = 8
value = 1000,0
channel = 1

[State 1150, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1165
ID = 1105
name = "Explosive Batarang Projectile"
posType = P1
pos = ceil(75 * const(size.xScale)), ceil(-95 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1150, Width]
type = Width
trigger1 = AnimElemTime(3) = 0
value = 30,0

[State 1150, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 0

;========================<EX AIR EXPLOSIVE BATARANG>=============================
[StateDef 1180]
type = A
physics = A
moveType = I
anim = 1150
ctrl = 0
velSet = -1,-5
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1180, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1180, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1180, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1180, EX FX]
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

[State 1180, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1180, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1180, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1180,sound]
type = Playsnd
trigger1 = time = 2
value = 9,1

[State 1180,sound]
type = Playsnd
trigger1 = time = 8
value = 1000,0
channel = 1

[State 1180, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1185
ID = 1105
name = "EX Explosive Batarang Projectile"
posType = P1
pos = ceil(75 * const(size.xScale)), ceil(-95 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1180, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1185
ID = 1105
name = "EX Explosive Batarang Projectile"
posType = P1
pos = ceil(75 * const(size.xScale)), ceil(-95 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1180, Width]
type = Width
trigger1 = AnimElemTime(3) = 0
value = 30,0

[State 1180, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 0

;=====================<BATBALL>==========================
[StateDef 1200]
type = S
physics = S
moveType = I
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ases]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 1200, wi]
type = Width
trigger1 = 1
edge = 0,30

[State 1200, dd]
type = PlaySnd
trigger1 = time%14 = 0
value = 1, 5
channel = 6
ignorehitpause = 1
volume = 250

[State 1200, no]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1200, holda]
type = ChangeState
trigger1 = command != "hold_but"
value = 1201
ctrl = 0

;Batball Move
[Statedef 1201]
type = S
movetype = A
physics = S
ctrl = 0
poweradd = 0
sprpriority = 1
juggle = 6
velset = 0,0

[State 1201, ch]
type = ChangeAnim
trigger1 = prevstateno != 9000
trigger1 = time = 0
value = 1201
ctrl = 1

[State 1201, hp]
type = Helper
trigger1 = animelem = 9
name = "batballs"
ID = 1205
pos = 90,-65
postype = p1
stateno = 1205
ownpal = 1

[State 1201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 46, ifElse(var(10), 39, 25)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 46, ifElse(var(10), 39, 25)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, end]
type = Changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;=====================<EX BATBALL>==========================
[StateDef 1230]
type = S
physics = S
moveType = I
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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

[State 1230, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1230, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1230, ases]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 1230, wi]
type = Width
trigger1 = 1
edge = 0,30

[State 1230, dd]
type = PlaySnd
trigger1 = time%14 = 0
value = 1, 5
channel = 6
ignorehitpause = 1
volume = 250

[State 1230, no]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1230, holda]
type = ChangeState
trigger1 = command != "hold_but"
value = 1231
ctrl = 0

;Batball Move
[Statedef 1231]
type = S
movetype = A
physics = S
ctrl = 0
poweradd = 0
sprpriority = 1
juggle = 6
velset = 0,0

[State 1231, ch]
type = ChangeAnim
trigger1 = prevstateno != 9000
trigger1 = time = 0
value = 1201
ctrl = 1

[State 1231, hp]
type = Helper
trigger1 = animelem = 9
name = "batballs"
ID = 1205
pos = 90,-65
postype = p1
stateno = 1235
ownpal = 1

[State 1231, hp]
type = Helper
trigger1 = animelem = 9
name = "batballs"
ID = 1205
pos = 90,-65
postype = p1
stateno = 1235
ownpal = 1

[State 1231, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 8
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, end]
type = Changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;=====================<BATBOMB>==========================
[StateDef 1300]
type = S
physics = S
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

[State 1300,sound]
type = Playsnd
trigger1 = time = 21
value = 1300,0

[State 1300, Projectile]
type = Helper
trigger1 = time = 29
helperType = Normal
stateNo = 1305
ID = 1305
name = "Batbomb Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1300, bomb]
type = Explod
trigger1 = time = 26
anim = 1307
pos = 66, -37
postype = p1
vel = 1, 9
removetime = 5
sprpriority = -1
bindtime = 1
ownpal = 1
ontop = 1

[State 1300, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX BATBOMB>=============================
[StateDef 1330]
type = S
physics = S
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
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

[State 1330, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1330, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1330,sound]
type = Playsnd
trigger1 = time = 21
value = 1300,0

[State 1330, Projectile]
type = Helper
trigger1 = time = 29
helperType = Normal
stateNo = 1335
ID = 1305
name = "Batbomb Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1330, Projectile]
type = Helper
trigger1 = time = 29
helperType = Normal
stateNo = 1335
ID = 1305
name = "Batbomb Projectile"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1330, bomb]
type = Explod
trigger1 = time = 26
anim = 1307
pos = 66, -37
postype = p1
vel = 1, 9
removetime = 5
sprpriority = -1
bindtime = 1
ownpal = 1
ontop = 1

[State 1330, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<DARK KNIGHT COMBO>==========================
[StateDef 1400]
type = S
physics = S
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

[State 1400, 1]
type = VelSet
trigger1 = Time >= 18
x = 2
y = 0

[State 1400, 1]
type = VelSet
trigger1 = Time >= 32
x = 3
y = 0

[State 1400, 1]
type = VelSet
trigger1 = Time >= 40
x = 1
y = 0

[State 1400, 1]
type = VelSet
trigger1 = Time >= 46
x = 0
y = 0

[State 1400, 6]
type = PlaySnd
trigger1 = time = 23
value = 1400,0

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 32, ifElse(var(10), 40, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 32, ifElse(var(10), 40, 55)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 7), ifElse(var(20), 3, 7)
guard.pauseTime = ifElse(var(20), 3, 7), ifElse(var(20), 3, 7)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1, -3
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
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 15
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 32, ifElse(var(10), 40, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 32, ifElse(var(10), 40, 55)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, ifElse(var(10) = 2, 0, ifElse(var(10) = 1, 0, -5))
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = ifElse(var(10) = 2, 0, ifElse(var(10) = 1, 0, 1))
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, 2]
type = ChangeState
trigger1 = var(10) = [1,2]
trigger1 = AnimTime = 0
value = 1401
ctrl = 1

[State 1400, 2]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Dark Knight Combo 2
[Statedef 1401]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1401
poweradd = 0

[State 1401, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 33, ifElse(var(10), 40, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 33, ifElse(var(10), 40, 55)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, ifElse(var(10) = 2, 0, ifElse(var(10) = 1, -5, -5))
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4, -5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = ifElse(var(10) = 2, 0, ifElse(var(10) = 1, 1, 1))
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, 2]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = AnimElem = 4
value = 1402
ctrl = 1

[State 1401, 2]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Dark Knight Combo 3
[Statedef 1402]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1402
poweradd = 0

[State 1402, 1]
type = VelSet
trigger1 = Time >= 6
x = 2
y = 0

[State 1402, 1]
type = VelSet
trigger1 = Time >= 11
x = 3
y = 0

[State 1402, 1]
type = VelSet
trigger1 = Time >= 16
x = 1
y = 0

[State 1402, 1]
type = VelSet
trigger1 = Time >= 23
x = 0
y = 0

[State 1402, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 33, ifElse(var(10), 40, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 33, ifElse(var(10), 40, 55)))), 7
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
ground.velocity = -5, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4, -5
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
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1402, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX DARK KNIGHT COMBO>=============================
[StateDef 1430]
type = S
physics = S
moveType = A
anim = 1420
ctrl = 0
velSet = 0,0
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
var(25) = 124

[State 1430, EX FX]
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

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1430, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1430, 1]
type = VelSet
trigger1 = Time >= 18
x = 2
y = 0

[State 1430, 1]
type = VelSet
trigger1 = Time >= 32
x = 3
y = 0

[State 1430, 1]
type = VelSet
trigger1 = Time >= 40
x = 1
y = 0

[State 1430, 1]
type = VelSet
trigger1 = Time >= 46
trigger2 = Time >= 84
x = 0
y = 0

[State 1430, 1]
type = VelSet
trigger1 = Time >= 55
x = 1
y = 0

[State 1430, 6]
type = PlaySnd
trigger1 = time = 23
value = 1400,0

[State 1430, 1]
type = Helper
trigger1 = time = 0
ID = 1425
name = "Energy Hit"
StateNo = 1425
postype = p1
pos = 0, 0
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999
ownpal = 1

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 7), ifElse(var(20), 3, 7)
guard.pauseTime = ifElse(var(20), 3, 7), ifElse(var(20), 3, 7)
animType = Light
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
air.velocity = -1, -3
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 15
trigger2 = AnimElem = 16
trigger3 = AnimElem = 19
trigger4 = AnimElem = 23
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 7), ifElse(var(20), 3, 7)
guard.pauseTime = ifElse(var(20), 3, 7), ifElse(var(20), 3, 7)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
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
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 27
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
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
ground.velocity = -20, -8
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -20, -8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
ID = 1430
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1430)
trigger1 = (Target(1430), StateNo = 5000) || (Target(1430), StateNo = 5010) || (Target(1430), StateNo = 5020)
value = 1435
ID = 1430
ignoreHitPause = 1

[State 1430, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 1431

[State 1430, 3]
type = ChangeState
trigger1 = MoveType = H
value = 0
ctrl = 1

;DNC End
[Statedef 1431]
type = S
movetype = I
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1421

[State 1431, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<HIT BY DARK KNIGHT COMBO>=============================
;Being Launched
[StateDef 1435]
type = A
moveType = H
physics = N
velSet = 0,0

[State 1435, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 5002

[State 1435, End]
type = ChangeState
trigger1 = HitShakeOver
value = 1436

;Heading Towards Wall
[StateDef 1436]
type = A
moveType = H
physics = N

[State 1436, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 1436, Gravity]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 1436, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1436, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 1436, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 1436, Bounce Off Wall]
type = ChangeState
trigger1 = BackEdgeBodyDist <= 10 || FrontEdgeBodyDist <= 10
value = 1437

[State 1436, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 0
value = 5100

;Impacting Wall
[StateDef 1437]
type = A
moveType = H
physics = N

[State 1437, Turn]
type = Turn
trigger1 = !Time
trigger1 = FrontEdgeDist < BackEdgeDist

[State 1437, PosSet]
type = PosSet
trigger1 = 1
x = -160 * Facing

[State 1437, PosFreeze]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1437, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1437, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1
ignoreHitPause = 1

[State 1437, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 5000

[State 1437, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,0

[State 1437, Hitting the Wall FX]
type = Explod
trigger1= !Time
anim = F72
pos = 0, floor(ScreenPos y) - 50
posType =  Back
sprPriority = 3

[State 1437, End]
type = ChangeState
trigger1 = Time >= 4
value = 1438

;Bouncing Off Wall
[Statedef 1438]
type = A
moveType = H
physics = N

[State 1438, Turn]
type = Turn
trigger1 = !Time

[State 1438, Gravity]
type = VelAdd
trigger1 = 1
y = 0.5

[State 1438, VelSet]
type = VelSet
trigger1 = !Time
x = -2.5
y = -9

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5051), 5051, 5030)

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
value = 5050

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = vel y > -3 && Anim = 5051 && SelfAnimExist(5061)
value = 5061

[State 1438, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,0
ignoreHitPause = 1

[State 1438, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 1438, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 0
value = 5100

;=====================<BATGRAPPLE>==========================
[StateDef 1500]
type = S
physics = S
moveType = I
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, grapplefx]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1500,0

[State 1500, 1]
type = Helper
trigger1 = AnimElem = 7
ID = 1502
pos = 70,-93
postype = p1
facing = 1
stateno = 1502
helpertype = normal
name = "Spear"
keyctrl = 0
ownpal = 1

[State 1500, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 1500, 3]
type = ChangeState
trigger1 = p2stateno = 1505
value = 1501
ctrl = 1

;Continue
[Statedef 1501]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1501
sprpriority = 3

[State 1501, grapplefx]
type = PlaySnd
trigger1 = time = 6
value = 1500,3
channel = 1

[State 1501,sound2]
type = Playsnd
trigger1 = time = 14
value = 52,0
channel = 2

[State 1501, grapple1P2]
type = explod
trigger1 = P2stateno = 1505
anim = 1511
ID = 1111
sprpriority = 5
postype = p2
pos = 0,-85
removetime = 20
ownpal = 1
removeongethit = 1
supermovetime = -1
bindtime = -1

[State 1501, 1]
type = VelSet
trigger1 = Time = 5
x = 1
y = -2

[State 1501, 1]
type = VelSet
trigger1 = Time >= 8
x = 11
y = 0

[State 1501, 1]
type = VelSet
trigger1 = p2movetype = H && MoveHit = 1
x = 0
y = 0

[State 1501, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 146, ifElse(var(10), 139, 125)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 146, ifElse(var(10), 139, 125)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -37
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1501, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 146, ifElse(var(10), 139, 125)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 146, ifElse(var(10), 139, 125)))), 7
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
ground.velocity = -5, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
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

[State 1501,1]
type = RemoveExplod
trigger1 = anim!= 1501
ID = 1111

[State 1501, 4]
type = DestroySelf
trigger1 = P2Stateno=5300

[State 1501, 3]
type = ChangeState
trigger1 = p2movetype = H && MoveHit = 1
trigger2 = time > 30
value = 1506

;Grappler
[Statedef 1502]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1515
sprpriority = -3

[State 1502, 3]
type = PosSet
trigger1 = (P2Stateno=1505) && (time <10)
y = -85

[State 1502, 3]
type = PosSet
trigger1 = (P2Stateno=1505) && (time >=10)
y = -95

[State 1502, 2]
type = VelSet
trigger1 = 1
x = 7
y = 0

[State 1502, SP]
type = SuperPause
trigger1 = Movehit
darken = 0
Time = 10
Anim = 1005

[State 1502, T]
type = EnvShake
trigger1 = Movehit
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1502, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1502, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1502, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = AnimElem = 1
attr = S,NA
hitFlag = M
guardFlag = M
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p2stateno = 1505
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1502, 4]
type = ChangeState
trigger1 = movehit
value = 1503

[State 1502, 4]
type = DestroySelf
trigger1 = time >= 28||moveguarded
trigger1 = !movehit

;Acerta p2
[StateDef 1503]
type = S
movetype = I
physics = S
juggle = 2
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = -1

[State 1503,1]
type = RemoveExplod
trigger1 = 1
ID = 1111

[State 1503, 2]
type = RemoveExplod
trigger1 = 1
ID = 1112

[State 1503, 3]
type = RemoveExplod
trigger1 = 1
ID = 1113

[State 1503, 4]
type = RemoveExplod
trigger1 = 1
ID = 1114

[State 1503, 5]
type = RemoveExplod
trigger1 = 1
ID = 1115

[State 1503, 1]
type = PosSet
trigger1 = time = 0
y = -85

[State 1503, 1]
type = PosSet
trigger1 = time = 5
y = -102

[State 1503, 1]
type = PosSet
trigger1 = time = 12
y = -110

[State 1503, 1]
type = VelSet
trigger1 = time = 10
x = -8
y = 0

[State 1503, 4]
type = DestroySelf
trigger1 = enemy(0), anim = 5300
trigger2 = P2Stateno != 1505

;P2 state
[Statedef 1505]
type = U
MoveType = H
physics = U
ctrl = 0
VelSet = 0,0
anim = 5002

[State 1505, a]
type = ChangeAnim
trigger1 = AnimExist(5000);(7696)
value = (5000);7696
persistent = 0

[State 1505, KOed by grpp
type = ChangeState
trigger1 = life <= 0
value = 5050

[State 1505, gr]
type = ChangeAnim
triggerall = AnimExist(5300)
trigger1 = (time = 10) && StateType != A
value = 5300

[State 1505, gr1]
type = SelfState
triggerall = AnimExist(5300)
trigger1 = (time = 10) && StateType = A
value = 5030

[State 1505, gr2]
type = SelfState
triggerall = AnimExist(5300)
trigger1 = time >= 101
ctrl = 1
value = 5030

[State 1505, gr3]
type = SelfState
triggerall = !AnimExist(5300)
trigger1 = time = 15
ctrl = 1
value = 5030

;End
[Statedef 1506]
type = S
physics = S
anim = 1506
sprpriority = 1
ctrl = 0

[State 1506, 1]
type = VelSet
trigger1 = 1
y = 0

[State 1506, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1506, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX BATGRAPPLE>=============================
[StateDef 1530]
type = S
physics = S
moveType = I
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
var(25) = 124

[State 1530, EX FX]
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

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" && command = "b"), 0, ifElse((command = "a" && command = "c"), 1, 2))

[State 1530, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1530, grapplefx]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1500,0

[State 1530, 1]
type = Helper
trigger1 = AnimElem = 7
ID = 1502
pos = 70,-93
postype = p1
facing = 1
stateno = 1532
helpertype = normal
name = "Spear"
keyctrl = 0
ownpal = 1

[State 1530, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 1530, 3]
type = ChangeState
trigger1 = p2stateno = 1505
value = 1531
ctrl = 1

;Continue
[Statedef 1531]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1531
sprpriority = 3

[State 1531, grapplefx]
type = PlaySnd
trigger1 = time = 6
value = 1500,3
channel = 1

[State 1531,sound2]
type = Playsnd
trigger1 = time = 14
value = 52,0
channel = 2

[State 1531, grapple1P2]
type = explod
trigger1 = P2stateno = 1505
anim = 1511
ID = 1111
sprpriority = 5
postype = p2
pos = 0,-85
removetime = 20
ownpal = 1
removeongethit = 1
supermovetime = -1
bindtime = -1

[State 1531, 1]
type = VelSet
trigger1 = Time = 5
x = 1
y = -2

[State 1531, 1]
type = VelSet
trigger1 = Time >= 8
x = 11
y = 0

[State 1531, 1]
type = VelSet
trigger1 = p2movetype = H && MoveHit = 1
x = 0
y = 0

[State 1531, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 78 < 7, 7, fvar(11) * 78)), 7
getPower = 0,0
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
ground.velocity = -5, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
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

[State 1531,1]
type = RemoveExplod
trigger1 = anim!= 1531
ID = 1111

[State 1531, 4]
type = DestroySelf
trigger1 = P2Stateno=5300

[State 1531, 3]
type = ChangeState
;trigger1 = p2movetype = H && MoveHit = 1
trigger1 = time > 30
value = 1506

;Grappler
[Statedef 1532]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1515
sprpriority = -3

[State 1532, 3]
type = PosSet
trigger1 = (P2Stateno=1505) && (time <10)
y = -85

[State 1532, 3]
type = PosSet
trigger1 = (P2Stateno=1505) && (time >=10)
y = -95

[State 1532, 2]
type = VelSet
trigger1 = 1
x = 7
y = 0

[State 1532, SP]
type = SuperPause
trigger1 = Movehit
darken = 0
Time = 10
Anim = 1005

[State 1532, T]
type = EnvShake
trigger1 = Movehit
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8

[State 1532, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1532, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1532, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = AnimElem = 1
attr = S,NA
hitFlag = M
guardFlag = M
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
p2stateno = 1505
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
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
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1532, 4]
type = ChangeState
trigger1 = movehit
value = 1503

[State 1532, 4]
type = DestroySelf
trigger1 = time >= 28||moveguarded
trigger1 = !movehit

;=====================<BATGRAPPLE 2>==========================
[StateDef 1600]
type = S
physics = S
moveType = I
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1600, Grapplefx]
type = PlaySnd
trigger1 = time = 24
value = 1500,0

[State 1600, exp]
type = Explod
trigger1 = Time = 19
anim = 1605
pos = 61,-121
sprpriority = -1
removetime = 7
ownpal = 1

[State 1600, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 1601

;BatGrapple 2 Continue
[Statedef 1601]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1601
poweradd = 0

[State 1601, 1]
type = VelSet
trigger1 = Time = 0
x = 1
y = -2

[State 1601, 1]
type = VelSet
trigger1 = Time >= 5
x = 7
y = -1

[State 1601, 1]
type = VelSet
trigger1 = Time >= 10
x = 14
y = -2

[State 1601, 1]
type = VelSet
trigger1 = Time >= 18
x = 4
y = 4

[State 1601, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 1601,sound2]
type = Playsnd
trigger1 = time = 13
value = 52,0
channel = 2

[State 1601, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 1601, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
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
ground.velocity = -6, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, -6
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

[State 1601, Change to Fall]
type = ChangeState
trigger1 = (Time >= 15) && (Pos Y >= 0)
value = 1602

;BatGrapple Y end
[Statedef 1602]
type = S
physics = S
anim = 101
sprpriority = 1
ctrl = 0

[State 1602, 1]
type = VelSet
trigger1 = 1
y = 0

[State 1602, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1602, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX BATGRAPPLE 2>=============================
[StateDef 1630]
type = S
physics = S
moveType = I
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 124

[State 1630, EX FX]
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

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" && command = "b"), 0, ifElse((command = "a" && command = "c"), 1, 2))

[State 1630, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1630, Grapplefx]
type = PlaySnd
trigger1 = time = 24
value = 1500,0

[State 1630, exp]
type = Explod
trigger1 = Time = 19
anim = 1605
pos = 61,-121
sprpriority = -1
removetime = 7
ownpal = 1

[State 1630, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 1631

;BatGrapple 2 Continue
[Statedef 1631]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1631
poweradd = 0

[State 1631, 1]
type = VelSet
trigger1 = Time = 0
x = 1
y = -2

[State 1631, 1]
type = VelSet
trigger1 = Time >= 5
x = 7
y = -1

[State 1631, 1]
type = VelSet
trigger1 = Time >= 10
x = 14
y = -2

[State 1631, 1]
type = VelSet
trigger1 = Time >= 18
x = 4
y = 4

[State 1631, 1]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 1631,sound2]
type = Playsnd
trigger1 = time = 13
value = 52,0
channel = 2

[State 1631, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 1631, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 7
getPower = 0,0
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
ground.velocity = -6, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, -6
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

[State 1631, Change to Fall]
type = ChangeState
trigger1 = (Time >= 15) && (Pos Y >= 0)
value = 1602

;=====================<AIR BATGRAPPLE 2>==========================
[StateDef 1650]
type = A
physics = S
moveType = A
anim = 1650
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1650, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1650, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1650, Grapplefx]
type = PlaySnd
trigger1 = time = 2
value = 1500,0

[State 1650, exp]
type = Explod
trigger1 = Time = 4
anim = 1652
pos = -30,-5
sprpriority = -1
removetime = 6
ownpal = 1

[State 1650, grap]
type = Helper
trigger1 = time = 11
ID = 1651
name = "grapple"
stateNo = 1651
postype = p1
pos = 0,0
ownpal = 1

[State 1650, 1]
type = VelSet
trigger1 = Time = 3
x = 1
y = -2

[State 1650, 2]
type = VelSet
trigger1 = Time >= 10
x = 6
y = -1

[State 1650, 3]
type = VelSet
trigger1 = Time >= 15
x = 8
y = -1

[State 1650, 4]
type = VelSet
trigger1 = Time >= 45
x = 4
y = 6

[State 1650, 5]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 1650,sound2]
type = Playsnd
trigger1 = time = 9 || time = 21
value = 52,0
channel = 2

[State 1650, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 1650, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
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
ground.velocity = -6, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, -6
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

[State 1650, ChangeFall]
type = ChangeState
trigger1 = (Time >= 15) && (Pos Y >= 0)
value = 1602

;Grapple
[Statedef 1651]
type = A
movetype = I
physics = N
anim = 1
sprpriority = 2

[State 1651, 0]
type = VarSet
trigger1 = time = 0
v = 0
value = parent, StateNo

[State 1651, 1]
type = ChangeAnim
trigger1 = AnimExist(parent, Anim + 1)
value = parent, Anim + 1
elem = Parent, AnimElemNo(0)

[State 1651, 2]
type = BindToParent
trigger1 = 1
pos = 0, 0

[State 1651, 3]
type = DestroySelf
trigger1 = Parent, StateNo != var(0)
trigger2 = Parent, MoveType = H
trigger3 = Time >= 42

;========================<EX AIR BATGRAPPLE 2>=============================
[StateDef 1680]
type = A
physics = S
moveType = A
anim = 1680
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 124

[State 1680, EX FX]
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

[State 1680, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1680, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" && command = "b"), 0, ifElse((command = "a" && command = "c"), 1, 2))

[State 1680, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1680, Grapplefx]
type = PlaySnd
trigger1 = time = 2
value = 1500,0

[State 1680, exp]
type = Explod
trigger1 = Time = 4
anim = 1652
pos = -30,-5
sprpriority = -1
removetime = 6
ownpal = 1

[State 1680, grap]
type = Helper
trigger1 = time = 11
ID = 1651
name = "grapple"
stateNo = 1651
postype = p1
pos = 0,0
ownpal = 1

[State 1680, 1]
type = VelSet
trigger1 = Time = 3
x = 1
y = -2

[State 1680, 2]
type = VelSet
trigger1 = Time >= 10
x = 6
y = -1

[State 1680, 3]
type = VelSet
trigger1 = Time >= 15
x = 8
y = -1

[State 1680, 4]
type = VelSet
trigger1 = Time >= 45
x = 4
y = 6

[State 1680, 5]
type = PlaySnd
trigger1 = Time = 2
value = 1, ifelse(Random > 500, 4, 5)

[State 1680,sound2]
type = Playsnd
trigger1 = time = 9 || time = 21
value = 52,0
channel = 2

[State 1680, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 1680, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 6
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 7
getPower = 0,0
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
ground.velocity = -6, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, -6
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

[State 1680, ChangeFall]
type = ChangeState
trigger1 = (Time >= 15) && (Pos Y >= 0)
value = 1602

;=====================<BATGRAPPLE 3>==========================
[StateDef 1700]
type = S
physics = S
moveType = I
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

[State 1700, Grapplefx]
type = PlaySnd
trigger1 = time = 23
value = 1500,0

[State 1700, 2]
type = ScreenBound
trigger1 = Animelem = 7,>= 0
value = 0
movecamera = 0,0

[state 1700, AssertSpecial]
type = AssertSpecial
trigger1 = Animelem = 7,>= 0
flag = NoShadow

[State 1700, capefx]
type = PlaySnd
trigger1 = time = 28
value = 1700,0

[State 1700, 1]
type = VelSet
trigger1 = Time >= 28
x = .1
y = -7

[State 1700, 1]
type = VelSet
trigger1 = Time >= 31
x = 0
y = -12

[State 1700, 2]
type = ChangeState
trigger1 = Time >= 70
value = 1701

;BatGrapple 3 continue
[Statedef 1701]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1
poweradd = 0

[State 1701, Anim]
type = ChangeAnim
trigger1 = 1
postype = P2
value = 1702

[State 1701, 1]
type = posSet
trigger1 = Time = 0
x = 120
y = -150

[State 1701, 1]
type = VelSet
trigger1 = Time >= 0
x = (P2BodyDist X+17)
y = 17

[State 1701,sound2]
type = Playsnd
trigger1 = time = 18
value = 52,0
channel = 2

[State 1701, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 1701, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
attr = C, NA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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

[State 1701, Change to Fall]
type = ChangeState
trigger1 = MoveHit || MoveGuarded
value = 1702

[State 1701, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 1602

;BatGrapple 3 end
[Statedef 1702]
type = S
physics = S
anim = 1705
sprpriority = 1
ctrl = 0

[State 1702, 1]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 0

[State 1702, 1]
type = VelSet
trigger1 = Time >= 6
x = -3
y = -1

[State 1702, 1]
type = VelSet
trigger1 = Time >= 17
x = -2
y = 4

[State 1702, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 1602

;========================<EX BATGRAPPLE 3>=============================
[StateDef 1730]
type = S
physics = S
moveType = I
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 124

[State 1730, EX FX]
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

[State 1730, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1730, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" && command = "b"), 0, ifElse((command = "a" && command = "c"), 1, 2))

[State 1730, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1730, Grapplefx]
type = PlaySnd
trigger1 = time = 23
value = 1500,0

[State 1730, 2]
type = ScreenBound
trigger1 = Animelem = 7,>= 0
value = 0
movecamera = 0,0

[state 1730, AssertSpecial]
type = AssertSpecial
trigger1 = Animelem = 7,>= 0
flag = NoShadow

[State 1730, capefx]
type = PlaySnd
trigger1 = time = 28
value = 1700,0

[State 1730, 1]
type = VelSet
trigger1 = Time >= 28
x = .1
y = -7

[State 1730, 1]
type = VelSet
trigger1 = Time >= 31
x = 0
y = -12

[State 1730, 2]
type = ChangeState
trigger1 = Time >= 70
value = 1731

;BatGrapple 3 continue
[Statedef 1731]
type = S
movetype = A
physics = S
juggle = 1
velset = 0,0
ctrl = 0
anim = 1
poweradd = 0

[State 1731, Anim]
type = ChangeAnim
trigger1 = 1
postype = P2
value = 1702

[State 1731, 1]
type = posSet
trigger1 = Time = 0
x = 120
y = -150

[State 1731, 1]
type = VelSet
trigger1 = Time >= 0
x = (P2BodyDist X+17)
y = 17

[State 1731,sound2]
type = Playsnd
trigger1 = time = 18
value = 52,0
channel = 2

[State 1731, T]
type = EnvShake
trigger1 = Movehit
freq = 50
ampl = 2
time = 20
persistent = 1
ignorehitpause = 1

[State 1731, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 1
attr = C, NA
hitFlag = MAFD
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 82 < 7, 7, fvar(11) * 82)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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

[State 1731, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 2
attr = C, NA
hitFlag = MAFD
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 7
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

[State 1731, Change to Fall]
type = ChangeState
trigger1 = hitcount >= 2 || MoveGuarded
value = 1702

[State 1701, Change to Fall]
type = ChangeState
trigger1 = (Time >= 50) || (Pos Y >= 0)
value = 1602

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
trigger1 = AnimElem = 3
value = 4, 2
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
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
sparkXY = -10 + 0 * (var(35) := 155), var(36) := -80
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
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 2
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
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
sparkXY = -10 + 0 * (var(35) := 196), var(36) := -5
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
