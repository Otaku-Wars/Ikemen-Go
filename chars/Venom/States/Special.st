; _________________________________________
;| Venom by varo_hades                     |
; ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<VENOM FANG>==========================
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

[State 1000, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 1001
ctrl = 1

;Attack
[Statedef 1001]
type = A
movetype = A
physics = N
velset = ifElse(var(10) = 2, 11, ifElse(var(10) = 1, 5, 3.5)), ifElse(var(10) = 2, -9, ifElse(var(10) = 1, -7.5, -6))
ctrl = 0
anim = ifElse(var(10) = 2, 1021, ifElse(var(10) = 1, 1011, 1001))
;juggle = 4

[State 1001, 1]
type = Helper
trigger1 = !time
helpertype = normal
name = "Venom Fang FX"
ID = 1019
pos = 0,0
postype = p1
ownpal = 1
stateno = 1019
size.xscale = const(size.xscale)

[State 1001, 1]
type = PosAdd
trigger1 = !time
x = 25
;y =
;ignorehitpause = 0
;persistent = 1

[State 1001, 1]
type = VelAdd
trigger1 = var(10) = 0
trigger1 = 1
y = .77
;ignorehitpause = 0
;persistent = 1

[State 1001, 1]
type = VelAdd
trigger1 = var(10) = 1
trigger1 = 1
y = .771

[State 1001, 1]
type = VelAdd
trigger1 = var(10) = 2
trigger1 = 1
y = .81

[State 1001, 1]
type = PlaySnd
trigger1 = time = 0
value = 1000,0+random%3
volume = 255
volumescale = 255
channel = 0

[State 1001, Hidef]
type = HitDef
triggerall = p2statetype != A
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 4,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = High
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -5
air.Velocity = -3,0
air.fall = 1
fall.recover = 0
air.hittime = 25
yaccel = 0.6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.velocity = -6,-7
down.cornerpush.veloff = -25.5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, Hitdef]
type = HitDef
triggerall = p2statetype = A
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 4,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = MA
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 5, 10)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
fall.xvelocity = 0
fall.yvelocity = -1;-5
air.fall = 1
fall.recover = 0
;down.bounce = 1
down.velocity = -6,-7
down.cornerpush.veloff = -25.5
hitflag = MAFD
id = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, 1]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
value = 1009

;Land
[Statedef 1009]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1008

[State 1008, 1]
type = ScreenBound
trigger1 = prevstateno = 3013
value = 0
;movecamera = 0,0
;ignorehitpause = 0
;persistent = 1

[State 1008, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 20,5
volume = 150
volumescale = 150

[State 1008, 1]
type = Explod
trigger1 = AnimElem = 4
anim = 1009
ID = 1009
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),1
;persistent = 1

[State 1008, ]
type = PosSet
trigger1 = !time
y = 0
;ignorehitpause = 0
;persistent = 1

[State 1008, 1]
type = ChangeState
trigger1 = animtime = 0
value = 11
ctrl = 1

;Venom Fang FX
[Statedef 1019]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1014
sprpriority = 4

[State 1019, 1]
type = ChangeAnim
triggerall = anim !=1014
trigger1 = parent, anim = 1001 || parent, anim = 1011 || parent, anim = 1021
trigger1 = parent, AnimElem = 1
value = 1014

[State 1019, 1]
type = ChangeAnim
triggerall = anim !=1015
trigger1 = parent, anim = 1001 || parent, anim = 1011 || parent, anim = 1021
trigger1 = parent, AnimElem = 2
trigger2 = parent, anim = [1051,1053]
trigger2 = parent, AnimElem = 1
value = 1015

[State 1019, 1]
type = ChangeAnim
triggerall = anim !=1016
trigger1 = parent, anim = 1001 || parent, anim = 1011 || parent, anim = 1021
trigger1 = parent, AnimElem = 3
trigger2 = parent, anim = [1051,1053]
trigger2 = parent, AnimElem = 2
value = 1016

[State 1019, 1]
type = ChangeAnim
triggerall = anim !=1017
trigger1 = parent, anim = 1001 || parent, anim = 1011 || parent, anim = 1021
trigger1 = parent, AnimElem = 4
trigger2 = parent, anim = [1051,1053]
trigger2 = parent, AnimElem = 3
value = 1017

[State 1019, 1]
type = ChangeAnim
triggerall = anim !=1018
trigger1 = parent, anim = 1001 || parent, anim = 1011 || parent, anim = 1021
trigger1 = parent, AnimElem = 5
trigger2 = parent, anim = [1051,1053]
trigger2 = parent, AnimElem = 4
value = 1018

[State 1019, 1]
type = BindToParent
trigger1 = 1
time = 1
facing = 0
pos = 0,0
;ignorehitpause = 0
;persistent = 1

[State 1019, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1019, 1]
type = DestroySelf
trigger1 = parent, stateno !=[1000,1001]
trigger1 = parent, stateno !=[1030,1031]
trigger1 = parent, stateno !=[1050,1051]
trigger1 = parent, stateno !=[1080,1081]

;========================<EX VENOM FANG>=============================
[StateDef 1030]
type = S
physics = S
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

[State 1030, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 1031
ctrl = 1

;Attack
[Statedef 1031]
type = A
movetype = A
physics = N
velset = 11, -7
ctrl = 0
anim = 1021
;juggle = 4

[State 1031, 1]
type = Helper
trigger1 = !time
helpertype = normal
name = "Venom Fang FX"
ID = 1019
pos = 0,0
postype = p1
ownpal = 1
stateno = 1019
size.xscale = const(size.xscale)

[State 1031, 1]
type = PosAdd
trigger1 = !time
x = 25
;y =
;ignorehitpause = 0
;persistent = 1

[State 1031, 1]
type = VelAdd
trigger1 = 1
y = .77
;ignorehitpause = 0
;persistent = 1

[State 1031, 1]
type = PlaySnd
trigger1 = time = 0
value = 1000,0+random%3
volume = 255
volumescale = 255
channel = 0

[State 1031, Hidef]
type = HitDef
triggerall = p2statetype != A
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 3,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = High
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -5
air.Velocity = -3,0
air.fall = 1
fall.recover = 0
air.hittime = 25
yaccel = 0.6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.velocity = -6,-7
down.cornerpush.veloff = -25.5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1031, Hitdef]
type = HitDef
triggerall = p2statetype = A
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 3,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 5, 10)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
fall.xvelocity = 0
fall.yvelocity = -1;-5
air.fall = 1
fall.recover = 0
;down.bounce = 1
down.velocity = -6,-7
down.cornerpush.veloff = -25.5
hitflag = MAFD
id = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1031, 1]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
value = 1009

;=====================<AIR VENOM FANG>==========================
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

[State 1050, End]
type = ChangeState
trigger1 = !AnimTime
value = 1051
ctrl = 1

;Attack
[Statedef 1051]
type = A
movetype = A
physics = N
velset = ifElse(var(10) = 2, 9.6, ifElse(var(10) = 1, 5, 3.5)), ifElse(var(10) = 2, -10, ifElse(var(10) = 1, -6, -3))
ctrl = 0
anim = ifElse(var(10) = 2, 1053, ifElse(var(10) = 1, 1052, 1051))
;juggle = 4

[State 1051, 1]
type = Helper
trigger1 = !time
helpertype = normal
name = "Venom Fang FX"
ID = 1019
pos = 0,0
postype = p1
ownpal = 1
stateno = 1019
size.xscale = const(size.xscale)

[State 1051, 1]
type = PosAdd
trigger1 = !time
x = 25

[State 1051, 1]
type = VelAdd
trigger1 = var(10) = 0
trigger1 = 1
y = .79

[State 1051, 1]
type = VelAdd
trigger1 = var(10) = 1
trigger1 = 1
y = .85

[State 1051, 1]
type = VelAdd
trigger1 = var(10) = 2
trigger1 = 1
y = .91

[State 1051, 1]
type = PlaySnd
trigger1 = time = 0
value = 1000,0+random%3
volume = 255
volumescale = 255
channel = 0

[State 1051, Hitdef]
type = HitDef
triggerall = p2statetype = A
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 4,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = MA
pausetime = 6,10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
fall.xvelocity = 0
fall.yvelocity = -5;-2
air.fall = 1
fall.recover = 0
down.bounce = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1051, Hitdef]
type = HitDef
triggerall = p2statetype = S || p2statetype = C
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 4,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = MA
pausetime = 6,10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1051, Hitdef]
type = HitDef
triggerall = p2statetype = L
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 4,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 6,10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
down.velocity = -6,-7
down.cornerpush.veloff = -25.5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1051, 1]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
value = 1009

;========================<EX AIR VENOM FANG>=============================
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

[State 1080, End]
type = ChangeState
trigger1 = !AnimTime
value = 1081
ctrl = 1

;Attack
[Statedef 1081]
type = A
movetype = A
physics = N
velset = 9, -6
ctrl = 0
anim = 1053
;juggle = 4

[State 1081, 1]
type = Helper
trigger1 = !time
helpertype = normal
name = "Venom Fang FX"
ID = 1019
pos = 0,0
postype = p1
ownpal = 1
stateno = 1019
size.xscale = const(size.xscale)

[State 1081, 1]
type = PosAdd
trigger1 = !time
x = 25

[State 1081, 1]
type = VelAdd
trigger1 = 1
y = .79

[State 1081, 1]
type = PlaySnd
trigger1 = time = 0
value = 1000,0+random%3
volume = 255
volumescale = 255
channel = 0

[State 1081, Hitdef]
type = HitDef
triggerall = p2statetype = A
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 3,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 6,10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
fall.xvelocity = 0
fall.yvelocity = -5;-2
air.fall = 1
fall.recover = 0
down.bounce = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1081, Hitdef]
type = HitDef
triggerall = p2statetype = S || p2statetype = C
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 3,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 6,10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1081, Hitdef]
type = HitDef
triggerall = p2statetype = L
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = timemod = 3,1
animtype = Back
attr = A, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 6,10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 35
ground.Velocity = -5
air.Velocity = -3,0
air.hittime = 25
yaccel = 0.6
down.velocity = -6,-7
down.cornerpush.veloff = -25.5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1081, 1]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
value = 1009

;========================<VENOM RUSH>=============================
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
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100, 1]
type = Helper
trigger1 = AnimElem = 4
helpertype = normal
name = "Shadow"
ID = 1105
pos = 0,0
postype = p1
ownpal = 1
stateno = 1105
persistent = 0
size.xscale = const(size.xscale)

[State 1100, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,0+random%4
volumescale = 255
channel = 0
persistent = 0

[State 1100, 1]
type = ChangeState
trigger1 = time >=25
trigger1 = !Numhelper(1105)
value = 1103

;Finish
[Statedef 1103]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1103

[State 1103, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;========================<EX VENOM RUSH>=============================
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
type = Helper
trigger1 = AnimElem = 4
helpertype = normal
name = "EX Shadow"
ID = 1135
pos = 0,0
postype = p1
ownpal = 1
stateno = 1135
persistent = 0
size.xscale = const(size.xscale)

[State 1130, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,0+random%4
volumescale = 255
channel = 0
persistent = 0

[State 1130, 1]
type = ChangeState
trigger1 = time >=25
trigger1 = !Numhelper(1135)
value = 1103

;=====================<VENOM BARRELL>==========================
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = ifElse(var(10) = 2, 18, ifElse(var(10) = 1, 13, 8))

[state 1200]
type = velmul
trigger1 = 1
x = 0.9

[State 1200, 2]
type = PlaySnd
trigger1 = Time = 8
value = S1, 2

[State 1200, Voice]
type = PlaySnd
trigger1 = Time = 0
value = S1200, 1

[State 1200, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 5 || AnimElem = 7 || AnimElem = 9
attr = S, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)))), 7
guardflag = HA
priority = 4
pausetime = 5,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Heavy
ground.type = High
ground.slidetime = 17
ground.hittime  = 25
ground.velocity = -1,-6
air.velocity = -1,-3
air.hittime = 25
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[state 1200]
type = changestate
trigger1 = animelemtime(12) = 0
value = 1205

;Venom Barrel Last Hit
[Statedef 1205]
type = S
movetype = A
physics = N
anim = 1201
velset = 0,0
ctrl = 0
sprpriority = 3
juggle = 0
facep2 = 1

[State 1205, 2]
type = PlaySnd
trigger1 = Time = 6
value = 1, 5

[State 1205, Voice]
type = PlaySnd
trigger1 = Time = 6
value = S1200, 0

[State 1205, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = Time = 0
attr = S, SA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
guardflag = HA
hitflag= MAFD
pausetime = 15,15
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Med
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -18,-3
air.velocity = -18,-3
airguard.velocity = -6,-4
yaccel = .9
fall.xvelocity = 0
fall.yvelocity = -2
air.hittime  = 25
yaccel = 0.6
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p2facing = 1
id = 1250
;p2stateno = 1206
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1205, p2state]
type = targetstate
trigger1 = movehit && numtarget(1250)
trigger1 = target(1250),Movetype=H
ID = 1250
value = 1206
ignorehitpause = 1
persistent = 0

[State 1205, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;========================<EX VENOM BARRELL>=============================
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 20,0
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
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[state 1230]
type = velmul
trigger1 = 1
x = 0.9

[State 1230, 2]
type = PlaySnd
trigger1 = Time = 8
value = S1, 2

[State 1230, Voice]
type = PlaySnd
trigger1 = Time = 0
value = S1200, 1

[State 1230, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 5 || AnimElem = 7 || AnimElem = 9 || AnimElem = 10
attr = S, SA
damage = ceil(ifElse(fvar(11) * 23 < 7, 7, fvar(11) * 23)), 7
guardflag = HA
priority = 4
pausetime = 5,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Heavy
ground.type = High
ground.slidetime = 17
ground.hittime  = 25
ground.velocity = -1,-6
air.velocity = -1,-3
air.hittime = 25
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[state 1230]
type = changestate
trigger1 = animelemtime(12) = 0
value = 1235

;Venom Barrel Last Hit
[Statedef 1235]
type = S
movetype = A
physics = N
anim = 1201
velset = 0,0
ctrl = 0
sprpriority = 3
juggle = 0
facep2 = 1

[State 1235, 2]
type = PlaySnd
trigger1 = Time = 6
value = 1, 5

[State 1235, Voice]
type = PlaySnd
trigger1 = Time = 6
value = S1200, 0

[State 1235, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 8 || var(20))
trigger1 = Time = 0
attr = S, SA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
guardflag = HA
hitflag= MAFD
pausetime = 15,15
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Med
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -18,-3
air.velocity = -18,-3
airguard.velocity = -6,-4
yaccel = .9
fall.xvelocity = 0
fall.yvelocity = -2
air.hittime  = 25
yaccel = 0.6
getPower = 0,0
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p2facing = 1
id = 1250
;p2stateno = 1206
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1235, p2state]
type = targetstate
trigger1 = movehit && numtarget(1250)
trigger1 = target(1250),Movetype=H
ID = 1250
value = 1206
ignorehitpause = 1
persistent = 0

[State 1235, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=====================<AIR VENOM BARRELL>==========================
[StateDef 1250]
type = A
physics = N
moveType = A
anim = 1250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1250, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = ifElse(var(10) = 2, 18, ifElse(var(10) = 1, 13, 8))

[state 1250]
type = velmul
trigger1 = 1
x = 0.9

[State 1250, 2]
type = PlaySnd
trigger1 = Time = 8
value = S1, 2

[State 1250, Voice]
type = PlaySnd
trigger1 = Time = 0
value = S1200, 1

[State 1250, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 5 || AnimElem = 7 || AnimElem = 9
attr = A, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)))), 7
guardflag = HA
priority = 4
pausetime = 5,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Heavy
ground.type = High
ground.slidetime = 17
ground.hittime  = 25
ground.velocity = -1,-6
air.velocity = -1,-3
air.hittime = 25
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[state 1250]
type = changestate
trigger1 = animelemtime(12) = 0
value = 1255

;Venom Barrel Last Hit
[Statedef 1255]
type = A
movetype = A
physics = N
anim = 1251
velset = 0,0
ctrl = 0
sprpriority = 3
juggle = 0
facep2 = 1

[State 1255, 2]
type = PlaySnd
trigger1 = Time = 6
value = 1, 5

[State 1255, Voice]
type = PlaySnd
trigger1 = Time = 6
value = S1200, 0

[State 1255, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = Time = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
guardflag = HA
hitflag= MAFD
pausetime = 15,15
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Med
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -18,-3
air.velocity = -18,-3
airguard.velocity = -6,-4
yaccel = .9
fall.xvelocity = 0
fall.yvelocity = -2
air.hittime  = 25
yaccel = 0.6
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p2facing = 1
id = 1250
;p2stateno = 1206
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1255, p2state]
type = targetstate
trigger1 = movehit && numtarget(1250)
trigger1 = target(1250),Movetype=H
ID = 1250
value = 1206
ignorehitpause = 1
persistent = 0

[state 1255]
type = statetypeset
trigger1 = animelemtime(5)>=0
physics = A

;========================<EX AIR VENOM BARRELL>=============================
[StateDef 1280]
type = A
physics = N
moveType = A
anim = 1250
ctrl = 0
velSet = 20,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1280, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1280, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1280, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1280, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1280, EX FX]
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

[State 1280, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[state 1280]
type = velmul
trigger1 = 1
x = 0.9

[State 1280, 2]
type = PlaySnd
trigger1 = Time = 8
value = S1, 2

[State 1280, Voice]
type = PlaySnd
trigger1 = Time = 0
value = S1200, 1

[State 1280, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 5 || AnimElem = 7 || AnimElem = 9 || AnimElem = 11
attr = A, SA
damage = ceil(ifElse(fvar(11) * 23 < 7, 7, fvar(11) * 23)), 7
guardflag = HA
priority = 4
pausetime = 5,9
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Heavy
ground.type = High
ground.slidetime = 17
ground.hittime  = 25
ground.velocity = -1,-6
air.velocity = -1,-3
air.hittime = 25
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[state 1280]
type = changestate
trigger1 = animelemtime(12) = 0
value = 1285

;Venom Barrel Last Hit
[Statedef 1285]
type = A
movetype = A
physics = N
anim = 1251
velset = 0,0
ctrl = 0
sprpriority = 3
juggle = 0
facep2 = 1

[State 1285, 2]
type = PlaySnd
trigger1 = Time = 6
value = 1, 5

[State 1285, Voice]
type = PlaySnd
trigger1 = Time = 6
value = S1200, 0

[State 1285, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 8 || var(20))
trigger1 = Time = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
guardflag = HA
hitflag= MAFD
pausetime = 15,15
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
animtype = Med
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -18,-3
air.velocity = -18,-3
airguard.velocity = -6,-4
yaccel = .9
fall.xvelocity = 0
fall.yvelocity = -2
air.hittime  = 25
yaccel = 0.6
getPower = 0,0
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p2facing = 1
id = 1250
;p2stateno = 1206
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1285, p2state]
type = targetstate
trigger1 = movehit && numtarget(1250)
trigger1 = target(1250),Movetype=H
ID = 1250
value = 1206
ignorehitpause = 1
persistent = 0

[state 1285]
type = statetypeset
trigger1 = animelemtime(5)>=0
physics = A

;========================<HIT WALL>=============================
;---Hit Pause---
[Statedef 1206]
type = A
movetype = H
physics = N
sprpriority = 1
velset = -16,-4
facep2 = 1

[State 1206, 2];ñ≥ìGÇÃèÛë‘ÇçÏÇÈ
type = NotHitBy
trigger1 = 1
value = SCA

[State 1206, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1260

[State 1206, 1]
type = VelAdd
Trigger1 = time != 0
y = .22

[State 1206, 3]
type = changeState
trigger1 = backedgedist <= 32
value = 1207

[State 1206, 3]
type = selfState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 10
value = 5100

;---Falling---
[Statedef 1207]
type = A
movetype = H
physics = N
sprpriority = 1
velset = 0,0

[state 1207]
type = posadd
trigger1 = time = 0
x = -30

[State 1207, 2];ñ≥ìGÇÃèÛë‘ÇçÏÇÈ
type = NotHitBy
trigger1 = 1
value = SCA

[State 1207, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1270

[State 1207, âπÇñ¬ÇÁÇ∑]
type = null;PlaySnd
trigger1 = Time = 0
value = F7,2

[State 1207, 4]
type = EnvShake
trigger1 = time = 0
time = 10
ampl = -5
freq = 95
phase = 95

[State 1207, 3]
type = changeState
trigger1 = animtime = 0
value = 1208

;---Hitting Wall---
[Statedef 1208]
type = A
movetype = H
physics = N
sprpriority = 1
velset = 0,0

[state 1208]
type = velset
trigger1 = time = 0
x = 2.5
y = -12

[state 1208]
type = veladd
trigger1 = 1
y = 0.46

[State 1208, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050

[State 1208, 3]
type = selfState
trigger1 = vel y > 0
trigger1 = pos y >= -10
value = 5050

;=====================<TENDRIL>==========================
[StateDef 1300]
type = S
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
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300,PlaySnd]
type = PlaySnd
trigger1 = animelem =4
value = S20,6
volume = 50

[State 1300,PlaySnd]
type = PlaySnd
trigger1 = animelem =4
value = 20,5
volume = 0

[State 1300, 1]
type = HitDef
Trigger1 = animelem = 4
trigger1 = !var(38)
attr = S, SA
guardflag = MA
priority = 3, Hit
pausetime = 0,10
hitflag = MAF
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1303
p2stateno = 1313
guard.dist = 0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)

[State 1300, 1]
type = HitDef
Trigger1 = Time = 12
trigger1 = !var(38)
attr = S, SA
guardflag = MA
priority = 3, Hit
pausetime = 0,10
hitflag = MAF
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1301
p2stateno = 1302
guard.dist = 0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)

[State 1300, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Head Butt
[Statedef 1301]
type = S
movetype = A
physics = N
anim = 1304
poweradd = 0
sprpriority = 1

[State 1301,Right There!]
type = PlaySnd
trigger1 = time = 0
value = S1300,1+random%2

[State 1301, Explod]
type = Explod
trigger1 = time = 0
anim = 1303
pos = 17,-94
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 200
vel = 0,0
accel = 0,0
random = 0,0
removetime = 23
pausemovetime = 0
scale = 1,1
sprpriority = 2
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;trans =
;persistent =
;supermove = 0
;pausemove = 0

[State 1301, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 290, 0
time = 7

[State 1301, Width 2-11]
type = TargetBind
trigger1 = AnimElem = 2
pos = 260,00
time = 7

[State 1301, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 3
pos =  210,00
time = 7

[State 1301, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 4
pos =  170,00
time = 7

[State 1301, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 5
pos =  100,00
time = 26

[State 1301, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 9
value = floor(ifElse(121 * fvar(11) < 7, -7, -121 * fvar(11)))
absolute = 0
;ignorehitpause =
;persistent =

[State 1301, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 9
value = 36

[State 1301, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 9 && !var(20)
value = 72

[State 1301, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 9
value = 1

[State 1301, Grab Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = S2, 2

[State 1301, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 9
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-90 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1301, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Head butt 2 variation
[Statedef 1303]
type = S
movetype = A
physics = N
anim = 1307
poweradd = 0
sprpriority = 1

[State 1303,Right There!]
type = PlaySnd
trigger1 = time = 0
value = S1300,1+random%2

[State 1303, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 1
pos =  105,00
time = 15

[State 1303, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = floor(ifElse(121 * fvar(11) < 7, -7, -121 * fvar(11)))
absolute = 0
;ignorehitpause =
;persistent =

[State 1303, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 1303, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5 && !var(20)
value = 72

[State 1303, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 1303, Grab Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 2, 2

[State 1303, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 5
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-90 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1303, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;P2 damage
[Statedef 1302]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0

[State 1302, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,1

[State 1302, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1310

[State 1302, 1] ;Gravity
type = Velset
Trigger1 = time > 57
y = -1
x = -4

[State 1302, 2]
type = SelfState
Trigger1 = time = 60
;trigger1 = !gethitvar(isbound)
value = 5050

;P2 damage variation 2
[Statedef 1313]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0

[State 1313, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1312
persistent = 1

[State 1313, 1] ;Gravity
type = Velset
Trigger1 = time > 13
y = -1
x = -4

[State 1313, 2]
type = SelfState
Trigger1 = time = 14
;trigger1 = !gethitvar(isbound)
value = 5050

;========================<EX TENDRIL>=============================
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1300
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
var(25) = 131

[State 1330, EX FX]
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

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330,PlaySnd]
type = PlaySnd
trigger1 = animelem =4
value = S20,6
volume = 50

[State 1330,PlaySnd]
type = PlaySnd
trigger1 = animelem =4
value = S20,5
volume = 0

[State 1330, 1]
type = HitDef
Trigger1 = animelem = 4
trigger1 = !var(38)
attr = S, SA
guardflag = MA
priority = 3, Hit
pausetime = 0,0
hitflag = MAF
getPower = 0,0
givePower = 36, 36
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1304
p2stateno = 1319
guard.dist = 0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -79
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1

[State 1330, 1]
type = HitDef
Trigger1 = Time = 12
trigger1 = !var(38)
attr = S, SA
guardflag = MA
priority = 3, Hit
pausetime = 0,10
hitflag = MAF
getPower = 0,0
givePower = 36, 36
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1311
p2stateno = 1312
guard.dist = 0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -79
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1

[State 1330, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Big throw 1
[Statedef 1311]
type = S
movetype = A
physics = N
anim = 1305
poweradd = 0
sprpriority = 1

[State 1311,Right There!]
type = PlaySnd
trigger1 = AnimElem = 5
value = S1330,0+random%2

[State 1311, Explod]
type = Explod
trigger1 = time = 0
anim = 1303
pos = 17,-94
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 200
vel = 0,0
accel = 0,0
random = 0,0
removetime = 23
pausemovetime = 0
scale = 1,1
sprpriority = 2
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;trans =
;persistent =
;supermove = 0
;pausemove = 0

[State 1311, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 290, 0
time = 7

[State 1311, Width 2-11]
type = TargetBind
trigger1 = AnimElem = 2
pos = 260,00
time = 7

[State 1311, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 3
pos =  210,00
time = 7

[State 1311, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 4
pos =  170,00
time = 7

[State 1311, TargetState]
type = TargetState
trigger1 = animelem = 5
value = 1319
ignorehitpause = 1
persistent = 1

[State 1311, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 5
pos =  64,-79
time = 3

[State 1311, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 6
pos =  48,-155
time = 3

[State 1311, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 7
pos =  22,-170
time = 3

[State 1311, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 8
pos =  26,-133
time = 2

[State 1311, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 8
value = floor(ifElse(133 * fvar(11) < 7, -7, -133 * fvar(11)))
absolute = 0
;ignorehitpause =
;persistent =

[State 1311, TargetState]
type = TargetState
trigger1 = animelem = 8
value = 1323
ignorehitpause = 1
persistent = 1

[State 1311, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 8
value = 36

[State 1311, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 8 && !var(20)
value = 0

[State 1311, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 8
value = 1

[State 1311, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Big throw 2
[Statedef 1304]
type = S
movetype = A
physics = N
anim = 1308
poweradd = 0
sprpriority = 1

[State 1304,Right There!]
type = PlaySnd
trigger1 = AnimElem = 2
value = S1330,0+random%2

[State 1304, TargetState]
type = TargetState
trigger1 = animelem = 1
value = 1319
ignorehitpause = 1
persistent = 1

[State 1304, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 2
pos =  64,-79
time = 3

[State 1304, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 3
pos =  48,-155
time = 3

[State 1304, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 4
pos =  22,-170
time = 3

[State 1304, Bind 2-4]
type = TargetBind
trigger1 = AnimElem = 5
pos =  26,-133
time = 2

[State 1304, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = floor(ifElse(133 * fvar(11) < 7, -7, -133 * fvar(11)))
absolute = 0
;ignorehitpause =
;persistent =

[State 1304, TargetState]
type = TargetState
trigger1 = animelem = 5
value = 1323
ignorehitpause = 1
persistent = 1

[State 1304, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 1304, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5 && !var(20)
value = 0

[State 1304, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 1304, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;P2 damage
[Statedef 1312]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0

[State 1312, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,1

[State 1312, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1311

[State 1312, 1] ;Gravity
type = Velset
Trigger1 = time > 31
y = -1
x = -8

[State 1312, 2]
type = SelfState
Trigger1 = time = 32
;trigger1 = !gethitvar(isbound)
value = 5050

;P2 throw damage
[Statedef 1319]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority=1
;anim = 1220

[State 1319, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera=0,1

[State 1319, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1320
persistent = 1

[State 1319, 1] ;Gravity
type = Velset
Trigger1 = time > 12
y = -1
x = -8

[State 1319, 2]
type = SelfState
Trigger1 = time = 12
;trigger1 = !gethitvar(isbound)
value = 5050

;P2 damage  variation
[Statedef 1314]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 0

[State 1314, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1312

[State 1314, 2]
type = SelfState
Trigger1 = time = 7
;trigger1 = !gethitvar(isbound)
value = 5050

;Throw (hit by, into air)
[Statedef 1323]
type = A
movetype = H ;Get hit
physics = N
ctrl = 0
sprpriority = 3
;anim = 1221

[State 1323, 5] ;Hit ground
type = SelfState
trigger1 = BackEdgeBodyDist <= 0
value = 5050 ;Hit ground

[State 1323, 2] ;Gravity
type = Velset
trigger1 = Time = 0
x = -15
y = -10

[State 1323, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 1321

[State 1323, 1]
type = ChangeAnim
trigger1 = time = 100
value = ifelse(SelfAnimExist(5035),5035,5050)

[State 1323, 2] ;Gravity
type = VelAdd
trigger1 = Time < 8
y = -1
x = -1

[State 1323, 2] ;Gravity
type = VelAdd
trigger1 = Time > 8
y = .5
x = -1

[State 1323, 5] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;=====================<VENOM TRAP>==========================
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

[State 1400, Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = animelem = 3
helpertype = normal
name = "Trap"
ID = 1401
stateno = 1401
;pos = Ceil(50*Const(size.xscale)),Ceil(0*Const(size.yscale))
pos = 100,0
postype = p1
facing = 1
ownpal = 1
shadow = 0
supermovetime = 999
pausemovetime = 999
size.xscale = 1
size.yscale = 1
scale = 0.7,0.7

[State 1400, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = animelem = 3
helpertype = normal
name = "Trap"
ID = 1402
stateno = 1402
pos = 100,0
postype = p1
facing = 1
ownpal = 1
shadow = 0
supermovetime = 999
pausemovetime = 999
size.xscale = 1
size.yscale = 1
scale = 0.7,0.7

[State 1400, Helper]
type = Helper
trigger1 = var(10) = 2
trigger1 = animelem = 3
helpertype = normal
name = "Trap"
ID = 1403
stateno = 1403
;pos = Ceil(50*Const(size.xscale)),Ceil(0*Const(size.yscale))
pos = 100,0
postype = p1
facing = 1
ownpal = 1
shadow = 0
supermovetime = 999
pausemovetime = 999
size.xscale = 1
size.yscale = 1
scale = 0.7,0.7

[State 1400, Become Our Prey Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S1400,0+random%3
channel = 0
freqmul = 1.0
loop = 0
pan = 0

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1405,0

[State 1400, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<EX VENOM TRAP>=============================
[StateDef 1430]
type = S
physics = S
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

[State 1430, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal
name = "Trap"
ID = 1404
stateno = 1404
;pos = Ceil(50*Const(size.xscale)),Ceil(0*Const(size.yscale))
pos = 100,0
postype = p1
facing = 1
ownpal = 1
shadow = 0
supermovetime = 999
pausemovetime = 999
size.xscale = 1
size.yscale = 1
scale = 0.7,0.7

[State 1430, Become Our Prey Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S1400,0+random%3
channel = 0
freqmul = 1.0
loop = 0
pan = 0

[State 1430, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1405,0

[State 1430, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

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

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 1500, 1]
type = Width
triggerall = var(10) = 0
trigger1 = Animelem = 5
player = 110,0

[State 1500, 1]
type = Width
triggerall = var(10) = 1
trigger1 = Animelem = 5
player = 100,0

[State 1500, 1]
type = Helper
triggerall = var(10) = 0
trigger1 = AnimElem = 5
helpertype = normal
name = "Webbing"
ID = 1504
pos = 129*const(size.xscale),-88*const(size.yscale)
postype = p1
ownpal = 1
stateno = 1504
persistent = 0
bindtime = 2
size.xscale = const(size.xscale)

[State 1500, 1]
type = Helper
triggerall = var(10) = 1
trigger1 = AnimElem = 5
helpertype = normal
name = "Webbing"
ID = 1506
pos = 112*const(size.xscale),-146*const(size.yscale)
postype = p1
ownpal = 1
stateno = 1506
persistent = 0
size.xscale = const(size.xscale)

[State 1500, 1]
type = Helper
triggerall = var(10) = 2
trigger1 = AnimElem = 5
helpertype = normal
name = "Shadow"
ID = 1508
pos = 15*const(size.xscale),-188*const(size.yscale)
postype = p1
ownpal = 1
stateno = 1508
persistent = 0
size.xscale = const(size.xscale)

[State 1500, Projectile]
type = Projectile
triggerall = var(10) = 0
trigger1 = Numhelper(1504)
trigger1 = helper(1504), movehit
trigger1 = helper(1504), Animelemtime(11)< 0
postype = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
p1stateno = 1540
p2stateno = 1550
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 1500, Projectile]
type = Projectile
triggerall = var(10) = 1
trigger1 = Numhelper(1506)
trigger1 = helper(1506), movehit
trigger1 = helper(1506), Animelemtime(10)< 0
postype = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
p1stateno = 1541
p2stateno = 1551
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 1500, Projectile]
type = Projectile
triggerall = var(10) = 2
trigger1 = Numhelper(1508)
trigger1 = helper(1508), movehit
trigger1 = helper(1508), Animelemtime(11)< 0
postype = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
p1stateno = 1542
p2stateno = 1552
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 1500, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1500,0+random%3
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 1500, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 20,0
persistent = 0

[State 1500, 1]
type = ChangeState
triggerall = var(10) = 0
trigger1 = time >=25
trigger1 = !Numhelper(1504)
trigger2 = time >= 50
value = 1503

[State 1500, 1]
type = ChangeState
triggerall = var(10) = 1
trigger1 = time >=25
trigger1 = !Numhelper(1506)
trigger2 = time >= 50
value = 1503

[State 1500, 1]
type = ChangeState
triggerall = var(10) = 2
trigger1 = time >=25
trigger1 = !Numhelper(1508)
trigger2 = time >= 50
value = 1503

;Finish
[Statedef 1503]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1503

[State 1503, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Webbing
[Statedef 1504]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 3
anim = 1504

[State 1504, 1]
type = BindToParent
trigger1 = Animelemtime(11) < 0
time = 1
;facing = 0
pos = (135+((Animelemno(0)-1)*16))*const(size.xscale),-88*const(size.yscale)

[State 1504, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1504, 2]
type = VelSet
trigger1 = AnimElemtime(11)>=0
x = 8

[State 1504, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1504, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1504, Hitdef]
type = HitDef
trigger1 = AnimElem = 10, < 2
attr = S, SP
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3
;p2getp1state = 1

[State 1504, Hitdef]
type = HitDef
trigger1 = AnimElem = 11, >= 0
attr = S, SP
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3

[State 1504, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1504, HitSpark]
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

[State 1504, Counter FX]
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

[State 1504, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1504, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1505
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1504, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1504, 1]
type = ChangeState
trigger1 = moveguarded
trigger2 = movehit && Animelemtime(11) >=0
value = 1505

[State 1504, 1]
type = DestroySelf
trigger1 = FrontEdgeBodyDist < -220  || time = 55
trigger2 = movehit && Animelemtime(11) <0

;Web
[Statedef 1505]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1505
sprpriority = 3

[State 1505, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1505, 1]
type = DestroySelf
trigger1 = Animtime = 0

;Webbing
[Statedef 1506]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 1
anim = 1514

[State 1506, 1]
type = BindToParent
trigger1 = Animelemtime(10) < 0
time = 1
;facing = 0
pos = (112+((Animelemno(0)-1)*12))*const(size.xscale),-166-((Animelemno(0)-1)*10)

[State 1506, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1506, 2]
type = VelSet
trigger1 = AnimElemtime(10)>=0
x = 6
y = -5

[State 1506, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1506, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1506, Hitdef]
type = HitDef
trigger1 = AnimElem = 9, < 2
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -4,-4
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3
;p2stateno = 3018
kill = 0

[State 1506, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
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

[State 1506, Counter FX]
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

[State 1506, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1506, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1507
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1506, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1506, 1]
type = ChangeState
trigger1 = moveguarded
trigger2 = movehit && Animelemtime(10) >= 0
value = 1507

[State 1506, 1]
type = DestroySelf
trigger1 = Screenpos Y <= -200
trigger2 = movehit && Animelemtime(10) <0

;Web
[Statedef 1507]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1515
sprpriority = 3

[State 1507, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1507, 1]
type = DestroySelf
trigger1 = Animtime = 0

;Webbing
[Statedef 1508]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 1
anim = 1524

[State 1508, 1]
type = BindToParent
trigger1 = Animelemtime(11) < 0
time = 1
;facing = 0
pos = 25*const(size.xscale),-188-((Animelemno(0)-1)*16)

[State 1508, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1508, 2]
type = VelSet
trigger1 = AnimElemtime(11)>=0
y = -8

[State 1508, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1508, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1508, Hitdef]
type = HitDef
trigger1 = AnimElem = 10, < 2
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2,-4
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3
;p2stateno = 3018
kill = 0

[State 1508, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1508, HitSpark]
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

[State 1508, Counter FX]
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

[State 1508, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1508, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1509
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1508, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1508, 1]
type = ChangeState
trigger1 = moveguarded
trigger2 = movehit && Animelemtime(11) >=0
value = 1509

[State 1508, 1]
type = DestroySelf
trigger1 = Screenpos Y <= -200
trigger2 = movehit && Animelemtime(11) <0

;Web
[Statedef 1509]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1525
sprpriority = 3

[State 1509, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1509, 1]
type = DestroySelf
trigger1 = Animtime = 0

;Slam
[Statedef 1540]
type = S
movetype = A
physics = N
anim = 1501
poweradd = 0
sprpriority = 2

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 244*const(size.xscale), -89*const(size.yscale)
time = 16

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 244*const(size.xscale), -69*const(size.yscale)
time = 16

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = 240*const(size.xscale), -51*const(size.yscale)
time = 16

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = 234*const(size.xscale), -41*const(size.yscale)
time = 16

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 224*const(size.xscale), -27*const(size.yscale)
time = 16

[State 1540, 1]
type = Turn
trigger1 = AnimElem = 6
;ignorehitpause = 0
;persistent = 1

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = -165*const(size.xscale), -12*const(size.yscale)
time = 16

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 7
pos = -159*const(size.xscale), -8*const(size.yscale)
time = 6

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 8
pos = -132*const(size.xscale), 3*const(size.yscale)
time = 16

[State 1540, Bind 1]
type = TargetBind
trigger1 = AnimElem = 9
pos = -120*const(size.xscale), -7*const(size.yscale)
time = 6

[State 1540, 1]
type = TargetState
trigger1 = Animtime = 0
value = 1555

[State 1540, State End]
type = ChangeState
trigger1 = Animtime = 0
value = 1545

;Slam
[Statedef 1541]
type = S
movetype = A
physics = N
anim = 1511
poweradd = 0
sprpriority = 2

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 149*const(size.xscale), -181*const(size.yscale)
time = 16

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 177*const(size.xscale), -175*const(size.yscale)
time = 16

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = 216*const(size.xscale), -155*const(size.yscale)
time = 16

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = 234*const(size.xscale), -41*const(size.yscale)
time = 16

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 231*const(size.xscale), -129*const(size.yscale)
time = 16

[State 1541, 1]
type = Turn
trigger1 = AnimElem = 7
;ignorehitpause = 0
;persistent = 1

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 211*const(size.xscale), -82*const(size.yscale)
time = 16

[State 1541, Bind 1]
type = TargetBind
trigger1 = AnimElem = 7
pos = -78*const(size.xscale), -40*const(size.yscale)
time = 6

[State 1541, 1]
type = TargetState
trigger1 = Animtime = 0
value = 1555

[State 1541, State End]
type = ChangeState
trigger1 = Animtime = 0
value = 1545

;Slam
[Statedef 1542]
type = S
movetype = A
physics = N
anim = 1521
poweradd = 0
sprpriority = 2

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 18*const(size.xscale), -231*const(size.yscale)
time = 16

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 30*const(size.xscale), -240*const(size.yscale)
time = 16

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = 78*const(size.xscale), -233*const(size.yscale)
time = 16

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = 87*const(size.xscale), -245*const(size.yscale)
time = 16

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 100*const(size.xscale), -230*const(size.yscale)
time = 16

[State 1542, 1]
type = Turn
trigger1 = AnimElem = 10
;ignorehitpause = 0
;persistent = 1

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 137*const(size.xscale), -212*const(size.yscale)
time = 16

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 7
pos = 159*const(size.xscale), -189*const(size.yscale)
time = 6

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 8
pos = 160*const(size.xscale), -160*const(size.yscale)
time = 16

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 9
pos = 148*const(size.xscale), -122*const(size.yscale)
time = 6

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 10
pos = -103*const(size.xscale), -53*const(size.yscale)
time = 6

[State 1542, Bind 1]
type = TargetBind
trigger1 = AnimElem = 11
pos = -77*const(size.xscale), -40*const(size.yscale)
time = 6

[State 1542, 1]
type = TargetState
trigger1 = Animtime = 0
value = 1555

[State 1542, State End]
type = ChangeState
trigger1 = Animtime = 0
value = 1545

;Waste the Creep
[Statedef 1545]
type = S
movetype = A
physics = N
anim = 1545
poweradd = 0
sprpriority = 2

[State 1545, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S1530,0+random%4

[State 1545, 1]
type = VarSet
trigger1 = time = 0
v = 40
value = 0

[State 1545, 1]
type = VarAdd
trigger1 = var(10) = [3,5]
v = 40
value = 1

[State 1545, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 12 || AnimElem = 31
value = 820,2

[State 1545, Impact Dust]
type = Helper
trigger1 = Animelem = 12 || AnimElem = 31
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = (floor(P2Dist X)-7)*const(size.xscale),-5*const(size.yscale)
facing = -1
ownPal = 1

[State 1545, 1]
type = TargetLifeAdd
triggerall = var(10) = [0,2]
trigger1 =  Animelem = 12 || AnimElem = 31
value = -35
kill = 0

[State 1545, 1]
type = TargetLifeAdd
triggerall = var(10) = [3,5]
trigger1 =  Animelem = 12 || AnimElem = 31
value = -30
kill = 0

[State 1545, 0]
type = GameMakeAnim
trigger1 = Animelem = 12 || AnimElem = 31
pos = floor(P2Dist X),0
value = 62

[State 1545, 3]
type = EnvShake
trigger1 = Animelem = 12 || AnimElem = 31
time = 15
freq = 70
ampl = -4

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -65*const(size.xscale), -39*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = -80*const(size.xscale), -50*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = -106*const(size.xscale), -70*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = -115*const(size.xscale), -84*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = -130*const(size.xscale), -128*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 135*const(size.xscale), -125*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 7
pos = 155*const(size.xscale), -117*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 8
pos = 217*const(size.xscale), -85*const(size.yscale)
time = 16

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 9
pos = 229*const(size.xscale), -66*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 10
pos = 237*const(size.xscale), -49*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 11
pos = 243*const(size.xscale), -5*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 12
pos = 243*const(size.xscale), 5*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 13
pos = 235*const(size.xscale), 33*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 14
pos = 213*const(size.xscale), -16*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 15
pos = 210*const(size.xscale), -7*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 16
pos = 206*const(size.xscale), -3*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 17
pos = 137*const(size.xscale), -23*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 18
pos = 123*const(size.xscale), -19*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 19
pos = 130*const(size.xscale), -23*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 20
pos = 119*const(size.xscale), -23*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 21
pos = 125*const(size.xscale), -29*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 22
pos =171*const(size.xscale), -54*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 23
pos = 192*const(size.xscale), -90*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 24
pos = 196*const(size.xscale), -147*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 25
pos = 31*const(size.xscale), -127*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 26
pos = 0, -147*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 27
pos = -23*const(size.xscale), -149*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 28
pos = -93*const(size.xscale), -153*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 29
pos = -192*const(size.xscale), -91*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 30
pos = -198*const(size.xscale), -56*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 31
pos = -199*const(size.xscale), -12*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 32
pos = -177*const(size.xscale), 25*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 33
pos = -168*const(size.xscale), 44*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 34
pos = -186*const(size.xscale), -6*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 35
pos = -165*const(size.xscale), 13*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 36
pos = -182*const(size.xscale), -3*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 37
pos = -206*const(size.xscale), -25*const(size.yscale)
time = 6

[State 1545, Bind 1]
type = TargetBind
trigger1 = AnimElem = 38
pos = -217*const(size.xscale), -43*const(size.yscale)
time = 6

[State 1545, 1]
type = TargetState
trigger1 = Animtime = 0
value = ifelse(Var(40)>9,1556,1557)

[State 1545, State End]
type = ChangeState
trigger1 = Animtime = 0
value = ifelse(Var(40)>9,1546,1547)

;Waste the Creep
[Statedef 1546]
type = S
movetype = A
physics = N
anim = 1546
sprpriority = 2

[State 1546, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 12 || AnimElem = 31
value = 820,2

[State 1546, 1]
type = TargetLifeAdd
triggerall = var(10) = [0,2]
trigger1 =  Animelem = 12 || AnimElem = 31
value = -20
kill = 0

[State 1546, 1]
type = TargetLifeAdd
triggerall = var(10) = [3,5]
trigger1 =  Animelem = 12 || AnimElem = 31
value = -15
kill = 0

[State 1546, Impact Dust]
type = Helper
trigger1 = Animelem = 12 || AnimElem = 31
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = (floor(P2Dist X)-80)*const(size.xscale),-5*const(size.yscale)
facing = -1
ownPal = 1

[State 1546, 0]
type = GameMakeAnim
trigger1 = Animelem = 12 || AnimElem = 31
pos = floor(P2Dist X),0
value = 62

[State 1546, 3]
type = EnvShake
trigger1 = Animelem = 12 || AnimElem = 31
time = 15
freq = 70
ampl = -4

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -65*const(size.xscale), -39*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = -80*const(size.xscale), -50*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = -106*const(size.xscale), -70*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = -115*const(size.xscale), -84*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = -130*const(size.xscale), -128*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 135*const(size.xscale), -125*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 7
pos = 155*const(size.xscale), -117*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 8
pos = 217*const(size.xscale), -85*const(size.yscale)
time = 16

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 9
pos = 229*const(size.xscale), -66*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 10
pos = 237*const(size.xscale), -49*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 11
pos = 243*const(size.xscale), -5*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 12
pos = 243*const(size.xscale), 5*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 13
pos = 235*const(size.xscale), 33*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 14
pos = 213*const(size.xscale), -16*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 15
pos = 210*const(size.xscale), -7*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 16
pos = 206*const(size.xscale), -3*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 17
pos = 137*const(size.xscale), -23*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 18
pos = 123*const(size.xscale), -19*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 19
pos = 130*const(size.xscale), -23*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 20
pos = 119*const(size.xscale), -23*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 21
pos = 125*const(size.xscale), -29*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 22
pos =171*const(size.xscale), -54*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 23
pos = 192*const(size.xscale), -90*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 24
pos = 196*const(size.xscale), -147*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 25
pos = 31*const(size.xscale), -127*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 26
pos = 0, -147*const(size.xscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 27
pos = -23*const(size.xscale), -149*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 28
pos = -93*const(size.xscale), -153*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 29
pos = -192*const(size.xscale), -91*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 30
pos = -198*const(size.xscale), -56*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 31
pos = -199*const(size.xscale), -12*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 32
pos = -177*const(size.xscale), 25*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 33
pos = -168*const(size.xscale), 44*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 34
pos = -186*const(size.xscale), -6*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 35
pos = -165*const(size.xscale), 13*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 36
pos = -182*const(size.xscale), -3*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 37
pos = -206*const(size.xscale), -25*const(size.yscale)
time = 6

[State 1546, Bind 1]
type = TargetBind
trigger1 = AnimElem = 38
pos = -217*const(size.xscale), -43*const(size.yscale)
time = 6

[State 1546, 1]
type = TargetState
trigger1 = Animtime = 0
value = 1557

[State 1546, State End]
type = ChangeState
trigger1 = Animtime = 0
value = 1547

;Slam
[Statedef 1547]
type = S
movetype = A
physics = N
anim = 1547
sprpriority = 2

[State 1547, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3 && Random < 200
value = 1330,0+random%2

[State 1547, 1]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1547, 1]
type = Explod
trigger1 = AnimElem = 3
anim = 1548
ID = 1548
pos = 0,-55*const(size.yscale)
postype = p2
bindtime = 18
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = 5
velocity = 1,0
facing = -1
scale = const(size.xscale),1

[State 1547, 1]
type = TargetLifeAdd
triggerall = var(10) = [0,2]
trigger1 =  Animelem = 3
value = -85

[State 1547, 1]
type = TargetLifeAdd
triggerall = var(10) = [3,5]
trigger1 =  Animelem = 3
value = -80

[State 1547, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -183*const(size.xscale), -70*const(size.yscale)
time = 1

[State 1547, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 18*const(size.xscale), -78*const(size.yscale)
time = 1

[State 1547, Bind 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = 89*const(size.xscale), -35*const(size.yscale)
time = 1

[State 1547, 1]
type = ChangeState
trigger1 = animtime = 0 && backedgebodydist <= -50
value = 1548

[State 1547, 1]
type = ChangeState
trigger1 = animtime = 0 && backedgebodydist > -50
value = 0
ctrl = 1

;Finish
[Statedef 1548]
type = S
movetype = A
physics = S
anim = 1
sprpriority = 1
velset = 0,0
ctrl = 0

[State 1548, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1548, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,1

[State 1548, PosSet]
type = PosSet
trigger1 = 1
x = -180 * facing
y = 0

[State 1548, ChangeState]
type = ChangeState
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target,stateno = 5110
value = 101

;Grabbed
[Statedef 1550]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = 1

[State 1550, StateTypeSet]
type = StateTypeSet
trigger1 = p2statetype = A
statetype = A       ;S,A,C,L
movetype = H        ;I,A,H
physics = N         ;A,C,S,N

[State 1550, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1550

[State 1550, ]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

;Grabbed
[Statedef 1551]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = 1

[State 1551, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1551

[State 0, ]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

;Grabbed
[Statedef 1552]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = 1

[State 1552, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1552

[State 1552, ]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

;Grabbed
[Statedef 1555]
type = S
movetype = H
physics = N
sprpriority = 1

[State 1555, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1555

[State 1555, 1]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

;Grabbed
[Statedef 1556]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = 1

[State 1556, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1556

[State 1556, 1]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 1556, 1]
type = SelfState
trigger1 =  time > 2 && enemy, stateno !=1546
value = 5000
ctrl = 1

;Throw (hit by, into air)
[Statedef 1557]
type = A
movetype = H ;Get hit
physics = N
ctrl = 0
sprpriority = 3

[State 1557, 1]
type = PosFreeze
trigger1 = BackEdgeBodyDist <= 0 && Anim =ifelse(SelfAnimExist(5063),5063,5061)
value = 4
persistent = 0

[State 1557, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 15
freq = 70
ampl = -4

[State 1557, 1]
type = PlaySnd
trigger1 = BackEdgeBodyDist <= 0 && Anim =ifelse(SelfAnimExist(5063),5063,5061)
value = 0,16
volume = 255
persistent = 0

[State 1557, 1]
type = Turn
trigger1 = !time

[State 1557, 2] ;Gravity
type = VelAdd
trigger1 = Time = 13
x = -22
y = -6

[State 1557, 1]
type = ChangeAnim2
trigger1 = !Time
value = 1557

[State 1557, 1]
type = ChangeAnim2
trigger1 = time = 12
value = ifelse(SelfAnimExist(5063),5063,5061)

[State 1557, 2] ;Gravity
type = VelAdd
trigger1 = Time > 13
y = .62

[State 1557, 5] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5110 ;Hit ground

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

[State 1530, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 3, ifElse((command = "x" && command = "z"), 4, 5))

[State 1530, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1530, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 5, 1520, ifElse(var(10) = 4, 1510, 1500))

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
var(25) = 194

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
type = Width
triggerall = var(10) = 3
trigger1 = Animelem = 5
player = 110,0

[State 1530, 1]
type = Width
triggerall = var(10) = 4
trigger1 = Animelem = 5
player = 100,0

[State 1530, 1]
type = Helper
triggerall = var(10) = 3
trigger1 = AnimElem = 5
helpertype = normal
name = "Webbing"
ID = 1534
pos = 129*const(size.xscale),-88*const(size.yscale)
postype = p1
ownpal = 1
stateno = 1534
persistent = 0
bindtime = 2
size.xscale = const(size.xscale)

[State 1530, 1]
type = Helper
triggerall = var(10) = 4
trigger1 = AnimElem = 5
helpertype = normal
name = "Webbing"
ID = 1536
pos = 112*const(size.xscale),-146*const(size.yscale)
postype = p1
ownpal = 1
stateno = 1536
persistent = 0
size.xscale = const(size.xscale)

[State 1530, 1]
type = Helper
triggerall = var(10) = 5
trigger1 = AnimElem = 5
helpertype = normal
name = "Shadow"
ID = 1538
pos = 15*const(size.xscale),-188*const(size.yscale)
postype = p1
ownpal = 1
stateno = 1538
persistent = 0
size.xscale = const(size.xscale)

[State 1530, Projectile]
type = Projectile
triggerall = var(10) = 3
trigger1 = Numhelper(1534)
trigger1 = helper(1534), movehit
trigger1 = helper(1534), Animelemtime(11)< 0
postype  = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
p1stateno = 1540
p2stateno = 1550
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 1530, Projectile]
type = Projectile
triggerall = var(10) = 4
trigger1 = Numhelper(1536)
trigger1 = helper(1536), movehit
trigger1 = helper(1536), Animelemtime(10)< 0
postype  = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
p1stateno = 1541
p2stateno = 1551
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 1530, Projectile]
type = Projectile
triggerall = var(10) = 5
trigger1 = Numhelper(1538)
trigger1 = helper(1538), movehit
trigger1 = helper(1538), Animelemtime(11)< 0
postype  = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
p1stateno = 1542
p2stateno = 1552
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 1530, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1500,0+random%3
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 1530, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 20,0
persistent = 0

[State 1530, 1]
type = ChangeState
triggerall = var(10) = 3
trigger1 = time >=25
trigger1 = !Numhelper(1534)
trigger2 = time >= 50
value = 1533

[State 1530, 1]
type = ChangeState
triggerall = var(10) = 4
trigger1 = time >=25
trigger1 = !Numhelper(1536)
trigger2 = time >= 50
value = 1533

[State 1530, 1]
type = ChangeState
triggerall = var(10) = 5
trigger1 = time >=25
trigger1 = !Numhelper(1538)
trigger2 = time >= 50
value = 1533

;Finish
[Statedef 1533]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1503

[State 1533, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Webbing
[Statedef 1534]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 3
anim = 1504

[State 1534, 1]
type = BindToParent
trigger1 = Animelemtime(11) < 0
time = 1
;facing = 0
pos = (135+((Animelemno(0)-1)*16))*const(size.xscale),-88*const(size.yscale)

[State 1534, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1534, 2]
type = VelSet
trigger1 = AnimElemtime(11)>=0
x = 8

[State 1534, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1534, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1534, Hitdef]
type = HitDef
trigger1 = AnimElem = 10, < 2
attr = S, SP
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3
;p2getp1state = 1

[State 1534, Hitdef]
type = HitDef
trigger1 = AnimElem = 11, >= 0
attr = S, SP
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3

[State 1534, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1534, HitSpark]
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

[State 1534, Counter FX]
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

[State 1534, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1534, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1535
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1534, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1534, 1]
type = ChangeState
trigger1 = moveguarded
trigger2 = movehit && Animelemtime(11) >=0
value = 1535

[State 1534, 1]
type = DestroySelf
trigger1 = FrontEdgeBodyDist < -220  || time = 55
trigger2 = movehit && Animelemtime(11) <0

;Web
[Statedef 1535]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1505
sprpriority = 3

[State 1535, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1535, 1]
type = DestroySelf
trigger1 = Animtime = 0

;Webbing
[Statedef 1536]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 1
anim = 1514

[State 1536, 1]
type = BindToParent
trigger1 = Animelemtime(10) < 0
time = 1
;facing = 0
pos = (112+((Animelemno(0)-1)*12))*const(size.xscale),-166-((Animelemno(0)-1)*10)

[State 1536, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1536, 2]
type = VelSet
trigger1 = AnimElemtime(10)>=0
x = 6
y = -5

[State 1536, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1536, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1536, Hitdef]
type = HitDef
trigger1 = AnimElem = 9, < 2
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -4,-4
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3
;p2stateno = 3018
kill = 0

[State 1536, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
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

[State 1536, Counter FX]
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

[State 1536, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1536, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1537
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1536, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1536, 1]
type = ChangeState
trigger1 = moveguarded
trigger2 = movehit && Animelemtime(10) >= 0
value = 1537

[State 1536, 1]
type = DestroySelf
trigger1 = Screenpos Y <= -200
trigger2 = movehit && Animelemtime(10) <0

;Web
[Statedef 1537]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1515
sprpriority = 3

[State 1537, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1537, 1]
type = DestroySelf
trigger1 = Animtime = 0

;Webbing
[Statedef 1538]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 1
anim = 1524

[State 1538, 1]
type = BindToParent
trigger1 = Animelemtime(11) < 0
time = 1
;facing = 0
pos = 25*const(size.xscale),-188-((Animelemno(0)-1)*16)

[State 1538, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1538, 2]
type = VelSet
trigger1 = AnimElemtime(11)>=0
y = -8

[State 1538, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1508, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1538, Hitdef]
type = HitDef
trigger1 = AnimElem = 10, < 2
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
guard.cornerpush.veloff = 0
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2,-4
yaccel = 0.53
sprpriority = 4
;fall = 1
;fall.recover = 0
envshake.time = 3
;p2stateno = 3018
kill = 0

[State 1538, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1538, HitSpark]
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

[State 1538, Counter FX]
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

[State 1538, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 1538, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1539
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 1538, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1538, 1]
type = ChangeState
trigger1 = moveguarded
trigger2 = movehit && Animelemtime(11) >=0
value = 1539

[State 1538, 1]
type = DestroySelf
trigger1 = Screenpos Y <= -200
trigger2 = movehit && Animelemtime(11) <0

;Web
[Statedef 1539]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1525
sprpriority = 3

[State 1539, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1539, 1]
type = DestroySelf
trigger1 = Animtime = 0

;=====================<VENOM GLIDE>==========================
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
value = ifElse(var(10) = 2, 1602, ifElse(var(10) = 1, 1600, 1601))

[State 1600, VelSet]
type = VelSet
triggerall = var(10) = 1
trigger1 = timemod = 4,2 && animelem != 11
y = -0.3

[State 1600, VelSet]
type = VelSet
triggerall = var(10) = 0
trigger1 = timemod = 4,2 && animelem != 8 && animelem != 9 && animelem != 10
y = -0.3

[State 1600, VelSet]
type =VelSet
triggerall = var(10) = 2
trigger1 = timemod = 4,2 && animelem != 12;15
y = -0.3

[State 1600]
type = PlaySnd
trigger1 = animelem = 3
value = 20,0

[State 1600, 1]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 1600, 2]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1600, Hitdef]
type = HitDef
attr = C, ST
triggerall = var(10) = 1
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
animtype = Medium
priority = 5, Hit
hitflag = MAFD
priority = 4, Hit
guardflag = MAF
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := 0
ground.type = High
ground.slidetime = 15
ground.hittime = 30
ground.velocity = -1,0
air.velocity = -1,0
fall = 0
air.fall = 0
fall.recover = 0
p1stateno = 1610
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, Hitdef]
type = HitDef
attr = C, ST
triggerall = var(10) = 0
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
animtype = Medium
priority  = 5, Hit
hitflag = MAFD
guardflag = MA
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := 50
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -1,0
air.velocity = -1,0
fall = 0
air.fall = 0
fall.recover = 0
p1stateno = 1611
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, Hitdef]
type = HitDef
attr = C, ST
triggerall = var(10) = 2
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
animtype = Medium
priority  = 5, Hit
hitflag = MAFD
guardflag = MA
pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 193), var(36) := -80
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -1,0
air.velocity = -1,0
fall = 0
air.fall = 0
fall.recover = 0
p1stateno = 1612
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, Projectile]
type = Projectile
triggerall = var(10) = 1
trigger1 =  animelem = 11
ProjID = 1005
projanim = 1640
projhitanim = 1630
projremanim = 1606
projcancelanim = 1606
projscale = 1,1
projremove = 1
projremovetime = -1
velocity = 10,10
velmul = 1
projhits = 1
projsprpriority = 3
offset = 25,-90
postype = p1
attr = S,SP
hitflag = MAFD
guardflag = MA
animtype = light
air.animtype = light
projpriority =  7
damage = 0,0
pausetime = 0,4
sparkno = -1
guard.sparkno = -1
hitsound = s2,6
guardsound = s3,0
ground.type = High
ground.hit = 10
air.hittime = 10
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.velocity = -2,0
sprpriority = 1

[State 1600, Projectile]
type = Projectile
triggerall = var(10) = 0
trigger1 = animelem = 8
ProjID = 1005
projanim = 1641
projhitanim = 1631
projremanim = 1609
projcancelanim = 1609
projscale = 1,1
projremove = 1
projremovetime = -1
velocity = 0,10
velmul = 1
projhits = 1
projsprpriority = 3
offset = 40,0
postype = p1
attr = S,SP
hitflag = MAFD
guardflag = MA
animtype = light
air.animtype = light
projpriority = 7
damage = 0,0
pausetime = 0,4
sparkno = -1
guard.sparkno = -1
hitsound = s2,6
guardsound = s3,0
ground.type = High
ground.hit = 10
air.hittime = 10
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.velocity = -2,0
sprpriority = 1

[State 1600, Projectile]
type = Projectile
triggerall = var(10) = 2
trigger1 = animelem = 12;15
ProjID = 1005
projanim = 1642
projhitanim = 1632
projremanim = 1604
projcancelanim = 1604
projscale = 1,1
projremove = 1
projremovetime = -1
velocity = 10,0;10
velmul = 1
projhits = 1
projsprpriority = 3
offset = 124,-106
postype = p1
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = light
air.animtype = light
projpriority = 7
damage = 15,3
pausetime = 0,4
sparkno = -1
guard.sparkno = -1
hitsound = s2,6
guardsound = s3,0
ground.type = High
ground.hit = 10
air.hittime = 10
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.velocity = -2,0
sprpriority = 1

[State 1600, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1613

;Falling From Venom Web Miss
[Statedef 1613]
type = A
movetype = I
physics = N
anim = 1603
sprpriority = 2

[State 1213, Turn]
type = Turn
trigger1 = P2Dist X < -5

[State 1613, 2]
type = PosAdd
trigger1 = Time = 0
x = 0;-10

[State 1613, 3]
type = Gravity
trigger1 = 1

[State 1613, 4]
type = ChangeState
trigger1 = Vel Y >= 0
trigger1 = Pos Y >= 0
value = 52

;Venom Glide Downforward cont.
[Statedef 1610]
type = A
movetype = A
physics = N
juggle = 1
anim = 1610
sprpriority = 0
velset = 0, 0

[State 1610, Explod]
type = Explod
trigger1 = time = 0
anim = 1630
ID = 1230
pos = -10,-100
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 8
scale = 1,1
sprpriority = 4

[State 1610, VelSet]
type = VelSet
trigger1 = time = 5
x = 10
y = 8

[State 1610, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1613

;Venom Glide Downward cont..
[Statedef 1611]
type = A
movetype = A
physics = N
juggle = 1
anim = 1612
sprpriority = 0
velset = 0, 0

[State 1611, Explod]
type = Explod
trigger1 =  time = 0
anim = 1631
ID = 1231
pos = 40,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 8
scale = 1,1
sprpriority = 4

[State 1611, VelSet]
type = VelSet
trigger1 = time = 5
y = 8

[State 1611, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1613

;Venom Glide Across cont.
[Statedef 1612]
type = A
movetype = A
physics = N
;juggle  = 1
anim = 1611
sprpriority = 0
velset = 2, 0

[State 1612, Explod]
type = Explod
trigger1 =  time = 0
anim = 1632
ID = 1232
pos = 124,-106
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 8
scale = 1,1
sprpriority = 4

[State 1612, VelSet]
type = VelSet
trigger1 = time = 5
x = 12

[State 1612, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1613

;========================<EX VENOM GLIDE>=============================
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

[State 1630, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 3, ifElse((command = "x" && command = "z"), 4, 5))

[State 1630, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1630, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 5, 1602, ifElse(var(10) = 4, 1600, 1601))

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
var(25) = 194

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

[State 1630, VelSet]
type = VelSet
triggerall = var(10) = 4
trigger1 = timemod = 4,2 && animelem != 11
y = -0.3

[State 1630, VelSet]
type = VelSet
triggerall = var(10) = 3
trigger1 = timemod = 4,2 && animelem != 8 && animelem != 9 && animelem != 10
y = -0.3

[State 1630, VelSet]
type =VelSet
triggerall = var(10) = 5
trigger1 = timemod = 4,2 && animelem != 12;15
y = -0.3

[State 1630]
type = PlaySnd
trigger1 = animelem = 3
value = 20,0

[State 1630, 1]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 1630, 2]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1630, Hitdef]
type = HitDef
attr = C, ST
triggerall = var(10) = 4
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = 0,0
givePower = 36, 36
animtype = Medium
priority = 5, Hit
hitflag = MAFD
priority = 4, Hit
guardflag = MAF
pausetime = 0,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := 0
ground.type = High
ground.slidetime = 15
ground.hittime = 30
ground.velocity = -1,0
air.velocity = -1,0
fall = 0
air.fall = 0
fall.recover = 0
p1stateno = 1640
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, Hitdef]
type = HitDef
attr = C, ST
triggerall = var(10) = 3
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = 0,0
givePower = 36, 36
animtype = Medium
priority  = 5, Hit
hitflag = MAFD
guardflag = MA
pausetime = 0,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := 50
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -1,0
air.velocity = -1,0
fall = 0
air.fall = 0
fall.recover = 0
p1stateno = 1641
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, Hitdef]
type = HitDef
attr = C, ST
triggerall = var(10) = 5
trigger1 = hitcount < 1
trigger1 = moveguarded < 1
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = 0,0
givePower = 36, 36
animtype = Medium
priority  = 5, Hit
hitflag = MAFD
guardflag = MA
pausetime = 0,5
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 193), var(36) := -80
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -1,0
air.velocity = -1,0
fall = 0
air.fall = 0
fall.recover = 0
p1stateno = 1642
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, Projectile]
type = Projectile
triggerall = var(10) = 4
trigger1 =  animelem = 11
ProjID = 1005
projanim = 1640
projhitanim = 1630
projremanim = 1606
projcancelanim = 1606
projscale = 1,1
projremove = 1
projremovetime = -1
velocity = 10,10
velmul = 1
projhits = 1
projsprpriority = 3
offset = 25,-90
postype = p1
attr = S,SP
hitflag = MAFD
guardflag = MA
animtype = light
air.animtype = light
projpriority =  7
damage = 0,0
pausetime = 0,4
sparkno = -1
guard.sparkno = -1
hitsound = s2,6
guardsound = s3,0
ground.type = High
ground.hit = 10
air.hittime = 10
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.velocity = -2,0
sprpriority = 1

[State 1630, Projectile]
type = Projectile
triggerall = var(10) = 3
trigger1 = animelem = 8
ProjID = 1005
projanim = 1641
projhitanim = 1631
projremanim = 1609
projcancelanim = 1609
projscale = 1,1
projremove = 1
projremovetime = -1
velocity = 0,10
velmul = 1
projhits = 1
projsprpriority = 3
offset = 40,0
postype = p1
attr = S,SP
hitflag = MAFD
guardflag = MA
animtype = light
air.animtype = light
projpriority = 7
damage = 0,0
pausetime = 0,4
sparkno = -1
guard.sparkno = -1
hitsound = s2,6
guardsound = s3,0
ground.type = High
ground.hit = 10
air.hittime = 10
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.velocity = -2,0
sprpriority = 1

[State 1630, Projectile]
type = Projectile
triggerall = var(10) = 5
trigger1 = animelem = 12;15
ProjID = 1005
projanim = 1642
projhitanim = 1632
projremanim = 1604
projcancelanim = 1604
projscale = 1,1
projremove = 1
projremovetime = -1
velocity = 10,0;10
velmul = 1
projhits = 1
projsprpriority = 3
offset = 124,-106
postype = p1
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = light
air.animtype = light
projpriority = 7
damage = 15,3
pausetime = 0,4
sparkno = -1
guard.sparkno = -1
hitsound = s2,6
guardsound = s3,0
ground.type = High
ground.hit = 10
air.hittime = 10
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.velocity = -2,0
sprpriority = 1

[State 1630, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1643

;Falling From Venom Web Miss
[Statedef 1643]
type = A
movetype = I
physics = N
anim = 1603
sprpriority = 2

[State 1643, Turn]
type = Turn
trigger1 = P2Dist X < -5

[State 1643, 2]
type = PosAdd
trigger1 = Time = 0
x = 0;-10

[State 1643, 3]
type = Gravity
trigger1 = 1

[State 1643, 4]
type = ChangeState
trigger1 = Vel Y >= 0
trigger1 = Pos Y >= 0
value = 52

;Venom Glide Downforward cont.
[Statedef 1640]
type = A
movetype = A
physics = N
juggle = 1
anim = 1610
sprpriority = 0
velset = 0, 0

[State 1640, Explod]
type = Explod
trigger1 = time = 0
anim = 1630
ID = 1230
pos = -10,-100
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 8
scale = 1,1
sprpriority = 4

[State 1640, VelSet]
type = VelSet
trigger1 = time = 5
x = 10
y = 8

[State 1640, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1285

;Venom Glide Downward cont..
[Statedef 1641]
type = A
movetype = A
physics = N
juggle = 1
anim = 1612
sprpriority = 0
velset = 0, 0

[State 1641, Explod]
type = Explod
trigger1 =  time = 0
anim = 1631
ID = 1231
pos = 40,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 8
scale = 1,1
sprpriority = 4

[State 1641, VelSet]
type = VelSet
trigger1 = time = 5
y = 8

[State 1641, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1285

;Venom Glide Across cont.
[Statedef 1642]
type = A
movetype = A
physics = N
;juggle  = 1
anim = 1611
sprpriority = 0
velset = 2, 0

[State 1642, Explod]
type = Explod
trigger1 =  time = 0
anim = 1632
ID = 1232
pos = 124,-106
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 8
scale = 1,1
sprpriority = 4

[State 1642, VelSet]
type = VelSet
trigger1 = time = 5
x = 12

[State 1642, 10]
type = ChangeState
trigger1 = AnimTime = 0
value = 1285

;=====================<POWER STONE>==========================
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

[State 1700,PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1700,1

[State 1700,PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1700,0

[State 1700, Pull Helper]
type = Helper
triggerall = AnimElem = 2
trigger1 = !NumHelper(1750)
helpertype = normal
stateno = 1750
ID = 1750
name = "Vaccum"
postype = p2
pos = EnemyNear, Const(size.ground.back) -25, -ceil(Enemy, Pos y)
persistent = 0
size.ground.back = 5
size.ground.front = 5
size.height = 240

[State 1700, xyzpdq]
type = Changestate
;trigger1 = Command != "hold_c"
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Vaccum Helper
[Statedef 1750]
physics = N
velset = 0, 0
anim = 1740

[State 1750, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA

[State 1750, bound]
type = screenbound
trigger1 = 1
value = 0

[State 1750, Turn]
type = turn
trigger1 = rootdist x < 5

[State 1750, Push]
type = playerpush
trigger1 = p2bodydist x = [ -10, 10]
value = 1

[State 1750, Pos]
type = posset
trigger1 = 1
y = 0

[State 1750, VSet]
type = VelSet
trigger1 = ParentDist X >= 0
x = IfElse((Parentdist X = [0,100]), 6, IfElse((ParentDist X = [100,200]), 10, 7))

[State 1750, Dust]
type = explod
trigger1 = (p2bodydist x = [ -5, 5]) && (enemynear, statetype != A) && !(time % 12)
anim = 8100
ID = 8104
sprpriority = 2
postype = p1
pos = 0, 0
;scale = 0.5, 0.5
removetime = -2
ownpal = 1

[State 1750, Pos]
type = posadd
trigger1 = p2bodydist x != [ -5, 5]
x = ceil(p2dist x) - enemynear, const(size.ground.back) -5

[State 1750, End]
type = destroyself
trigger1 = (root, stateno != 1700)  ;|| root, movecontact

;========================<EX POWER STONE>=============================
[StateDef 1730]
type = S
physics = S
moveType = A
anim = 1700
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

[State 1760, NHB]
type = nothitby
trigger1 = 1
time = 15
value = SCA

[State 1700,PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1700,1

[State 1700,PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1700,0

[State 1700, Pull Helper]
type = Helper
triggerall = AnimElem = 2
trigger1 = !NumHelper(1760)
helpertype = normal
stateno = 1760
ID = 1760
name = "Vaccum"
postype = p2
pos = EnemyNear, Const(size.ground.back) -25, -ceil(Enemy, Pos y)
persistent = 0
size.ground.back = 5
size.ground.front = 5
size.height = 240

[State 1700, xyzpdq]
type = Changestate
;trigger1 = Command != "hold_c"
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Vaccum Helper
[Statedef 1760]
physics = N
velset = 0, 0
anim = 1740

[State 1760, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA

[State 1760, bound]
type = screenbound
trigger1 = 1
value = 0

[State 1760, Turn]
type = turn
trigger1 = rootdist x < 5

[State 1750, Push]
type = playerpush
trigger1 = p2bodydist x = [ -10, 10]
value = 1

[State 1760, Pos]
type = posset
trigger1 = 1
y = 0

[State 1760, VSet]
type = VelSet
trigger1 = ParentDist X >= 0
x = IfElse((Parentdist X = [0,100]), 16, IfElse((ParentDist X = [100,200]), 10, 17))

[State 1760, Dust]
type = explod
trigger1 = (p2bodydist x = [ -5, 5]) && (enemynear, statetype != A) && !(time % 12)
anim = 8100
ID = 8104
sprpriority = 2
postype = p1
pos = 0, 0
;scale = 0.5, 0.5
removetime = -2
ownpal = 1

[State 1760, Pos]
type = posadd
trigger1 = p2bodydist x != [ -5, 5]
x = ceil(p2dist x) - enemynear, const(size.ground.back) -5

[State 1760, End]
type = destroyself
trigger1 = (root, stateno != 1730)  ;|| root, movecontact

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
trigger1 = AnimElemTime(3) < 0
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

[State 2900, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 4
y = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 74 < 7, 7, fvar(11) * 74)), 0
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
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -95
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
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
trigger1 = AnimElemTime(6) < 0
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
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 74 < 7, 7, fvar(11) * 74)), 0
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
trigger1= AnimElemTime(9) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
