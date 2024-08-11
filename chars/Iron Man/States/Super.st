; _________________________________________
;| Iron Man by varo_hades                  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<PROTON CANNON>=============================
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = AnimElem = 18
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(95 * const(size.xScale)), ceil(-94 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = AnimElem = 18
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, 1.1]
type = PlaySnd
trigger1 = AnimElem = 16
value = 3000, 0
channel = 0

[State 3000, 3.4]
type = Explod
trigger1 = AnimElem = 19
anim = 4086
id = 4086
postype = P1
pos = 95, 0
sprpriority = 5
ownpal = 1
bindtime = -1
scale = .8333,1

[State 3000, 5.1]
type = Helper
trigger1 = AnimElem = 2
name = "Proton Cannon"
id = 3010
postype = P1
pos = 33, -104
stateno = 3010
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0
size.xscale = .8333
size.yscale = 1

[State 3000, 5.2]
type = Helper
trigger1 = AnimElem = 19
name = "Beam"
id = 3015
postype = P1
pos = 70, 0
stateno = 3015
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0
size.xscale = .8333
size.yscale = 1

[State 3000, 6]
type = HitDef
trigger1 = Time = 0
attr = S, HA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
guardflag = MA
pausetime = 0,0
priority = 7, Hit
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -82
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -6,-6
guard.velocity = -6
air.velocity = -1,-5
air.hittime = 12
fall = 1
fall.recover = 0
getpower = 0
kill = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<MAX PROTON CANNON>=============================
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3050, SuperPause FX]
type = Helper
trigger1 = AnimElem = 18
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(95 * const(size.xScale)), ceil(-94 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = AnimElem = 18
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, 1.1]
type = PlaySnd
trigger1 = AnimElem = 16
value = 3000, 1
channel = 0

[State 3050, 3.4]
type = Explod
trigger1 = AnimElem = 19
anim = 4086
id = 4087
postype = P1
pos = 95, 0
sprpriority = 5
ownpal = 1
bindtime = -1
scale = .8333,1

[State 3050, 5.1]
type = Helper
trigger1 = AnimElem = 2
name = "Proton Cannon"
id = 3010
postype = P1
pos = 33, -104
stateno = 3060
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0
size.xscale = .8333
size.yscale = 1

[State 3050, 5.2]
type = Helper
trigger1 = AnimElem = 19
name = "Beam"
id = 3015
postype = P1
pos = 70, 0
stateno = 3065
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 0
size.xscale = .8333
size.yscale = 1

[State 3050, 6]
type = HitDef
trigger1 = Time = 0
attr = S, HA
hitflag = MAF
animtype = Hard
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
guardflag = MA
pausetime = 0,0
priority = 7, Hit
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -82
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -6,-6
guard.velocity = -6
air.velocity = -1,-5
air.hittime = 12
fall = 1
fall.recover = 0
getpower = 0
kill = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<NANO ASSAULT>=============================
[StateDef 3100]
type = S
physics = S
moveType = A
anim = 3150
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
trigger1 = AnimElemTime(1) < 0
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
pos = ceil(5 * const(size.xScale)), ceil(-31 * const(size.yScale))
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

[State 3100, 3]
type = PlaySnd
trigger1 = time  = 0
value = 1500,0

[State 3100, end]
type = ChangeState
trigger1 = !AnimTime
value = 3110
ctrl = 1

;Start nano
[Statedef 3110]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3160
ctrl = 0
sprpriority = 1

[State 3110, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH out
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Anti-Air Slash Dust"
posType = P1
ownPal = 1

[State 3110, vel]
type = velset
trigger1 = animelem = 3
x = 10
y = -3

[State 3110, sts]
type = statetypeset
trigger1 = animelemtime(3)>=0
statetype = S
physics = S

[State 3110, push]
type = playerpush
trigger1 = animelemtime(4)>=0 && animelemtime(18)<0 && movehit
value = 660
ignorehitpause = 1

[State 3110, 3]
type = PlaySnd
trigger1 = animelem = 3
value = 190,2

[State 3110, shit]
type = Explod
triggerall = !NumExplod(3161)
trigger1 = animelem  = 2
anim = 3161
ontop = 1
pos = 0,-20
bindtime= -1
sprpriority = 6
flag = noshadow
ownpal = 1
removeongethit = 1
scale = .7,.7

[State 3110, shit2]
type = Explod
triggerall = !NumExplod(3152)
trigger1 = animelem  = 2
anim = 3152
ontop = 1
pos = 0,-5
bindtime= -1
sprpriority = -4
flag = noshadow
ownpal = 1
removeongethit = 1

[State 3110, shits2]
type = Explod
triggerall = !NumExplod(3152)
trigger1 = animelem  = 2
anim = 3152
ontop = 1
pos = 0,-50
bindtime= -1
sprpriority = -4
flag = noshadow
ownpal = 1
removeongethit = 1

[State 3110, shit3]
type = Explod
triggerall = !NumExplod(3161)
trigger1 = animelem  = 2
anim = 3161
ontop = 1
pos = 0,-50
bindtime= -1
sprpriority = -4
flag = noshadow
ownpal = 1
removeongethit = 1

[State 3110, bootjets]
type = Explod
triggerall = !NumExplod(4100)
trigger1 = animelem = 2
anim = 4000
id = 4100
sprpriority = -1
facing = 1
bindtime = -1
removetime = 60
pos = 7,-10
flag = noshadow
ownpal = 1
removeongethit = 1
scale = .5,.9

[State 3110,helper1]
type = Helper
triggerall = !Numhelper(3105)
trigger1 = StateNo = 3110
trigger1 = animelem = 3
ID = 3105
postype = P1
pos = 0,20
helpertype = normal
name = "big_wave_1"
stateno = 3105
sprpriority = 6
facing = 1
bindtime = -1
pausemovetime = 1

[State 3110, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<MAX NANO ASSAULT>=============================
[StateDef 3150]
type = S
physics = S
moveType = A
anim = 3150
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
trigger1 = AnimElemTime(1) < 0
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
pos = ceil(5 * const(size.xScale)), ceil(-31 * const(size.yScale))
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

[State 3150, 3]
type = PlaySnd
trigger1 = time  = 0
value = 1500,0

[State 3150, end]
type = ChangeState
trigger1 = !AnimTime
value = 3160
ctrl = 1

;Start nano
[Statedef 3160]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3170
ctrl = 0
sprpriority = 1

[State 3160, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH out
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Anti-Air Slash Dust"
posType = P1
ownPal = 1

[State 3160, vel]
type = velset
trigger1 = animelem = 3
x = 10
y = -3

[State 3160, sts]
type = statetypeset
trigger1 = animelemtime(3)>=0
statetype = S
physics = S

[State 3160, push]
type = playerpush
trigger1 = animelemtime(4)>=0 && animelemtime(18)<0 && movehit
value = 660
ignorehitpause = 1

[State 3160, 3]
type = PlaySnd
trigger1 = animelem = 3
value = 190,2

[State 3160, shit]
type = Explod
triggerall = !NumExplod(3162)
trigger1 = animelem  = 2
anim = 3162
ontop = 1
pos = 0,-20
bindtime= -1
sprpriority = 6
flag = noshadow
ownpal = 1
removeongethit = 1
scale = .7,.7

[State 3160, shit2]
type = Explod
triggerall = !NumExplod(3153)
trigger1 = animelem  = 2
anim = 3153
ontop = 1
pos = 0,-5
bindtime= -1
sprpriority = -4
flag = noshadow
ownpal = 1
removeongethit = 1

[State 3160, shits2]
type = Explod
triggerall = !NumExplod(3153)
trigger1 = animelem  = 2
anim = 3153
ontop = 1
pos = 0,-50
bindtime= -1
sprpriority = -4
flag = noshadow
ownpal = 1
removeongethit = 1

[State 3160, shit3]
type = Explod
triggerall = !NumExplod(3162)
trigger1 = animelem  = 2
anim = 3162
ontop = 1
pos = 0,-50
bindtime= -1
sprpriority = -4
flag = noshadow
ownpal = 1
removeongethit = 1

[State 3160, bootjets]
type = Explod
triggerall = !NumExplod(4100)
trigger1 = animelem = 2
anim = 4000
id = 4100
sprpriority = -1
facing = 1
bindtime = -1
removetime = 60
pos = 7,-10
flag = noshadow
ownpal = 1
removeongethit = 1
scale = .5,.9

[State 3160,helper1]
type = Helper
triggerall = !Numhelper(3155)
trigger1 = StateNo = 3160
trigger1 = animelem = 3
ID = 3105
postype = P1
pos = 0,20
helpertype = normal
name = "big_wave_1"
stateno = 3155
sprpriority = 6
facing = 1
bindtime = -1
pausemovetime = 1

[State 3160, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;========================<HEAVY ARTILLERY UNI BEAM>=============================
[StateDef 3200]
type = S
physics = S
moveType = A
anim = 3300
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Animelem = 1
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
trigger1 = Animelem = 1
time = 33
;moveTime = 33
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, 3]
type = PlaySnd
trigger1 = time = 0
value = 195,0

[State 3200, HitDef]
type = HitDef
trigger1 = Time % 6 = 0 && Time < 135 ;95
attr = S, NA
damage = 8, 3
guardflag = MA
pausetime = 2,2
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -58
animtype = Hard
ground.type = Low
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -2
guard.velocity = -1
air.velocity = -1,-1
envshake.time = 4
envshake.freq = 60
envshake.ampl = -4
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3200, HitDef]
type = HitDef
trigger1 = Time > 135
attr = S, NA
damage = 10, 4
guardflag = MA
pausetime = 8,2
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -58
animtype = Hard
ground.type = Low
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -11, -8
guard.velocity = -5
air.velocity = -1,-1
envshake.time = 4
envshake.freq = 60
envshake.ampl = -4
fall = 1
envshake.time = 12
envshake.ampl = 6; or 7
fall.envshake.time = 20
fall.envshake.ampl = 8
getpower = 0,0

[State 3200, 3x]
type = PlaySnd
trigger1 = animelem = 18
trigger2 = animelem = 20
value = 3200,1
channel = 5

[State 3200, 3x]
type = PlaySnd
trigger1 = animelem = 19
trigger2 = animelem = 21
value = 3200,2
channel = 4

[State 3200, helper]
type = Helper
trigger1 = animelem = 18
trigger2 = animelem = 20
name = "msil"
StateNo = 3201
postype = p1
pos = 0, 0
sprpriority = 6
ownpal = 1

[State 3200, helper]
type = Helper
trigger1 = animelem = 19
trigger2 = animelem = 21
name = "msil2"
StateNo = 3201
postype = p1
pos = 50, 10
sprpriority = 6
ownpal = 1

[State 3200, helper]
type = Helper
trigger1 = animelem = 19
;trigger2 = animelem = 21
name = "msil3"
StateNo = 3201
postype = p1
pos = -5, 30
sprpriority = 6
ownpal = 1

[State 3200, helper]
type = Helper
trigger1 = animelem = 21
;trigger2 = animelem = 20
name = "msil4"
StateNo = 3201
postype = p1
pos = 20, 30
sprpriority = 6
ownpal = 1

[State 3200, helper]
type = Helper
trigger1 = animelem = 21
name = "bigmisil"
StateNo = 3202
postype = p1
pos = 0, 0
sprpriority = -6
ownpal = 1

[State 3200, 3x]
type = PlaySnd
trigger1 = animelem = 21
value = 3200,0
channel = 4

[State 3200, gethit]
type = Explod
triggerall = !NumExplod(3009)
trigger1 = animelem = 19
trigger2 = animelem = 21
anim = 3308
id = 3009
pos = 50,0
postype = p1
sprpriority = 6
ownpal = 1
facing = 1
bindtime = -1
removetime = 14
removeongethit = 1

[State 3200, gethit]
type = Explod
triggerall = !NumExplod(3008)
trigger1 = animelem = 18
trigger2 = animelem = 20
anim = 3308
id = 3008
pos = 0,0
postype = p1
sprpriority = 6
ownpal = 1
facing = 1
bindtime = -1
removetime = 14
removeongethit = 1

[State 3200, gethit]
type = Explod
triggerall = !NumExplod(3028)
trigger1 = animelem = 21
anim = 3308
id = 3028
pos = 10,60
postype = p1
sprpriority = 6
ownpal = 1
facing = 1
bindtime = -1
removetime = 14
removeongethit = 1

[State 3200, helper]
type = Helper
trigger1 = animelem = 18
;trigger2 = animelem = 20
name = "msil5"
StateNo = 3201
postype = p1
pos = -30, 60
sprpriority = 6
ownpal = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 =!time
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 140
ignorehitpause =1

[State 3200, back]
type = ChangeState
trigger1 = Time = 140
value = 3205
ctrl = 1

;Artillery - (move end)
[Statedef 3205]
type = S
physics = S
ctrl = 0
anim = 3305
sprpriority = 2

[State 3205, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================<ROCKETS LAUNCHERS>=============================
[StateDef 3300]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3300, SuperPause FX]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(-64 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = AnimElem = 7
time = 60
;moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, 3]
type = PlaySnd
trigger1 = time  = 0
value = 1400,0

[State 3300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 29
value = 3300,0

[State 3300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 5
trigger3 = animelem = 28
trigger4 = animelem = 30
value = 3300,1

[State 3300, Explod]
type = Explod
trigger1 =  animelem = 5
anim = 3404
ID = 3404
pos = 34,-68
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 68
scale = 1,1
sprpriority = 9
removeongethit = 1
supermovetime = 999
pausemove = 999

[State 3300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
value = 3200,1

[State 3300, Explod]
type = Explod
trigger1 = animelem = 8
trigger2 = animelem = 11
trigger3 = animelem = 14
trigger4 = animelem = 17
trigger5 = animelem = 20
trigger6 = animelem = 23
trigger7 = animelem = 26
anim = 3401
ID = 3401
pos = 50,-60
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
sprpriority = 2
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3300, VarRandom]
type = VarRandom
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
v = 41
range = 0,4

[State 3300, Projectile]
type = Projectile
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
ProjID = 3410+var(41)
projanim = 3410+var(41)
projhitanim = 3106
projremanim = 3106
projcancelanim = 3106
projscale = .75,.75
projremove = 1
projremovetime = -1
projheightbound = -440
velocity = 7,ifelse(var(41)=2,-2,-6)
remvelocity = 0,0
accel = 0,ifelse(var(41)=0,0.3,(ifelse(var(41)=3,0.2,(ifelse(var(41)=4,0.4,0)))))
velmul = 1
projhits = 2
projmiss = 0
projpriority = 5
projsprpriority = 5
offset = 55,-65
postype = p1         ;p2,front,back,left,right
attr = S,HP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFD        ;HLAFD+-
guardflag = MA         ;HLA
animtype = hard          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 3,Hit   ;Hit,Miss,Dodge
damage = 14,2
pausetime = 3,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High      ;Low,Trip,None
ground.slidetime = 15
ground.hittime = 25
air.hittime = 20
ground.velocity = -3,-6
air.velocity = -2,-4
envshake.time = 9
envshake.ampl = 5
fall = 1
getpower = 0

[State 3300, HitSound]
type = PlaySnd
trigger1 = projhit = 1 && NumTarget
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3300, HitSpark]
type = Helper
trigger1 = projhit = 1 && NumTarget
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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
persistent = 1
ignoreHitPause = 1

[State 3300, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3, 0
channel = 3
persistent = 1
ignorehitPause = 1

[State 3300, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
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
persistent = 1
ignoreHitPause = 1

[State 3300, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3300, back to stance]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;========================<MAX ROCKETS LAUNCHERS>=============================
[StateDef 3350]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3350, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3350, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3350, Corner Push]
type = VarSet
trigger1 = Time = 3
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3350, SuperPause FX]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(-64 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3350, SuperPause]
type = SuperPause
trigger1 = AnimElem = 7
time = 60
;moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3350, 3]
type = PlaySnd
trigger1 = time  = 0
value = 1400,0

[State 3350, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 29
value = 3300,0

[State 3350, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 5
trigger3 = animelem = 28
trigger4 = animelem = 30
value = 3300,1

[State 3350, Explod]
type = Explod
trigger1 =  animelem = 5
anim = 3404
ID = 3404
pos = 34,-68
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 68
scale = 1,1
sprpriority = 9
removeongethit = 1
supermovetime = 999
pausemove = 999

[State 3350, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
value = 3200,1

[State 3350, Explod]
type = Explod
trigger1 = animelem = 8
trigger2 = animelem = 11
trigger3 = animelem = 14
trigger4 = animelem = 17
trigger5 = animelem = 20
trigger6 = animelem = 23
trigger7 = animelem = 26
anim = 3401
ID = 3401
pos = 50,-60
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
sprpriority = 2
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3350, VarRandom]
type = VarRandom
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
v = 41
range = 0,4

[State 3350, Projectile]
type = Projectile
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
ProjID = 3410+var(41)
projanim = 3410+var(41)
projhitanim = 3106
projremanim = 3106
projcancelanim = 3106
projscale = .75,.75
projremove = 1
projremovetime = -1
projheightbound = -440
velocity = 7,ifelse(var(41)=2,-2,-6)
remvelocity = 0,0
accel = 0,ifelse(var(41)=0,0.3,(ifelse(var(41)=3,0.2,(ifelse(var(41)=4,0.4,0)))))
velmul = 1
projhits = 2
projmiss = 0
projpriority = 5
projsprpriority = 5
offset = 55,-65
postype = p1         ;p2,front,back,left,right
attr = S,HP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFD        ;HLAFD+-
guardflag = MA         ;HLA
animtype = hard          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 3,Hit   ;Hit,Miss,Dodge
damage = 10,2
pausetime = 3,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High      ;Low,Trip,None
ground.slidetime = 15
ground.hittime = 25
air.hittime = 20
ground.velocity = -3,-6
air.velocity = -2,-4
envshake.time = 9
envshake.ampl = 5
fall = 1
getpower = 0

[State 3350, VarRandom]
type = VarRandom
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
v = 41
range = 0,4

[State 3350, Projectile]
type = Projectile
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
trigger8 = animelem = 22
trigger9 = animelem = 24
trigger10 = animelem = 26
ProjID = 3410+var(41)
projanim = 3410+var(41)
projhitanim = 3106
projremanim = 3106
projcancelanim = 3106
projscale = .75,.75
projremove = 1
projremovetime = -1
projheightbound = -440
velocity = 7,ifelse(var(41)=2,-2,-6)
remvelocity = 0,0
accel = 0,ifelse(var(41)=0,0.3,(ifelse(var(41)=3,0.2,(ifelse(var(41)=4,0.4,0)))))
velmul = 1
projhits = 2
projmiss = 0
projpriority = 5
projsprpriority = 5
offset = 40,-82
postype = p1         ;p2,front,back,left,right
attr = S,HP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFD        ;HLAFD+-
guardflag = MA         ;HLA
animtype = hard          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 3,Hit   ;Hit,Miss,Dodge
damage = 10,2
pausetime = 3,3
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
ground.type = High      ;Low,Trip,None
ground.slidetime = 15
ground.hittime = 25
air.hittime = 20
ground.velocity = -3,-6
air.velocity = -2,-4
envshake.time = 9
envshake.ampl = 5
fall = 1
getpower = 0

[State 3350, HitSound]
type = PlaySnd
trigger1 = projhit = 1 && NumTarget
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 1
ignorehitPause = 1

[State 3350, HitSpark]
type = Helper
trigger1 = projhit = 1 && NumTarget
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
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
persistent = 1
ignoreHitPause = 1

[State 3350, HitSound]
type = PlaySnd
trigger1 = projGuarded = 1
value = 3, 0
channel = 3
persistent = 1
ignorehitPause = 1

[State 3350, HitSpark]
type = Helper
trigger1 = projGuarded = 1
helperType = Normal
stateNo = 8001
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
persistent = 1
ignoreHitPause = 1

[State 3350, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x), ceil(P2Dist y-80)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3350, back to stance]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1
