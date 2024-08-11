; _________________________________________
;| Iron Man by varo_hades                  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<UNIBEAM>==========================
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

[State 1000, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 0
channel = 0

[State 1000, 2]
type = Explod
trigger1 = AnimElem = 2
anim = 4060
id = 1000
postype = P1
pos = -2, 2
sprpriority = 4
ownpal = 1
removetime = 29

[State 1000, 3]
type = Explod
trigger1 = AnimElem = 7, 2
anim = 4061
id = 1001
postype = P1
pos = -2, 2
sprpriority = 6
ownpal = 1
removetime = 18

[State 1000, 4]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4062
id = 1002
postype = P1
pos = 10, -73
sprpriority = 5
ownpal = 1
removetime = 29
accel = 0.675, 0.45

[State 1000, 5]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4063
id = 1003
postype = P1
pos = 0, -73
sprpriority = 5
ownpal = 1
removetime = 29
accel = -1.4, 0.675

[State 1000, 6]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4064
id = 1004
postype = P1
pos = 4, -81
sprpriority = 5
ownpal = 1
removetime = 29
accel = -0.14625, -0.675

[State 1000, 7.1]
type = Helper
trigger1 = AnimElem = 7, 2
name = "Unibeam Attacker"
id = 1005
postype = P1
pos = 4, -76
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX UNIBEAM>=============================
[StateDef 1030]
type = S
physics = S
moveType = I
anim = 1030
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

[State 1030, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 1
channel = 0

[State 1030, 2]
type = Explod
trigger1 = AnimElem = 2
anim = 4060
id = 1000
postype = P1
pos = -2, 2
sprpriority = 4
ownpal = 1
removetime = 29

[State 1030, 3]
type = Explod
trigger1 = AnimElem = 7, 2
anim = 4061
id = 1001
postype = P1
pos = -2, 2
sprpriority = 6
ownpal = 1
removetime = 18

[State 1030, 4]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4062
id = 1002
postype = P1
pos = 10, -73
sprpriority = 5
ownpal = 1
removetime = 29
accel = 0.675, 0.45

[State 1030, 5]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4063
id = 1003
postype = P1
pos = 0, -73
sprpriority = 5
ownpal = 1
removetime = 29
accel = -1.4, 0.675

[State 1030, 6]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4064
id = 1004
postype = P1
pos = 4, -81
sprpriority = 5
ownpal = 1
removetime = 29
accel = -0.14625, -0.675

[State 1030, 7.1]
type = Helper
trigger1 = AnimElem = 7, 2
name = "Unibeam Attacker"
id = 1005
postype = P1
pos = 4, -76
stateno = 1035
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=====================<AIR UNIBEAM>==========================
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
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1070, ifElse(var(10) = 1, 1060, 1050))

[State 1050, VarSet]
type = VarSet
trigger1 = prevstateno = 1310
v = 42
value = 1

[State 1050, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 0
channel = 0

[State 1050, 2]
type = Explod
trigger1 = AnimElem = 2
anim = 4060
id = 1000
postype = P1
pos = 0, 0
sprpriority = 4
ownpal = 1
removetime = 29
bindtime = -1

[State 1050, 3]
type = Explod
trigger1 = AnimElem = 7, 2
anim = 4061
id = 1001
postype = P1
pos = 0, 0
sprpriority = 6
ownpal = 1
removetime = 18
bindtime = -1

[State 1050, 4]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4062
id = 1002
postype = P1
pos = 17, -77
sprpriority = 5
ownpal = 1
removetime = 29
accel = 0.675, 0.45

[State 1050, 5]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4063
id = 1003
postype = P1
pos = 17, -77
sprpriority = 5
ownpal = 1
removetime = 29
accel = -1.4, 0.675

[State 1050, 6]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4064
id = 1004
postype = P1
pos = 17, -77
sprpriority = 5
ownpal = 1
removetime = 29
accel = -0.14625, -0.675

[State 1050, 7.1]
type = Helper
trigger1 = AnimElem = 7, 2
name = "Unibeam Attacker"
id = 1005
postype = P1
pos = 18, -78
stateno = 1055
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1050, VelSet]
type = VelSet
trigger1 = var(42)
x = 0
y = 0

[State 1050, 11]
type = VelSet
trigger1 = Pos Y < -0.2 && !var(42)
x = 0
y = 0.3

[State 1050, 12]
type = VelSet
trigger1 = Pos Y >= -0.2
x = 0
y = 0

[State 1050, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1050, 13.2]
type = ChangeState
trigger1 = AnimTime = 0
value = ifelse(Var(42)=1, 1310, 50)
ctrl = 1

;========================<EX AIR UNIBEAM>=============================
[StateDef 1080]
type = A
physics = A
moveType = I
anim = 1080
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

[State 1080, VarSet]
type = VarSet
trigger1 = prevstateno = 1310
v = 42
value = 1

[State 1080, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 1
channel = 0

[State 1080, 2]
type = Explod
trigger1 = AnimElem = 2
anim = 4060
id = 1000
postype = P1
pos = 0, 0
sprpriority = 4
ownpal = 1
removetime = 29
bindtime = -1

[State 1080, 3]
type = Explod
trigger1 = AnimElem = 7, 2
anim = 4061
id = 1001
postype = P1
pos = 0, 0
sprpriority = 6
ownpal = 1
removetime = 18
bindtime = -1

[State 1080, 4]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4062
id = 1002
postype = P1
pos = 17, -77
sprpriority = 5
ownpal = 1
removetime = 29
accel = 0.675, 0.45

[State 1080, 5]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4063
id = 1003
postype = P1
pos = 17, -77
sprpriority = 5
ownpal = 1
removetime = 29
accel = -1.4, 0.675

[State 1080, 6]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11, 2
anim = 4064
id = 1004
postype = P1
pos = 17, -77
sprpriority = 5
ownpal = 1
removetime = 29
accel = -0.14625, -0.675

[State 1080, 7.1]
type = Helper
trigger1 = AnimElem = 7, 2
name = "Unibeam Attacker"
id = 1005
postype = P1
pos = 18, -78
stateno = 1085
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1080, VelSet]
type = VelSet
trigger1 = var(42)
x = 0
y = 0

[State 1080, 11]
type = VelSet
trigger1 = Pos Y < -0.2 && !var(42)
x = 0
y = 0.3

[State 1080, 12]
type = VelSet
trigger1 = Pos Y >= -0.2
x = 0
y = 0

[State 1080, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1080, 13.2]
type = ChangeState
trigger1 = AnimTime = 0
value = ifelse(Var(42)=1, 1310, 50)
ctrl = 1

;========================<SMART BOMB>=============================
[StateDef 1100]
type = S
physics = S
moveType = I
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, 1]
type = PlaySnd
trigger1 = AnimElem = 15, 2
value = 1100, 2

[State 1100, 2]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100, 0
channel = 0

[State 1100, 3.1]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1100
postype = P1
pos = -14, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1100, 3.2]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1101
postype = P1
pos = 36, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1100, 3.1]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1110
postype = P1
pos = -14, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1100, 3.2]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1111
postype = P1
pos = 36, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1100, 3.1]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1120
postype = P1
pos = -14, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1100, 3.2]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1121
postype = P1
pos = 36, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1100, 4.1]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1102
postype = P1
pos = -11, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1100, 4.2]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1103
postype = P1
pos = 36, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1100, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX SMART BOMB>=============================
[StateDef 1130]
type = S
physics = S
moveType = I
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

[State 1130, 1]
type = PlaySnd
trigger1 = AnimElem = 15, 2
value = 1100, 2

[State 1130, 2]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100, 1
channel = 0

[State 1130, 3.1]
type = Helper
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1100
postype = P1
pos = -14, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1130, 3.2]
type = Helper
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1101
postype = P1
pos = 36, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1130, 3.1]
type = Helper
trigger1 = AnimElem = 17, 2
name = "Smart Bomb Right"
id = 1100
postype = P1
pos = -14, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1130, 3.2]
type = Helper
trigger1 = AnimElem = 17, 2
name = "Smart Bomb Left"
id = 1101
postype = P1
pos = 36, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1130, 4.1]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1102
postype = P1
pos = -11, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1130, 4.2]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1103
postype = P1
pos = 36, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1130, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<AIR SMART BOMB>=============================
[StateDef 1150]
type = A
physics = A
moveType = I
anim = 1150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1150, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1150, VarSet]
type = VarSet
trigger1 = prevstateno = 1310
v = 42
value = 1

[State 1150, 1.1]
type = PlaySnd
trigger1 = AnimElem = 15, 2
value = 1100, 2

[State 1150, 1.2]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100, 0
channel = 0

[State 1150, 2]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1150, 3.1]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1100
postype = P1
pos = -14, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1150, 3.2]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1101
postype = P1
pos = 36, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1150, 3.1]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1110
postype = P1
pos = -14, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1150, 3.2]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1111
postype = P1
pos = 36, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1150, 3.1]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1120
postype = P1
pos = -14, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1150, 3.2]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1121
postype = P1
pos = 36, -84
stateno = 1105
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1150, 4.1]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1102
postype = P1
pos = -11, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1150, 4.2]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1103
postype = P1
pos = 36, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1150, 7.1]
type = ChangeState
trigger1 = AnimTime = 0
value = ifelse(Var(42)=1, 1310, 50)
ctrl = 1

;========================<EX AIR SMART BOMB>=============================
[StateDef 1180]
type = S
physics = S
moveType = I
anim = 1150
ctrl = 0
velSet = 0,0
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
var(25) = 131

[State 1180, EX FX]
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

[State 1180, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1180, VarSet]
type = VarSet
trigger1 = prevstateno = 1310
v = 42
value = 1

[State 1180, 1.1]
type = PlaySnd
trigger1 = AnimElem = 15, 2
value = 1100, 2

[State 1180, 1.2]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100, 1
channel = 0

[State 1180, 2]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1180, 3.1]
type = Helper
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Right"
id = 1100
postype = P1
pos = -14, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1180, 3.2]
type = Helper
trigger1 = AnimElem = 15, 2
name = "Smart Bomb Left"
id = 1101
postype = P1
pos = 36, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1180, 3.1]
type = Helper
trigger1 = AnimElem = 17, 2
name = "Smart Bomb Right"
id = 1100
postype = P1
pos = -14, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1180, 3.2]
type = Helper
trigger1 = AnimElem = 17, 2
name = "Smart Bomb Left"
id = 1101
postype = P1
pos = 36, -84
stateno = 1135
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = .8333
size.yscale = 1

[State 1180, 4.1]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1102
postype = P1
pos = -11, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1180, 4.2]
type = Explod
trigger1 = AnimElem = 15, 3
anim = 4071
id = 1103
postype = P1
pos = 36, -84
ontop = 1
ownpal = 1
removetime = 4
scale = .8333,1

[State 1180, 7.1]
type = ChangeState
trigger1 = AnimTime = 0
value = ifelse(Var(42)=1, 1310, 50)
ctrl = 1

;=====================<REPULSOR BLAST>==========================
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

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1220, ifElse(var(10) = 1, 1210, 1200))

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 0
channel = 0

[State 1200, 2.1]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 5, 2
name = "Laser Down Foward"
id = 1201
postype = P1
pos = 6, -119
stateno = 1201
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.2]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 8
name = "Laser Up Foward"
id = 1202
postype = P1
pos = 6, -119
stateno = 1202
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.3]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 11, 2
name = "Laser Up Back"
id = 1203
postype = P1
pos = 6, -119
stateno = 1203
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.4]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 14, 2
name = "Laser Down Back"
id = 1204
postype = P1
pos = 6, -119
stateno = 1204
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 3.1]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 6
name = "Laser Down Foward1"
id = 1211
postype = P1
pos = 6, -119
stateno = 1201
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 3.2]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 10
name = "Laser Up Foward1"
id = 1212
postype = P1
pos = 6, -119
stateno = 1202
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 3.3]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 13, 2
name = "Laser Up Back1"
id = 1213
postype = P1
pos = 6, -119
stateno = 1203
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 3.4]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 17, 2
name = "Laser Down Back1"
id = 1214
postype = P1
pos = 6, -119
stateno = 1204
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.1]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 6, 3
name = "Laser Down Foward1"
id = 1221
postype = P1
pos = 6, -119
stateno = 1201
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.2]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 11, 2
name = "Laser Up Foward1"
id = 1222
postype = P1
pos = 6, -119
stateno = 1202
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.3]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 16
name = "Laser Up Back1"
id = 1223
postype = P1
pos = 6, -119
stateno = 1203
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 2.4]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 20, 2
name = "Laser Down Back1"
id = 1224
postype = P1
pos = 6, -119
stateno = 1204
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1200, 3]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX REPULSOR BLAST>=============================
[StateDef 1230]
type = S
physics = S
moveType = I
anim = 1230
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
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 1
channel = 0

[State 1230, 2.1]
type = Helper
trigger1 = AnimElem = 6, 3
name = "Laser Down Foward1"
id = 1221
postype = P1
pos = 6, -119
stateno = 1231
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.2]
type = Helper
trigger1 = AnimElem = 11, 2
name = "Laser Up Foward1"
id = 1222
postype = P1
pos = 6, -119
stateno = 1232
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.3]
type = Helper
trigger1 = AnimElem = 16
name = "Laser Up Back1"
id = 1223
postype = P1
pos = 6, -119
stateno = 1233
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.4]
type = Helper
trigger1 = AnimElem = 20, 2
name = "Laser Down Back1"
id = 1224
postype = P1
pos = 6, -119
stateno = 1234
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.1]
type = Helper
trigger1 = AnimElem = 24, 3
name = "Laser Down Foward1"
id = 1221
postype = P1
pos = 6, -119
stateno = 1231
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.2]
type = Helper
trigger1 = AnimElem = 28, 2
name = "Laser Up Foward1"
id = 1222
postype = P1
pos = 6, -119
stateno = 1232
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.3]
type = Helper
trigger1 = AnimElem = 32
name = "Laser Up Back1"
id = 1223
postype = P1
pos = 6, -119
stateno = 1233
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 2.4]
type = Helper
trigger1 = AnimElem = 36, 2
name = "Laser Down Back1"
id = 1224
postype = P1
pos = 6, -119
stateno = 1234
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1230, 3]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1230, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<FLY>=============================
[StateDef 1300]
type = S
physics = S
moveType = I
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1300, 1]
type = PosSet
trigger1 = 1
y = -2

[State 1300, 2.1]
type = Explod
trigger1 = Time = 0
anim = 4006
id = 1300
postype = P1
pos = -13, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1300, 2.2]
type = Explod
trigger1 = Time = 0
anim = 4006
id = 1300
postype = P1
pos = 0, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1300, 7]
type = ChangeState
trigger1 = Time = 1
value = 1305

;Getting set
[Statedef 1305]
type = A
movetype = I
physics = A
juggle = 0
ctrl = 0
sprpriority = 2

[State 1305, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1305, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1305, 1]
type = PlaySnd
trigger1 = Time = 0
value = 41, 1

[State 1305, 2]
type = ChangeAnim
trigger1 = PrevStateNo != 1300
value = 1300

[State 1305, 3]
type = VelSet
trigger1 = 1
x = 0
y = -4

[State 1305, 4.1]
type = Explod
trigger1 = NumExplod(1300) = 0
trigger1 = Time = 0
anim = 4006
id = 1300
postype = P1
pos = -13, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1305, 4.2]
type = Explod
trigger1 = NumExplod(1301) = 0
trigger1 = Time = 0
anim = 4006
id = 1301
postype = P1
pos = 0, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1305, 7]
type = ChangeState
trigger1 = NumExplod(1301) = 0
value = 1310
ctrl = 1

;Flying
[Statedef 1310]
type = A
movetype = I
physics = A
juggle = 0
ctrl = 0
sprpriority = 2

[State 1310, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1310, VarSet]
type = VarSet
trigger1 = time = 0
v = 42
value = 0

[State 1310, 0]
type = Helper
trigger1 = var(10) = [0,2]
trigger1 = PrevStateNo = 1305
trigger1 = Time = 0
name = "Timer"
id = 1310
postype = P1
pos = 0, 0
stateno = 1320
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1310, 0]
type = Helper
trigger1 = var(10) = 3
trigger1 = PrevStateNo = 1335
trigger1 = Time = 0
name = "Timer"
id = 1310
postype = P1
pos = 0, 0
stateno = 1340
helpertype = normal
keyctrl = 0
ownpal = 1

; Change Anim
; Stand / Going down
[State 1310, 1.1/5]
type = ChangeAnim
triggerall = Anim != 1313
trigger1 = Vel X = 0
trigger1 = Vel Y = 0
trigger2 = Vel X = 0
trigger2 = Vel Y > 0
value = 1313

; Going Foward (Up, down and horizontal)
[State 1310, 1.2]
type = ChangeAnim
triggerall = Anim != 1310
triggerall = Vel X > 0
trigger1 = Vel Y = 0
trigger2 = Vel Y != 0
value = 1310

; Going Up
[State 1310, 1.3]
type = ChangeAnim
triggerall = Anim != 1311
trigger1 = Vel X = 0
trigger1 = Vel Y < 0
value = 1311

; Going Back (Up, down and horizontal)
[State 1310, 1.4]
type = ChangeAnim
triggerall = Anim != 1312
triggerall = Vel X < 0
trigger1 = Vel Y = 0
trigger2 = Vel Y != 0
value = 1312

; VelSet
; Stand
[State 1310, 2.1]
type = VelSet
trigger1 = Command != "holdfwd"
trigger1 = Command != "holdback"
trigger1 = Command != "holdup"
trigger1 = Command != "holddown"
x = 0
y = 0

; Going Up Foward
[State 1310, 2.2a]
type = VelSet
trigger1 = Command = "holdfwd"
trigger1 = Command = "holdup"
trigger1 = Command != "holdback"
trigger1 = Command != "holddown"
x = const(velocity.walk.fwd.x)*(94/50)
y = -4

; Going Down Foward
[State 1310, 2.2b]
type = VelSet
trigger1 = Command = "holdfwd"
trigger1 = Command = "holddown"
trigger1 = Command != "holdback"
trigger1 = Command != "holdup"
x = const(velocity.walk.fwd.x)*(94/83)
y = ifelse(Pos Y < -5, 3.5, 0)

; Going Down Foward
[State 1310, 2.2c]
type = VelSet
trigger1 = Command = "holdfwd"
trigger1 = Command != "holdback"
trigger1 = Command != "holdup"
trigger1 = Command != "holddown"
x = const(velocity.walk.fwd.x)*(94/35)
y = 0

; Going Up
[State 1310, 2.3]
type = VelSet
trigger1 = Command = "holdup"
trigger1 = Command != "holdfwd"
trigger1 = Command != "holdback"
trigger1 = Command != "holddown"
x = 0
y = -4

; Going Up Back
[State 1310, 2.4a]
type = VelSet
trigger1 = Command = "holdback"
trigger1 = Command = "holdup"
trigger1 = Command != "holdfwd"
trigger1 = Command != "holddown"
x = const(velocity.walk.back.x)*(118/50)
y = -4

; Going Back
[State 1310, 2.4b]
type = VelSet
trigger1 = Command = "holdback"
trigger1 = Command != "holdfwd"
trigger1 = Command != "holdup"
trigger1 = Command != "holddown"
x = const(velocity.walk.back.x)*(118/35)
y = 0

; Going Down Back
[State 1310, 2.4c]
type = VelSet
trigger1 = Command = "holdback"
trigger1 = Command = "holddown"
trigger1 = Command != "holdfwd"
trigger1 = Command != "holdup"
x = const(velocity.walk.back.x)*(118/82)
y = ifelse(Pos Y < -5, 3.5, 0)

; Going down
[State 1310, 2.5]
type = VelSet
trigger1 = Command = "holddown"
trigger1 = Command != "holdfwd"
trigger1 = Command != "holdback"
trigger1 = Command != "holdup"
x = 0
y = ifelse(Pos Y < -5, 3.5, 0)

; Explods
; Stand / Going down
[State 1310, 3.1a/5a]
type = Explod
triggerall = NumExplod(1310) = 0
trigger1 = Anim = 1313
anim = 4000
id = 1310
postype = P1
pos = -11, 2
sprpriority = -1
ownpal = 1
bindtime = -1
scale = .8333,1

[State 1310, 3.1b/5b]
type = Explod
triggerall = NumExplod(1311) = 0
trigger1 = Anim = 1313
anim = 4000
id = 1311
postype = P1
pos = 8, -19
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

; Going Foward
[State 1310, 3.2a]
type = Explod
triggerall = NumExplod(1312) = 0
trigger1 = Anim = 1310
anim = 4001
id = 1312
postype = P1
pos = -27,-7
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

[State 1310, 3.2b]
type = Explod
triggerall = NumExplod(1313) = 0
trigger1 = Anim = 1310
anim = 4001
id = 1313
postype = P1
pos = -13,-8
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

; Going up
[State 1310, 3.3a]
type = Explod
triggerall = NumExplod(1314) = 0
trigger1 = Anim = 1311
anim = 4000
id = 1314
postype = P1
pos = -13, -10
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

[State 1310, 3.3b]
type = Explod
triggerall = NumExplod(1315) = 0
trigger1 = Anim = 1311
anim = 4000
id = 1315
postype = P1
pos = 0, -10
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

; Going Back
[State 1310, 3.4a]
type = Explod
triggerall = NumExplod(1316) = 0
trigger1 = Anim = 1312
anim = 4003
id = 1316
postype = P1
pos = 29,-8
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

[State 1310, 3.4b]
type = Explod
triggerall = NumExplod(1317) = 0
trigger1 = Anim = 1312
anim = 4003
id = 1317
postype = P1
pos = 35,-10
sprpriority = 0
ownpal = 1
bindtime = -1
scale = .8333,1

; Remove Explod
; Stand / Going Down
[State 1310, 4.1a/5a]
type = RemoveExplod
trigger1 = Anim != 1313
ID = 1310

[State 1310, 4.1b/5b]
type = RemoveExplod
trigger1 = Anim != 1313
ID = 1311

; Going Foward
[State 1310, 4.2a]
type = RemoveExplod
trigger1 = Anim != 1310
ID = 1312

[State 1310, 4.2b]
type = RemoveExplod
trigger1 = Anim != 1310
ID = 1313

; Going Up
[State 1310, 4.3a]
type = RemoveExplod
trigger1 = Anim != 1311
ID = 1314

[State 1310, 4.3b]
type = RemoveExplod
trigger1 = Anim != 1311
ID = 1315

; Going Back
[State 1310, 4.4a]
type = RemoveExplod
trigger1 = Anim != 1312
ID = 1316

[State 1310, 4.4b]
type = RemoveExplod
trigger1 = Anim != 1312
ID = 1317

[State 1310, 5]
type = Turn
trigger1 = P2Dist X < 0

[State 1310, 7]
type = ChangeState
trigger1 = Time > 2
trigger1 = NumHelper(1310) = 0
value = 50
ctrl = 1

;Timer
[Statedef 1320]
type = S
movetype = I
physics = S
juggle = 0
ctrl = 0
sprpriority = 2
anim = 1

[State 1320, 1.1]
type = ParentVarSet
trigger1 = Time = 0
var(27) = 1

[State 1320, 1.2]
type = ParentVarSet
trigger1 = Parent, StateNo = 50
trigger2 = Parent, Command = "Fly"
var(27) = 0

[State 1320, 7]
type = DestroySelf
trigger1 = Time = 635
trigger2 = Parent, StateNo = 50
trigger3 = Parent, MoveType = H
trigger4 = Parent, Command = "Fly"

;========================<EX FLY>=============================
[StateDef 1330]
type = S
physics = S
moveType = I
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1330, 1]
type = PosSet
trigger1 = 1
y = -2

[State 1330, 2.1]
type = Explod
trigger1 = Time = 0
anim = 4006
id = 1300
postype = P1
pos = -13, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1330, 2.2]
type = Explod
trigger1 = Time = 0
anim = 4006
id = 1300
postype = P1
pos = 0, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1330, 7]
type = ChangeState
trigger1 = Time = 1
value = 1335

;Getting set
[Statedef 1335]
type = A
movetype = I
physics = A
juggle = 0
ctrl = 0
powerAdd = -500
sprpriority = 2

[State 1335, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1335, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1335, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1335, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 24

[State 1335, EX FX]
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

[State 1335, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1335, 1]
type = PlaySnd
trigger1 = Time = 0
value = 41, 1

[State 1305, 2]
type = ChangeAnim
trigger1 = PrevStateNo != 1330
value = 1300

[State 1335, 3]
type = VelSet
trigger1 = 1
x = 0
y = -4

[State 1335, 4.1]
type = Explod
trigger1 = NumExplod(1300) = 0
trigger1 = Time = 0
anim = 4006
id = 1300
postype = P1
pos = -13, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1335, 4.2]
type = Explod
trigger1 = NumExplod(1301) = 0
trigger1 = Time = 0
anim = 4006
id = 1301
postype = P1
pos = 0, -10
sprpriority = 0
ownpal = 1
removetime = 10
bindtime = -1
scale = .8333,1

[State 1335, 7]
type = ChangeState
trigger1 = NumExplod(1301) = 0
value = 1310
ctrl = 1

;Timer
[Statedef 1340]
type = S
movetype = I
physics = S
juggle = 0
ctrl = 0
sprpriority = 2
anim = 1

[State 1340, 1.1]
type = ParentVarSet
trigger1 = Time = 0
var(28) = 1

[State 1340, 1.2]
type = ParentVarSet
trigger1 = Parent, StateNo = 50
trigger2 = Parent, Command = "Fly"
var(28) = 0

[State 1340, 7]
type = DestroySelf
trigger1 = Time = 835
trigger2 = Parent, StateNo = 50
trigger3 = Parent, MoveType = H
trigger4 = Parent, Command = "Fly"

;=====================<REPULSOR SHOT>==========================
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

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1420, ifElse(var(10) = 1, 1410, 1400))

[State 1400, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810, 0

[State 1400, 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1400, 0
channel = 0

[State 1400, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1405
ID = 1405
name = "Repulsor Shot Projectile"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1400, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1405
ID = 1405
name = "Repulsor Shot Projectile"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-53 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1400, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1400, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX REPULSOR SHOT>=============================
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

[State 1430, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810, 0

[State 1430, 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1400, 0
channel = 0

[State 1430, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1435
ID = 1405
name = "Repulsor Shot Projectile"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1430, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1435
ID = 1405
name = "Repulsor Shot Projectile"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-53 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1430, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1430, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<BEAM SHOT>==========================
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

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 1500, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 181, 1

[State 1500, 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1500, 0
channel = 0

[State 1500, 4]
type = Explod
trigger1 = AnimElem = 6
anim = 4030
id = 1500
postype = P1
pos = 0, 0
ontop = 1
ownpal = 1
bindtime = -1
scale = 1,1

[State 1500, 3.2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, NA
hitflag = MAF
animtype  = Hard
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = MA
pausetime = 0,0
priority = 4, Hit
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -58
ground.type = High
ground.slidetime = 5
ground.hittime  = 18
ground.velocity = -5, -3
guard.velocity = -20
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.type = High
air.velocity = -5,-2
air.hittime = 15
airguard.velocity = -3
yAccel = 0.5
fall = 1
fall.recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1500, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX BEAM SHOT>=============================
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1530
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

[State 1530, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 181, 1

[State 1530, 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1500, 0
channel = 0

[State 1530, 4]
type = Explod
trigger1 = AnimElem = 6
anim = 4030
id = 1500
postype = P1
pos = 0, 0
ontop = 1
ownpal = 1
bindtime = -1
scale = 1,1

[State 1530, 3.2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = TimeMod = 2, 1
attr = S, NA
hitflag = MAF
animtype  = Hard
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0
givePower = 36, 36
guardflag = MA
pausetime = 0,0
priority = 4, Hit
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -58
ground.type = High
ground.slidetime = 5
ground.hittime  = 18
ground.velocity = -5, -5
guard.velocity = -20
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.type = High
air.velocity = -5,-4
air.hittime = 15
airguard.velocity = -3
yAccel = 0.5
fall = 1
fall.recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1530, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<REPULSOR BURST>==========================
[StateDef 1600]
type = A
physics = A
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
value = ifElse(var(10) = 2, 1620, ifElse(var(10) = 1, 1600, 1610))

[State 1600, VarSet]
type = VarSet
trigger1 = prevstateno = 1310
v = 42
value = 1

[State 1600, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1600, 12]
type = VelSet
trigger1 = Pos Y >= -0.2
x = 0
y = 0

[State 1600, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1, 2

[State 1600, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1600, 0

[State 1600, 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4, 1
channel = 0

[State 1600, 3]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, NA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = HA
priority = 4, Hit
pausetime = 9,9
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -123
animtype = Hard
ground.type = High
ground.slidetime = 7
ground.hittime = 16
ground.velocity = -10
guard.velocity = -10
air.type = High
air.velocity = -2,-4
air.hittime = 13
airguard.velocity = -5
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, 3]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, NA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = HA
priority = 4, Hit
pausetime = 9,9
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -77
animtype = Hard
ground.type = High
ground.slidetime = 7
ground.hittime = 16
ground.velocity = -10
guard.velocity = -10
air.type = High
air.velocity = -6,7
air.hittime = 13
airguard.velocity = -5
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, 3]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, NA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = HA
priority = 4, Hit
pausetime = 9,9
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -16
animtype = Hard
ground.type = High
ground.slidetime = 7
ground.hittime = 16
ground.velocity = -10
guard.velocity = -10
air.type = High
air.velocity = -3,10
air.hittime = 13
airguard.velocity = -5
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = ifelse(Var(42)=1, 1310, 50)
ctrl = 1

;========================<EX REPULSOR BURST>=============================
[StateDef 1630]
type = A
physics = A
moveType = A
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
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1630, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1630, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1620, ifElse(var(10) = 1, 1600, 1610))

[State 1630, VarSet]
type = VarSet
trigger1 = prevstateno = 1310
v = 42
value = 1

[State 1630, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1630, 12]
type = VelSet
trigger1 = Pos Y >= -0.2
x = 0
y = 0

[State 1630, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1, 2

[State 1630, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1600, 0

[State 1630, 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4, 3
channel = 0

[State 1630, 3]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = TimeMod = 2, 1
attr = A, NA
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = 0
givePower = 36, 36
guardflag = HA
priority = 4, Hit
pausetime = 9,9
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -123
animtype = Hard
ground.type = High
ground.slidetime = 7
ground.hittime = 16
ground.velocity = -5
guard.velocity = -10
air.type = High
air.velocity = -2,-4
air.hittime = 13
airguard.velocity = -5
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, 3]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = TimeMod = 2, 1
attr = A, NA
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = 0
givePower = 36, 36
guardflag = HA
priority = 4, Hit
pausetime = 9,9
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -77
animtype = Hard
ground.type = High
ground.slidetime = 7
ground.hittime = 16
ground.velocity = -5
guard.velocity = -10
air.type = High
air.velocity = -6,7
air.hittime = 13
airguard.velocity = -5
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, 3]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = TimeMod = 2, 1
attr = A, NA
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = 0
givePower = 36, 36
guardflag = HA
priority = 4, Hit
pausetime = 9,9
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -16
animtype = Hard
ground.type = High
ground.slidetime = 7
ground.hittime = 16
ground.velocity = -5
guard.velocity = -10
air.type = High
air.velocity = -3,10
air.hittime = 13
airguard.velocity = -5
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = ifelse(Var(42)=1, 1310, 50)
ctrl = 1

;=====================<SHOULDER MISIL>==========================
[StateDef 1700]
type = S
physics = S
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

[State 1700, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 420,0

[State 1700, sndx]
type = PlaySnd
trigger1 = time = 0
value = 1,2

[State 1700, sndx]
type = PlaySnd
trigger1 = time = 0
value = 4,4

[State 1700, dust]
type = Explod
triggerall = !NumExplod(1701)
trigger1 = StateNo = 1700
trigger1 = animelem = 5
id = 1701
anim = 1701
pos = -3,0
postype= p1
time = 12
sprpriority = 4
ontop = 1
bintime = -1
removeongethit = 1

[State 1700, dust]
type = Explod
triggerall = !NumExplod(1702)
trigger1 = StateNo = 1700
trigger1 = animelem = 6
id = 1702
anim = 1702
pos = 5,0
postype= p1
time = 9
bintime = -1
sprpriority = -4
removeongethit = 1

[State 1700, helper]
type = Helper
trigger1 = animelem = 5
name = "bigmisil"
StateNo = 1705
ID = 1705
postype = p1
pos = -90, -22
sprpriority = -6
ownpal = 1

[State 1700, changestate]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX SHOULDER MISIL>=============================
[StateDef 1730]
type = S
physics = S
moveType = A
anim = 1730
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

[State 1730, snd]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 8
value = 420,0

[State 1730, sndx]
type = PlaySnd
trigger1 = time = 0
value = 1,2

[State 1730, sndx]
type = PlaySnd
trigger1 = time = 0
value = 4,4

[State 1730, dust]
type = Explod
triggerall = !NumExplod(1701)
trigger1 = StateNo = 1730
trigger1 = animelem = 5
id = 1701
anim = 1701
pos = -3,0
postype= p1
time = 12
sprpriority = 4
ontop = 1
bintime = -1
removeongethit = 1

[State 1730, dust]
type = Explod
triggerall = !NumExplod(1702)
trigger1 = StateNo = 1730
trigger1 = animelem = 6
id = 1702
anim = 1702
pos = 5,0
postype= p1
time = 9
bintime = -1
sprpriority = -4
removeongethit = 1

[State 1730, dust]
type = Explod
triggerall = !NumExplod(1701)
trigger1 = StateNo = 1730
trigger1 = animelem = 8
id = 1701
anim = 1701
pos = -3,0
postype= p1
time = 12
sprpriority = 4
ontop = 1
bintime = -1
removeongethit = 1

[State 1730, dust]
type = Explod
triggerall = !NumExplod(1702)
trigger1 = StateNo = 1730
trigger1 = animelem = 9
id = 1702
anim = 1702
pos = 5,0
postype= p1
time = 9
bintime = -1
sprpriority = -4
removeongethit = 1

[State 1730, helper]
type = Helper
trigger1 = animelem = 5
name = "bigmisil"
StateNo = 1735
ID = 1735
postype = p1
pos = -90, -22
sprpriority = -6
ownpal = 1

[State 1730, helper]
type = Helper
trigger1 = animelem = 8
name = "bigmisil"
StateNo = 1735
ID = 1735
postype = p1
pos = -90, -22
sprpriority = -6
ownpal = 1

[State 1730, changestate]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<MINI MISILS>==========================
[StateDef 1800]
type = S
physics = S
moveType = A
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1800, swoosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2

[State 1800, swoosh]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 19
value = 1800,1

[State 1800, swoosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1800,0

[State 1800, swoosh]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1400,0

[State 1800, swoosh]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 12
value = 181,1
channel = -1

[State 1800, Explod]
type = Explod
trigger1 =  animelem = 11
anim = 1801
ID = 1801
pos = 21,-84
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
removeongethit = 1

[State 1800, Explod]
type = Explod
trigger1 =  animelem = 3
anim = 1804
ID = 1804
pos = 41,-94
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 30
scale = 1,1
sprpriority = 9
removeongethit = 1

[State 1800, Explod]
type = Explod
trigger1 =  animelem = 3
anim = 1805
ID = 1805
pos = 0,-65
postype = p2  ;p2,front,back,left,right
bindtime = -1
removetime = 50
scale = 1,1
sprpriority = 9
removeongethit = 1

[State 1800, Helper]
type = Helper
trigger1 = animelem = 11
helpertype = normal ;player
name = "missi"
ID = 1805
stateno = 1805
pos = 25,-82
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1800, Helper]
type = Helper
trigger1 = animelem = 12
helpertype = normal ;player
name = "missi"
ID = 1805
stateno = 1805
pos = 16,-85
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1800, changestate]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX MINI MISILS>=============================
[StateDef 1830]
type = S
physics = S
moveType = A
anim = 1830
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1830, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1830, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1830, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1830, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1830, EX FX]
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

[State 1830, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1830, swoosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2

[State 1830, swoosh]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 21
value = 1800,1

[State 1830, swoosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1800,0

[State 1830, swoosh]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1400,0

[State 1830, swoosh]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 12
trigger3 = AnimElem = 13
trigger4 = AnimElem = 14
value = 181,1
channel = -1

[State 1830, Explod]
type = Explod
trigger1 =  animelem = 11
anim = 1801
ID = 1801
pos = 21,-84
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 2
removeongethit = 1

[State 1830, Explod]
type = Explod
trigger1 =  animelem = 3
anim = 1804
ID = 1804
pos = 41,-94
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 30
scale = 1,1
sprpriority = 9
removeongethit = 1

[State 1830, Explod]
type = Explod
trigger1 =  animelem = 3
anim = 1805
ID = 1805
pos = 0,-65
postype = p2  ;p2,front,back,left,right
bindtime = -1
removetime = 50
scale = 1,1
sprpriority = 9
removeongethit = 1

[State 1830, Helper]
type = Helper
trigger1 = animelem = 11
helpertype = normal ;player
name = "missi"
ID = 1835
stateno = 1835
pos = 25,-82
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1830, Helper]
type = Helper
trigger1 = animelem = 12
helpertype = normal ;player
name = "missi"
ID = 1835
stateno = 1835
pos = 16,-85
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1830, Helper]
type = Helper
trigger1 = animelem = 13
helpertype = normal ;player
name = "missi"
ID = 1835
stateno = 1835
pos = 25,-82
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1830, Helper]
type = Helper
trigger1 = animelem = 14
helpertype = normal ;player
name = "missi"
ID = 1835
stateno = 1835
pos = 16,-85
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1830, changestate]
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
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

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
damage = ceil(ifElse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 0
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
sparkXY = -10 + 0 * (var(35) := 155), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
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
trigger1 = AnimElem = 2
value = 4, 4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 810,0
channel = 1

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 2

[State 2910, 2]
type = VelAdd
trigger1 = AnimElem = 4
x = 9.5

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 0
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -16
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(15) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
