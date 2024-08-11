; _________________________________________
;| Venom by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<DEATH BITE>=============================
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
trigger1 = AnimElemTime(4) < 0
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
type = VarSet
;triggerall = var(23)=0
trigger1 = !time
v =  40
value = 0

[State 3000, 1]
type = VarSet
;triggerall = var(23)=0
trigger1 = NumHelper(3002)
trigger1 = helper(3002), movehit
v =  40
value = 1

[State 3000, 1]
type = ScreenBound
trigger1 = var(40)
value = 0

[State 3000, 1]
type = Helper
trigger1 = AnimElem = 2,3
helpertype = normal
name = "Shadow"
ID = 3001
pos = 0,0
postype = p1
ownpal = 1
stateno = 3001
persistent = 0
size.xscale = const(size.xscale)

[State 3000, Devour Everything]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,0+random%2
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3000, Eat Everything!]
type = PlaySnd
trigger1 = time = 66;30
value = 3050,0+random%2
volume = 216
volumescale = 216
channel = 0
loop = 0

[State 3000, 1]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal
name = "Symbiote"
ID = 3002
pos = 80*const(size.xscale),0
postype = p1
ownpal = 1
stateno = 3002
persistent = 0
size.xscale = const(size.xscale)

[State 3000, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, HA
animtype = Up
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,3
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -9
airguard.velocity = -1,-6
air.hittime  = 25
ground.velocity = -5,-6.5
down.velocity = -5, -6.5
air.velocity = -2,-5.5
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, 1]
type = ChangeState
trigger1 = time >=59 && backedgebodydist > -50
trigger1 = !Numhelper(3001)
value = 1103

[State 3000, 1]
type = ChangeState
trigger1 = time >=59 && backedgebodydist <= -50
trigger1 = !Numhelper(3002)
value = 1548

;Venom Rush Shadow
[Statedef 3001]
type = A
movetype = I
physics = N
velset = 7,0
anim = 1104
sprpriority = -2

[State 3001, 1]
type = Explod
trigger1 = !time
anim = 1105
ID = 1105
pos = 0,0
postype = p1
bindtime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -2
;persistent = 1
under = 1
scale = const(size.xscale),1

[State 3001, 1]
type = ModifyExplod
trigger1 = 1
ID = 1105
scale = (ParentDist X), 1
sprpriority = -1

[State 3001, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3001, 1]
type = RemoveExplod
trigger1 = parent, stateno !=[3000,3003]
ID = 1105

[State 3001, 1]
type = DestroySelf
trigger1 = parent, stateno !=[3000,3003]

[State 3001, 1]
type = ChangeState
trigger1 = time >= 30 && parent, Numhelper(3002) = 0
value = 3004

;Venom Rush Symbiote
[Statedef 3002]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 4

[State 3002, 1]
type = ChangeAnim
trigger1 = !time && Anim !=3007
value = 3007

[State 3002, 1];Chain Reaction
type = Helper
trigger1 = time = 18 && frontedgedist >= 0 && root, time < 150
;trigger1 = time = 13 && frontedgedist >= 0 && root, time < 125
helpertype = normal
name = "Symbiote"
ID = 3002
pos = 98*const(size.xscale),0
postype = p1
ownpal = 1
stateno = 3002
size.xscale = const(size.xscale)

[State 3002, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3002, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 20,5
volume = 216
volumescale = 216
channel = 7

[State 3002, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3002, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3002, Hitdef]
type = HitDef
trigger1 = AnimElem = 3
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,3
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -7
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = 0,-7.5
down.velocity = 0, -7.5
air.velocity = 0,-5.5
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = 18
ground.hittime = 18

[State 3002, Hitdef]
type = HitDef
trigger1 =  AnimElem = 6
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -7
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = -2,-2
air.velocity = -2,-2
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 3002, Hitdef]
type = HitDef
trigger1 = AnimElem = 9
attr = S, NA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -9
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = -7,-3.3
air.velocity = -7,-3.3
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = 18
ground.hittime = 18

[State 3002, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3002, HitSpark]
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
persistent = 1
ignoreHitPause = 1

[State 3002, Counter FX]
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

[State 3002, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3002, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1136;1026
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 3002, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 3002, 1]
type = DestroySelf
trigger1 = root, stateno !=3000
trigger2 = animtime=0

;Venom Rush Shadow
[Statedef 3004]
type = A
movetype = I
physics = N
velset = 0,0
sprpriority = -2

[State 3004, 1]
type = ModifyExplod
trigger1 = 1
ID = 1105
scale = (ParentDist X), 1
sprpriority = -1

[State 3004, 1]
type = VelSet
trigger1 = !time
x = (ParentDist X)/7

[State 3004, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3004, 1]
type = RemoveExplod
trigger1 = time >= 7
ID = 1105

[State 3004, 1]
type = DestroySelf
trigger1 = time >=7

;========================<MAX DEATH BITE>=============================
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
trigger1 = AnimElemTime(4) < 0
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
type = VarSet
;triggerall = var(23)=0
trigger1 = !time
v =  40
value = 0

[State 3050, 1]
type = VarSet
;triggerall = var(23)=0
trigger1 = NumHelper(3052)
trigger1 = helper(3052), movehit
v =  40
value = 1

[State 3050, 1]
type = ScreenBound
trigger1 = var(40)
value = 0

[State 3050, 1]
type = Helper
trigger1 = AnimElem = 2,3
helpertype = normal
name = "Shadow"
ID = 3051
pos = 0,0
postype = p1
ownpal = 1
stateno = 3051
persistent = 0
size.xscale = const(size.xscale)

[State 3050, Devour Everything]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,0+random%2
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3050, Eat Everything!]
type = PlaySnd
trigger1 = time = 66;30
value = 3050,0+random%2
volume = 216
volumescale = 216
channel = 0
loop = 0

[State 3050, 1]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal
name = "Symbiote"
ID = 3052
pos = 80*const(size.xscale),0
postype = p1
ownpal = 1
stateno = 3052
persistent = 0
size.xscale = const(size.xscale)

[State 3050, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, HA
animtype = Up
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,3
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -9
airguard.velocity = -1,-6
air.hittime  = 25
ground.velocity = -5,-6.5
down.velocity = -5, -6.5
air.velocity = -2,-5.5
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, 1]
type = ChangeState
trigger1 = time >=59 && backedgebodydist > -50
trigger1 = !Numhelper(3051)
value = 1103

[State 3050, 1]
type = ChangeState
trigger1 = time >=59 && backedgebodydist <= -50
trigger1 = !Numhelper(3052)
value = 1548

;Venom Rush Shadow
[Statedef 3051]
type = A
movetype = I
physics = N
velset = 7,0
anim = 1104
sprpriority = -2

[State 3051, 1]
type = Explod
trigger1 = !time
anim = 1105
ID = 1105
pos = 0,0
postype = p1
bindtime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -2
;persistent = 1
under = 1
scale = const(size.xscale),1

[State 3051, 1]
type = ModifyExplod
trigger1 = 1
ID = 1105
scale = (ParentDist X), 1
sprpriority = -1

[State 3051, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3051, 1]
type = RemoveExplod
trigger1 = parent, stateno !=[3050,3053]
ID = 1105

[State 3051, 1]
type = DestroySelf
trigger1 = parent, stateno !=[3050,3053]

[State 3051, 1]
type = ChangeState
trigger1 = time >= 30 && parent, Numhelper(3052) = 0
value = 3054

;Venom Rush Symbiote
[Statedef 3052]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 4

[State 3052, 1]
type = ChangeAnim
trigger1 = !time && Anim !=3007
value = 3007

[State 3052, 1];Chain Reaction
type = Helper
trigger1 = time = 18 && frontedgedist >= 0 && root, time < 150
;trigger1 = time = 13 && frontedgedist >= 0 && root, time < 125
helpertype = normal
name = "Symbiote"
ID = 3052
pos = 98*const(size.xscale),0
postype = p1
ownpal = 1
stateno = 3052
size.xscale = const(size.xscale)

[State 3052, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3052, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 20,5
volume = 216
volumescale = 216
channel = 7

[State 3052, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3052, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3052, Hitdef]
type = HitDef
trigger1 = AnimElem = 3
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAFD
pausetime = 0,3
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -7
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = 0,-7.5
down.velocity = 0, -7.5
air.velocity = 0,-5.5
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = 18
ground.hittime = 18

[State 3052, Hitdef]
type = HitDef
trigger1 =  AnimElem = 6
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -7
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = -2,-2
air.velocity = -2,-2
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 3052, Hitdef]
type = HitDef
trigger1 = AnimElem = 9
attr = S, NA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -9
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = -7,-3.3
air.velocity = -7,-3.3
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = 18
ground.hittime = 18

[State 3052, Hitdef]
type = HitDef
trigger1 = AnimElem = 11
attr = S, NA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
guard.velocity = -9
airguard.velocity = -1,-6
air.hittime = 25
ground.velocity = -7,-3
air.velocity = -7,-3
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
fall.envshake.time = 10
id = 4+64
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = 18
ground.hittime = 18

[State 3052, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3052, HitSpark]
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
persistent = 1
ignoreHitPause = 1

[State 3052, Counter FX]
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

[State 3052, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3052, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 1136;1026
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 3052, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 3052, 1]
type = DestroySelf
trigger1 = root, stateno !=3050
trigger2 = animtime=0

;Venom Rush Shadow
[Statedef 3054]
type = A
movetype = I
physics = N
velset = 0,0
sprpriority = -2

[State 3054, 1]
type = ModifyExplod
trigger1 = 1
ID = 1105
scale = (ParentDist X), 1
sprpriority = -1

[State 3054, 1]
type = VelSet
trigger1 = !time
x = (ParentDist X)/7

[State 3054, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3054, 1]
type = RemoveExplod
trigger1 = time >= 7
ID = 1105

[State 3054, 1]
type = DestroySelf
trigger1 = time >=7

;========================<VENOM WEB>=============================
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 3100, 1]
type = PlaySnd
trigger1 = AnimElem = 1;3
value = 3100,0+random%3
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3100, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1

[State 3100, 1]
type = PlayerPush
trigger1 = AnimElem = 3, >=0
value = 0

[State 3100,1]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 3100, ]
type = VelSet
trigger1 = AnimElem = 3
x = ((-1*Facing)*Pos X)/15
y = (Pos Y-40)/15

[State 3100, VelAdd]
type = VelAdd
trigger1 = AnimElem = 3
x = 3.82
y = -3.82

[State 3100, 1]
type = ChangeState
trigger1 = time = 25
value = 3101

;Venom Web Air
[Statedef 3101]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
;juggle = 4
sprpriority = 2
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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3101, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3101, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3101, 1]
type = PlayerPush
trigger1 = 1
value = 0

[State 3101, 1]
type = VarSet
trigger1 = !time
v =  41
value = 0

[State 3101, 1]
type = VarSet
trigger1 = NumHelper(3105)
trigger1 = helper(3105), movehit
v =  41
value = 1

[State 3101, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3101, 1]
type = Helper
trigger1 = AnimElem = 3
helpertype = normal
name = "Web"
ID = 3105
pos = 0,-83*const(size.yscale)
postype = p1
ownpal = 1
stateno = 3105
persistent = 0
size.xscale = const(size.xscale)

[State 3101, 1]
type = PlaySnd
triggerall = prevstateno !=3110
trigger1 = time= 0 ;AnimElem = 1
value = 3100,0+random%3
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3101,Venom Web]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3101,0+random%2
volumescale = 255
channel = 0
persistent = 0

[State 3101, 1]
type = ChangeState
trigger1 = time >=60 && Var(41) = 0
value = 1613;50
;anim = 460

[State 3101, 1]
type = ChangeState
trigger1 = time >=60 && Var(41) = 1
value = 3102

;Attack
[Statedef 3102]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3102

[State 3102, NotHitBy]
type = NotHitBy
trigger1 = anim = 3102
value = SCA
time = 1

[State 3102, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3102, 1]
type = Turn
trigger1 = P2Dist X < 0 && !time

[State 3102, 1]
type = PlayerPush
trigger1 = 1
value = 0

[State 3102, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1
;persistent = 1

[State 3102, ]
type = VelSet
trigger1 = time = 1
x = (P2Dist X - 50)/8
y = (P2Dist Y)/8

[State 3102, 1]
type = ChangeState
trigger1 = time = 9
value = 3103

;Attack
[Statedef 3103]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3103

[State 3103, NotHitBy]
type = NotHitBy
trigger1 = anim = 3103
value = SCA
time = 1

[State 3103, 1]
type = Helper
trigger1 = AnimElem = 11
helpertype = normal
name = "Venom Fang FX"
ID = 3107
pos = 0,0
postype = p1
ownpal = 1
stateno = 3107
size.xscale = const(size.xscale)

[State 3103, 1]
type = ScreenBound
trigger1 = AnimElemtime(12) < 0
value = 1
movecamera = 0,0

[State 3103, ]
type = VelSet
trigger1 = AnimElem = 11
x = 6
y = -4

[State 3103, 1]
type = VelAdd
trigger1 = Animelemtime(11) >= 0
y = .61

[State 3103, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3102,0+random%4
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3103,Die]
type = PlaySnd
trigger1 = AnimElem = 13
value = 3103,0+random%3
volumescale = 255
channel = 0
persistent = 0

[State 3103, 4]
type = HitDef
trigger1 = AnimElem = 4
animtype = Back
attr = A, HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 4,4
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -5,-10
air.Velocity = -5, -10
air.hittime = 25
yaccel = 0.53
p2stateno = 3109
kill = 0
air.fall = 1
fall.recover = 0
id = 1+4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3103, 4]
type = HitDef
trigger1 = AnimElem = 2
animtype = Back
attr = A, HA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 4,4
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -5,-10
air.Velocity = -5, -10
air.hittime = 25
yaccel = 0.53
p2stateno = 3110
kill = 0
air.fall = 1
fall.recover = 0
id = 1+4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3103, 4]
type = HitDef
trigger1 = AnimElem = 6
animtype = Back
attr = A, HA
animtype = up
air.animtype = up
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = 1,-11
air.Velocity = 1, -11
air.hittime = 45
kill = 0
yaccel = 0.77
id = 1+4
air.fall = 1
fall.recover = 9
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3103, 4]
type = HitDef
trigger1 = AnimElem = 11,0
animtype = Diagup
air.animtype = Diagup
attr = A, HA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 5,8
guard.pausetime = 5,8
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 12
ground.hittime = 14
air.hittime = 17
yaccel = .98
ground.velocity = 3.8,2
guard.velocity = -10
air.velocity = 3.8,4
ground.cornerpush.veloff = 0
airguard.velocity = -10.5,3
fall.xvelocity = 0
fall.yvelocity = -2
fall = 1
fall.recover = 0
id = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3103, 4]
type = HitDef
trigger1 = AnimElem = 12,1
animtype = Diagup
air.animtype = Diagup
attr = A, HA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 5,8
guard.pausetime = 5,8
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 12
ground.hittime = 14
air.hittime = 17
yaccel = .98
ground.velocity = 3.8,2
guard.velocity = -10
air.velocity = 3.8,7
ground.cornerpush.veloff = 0
airguard.velocity = -10.5,3
fall.xvelocity = 0
fall.yvelocity = -2
fall = 1
fall.recover = 0
id = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3103, 4]
type = HitDef
trigger1 = AnimElem = 13
animtype = Back
attr = A, HA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 5,6
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -28,-13
air.Velocity = -28, -13
air.hittime = 8
yaccel = 0.83
fall.envshake.time = 10
fall= 1
fall.recover = 0
id = 4+64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3103, 1]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
value = 1009

;Web
[Statedef 3105]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 4
;sprpriority = -2
anim = 3016

[State 3105, 1]
type = Helper
trigger1 = !NumHelper(898) && enemy, stateno = 3108
helpertype = normal
name = "Coccoon"
ID = 898
pos = 0,0
postype = p2
ownpal = 1
stateno = 898

[State 3105, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3105, 1]
type = PlaySnd
trigger1 = !time
value = 20,1

[State 3105, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
scale = const(size.xscale),1

[State 3105, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
scale = const(size.xscale),1

[State 3105, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
scale = const(size.xscale),1

[State 3105, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
vfacing = -1
scale = const(size.xscale),1

[State 3105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3105, 2]
type = HitDef
trigger1 = AnimElem = 2
attr = S, HA
animtype = Up
damage  = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
envshake.time = 3
p2stateno = 3108
kill = 0
id = 4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3105, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3105, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3105, Counter FX]
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

[State 3105, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3105, 1]
type = ChangeState
trigger1 = time >= 20 && !movehit
trigger2 = parent, stateno = 3103 && parent, AnimElemtime(22) > 0
value = 3106

[State 3105, 1]
type = RemoveExplod
trigger1 = root, stateno !=[3101,3103]
ID = 3014

[State 3105, 1]
type = DestroySelf
trigger1 = root, stateno !=[3101,3103]

;Player 2
[Statedef 3106]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1
sprpriority = 4

[State 3106, 1]
type = RemoveExplod
trigger1 = !time
ID = 3014

[State 3106, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
scale = const(size.xscale),1

[State 3106, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
scale = const(size.xscale),1

[State 3106, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
scale = const(size.xscale),1

[State 3106, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
vfacing = -1
scale = const(size.xscale),1

[State 3106, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3106, Fade In]
type = PalFX
trigger1 = 1
mul = 255-((StateTime)*10),255-((StateTime)*10),255-((StateTime)*10)
time = 5

[State 3106, 1]
type = DestroySelf
trigger1 = time = 20

;Venom Fang FX
[Statedef 3107]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1016
sprpriority = 4

[State 3107, 1]
type = ChangeAnim
triggerall = anim !=1016
trigger1 = parent, anim = 3103
trigger1 = parent, AnimElem = 22
value = 1016

[State 3107, 1]
type = ChangeAnim
triggerall = anim !=1017
trigger1 = parent, anim = 3103
trigger1 = parent, AnimElem = 23
value = 1017

[State 3107, 1]
type = ChangeAnim
triggerall = anim !=1018
trigger1 = parent, anim = 3103
trigger1 = parent, AnimElem = 24
value = 1018

[State 3107, 1]
type = BindToParent
trigger1 = 1
time = 1
facing = 0
pos = 0,0

[State 3107, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3107, 1]
type = DestroySelf
trigger1 = parent, stateno !=3103

;Player 2
[Statedef 3108]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1;2

[State 3108, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3018

[State 3108, 1]
type = AssertSpecial
trigger1 = time > 4
flag = invisible

[State 3108, ]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3108, ]
type = SelfState
trigger1 = time = 85
value = 5050

;Stuck in Combo
[Statedef 3109]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 3109, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3019

[State 3109, 2]
type = HitFallSet
trigger1 = Time = 0
value = 0

[State 3109, 3]
type = SelfState
trigger1 = time >= 40
value = 5000

;Stuck in Combo
[Statedef 3110]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 3110, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3020

[State 3110, 2]
type = HitFallSet
trigger1 = Time = 0
value = 0

[State 3110, 3]
type = SelfState
trigger1 = time >= 40
value = 5000

;========================<MAX VENOM WEB>=============================
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 3150, 1]
type = PlaySnd
trigger1 = AnimElem = 1;3
value = 3100,0+random%3
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3150, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1

[State 3150, 1]
type = PlayerPush
trigger1 = AnimElem = 3, >=0
value = 0

[State 3150,1]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 3150, ]
type = VelSet
trigger1 = AnimElem = 3
x = ((-1*Facing)*Pos X)/15
y = (Pos Y-40)/15

[State 3150, VelAdd]
type = VelAdd
trigger1 = AnimElem = 3
x = 3.82
y = -3.82

[State 3150, 1]
type = ChangeState
trigger1 = time = 25
value = 3151

;Venom Web Air
[Statedef 3151]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
;juggle = 4
sprpriority = 2
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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3151, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3151, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3151, 1]
type = PlayerPush
trigger1 = 1
value = 0

[State 3151, 1]
type = VarSet
trigger1 = !time
v =  41
value = 0

[State 3151, 1]
type = VarSet
trigger1 = NumHelper(3155)
trigger1 = helper(3155), movehit
v =  41
value = 1

[State 3151, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3151, 1]
type = Helper
trigger1 = AnimElem = 3
helpertype = normal
name = "Web"
ID = 3155
pos = 0,-83*const(size.yscale)
postype = p1
ownpal = 1
stateno = 3155
persistent = 0
size.xscale = const(size.xscale)

[State 3151, 1]
type = PlaySnd
triggerall = prevstateno !=3110
trigger1 = time= 0 ;AnimElem = 1
value = 3100,0+random%3
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3151,Venom Web]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3101,0+random%2
volumescale = 255
channel = 0
persistent = 0

[State 3151, 1]
type = ChangeState
trigger1 = time >=60 && Var(41) = 0
value = 1613;50
;anim = 460

[State 3151, 1]
type = ChangeState
trigger1 = time >=60 && Var(41) = 1
value = 3152

;Attack
[Statedef 3152]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3102

[State 3152, NotHitBy]
type = NotHitBy
trigger1 = anim = 3102
value = SCA
time = 1

[State 3152, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3152, 1]
type = Turn
trigger1 = P2Dist X < 0 && !time

[State 3152, 1]
type = PlayerPush
trigger1 = 1
value = 0

[State 3152, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1
;persistent = 1

[State 3152, ]
type = VelSet
trigger1 = time = 1
x = (P2Dist X - 50)/8
y = (P2Dist Y)/8

[State 3152, 1]
type = ChangeState
trigger1 = time = 9
value = 3153

;Attack
[Statedef 3153]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3153

[State 3153, NotHitBy]
type = NotHitBy
trigger1 = anim = 3153
value = SCA
time = 1

[State 3153, 1]
type = Helper
trigger1 = AnimElem = 22
helpertype = normal
name = "Venom Fang FX"
ID = 3157
pos = 0,0
postype = p1
ownpal = 1
stateno = 3157
size.xscale = const(size.xscale)

[State 3153, 1]
type = ScreenBound
trigger1 = AnimElemtime(23) < 0
value = 1
movecamera = 0,0

[State 3153, ]
type = VelSet
trigger1 = AnimElem = 22
x = 6
y = -4

[State 3153, 1]
type = VelAdd
trigger1 = Animelemtime(22) >= 0
y = .61

[State 3153, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3102,0+random%4
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3153,Die]
type = PlaySnd
trigger1 = AnimElem = 24
value = 3103,0+random%3
volumescale = 255
channel = 0
persistent = 0

[State 3153, 4]
type = HitDef
trigger1 = AnimElem = 2 || AnimElem = 6
trigger2 = AnimElem = 10 ||AnimElem = 15
animtype = Back
attr = A, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 4,4
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -5,-10
air.Velocity = -5, -10
air.hittime = 25
yaccel = 0.53
p2stateno = 3109
kill = 0
air.fall = 1
fall.recover = 0
id = 1+4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3153, 4]
type = HitDef
trigger1 = AnimElem = 4 || AnimElem = 8
trigger2 = AnimElem = 13
animtype = Back
attr = A, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 4,4
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -5,-10
air.Velocity = -5, -10
air.hittime = 25
yaccel = 0.53
p2stateno = 3110
kill = 0
air.fall = 1
fall.recover = 0
id = 1+4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3153, 4]
type = HitDef
trigger1 = AnimElem = 17
animtype = Back
attr = A, HA
animtype = up
air.animtype = up
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = 1,-11
air.Velocity = 1, -11
air.hittime = 45
kill = 0
yaccel = 0.77
id = 1+4
air.fall = 1
fall.recover = 9
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3153, 4]
type = HitDef
trigger1 = AnimElem = 22,0
animtype = Diagup
air.animtype = Diagup
attr = A, HA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 5,8
guard.pausetime = 5,8
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 12
ground.hittime = 14
air.hittime = 17
yaccel = .98
ground.velocity = 3.8,2
guard.velocity = -10
air.velocity = 3.8,4
ground.cornerpush.veloff = 0
airguard.velocity = -10.5,3
fall.xvelocity = 0
fall.yvelocity = -2
fall = 1
fall.recover = 0
id = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3153, 4]
type = HitDef
trigger1 = AnimElem = 23,1
animtype = Diagup
air.animtype = Diagup
attr = A, HA
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 5,8
guard.pausetime = 5,8
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 12
ground.hittime = 14
air.hittime = 17
yaccel = .98
ground.velocity = 3.8,2
guard.velocity = -10
air.velocity = 3.8,7
ground.cornerpush.veloff = 0
airguard.velocity = -10.5,3
fall.xvelocity = 0
fall.yvelocity = -2
fall = 1
fall.recover = 0
id = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3153, 4]
type = HitDef
trigger1 = AnimElem = 24
animtype = Back
attr = A, HA
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 5,6
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -62
ground.type = High
air.type = Low
ground.slidetime = 12
ground.hittime  = 25
ground.Velocity = -28,-13
air.Velocity = -28, -13
air.hittime = 8
yaccel = 0.83
fall.envshake.time = 10
fall= 1
fall.recover = 0
id = 4+64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3153, 1]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
value = 1009

;Web
[Statedef 3155]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 4
;sprpriority = -2
anim = 3016

[State 3155, 1]
type = Helper
trigger1 = !NumHelper(898) && enemy, stateno = 3108
helpertype = normal
name = "Coccoon"
ID = 898
pos = 0,0
postype = p2
ownpal = 1
stateno = 898

[State 3155, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3155, 1]
type = PlaySnd
trigger1 = !time
value = 20,1

[State 3155, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
scale = const(size.xscale),1

[State 3155, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
scale = const(size.xscale),1

[State 3155, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
scale = const(size.xscale),1

[State 3155, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 3014
pos = 0,0
postype = p1
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
vfacing = -1
scale = const(size.xscale),1

[State 3155, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3155, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3155, 2]
type = HitDef
trigger1 = AnimElem = 2
attr = S, HA
animtype = Up
damage  = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.velocity = -6
airguard.velocity = -10.5,3
air.hittime  = 25
ground.velocity = -7
down.velocity = -7
air.velocity = -2
yaccel = 0.53
sprpriority = 4
fall = 1
fall.recover = 0
envshake.time = 3
p2stateno = 3108
kill = 0
id = 4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3155, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3155, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3155, Counter FX]
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

[State 3155, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3155, 1]
type = ChangeState
trigger1 = time >= 20 && !movehit
trigger2 = parent, stateno = 3153 && parent, AnimElemtime(22) > 0
value = 3156

[State 3155, 1]
type = RemoveExplod
trigger1 = root, stateno !=[3151,3153]
ID = 3014

[State 3155, 1]
type = DestroySelf
trigger1 = root, stateno !=[3151,3153]

;Player 2
[Statedef 3156]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1
sprpriority = 4

[State 3156, 1]
type = RemoveExplod
trigger1 = !time
ID = 3014

[State 3156, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
scale = const(size.xscale),1

[State 3156, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
scale = const(size.xscale),1

[State 3156, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
scale = const(size.xscale),1

[State 3156, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3015
pos = 0,0
postype = p1
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
vfacing = -1
scale = const(size.xscale),1

[State 3156, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3156, Fade In]
type = PalFX
trigger1 = 1
mul = 255-((StateTime)*10),255-((StateTime)*10),255-((StateTime)*10)
time = 5

[State 3156, 1]
type = DestroySelf
trigger1 = time = 20

;Venom Fang FX
[Statedef 3157]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1016
sprpriority = 4

[State 3157, 1]
type = ChangeAnim
triggerall = anim !=1016
trigger1 = parent, anim = 3103
trigger1 = parent, AnimElem = 22
value = 1016

[State 3157, 1]
type = ChangeAnim
triggerall = anim !=1017
trigger1 = parent, anim = 3103
trigger1 = parent, AnimElem = 23
value = 1017

[State 3157, 1]
type = ChangeAnim
triggerall = anim !=1018
trigger1 = parent, anim = 3103
trigger1 = parent, AnimElem = 24
value = 1018

[State 3157, 1]
type = BindToParent
trigger1 = 1
time = 1
facing = 0
pos = 0,0

[State 3157, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3157, 1]
type = DestroySelf
trigger1 = parent, stateno !=3153

;========================<VENOM BASH>=============================
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
trigger1 = AnimElemTime(1) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-70 * const(size.yScale))
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

[State 3200, Your Not so Tough!]
type = PlaySnd
trigger1 = time = 0
value = 3200,0+random%2
volume = 255
volumescale = 255
channel = 0
persistent = 0

[State 3200, 1]
type = ChangeState
trigger1 = animtime = 0
value = 3201

;Venom Fanged!!!!!
[Statedef 3201]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 3201

[State 3201, Dust Helper]
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

[State 3201, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 3202

;Attacking
[Statedef 3202]
type = A
movetype = A
physics = N
velset = 5, -6;3.5, -6
ctrl = 0
anim = 3202
;juggle = 4

[State 3202, 1]
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

[State 3202, 1]
type = PosAdd
trigger1 = !time
x = 25

[State 3202, 1]
type = VelAdd
trigger1 = 1
y = .77

[State 3202, 1]
type = PlaySnd
trigger1 = time = 0
value = 3201,0+random%2
volume = 255
volumescale = 255
channel = 0

[State 3202, Hitdef]
type = HitDef
trigger1 = time = 0
attr = S,HA
hitflag = MAFD
guardflag = MA
priority = 1, Miss
animtype = Heavy
air.animtype = heavy
;animtype = Diagup
;air.animtype = Diagup
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = 0,0
givePower = 36, 36
guard.pausetime = 5,5
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
ground.slidetime = 12
ground.hittime = 14
air.hittime = 17
yaccel = .98
;ground.velocity = -5,0
;air.velocity = -5,0
ground.velocity = -3,0
air.velocity = -3,0
guard.velocity = -5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.velocity = -5,0
;fall.xvelocity = 0
;fall.yvelocity = -1
;air.fall = 1
;fall = 1
;fall.recover = 0
p2stateno = 3208
p2facing = 1

[State 3202, 1]
type = Changestate
trigger1 = Vel y > 0 && Pos Y >=0
value = 3203

;Decider
[Statedef 3203]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1008

[State 3203, 1]
type = ScreenBound
trigger1 = prevstateno = 3013
value = 0

[State 3203, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 20,5
volume = 150
volumescale = 150

[State 3203, 1]
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

[State 3203, ]
type = PosSet
trigger1 = !time
y = 0

[State 3203, 1]
type = ChangeState
trigger1 = p2stateno = 3208
;trigger2 = roundstate !=3
value = 3204
ctrl = 1

[State 3203, 1]
type = ChangeState
trigger1 = animtime = 0
;trigger2 = roundstate >=3
value = 11
ctrl = 1

;P2 Fang Hits
[Statedef 3208]
type = U
movetype = H
physics = N
sprpriority = 0

[State 3208, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3205

[State 3208, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 3208, Dead]
type = SelfState
trigger1 = time
trigger1 = !Alive
value = 5150

[State 3208, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 3208, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 3208, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3208, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 3208, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 3208, 14] ;Friction
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 3208, 5]
type = ChangeState
trigger1 = animtime = 0
value = 0;3206

;Venom Slam
[Statedef 3204]
type = S
movetype = A
physics = S
anim = 3208;800
sprpriority = 1
velset = 0,0
ctrl = 0

[State 3204, HitDef]
type = HitDef
trigger1 = 1
attr = C, NT
;attr = S, NT
getpower = 0,0
givepower = 0,0
guardflag =
hitflag = MAFD+
;hitflag = M+
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
fall.xvelocity = 0
fall.yvelocity = -2
fall = 1
fall.recover = 0
p1stateno = 3205
p2stateno = 3206
p1facing = 1
p2facing = 1
numhits = 0
id = 4
kill = 0

[State 3204, 1]
type = ChangeState
trigger1 = animtime = 0
value = 1100;250

;P1 Let The Slaughter Begin!
[Statedef 3205]
type = S
movetype = A
physics = N
anim = 3204
poweradd = 0
sprpriority = 2

[State 3205,Let the Slaughter begin!]
type = PlaySnd
trigger1 = time = 0
value = 3203,0+random%5
volume = 255
volumescale = 255
channel = 0

[State 3205, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 5
value = 820,2
volume = 155
volumescale = 155

[State 3205, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 102, 0;102*const(size.xscale), 0*const(size.yscale)
;pos = 60,-40+60
time = 16

[State 3205, Bind 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 102*const(size.xscale), -145*const(size.yscale)
time = 16

[State 3205, EnvShake]
type = EnvShake
trigger1 = animelem= 5
time = 15
freq = 70
ampl = -4

[State 3205, 1]
type = Turn
trigger1 = AnimElem = 4

[State 3205, Impact Dust]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 100,0
facing = -1
ownPal = 1

[State 3205, Bind 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = 0, -130*const(size.yscale)
time = 6

[State 3205, Bind 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 127*const(size.xscale), -6*const(size.yscale)
time = 6

[State 3205, Width 2-11]
type = Width
trigger1 = AnimElemTime(5) < 0
edge = 110,110

[State 3205, 1]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = -120
kill = 0

[State 3205, 1]
type = TargetState
trigger1 = AnimElem = 6
value = 3207

[State 3205, State End]
type = ChangeState
trigger1 = Animtime = 0
value = 3210
ctrl = 1

;P2 Grabbed
[Statedef 3206]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = 1

[State 3206, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3206

[State 3206, ]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3206, 1]
type = SelfState
trigger1 =  enemy, stateno !=3205
value = 5000
ctrl = 1

;P2 Throw (hit by, into air)
[Statedef 3207]
type = A
movetype = H ;Get hit
physics = N
ctrl = 0

[State 3207, 2] ;Gravity
type = VelAdd
trigger1 = Time = 5
x = -1
y = -18

[State 3207, Turn]
type = Turn
trigger1 = time = 1

[State 3207, 1]
type = PosSet
trigger1 = time = 4
y = 0

[State 3207, 0]
type = GameMakeAnim
trigger1 = time = 0
pos = -5,0
value = 62

[State 3207, 1]
type = ChangeAnim2
trigger1 = Time = 4
value = 5063

[State 3207, 2] ;Gravity
type = VelAdd
trigger1 = Time > 5
y = .73

[State 3207, 5] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5110 ;Hit ground

;Were Are not Finished With You!
[Statedef 3210]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1510
;juggle = 4
sprpriority = 2

[State 3210, 1]
type = Width
trigger1 = Animelem = 5
player = 100,0

[State 3210, 1]
type = Helper
trigger1 = AnimElem = 5
helpertype = normal
name = "Webbing"
ID = 3250;1036
pos = 112*const(size.xscale),-146*const(size.yscale)
postype = p1
ownpal = 1
stateno = 3250
persistent = 0
size.xscale = const(size.xscale)

[State 3210, 3]
type = Projectile
trigger1 = Numhelper(3250)
trigger1 = helper(3250), movehit
trigger1 = helper(3250), Animelemtime(10)< 0
getPower = 0,0
givePower = 36, 36
postype  = p2
projAnim = 1543
sparkno = -1
offset = 0,-30
projhitanim = -1
projremovetime = 5
attr = S, SP
animtype = Medium
guardflag = MA
;p1stateno = 3015
p2stateno = 3254
p2facing = 1
numhits = 0
kill = 0
id = 4

[State 3210, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 20,0
persistent = 0

[State 3210, 1]
type = ChangeState
trigger1 = time >=25
trigger1 = !Numhelper(3250)
trigger2 = time >= 50
value = 3211;1033

;Jumping At P2
[Statedef 3211]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 3210
sprpriority = 2

[State 3211, NotHitBy];to prevent p2 stuck in state tag battle or projectile
type = NotHitBy
trigger1 = anim = 3210
value = SCA
time = 1

[State 3211,PlaySnd]
type = PlaySnd
trigger1 = Time = 45
value = S41,0

[State 3211, StateTypeSet]
type = StateTypeSet
trigger1 = time > 45
trigger1 = time < 108
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A         ;A,C,S,N

[State 3211, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 2;10
y = -19;-13

[State 3211, HitDef]
type = HitDef
;trigger1 = time = 0
trigger1 = animelem =6 ;|| animelem =7
attr = A,NA
hitflag = MAFD
guardflag = HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = 0,0
givePower = 36, 36
;damage = 100,0
pausetime = 8,7
guard.pausetime = 8,7
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
ground.type = High
ground.slidetime = 12
ground.hittime = 26
air.hittime = 12
yaccel = .82
;ground.velocity = -1,0
;air.velocity = -1,12
ground.velocity = -1,20
air.velocity = -1,20
ground.cornerpush.veloff = 0
airguard.velocity = -6,-2
fall.xvelocity = 0
fall.yvelocity = -2
air.fall = 1
fall.recover = 0
fall.envshake.time = 10
;p2stateno = 5111
kill = 0

[State 3211, HitDef]
type = HitDef
;trigger1 = time = 0
trigger1 =  animelem =7
attr = A,NA
hitflag = MAFD
guardflag = HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = 0,0
givePower = 36, 36
;damage = 100,0
pausetime = 8,7
guard.pausetime = 8,7
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
ground.type = High
ground.slidetime = 12
ground.hittime = 26
air.hittime = 12
yaccel = .82
;ground.velocity = -1,0
;air.velocity = -1,12
ground.velocity = -1,20
air.velocity = -1,20
ground.cornerpush.veloff = 0
airguard.velocity = -6,-2
fall.xvelocity = 0
fall.yvelocity = -2
air.fall = 1
fall.recover = 0
fall.envshake.time = 10
p2stateno = 5111

[State 3211, StateTypeSet]
type = StateTypeSet
trigger1 = time > 108
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N       ;A,C,S,N

[State 3211, 2]
type = Gravity
trigger1 = time > 108

[State 3211, 3]
type = ChangeState
trigger1 = Vel y > 0 && Pos Y >=0
;trigger1 = Vel Y > 0 && Pos Y >= 10
value = 3212

;We are the Strongest!!!!!
[Statedef 3212]
type = S
movetype = A
physics = S
anim = 3212
sprpriority = 2

[State 3212, VelSet]
type = VelSet
trigger1 = time = 0
y = 0

[State 3212, 1]
type = PosSet
trigger1 = !time
y = 0

[State 3212, Hitdef]
Type = HitDef
TriggerAll = P2StateType = L
Trigger1 = time = 0
Attr = A, SA
damage = ceil(ifElse(fvar(11) * 75 < 7, 7, fvar(11) * 75)), 7
getPower = 0,0
givePower = 36, 36
AnimType = Hard
Ground.Type = High
Air.Type = High
GuardFlag = HA
HitFlag = FD
Priority = 4, Hit
PauseTime = 0, 10
sparkno = S8002
guard.sparkno = S8050
sparkxy = -15,-5
hitsound = -1
guardsound = -1
Ground.SlideTime = 10
Guard.SlideTime = 10
Ground.HitTime = 10
Guard.HitTime = 10
Air.HitTime = 10
Ground.Velocity = 0, 0
Air.Velocity = 0,0
;GetPower = 30, 5
GivePower = 20, 0
Fall = 1
Fall.Recover = 0
P2StateNo = 5111
;ID = 5111

[State 3212, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Web Shoot
[Statedef 3250]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 1
anim = 1514

[State 3250, 1]
type = BindToParent
trigger1 = Animelemtime(10) < 0
time = 1
pos = (112+((Animelemno(0)-1)*12))*const(size.xscale),-166-((Animelemno(0)-1)*10)

[State 3250, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3250, 2]
type = VelSet
trigger1 = AnimElemtime(10)>=0
x = 6
y = -5

[State 3250, 1]
type = Helper
trigger1 = AnimElem = 9, < 2
trigger1 = movehit = 1
helpertype = normal
name = "Web"
ID = 3256
pos = 0,-83*const(size.yscale)
postype = p2
ownpal = 1
stateno = 3256
persistent = 0
size.xscale = const(size.xscale)

[State 3250, Hitdef]
type = HitDef
trigger1 = AnimElem = 9, < 2
attr = S, HA
animtype  = Hard
damage = 0,0
getPower = 0,0
givePower = 36, 36
;damage    = 15,4
guardflag = MA
hitflag = MAF
pausetime = 0,5
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
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
envshake.time = 3
kill = 0
p2stateno = 3254

[State 3250, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3250, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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

[State 3250, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3250, 1]
type = HitOverride
trigger1 = Time >= 0
slot = 1
time = 1
stateno = 3251
attr = SCA, NP, SP, HP
ignorehitpause = 1

[State 3250, 1]
type = HitBy
trigger1 = Time >= 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 3250, 1]
type = ChangeState
trigger1 = movehit && Animelemtime(10) >= 0
value = 3251

[State 3250, 1]
type = DestroySelf
trigger1 = Screenpos Y <= -200
trigger2 = movehit && Animelemtime(10) <0

;Web Remove Explod
[Statedef 3251]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1515
sprpriority = 3

[State 3251, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3251, 1]
type = DestroySelf
trigger1 = Animtime = 0

;P2 on WEb
[Statedef 3254]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 2

[State 3254, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3018

[State 3254, 1]
type = AssertSpecial
trigger1 = time > 4
flag = invisible

[State 3254, ]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3254, ]
type = SelfState
trigger1 = time = 200;85
value = 5050

;Web
[Statedef 3256]
type = A
movetype = A
physics = N
velset = 0,0
sprpriority = 4
anim = 1;3016

[State 3256, 1]
type = Helper
trigger1 = !NumHelper(3270) && enemy, stateno = 3254
helpertype = normal
name = "Coccoon"
ID = 3270
pos = 0,0
postype = p2
ownpal = 1
stateno = 3270

[State 3256, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3256, 1]
type = PlaySnd
trigger1 = !time
value = 20,1

[State 3256, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 30142
pos = 0,0
postype = p2
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
scale = const(size.xscale),1

[State 3256, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 30142
pos = 0,0
postype = p2
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
scale = const(size.xscale),1

[State 3256, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 30142
pos = 0,0
postype = p2
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
scale = const(size.xscale),1

[State 3256, 1]
type = Explod
trigger1 = !time
anim = 3014
ID = 30142
pos = 0,0
postype = p2
bindtime = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
vfacing = -1
scale = const(size.xscale),1

[State 3256, 1]
type = NotHitBy
trigger1 = Time >= 0
time = 1
value = SCA, NA, SA, HA, NT, ST, HT
ignorehitpause = 1

[State 3256, 1]
type = ChangeState
trigger1 = time >= 100 && !movehit
;trigger2 = parent, stateno = 3211 && parent, AnimElemtime(28) > 0
value = 3257

[State 3256, 1]
type = RemoveExplod
trigger1 = root, stateno !=[3210,3211]
ID = 30142

[State 3256, 1]
type = DestroySelf
trigger1 = root, stateno !=[3210,3211]

;Player 2
[Statedef 3257]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1
sprpriority = 4

[State 3257, 1]
type = RemoveExplod
trigger1 = !time
ID = 30142

[State 3257, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3256;3015
pos = 0,0
postype = p2
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
scale = const(size.xscale),1

[State 3257, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3256;3015
pos = 0,0
postype = p2
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
scale = const(size.xscale),1

[State 3257, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3256;3015
pos = 0,0
postype = p2
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
vfacing = -1
scale = const(size.xscale),1

[State 3257, 1]
type = Explod
trigger1 = !time
anim = 3015
ID = 3256;3015
pos = 0,0
postype = p2
bindtime = 1
removeongethit = 1
ignorehitpause = 1
sprpriority = -1
;persistent = 1
facing = -1
vfacing = -1
scale = const(size.xscale),1

[State 3257, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3257, Fade In]
type = PalFX
trigger1 = 1
mul = 255-((StateTime)*10),255-((StateTime)*10),255-((StateTime)*10)
time = 5

[State 3257, 1]
type = DestroySelf
trigger1 = time = 20

;Web Coccoon (SMALL)
[Statedef 3270]
type = A
movetype = I
physics = N
velset = 0,0
anim = 898
sprpriority = 4

[State 3270, 1]
type = BindToTarget
trigger1 = 1
time = 1
facing = 0
pos = 0,0

[State 3270, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3270, 1]
type = ChangeState
trigger1 = enemynear, stateno != 805 && enemynear, stateno !=3254
value = 3271

;Web Coccoon (SMALL)
[Statedef 3271]
type = A
movetype = I
physics = N
velset = 0,0
anim = 899
sprpriority = 4

[State 3271, 2]
type = PlaySnd
trigger1 = !time
value = 20,3

[State 3271, 2]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 3271, ]
type = DestroySelf
trigger1 = Animtime = 0

;Custom P2 State
[Statedef 5111]
type = L
movetype = H
physics = N

[State 5111, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5111, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5111, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5111, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5111, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5111, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5111, Var] ;Get fall velocity
type = varset
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5111, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))
abspan = Ceil(Pos x * (600 / (gamewidth * 0.90625 / 2))) * facing
channel = 1

[State 5111, 7]
type = Explod
trigger1 = Time = 0
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)
bindtime = 1
facing = facing
pos = facing * 0 * Const(Size.xscale), 0 * Const(Size.yscale)
scale = 1.0 * Const(Size.xscale), 1.0 * Const(Size.yscale)

[State 5111, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5111, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5111, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5111, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5111, 12]
type = varset
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5111, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5111, 14] ;Friction
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5111, 15]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5111, 16]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

[State 5111, End]
type = SelfState
triggerall = time && anim = 5110
triggerall = animelem = 1,>=1
trigger1 = time > 50 ;100
value = 5120

[State 5111, Safe]
type = SelfState
trigger1 = !SelfAnimExist(5110)
trigger1 = !time
trigger2 = time > 240
value = 5120

[State 5111, Dead]
type = SelfState
trigger1 = time
trigger1 = !Alive
value = 5150

;========================<TENDRILS BARRAGE>=============================
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(40 * const(size.xScale)), ceil(-75 * const(size.yScale))
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

[State 3300,Tendrils Snd]
type = PlaySnd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
value = 20,5
volume = 0

[State 3300,Venom Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3103,0+random%2
channel = 0

[State 3300, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(2)>=0
value = 0

[State 3300, HitDef]
type = HitDef
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
attr = S, HA
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
hitflag = MAF
guardflag = MA
pausetime = 3,2;0,11
getpower = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 197), var(36) := -67
animtype = hard;Up
ground.type = High
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x<120 , -6.4 , 0),-4
guard.velocity = -6;,-1
air.type = low
air.velocity = ifelse(p2bodydist x<120 , -6.4 , 0) ,-1
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
p2facing = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Hit]
type = hitdef
trigger1 = animelem = 8
attr = S,HA
damage = ceil(ifElse(fvar(11) * 85 < 7, 7, fvar(11) * 85)), 7
animtype = Diagup
fall.animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4,Hit
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 197), var(36) := -69
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -17,-4.5
ground.cornerpush.veloff = -15
guard.velocity = -5
air.type=Low
air.velocity = -17,-4.5
getpower = 0,0
givepower = 36,36
forcestand = 1
envshake.time = 18
envshake.freq = 160
envshake.ampl = 12
fall = 1
fall.recover = 0
yaccel = .5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300]
type = statetypeset
trigger1 = animelemtime(9)>=0
movetype = I

[State 3300, End]
type = changestate
trigger1 = !animtime
value = ifelse((backedgebodydist<0 || frontedgebodydist<0),1548,0)
ctrl = 1

;========================<MAX TENDRILS BARRAGE>=============================
[StateDef 3350]
type = S
physics = S
moveType = A
anim = 3350
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(40 * const(size.xScale)), ceil(-75 * const(size.yScale))
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

[State 3350,Tendrils Snd]
type = PlaySnd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
value = 20,5
volume = 0

[State 3350,Venom Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3103,0+random%2
channel = 0

[State 3350, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(2)>=0
value = 0

[State 3350, HitDef]
type = HitDef
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12
attr = S, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
hitflag = MAF
guardflag = MA
pausetime = 3,2;0,11
getpower = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 197), var(36) := -67
animtype = hard;Up
ground.type = High
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x<120 , -6.4 , 0),-4
guard.velocity = -6;,-1
air.type = low
air.velocity = ifelse(p2bodydist x<120 , -6.4 , 0) ,-1
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
p2facing = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S,HA
damage = ceil(ifElse(fvar(11) * 85 < 7, 7, fvar(11) * 85)), 7
animtype = Diagup
fall.animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4,Hit
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 197), var(36) := -69
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -17,-4.5
ground.cornerpush.veloff = -15
guard.velocity = -5
air.type=Low
air.velocity = -17,-4.5
getpower = 0,0
givepower = 36,36
forcestand = 1
envshake.time = 18
envshake.freq = 160
envshake.ampl = 12
fall = 1
fall.recover = 0
yaccel = .5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350]
type = statetypeset
trigger1 = animelemtime(14)>=0
movetype = I

[State 3350, End]
type = changestate
trigger1 = !animtime
value = ifelse((backedgebodydist<0 || frontedgebodydist<0),1548,0)
ctrl = 1
