; _________________________________________
;| Joker by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<FLOWER>==========================
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
value = ifElse(var(10) = 2, 1004, ifElse(var(10) = 1, 1002, 1000))

[State 1000, Projectile]
type = Helper
triggerall = var(10) = 0
triggerall = !NumHelper(1001)
trigger1 = animelem = 2
ID = 1001
pos = 0,0
stateno = 1001
helperType = Normal
name = "gas"
keyctrl = 0
ownpal = 1

[State 1000, Projectile]
type = Helper
triggerall = var(10) = 1
triggerall = !NumHelper(1003)
trigger1 = animelem = 2
ID = 1003
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1003
helperType = Normal
name = "water"
keyctrl = 0
ownpal = 1

[State 1000, Projectile]
type = Helper
triggerall = var(10) = 2
triggerall = !NumHelper(1005)
trigger1 = animelem = 2
ID = 1005
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1005
helperType = Normal
name = "poison"
keyctrl = 0
ownpal = 1

[State 1000,sound]
type = Playsnd
triggerall = var(10) = 0
trigger1 = time = 0
value = 30,17

[State 1000,sound]
type = Playsnd
triggerall = var(10) = 0
trigger1 = animelem = 2
value = 60,13

[State 1000,sound]
type = Playsnd
triggerall = var(10) = 1
trigger1 = time = 0
value = 30,19

[State 1000,sound]
type = Playsnd
triggerall = var(10) = 1
trigger1 = time = 8
value = 60,16
channel = 8
persistent = 1

[State 1000,sound]
type = Playsnd
triggerall = var(10) = 2
trigger1 = time = 0
value = 40,19
persistent = 1

[State 1000,sound]
type = Playsnd
triggerall = var(10) = 2
trigger1 = animelem = 2
value = 60,14

[State 1000, 2]
type = ChangeState
triggerall = var(10) = 0
trigger1 = Time = 61
value = 0
ctrl = 1

[State 1000, 2]
type = ChangeState
triggerall = var(10) = 1
trigger1 = NumHelper(1003)
trigger1 = Helper(1003), StateNo = 1009
value = 0
ctrl = 1

[State 1000, 2]
type = ChangeState
triggerall = var(10) = 2
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<EX FLOWER>=============================
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
pos = ceil(6 * const(size.xScale)), ceil(-140 * const(size.yScale))
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
value = ifElse(var(10) = 2, 1004, ifElse(var(10) = 1, 1002, 1000))

[State 1030, Projectile]
type = Helper
triggerall = var(10) = 0
triggerall = !NumHelper(1031)
trigger1 = animelem = 2
ID = 1031
pos = 0,0
stateno = 1031
helperType = Normal
name = "EX gas"
keyctrl = 0
ownpal = 1

[State 1030, Projectile]
type = Helper
triggerall = var(10) = 1
triggerall = !NumHelper(1033)
trigger1 = animelem = 2
ID = 1033
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1033
helperType = Normal
name = "EX water"
keyctrl = 0
ownpal = 1

[State 1030, Projectile]
type = Helper
triggerall = var(10) = 2
triggerall = !NumHelper(1035)
trigger1 = animelem = 2
ID = 1035
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1035
helperType = Normal
name = "EX poison"
keyctrl = 0
ownpal = 1

[State 1030,sound]
type = Playsnd
triggerall = var(10) = 0
trigger1 = time = 0
value = 30,17

[State 1030,sound]
type = Playsnd
triggerall = var(10) = 0
trigger1 = animelem = 2
value = 60,13

[State 1030,sound]
type = Playsnd
triggerall = var(10) = 1
trigger1 = time = 0
value = 30,19

[State 1030,sound]
type = Playsnd
triggerall = var(10) = 1
trigger1 = time = 8
value = 60,16
channel = 8
persistent = 1

[State 1030,sound]
type = Playsnd
triggerall = var(10) = 2
trigger1 = time = 0
value = 40,19
persistent = 1

[State 1030,sound]
type = Playsnd
triggerall = var(10) = 2
trigger1 = animelem = 2
value = 60,14

[State 1030, 2]
type = ChangeState
triggerall = var(10) = 0
trigger1 = Time = 61
value = 0
ctrl = 1

[State 1030, 2]
type = ChangeState
triggerall = var(10) = 1
trigger1 = NumHelper(1033)
trigger1 = Helper(1033), StateNo = 1039
value = 0
ctrl = 1

[State 1030, 2]
type = ChangeState
triggerall = var(10) = 2
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<GUNSHOT>=============================
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
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1115, ifElse(var(10) = 1, 1100, 1110))

[State 1100, 4]
type = PlaySnd
triggerall = var(10) = [0,1]
trigger1 = StateNo = 1100
trigger1 = animelem = 5
value = 60,10

[State 1100, 4]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = StateNo = 1100
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
value = 60,10

[State 1100, gun]
type = Explod
triggerall = var(10) = [0,1]
triggerall = !NumExplod(101902)
trigger1 = StateNo = 1100
trigger1 = animelem = 5
anim = 101902
id = 101902
name = "shot2"
postype = P1
pos = 0,0
ownpal = 1
bindtime = -1
sprpriority = 4
facing = 1
animtime = 10

[State 1100, gun]
type = Explod
triggerall = var(10) = 2
triggerall = !NumExplod(101902)
trigger1 = StateNo = 1100
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
anim = 101902
id = 101902
name = "shot2"
postype = P1
pos = 0,0
ownpal = 1
bindtime = -1
sprpriority = 4
facing = 1
animtime = 10

[State 1100, flag A]
type = Explod
triggerall = var(10) = 0
triggerall = !NumExplod(1111)
trigger1 = facing = 1 && animelem = 5
anim = 1111
id = 1111
name = "flagA"
postype = P1
pos = 0,0
ownpal = 1
bindtime = -1
sprpriority = 2
facing = 1
removetime = 38

[State 1100, flag B]
type = Explod
triggerall = var(10) = 0
triggerall = !NumExplod(1112)
trigger1 = facing = -1 && animelem = 5
anim = 1112
id = 1112
name = "flagB"
postype = P1
pos = 0,0
ownpal = 1
bindtime = -1
sprpriority = 2
facing = -1
removetime = 38

[State 1100, 1]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = time = 1
value = 40,6
channel = 2

[State 1100, 1]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = animelem = 8
value = 30,18
channel = 4

[State 1100, 1]
type = PlaySnd
triggerall = var(10) = [1,2]
trigger1 = animelem = 1
value = 40,11

[State 1100, Projectile]
type = Helper
triggerall = var(10) = 1
trigger1 = animelem = 5
ID = 1105
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1105
helperType = Normal
name = "Gunshot"
keyctrl = 0
ownpal = 1

[State 1100, Projectile]
type = Helper
triggerall = var(10) = 2
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
ID = 1105
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1105
helperType = Normal
name = "Gunshot"
keyctrl = 0
ownpal = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
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
ground.velocity = -6, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -160
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
triggerall = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
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
ground.velocity = -6, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 243), var(36) := -166
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX GUNSHOT>=============================
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1120
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
pos = ceil(17 * const(size.xScale)), ceil(-145 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, 4]
type = PlaySnd
trigger1 = StateNo = 1130
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
trigger4 = animelem = 14
value = 60,10

[State 1130, gun]
type = Explod
triggerall = !NumExplod(101902)
trigger1 = StateNo = 1130
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
trigger4 = animelem = 14
anim = 101902
id = 101902
name = "shot2"
postype = P1
pos = 0,0
ownpal = 1
bindtime = -1
sprpriority = 4
facing = 1
animtime = 10

[State 1130, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 40,11

[State 1130, Projectile]
type = Helper
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
trigger4 = animelem = 14
ID = 1105
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 1135
helperType = Normal
name = "Gunshot"
keyctrl = 0
ownpal = 1

[State 1130, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 7
getPower = 0,0
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
ground.velocity = -6, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -160
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<TEETH>=============================
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
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, dust]
type = Explod
triggerall = !NumExplod(1201)
trigger1 = animelem = 1
anim = 1201
scale = .5,.5
id = 1201
supermove = 1
ontop = 1
removeongethit = 1
removetime = 20

[State 1200,helper]
type = Helper
triggerall = !NumHelper(1202)
trigger1 = animelem = 3
ID = 1202
pos = 0,0
stateno = 1202
helpertype = normal
name = "teeth"
keyctrl = 0
ownpal = 1

[State 1200,sound]
type = Playsnd
trigger1 = time = 0
value = 40,18

[State 1200, 2]
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<EX TEETH>=============================
[StateDef 1230]
type = S
physics = S
moveType = A
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
var(25) = 131

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-145 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, dust]
type = Explod
triggerall = !NumExplod(1201)
trigger1 = animelem = 1
trigger2 = animelem = 5
anim = 1201
scale = .5,.5
id = 1201
supermove = 1
ontop = 1
removeongethit = 1
removetime = 20

[State 1230,helper]
type = Helper
trigger1 = animelem = 3
trigger2 = animelem = 7
ID = 1232
pos = 0,0
stateno = 1232
helpertype = normal
name = "EX teeth"
keyctrl = 0
ownpal = 1

[State 1230,sound]
type = Playsnd
trigger1 = time = 0
value = 40,18

[State 1230, 2]
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<TOY BOX>=============================
[StateDef 1300]
type = S
physics = S
moveType = A
anim = 1200
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

[State 1300, dust]
type = Explod
triggerall = !NumExplod(1300)
trigger1 = animelem = 1
anim = 1300
scale = .5,.5
id = 1300
supermove = 1
ontop = 1
removeongethit = 1
removetime = 20

[State 1300,helper]
type = Helper
triggerall = var(10) = 0
triggerall = !NumHelper(1301)
trigger1 = animelem = 3
ID = 1301
pos = 0,0
stateno = 1301
helpertype = normal
name = "toybox"
keyctrl = 0
ownpal = 1

[State 1300,helper]
type = Helper
triggerall = var(10) = 1
triggerall = !NumHelper(1304)
trigger1 = animelem = 3
ID = 1304
pos = 0,0
stateno = 1304
helpertype = normal
name = "toybox"
keyctrl = 0
ownpal = 1

[State 1300,helper]
type = Helper
triggerall = var(10) = 2
triggerall = !NumHelper(1309)
trigger1 = animelem = 3
ID = 1309
pos = 0,0
stateno = 1309
helpertype = normal
name = "toybox"
keyctrl = 0
ownpal = 1

[State 1300,sound]
type = Playsnd
trigger1 = time = 0
value = 30,21

[State 1300, 2]
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<EX TOY BOX>=============================
[StateDef 1330]
type = S
physics = S
moveType = A
anim = 1200
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
var(25) = 131

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-145 * const(size.yScale))
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
var(10) = ifElse((command = "c" && command = "b"), 2, ifElse((command = "a" && command = "c"), 1, 0))

[State 1330, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1330, dust]
type = Explod
triggerall = !NumExplod(1300)
trigger1 = animelem = 1
anim = 1300
scale = .5,.5
id = 1300
supermove = 1
ontop = 1
removeongethit = 1
removetime = 20

[State 1330,helper]
type = Helper
triggerall = var(10) = 0
triggerall = !NumHelper(1331)
trigger1 = animelem = 3
ID = 1331
pos = 0,0
stateno = 1331
helpertype = normal
name = "toybox"
keyctrl = 0
ownpal = 1

[State 1330,helper]
type = Helper
triggerall = var(10) = 1
triggerall = !NumHelper(1334)
trigger1 = animelem = 3
ID = 1334
pos = 0,0
stateno = 1334
helpertype = normal
name = "toybox"
keyctrl = 0
ownpal = 1

[State 1330,helper]
type = Helper
triggerall = var(10) = 2
triggerall = !NumHelper(1339)
trigger1 = animelem = 3
ID = 1339
pos = 0,0
stateno = 1339
helpertype = normal
name = "toybox"
keyctrl = 0
ownpal = 1

[State 1330,sound]
type = Playsnd
trigger1 = time = 0
value = 30,21

[State 1330, 2]
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;=====================<CARDS>==========================
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1402, ifElse(var(10) = 1, 1401, 1400))

[State 1400, card]
type = Helper
triggerall = var(10) = 0
trigger1 = AnimElem = 5
helpertype = normal
name = "card"
ID = 1405
pos = 0,0
postype = p1
stateno = 1405
priority = 4
ownpal = 1

[State 1400, card]
type = Helper
triggerall = var(10) = 1
trigger1 = AnimElem = 6
helpertype = normal
name = "card"
ID = 1405
pos = -30,0
postype = p1
stateno = 1405
priority = 4
ownpal = 1

[State 1400, card]
type = Helper
triggerall = var(10) = 1
trigger1 = AnimElem = 6
helpertype = normal
name = "card"
ID = 1405
pos = -30,30
postype = p1
stateno = 1405
priority = 4
ownpal = 1

[State 1400, card]
type = Helper
triggerall = var(10) = 2
trigger1 = AnimElem = 6
helpertype = normal
name = "card"
ID = 1405
pos = -30,0
postype = p1
stateno = 1405
priority = 4
ownpal = 1

[State 1400, card]
type = Helper
triggerall = var(10) = 2
trigger1 = AnimElem = 6
helpertype = normal
name = "card"
ID = 1405
pos = -30,30
postype = p1
stateno = 1405
priority = 4
ownpal = 1

[State 1400, card]
type = Helper
triggerall = var(10) = 2
trigger1 = AnimElem = 14
helpertype = normal
name = "card"
ID = 1405
pos = 0,0
postype = p1
stateno = 1415
priority = 4
ownpal = 1

[State 1400,sound]
type = Playsnd
trigger1 = time = 0
value = 40,8

[State 1400, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX CARD>=============================
[StateDef 1430]
type = S
physics = S
moveType = A
anim = 1403
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
pos = ceil(17 * const(size.xScale)), ceil(-145 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, card]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal
name = "card"
ID = 1405
pos = -30,0
postype = p1
stateno = 1435
priority = 4
ownpal = 1

[State 1430, card]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal
name = "card"
ID = 1405
pos = -30,30
postype = p1
stateno = 1435
priority = 4
ownpal = 1

[State 1430, card]
type = Helper
trigger1 = AnimElem = 16
helpertype = normal
name = "card"
ID = 1405
pos = -30,0
postype = p1
stateno = 1435
priority = 4
ownpal = 1

[State 1430, card]
type = Helper
trigger1 = AnimElem = 16
helpertype = normal
name = "card"
ID = 1405
pos = -30,30
postype = p1
stateno = 1435
priority = 4
ownpal = 1

[State 1430,sound]
type = Playsnd
trigger1 = time = 0
value = 40,8

[State 1430, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================<CAKE>==========================
[StateDef 1500]
type = A
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

[State 1500, cake]
type = Helper
trigger1 = AnimElem = 4
helpertype = normal
name = "cake"
ID = 1501
pos = 0,0
postype = p1
stateno = 1501
ownpal = 1

[State 1500,sound]
type = Playsnd
trigger1 = time = 0
value = 30,1

[State 1500, ab1]
type = Explod
trigger1 = animelem = 2
sprpriority = 6
id = 1503
anim = 1503
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 1500, re]
type = RemoveExplod
trigger1 = AnimElem = 3
ID = 1503

[State 1500, ab1]
type = Explod
trigger1 = animelem = 3
sprpriority = 6
id = 1504
anim = 1504
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 1500, re]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 1504

[State 1500, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<EX CAKE>=============================
[StateDef 1530]
type = A
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
pos = ceil(17 * const(size.xScale)), ceil(-145 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, cake]
type = Helper
trigger1 = AnimElem = 4
helpertype = normal
name = "cake"
ID = 1501
pos = 0,0
postype = p1
stateno = 1531
ownpal = 1

[State 1530,sound]
type = Playsnd
trigger1 = time = 0
value = 30,1

[State 1530, ab1]
type = Explod
trigger1 = animelem = 2
sprpriority = 6
id = 1503
anim = 1503
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 1530, re]
type = RemoveExplod
trigger1 = AnimElem = 3
ID = 1503

[State 1530, ab1]
type = Explod
trigger1 = animelem = 3
sprpriority = 6
id = 1504
anim = 1504
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 1530, re]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 1504

[State 1530, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
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
trigger1 = AnimElemTime(6) < 0
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
sparkXY = -10 + 0 * (var(35) := 235), var(36) := -130
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(13) >= 0
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
sparkXY = -10 + 0 * (var(35) := 296), var(36) := -20
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
