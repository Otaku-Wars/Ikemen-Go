; _________________________________________
;| Joker by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<IMPERIAL ROYAL FLUSH>=============================
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
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-30 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, snd]
type = PlaySnd
trigger1 = AnimElem = 28
value = 40,3
channel = 8

[State 3000,sound]
type = Playsnd
trigger1 = time = 0
value = 40,8

[State 3000, card]
type = Helper
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
trigger3 = AnimElem = 20
helpertype = normal
name = "card"
ID = 3007
pos = -30,0
postype = p1
stateno = 3007
priority = 4
ownpal = 1

[State 3000, card]
type = Helper
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
trigger3 = AnimElem = 20
helpertype = normal
name = "card"
ID = 3008
pos = -30,30
postype = p1
stateno = 3008
priority = 4
ownpal = 1

;[State 3000, card]
;type = Helper
;trigger1 = AnimElem = 6
;trigger2 = AnimElem = 13
;trigger3 = AnimElem = 20
;helpertype = normal
;name = "card"
;ID = 3005
;pos = -50,15
;postype = p1
;stateno = 3005
;priority = 4
;ownpal = 1

;[State 3000, card]
;type = Helper
;trigger1 = AnimElem = 6
;trigger2 = AnimElem = 13
;trigger3 = AnimElem = 20
;helpertype = normal
;name = "card"
;ID = 3006
;pos = -50,45
;postype = p1
;stateno = 3006
;priority = 4
;ownpal = 1

;[State 3000, card]
;type = Helper
;trigger1 = AnimElem = 26
;helpertype = normal
;name = "card"
;ID = 3009
;pos = 0,0
;postype = p1
;stateno = 3009
;priority = 4
;ownpal = 1

[State 3000, card]
type = Helper
trigger1 = AnimElem = 26
helpertype = normal
name = "card"
ID = 3010
pos = 0,10
postype = p1
stateno = 3009
priority = 4
ownpal = 1

[State 3000, card]
type = Helper
trigger1 = AnimElem = 26
helpertype = normal
name = "card"
ID = 3011
pos = 0,-10
postype = p1
stateno = 3009
priority = 4
ownpal = 1

[State 3000, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;========================<MAX IMPERIAL ROYAL FLUSH>=============================
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
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-30 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, snd]
type = PlaySnd
trigger1 = AnimElem = 28
value = 40,3
channel = 8

[State 3050,sound]
type = Playsnd
trigger1 = time = 0
value = 40,8

[State 3050, card]
type = Helper
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
trigger3 = AnimElem = 20
helpertype = normal
name = "card"
ID = 3007
pos = -30,0
postype = p1
stateno = 3007
priority = 4
ownpal = 1

[State 3050, card]
type = Helper
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
trigger3 = AnimElem = 20
helpertype = normal
name = "card"
ID = 3008
pos = -30,30
postype = p1
stateno = 3008
priority = 4
ownpal = 1

[State 3050, card]
type = Helper
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
trigger3 = AnimElem = 20
helpertype = normal
name = "card"
ID = 3005
pos = -50,15
postype = p1
stateno = 3005
priority = 4
ownpal = 1

[State 3050, card]
type = Helper
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
trigger3 = AnimElem = 20
helpertype = normal
name = "card"
ID = 3006
pos = -50,45
postype = p1
stateno = 3006
priority = 4
ownpal = 1

[State 3050, card]
type = Helper
trigger1 = AnimElem = 26
helpertype = normal
name = "card"
ID = 3009
pos = 0,0
postype = p1
stateno = 3009
priority = 4
ownpal = 1

[State 3050, card]
type = Helper
trigger1 = AnimElem = 26
helpertype = normal
name = "card"
ID = 3010
pos = 0,10
postype = p1
stateno = 3009
priority = 4
ownpal = 1

[State 3050, card]
type = Helper
trigger1 = AnimElem = 26
helpertype = normal
name = "card"
ID = 3011
pos = 0,-10
postype = p1
stateno = 3009
priority = 4
ownpal = 1

[State 3050, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;========================<JOKER VENOM GAS>=============================
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, snd]
type = PlaySnd
trigger1 = time = 1
value = 40,21
channel = 8

[State 3100, Gas]
type = Helper
triggerall = !NumHelper(3111)
trigger1 = animelem = 2
ID = 3111
pos = 0,0
stateno = 3111
helpertype = normal
name = "gas"
keyctrl = 0
ownpal = 1

[State 3100, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Conect
[Statedef 3112]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3101
ctrl = 0
juggle = 6
sprpriority = 1

[State 3112, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3112, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3112, snd]
type = PlaySnd
trigger1 = animelem= 2
value = 30,11
channel = 6

;[State 3112, 1]
;type = ChangeState
;trigger1 = Time = 200
;value = 3002
;ctrl = 1

[State 3112, Activation]
type = VarSet
trigger1 =time = 0
var(24) = 0

[State 3112, 2]
type = ChangeState
trigger1 = Time = 200 && var(24) = 0
value = 3102
ctrl = 1

;Finish
[Statedef 3102]
type = S
movetype = A
physics = S
juggle = 4
velset = 0,0
anim = 3102
ctrl = 0
sprpriority = 2

[State 3102, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3102, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3102, 4]
type = PlaySnd
trigger1 = animelem = 8
value = 60,11

[State 3102, velset]
type = velset
trigger1 = animelem = 10
x = -16
y = 0

[State 3102, gun]
type = Explod
triggerall = !NumExplod(3104)
trigger1 = animelem = 10
anim = 3104
id = 3104
name = "gun"
postype = P1
pos = 0,0
ownpal = 1
bindtime = 3
ontop = 1
sprpriority = 4
animtime = 21

[State 3102, gun]
type = Explod
triggerall = !NumExplod(101902)
trigger1 = animelem = 8
anim = 101902
id = 101902
name = "shot2"
postype = P1
pos = 40,0
ownpal = 1
bindtime = -1
ontop = 1
sprpriority = 4
animtime = 10

[State 3102, gun]
type = Explod
triggerall = !NumExplod(3107)
trigger1 = animelem = 8
anim = 3107
id = 3107
name = "shot2"
postype = P1
pos = 40,0
ownpal = 1
bindtime = -1
ontop = 1
sprpriority = 4
animtime = 12

[State 3102, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 40,12

[State 3102, Projectile]
type = Helper
trigger1 = animelem = 8
ID = 3105
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 3105
helperType = Normal
name = "Gunshot"
keyctrl = 0
ownpal = 1

[State 3102, 2]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype = Medium
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -180
ground.type = Low
ground.slidetime = 6
ground.hittime  = 18
ground.velocity = -13, -4
guard.velocity = -8
air.velocity = -13, -4
airguard.velocity = -6
ground.cornerpush.veloff = -6
fall.recovertime = 46
yAccel = 0.2
fall = 1
air.fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3102, exp]
type = Explod
trigger1 = projhit(3105) = 1
anim = 3106
id = 3106
pos = -5,-85
postype = p2
sprpriority = 3
bindtime = -1
facing = 1

[State 3102, 7]
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<MAX JOKER VENOM GAS>=============================
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(0 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, snd]
type = PlaySnd
trigger1 = time = 1
value = 40,21
channel = 8

[State 3150, Gas]
type = Helper
triggerall = !NumHelper(3161)
trigger1 = animelem = 2
ID = 3161
pos = 0,0
stateno = 3161
helpertype = normal
name = "gas"
keyctrl = 0
ownpal = 1

[State 3150, 1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Conect
[Statedef 3162]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3101
ctrl = 0
juggle = 6
sprpriority = 1

[State 3162, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3162, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3162, snd]
type = PlaySnd
trigger1 = animelem= 2
value = 30,11
channel = 6

;[State 3162, 1]
;type = ChangeState
;trigger1 = Time = 200
;value = 3002
;ctrl = 1

[State 3162, Activation]
type = VarSet
trigger1 =time = 0
var(27) = 0

[State 3162, 2]
type = ChangeState
trigger1 = Time = 200 && var(27) = 0
value = 3152
ctrl = 1

;Finish
[Statedef 3152]
type = S
movetype = A
physics = S
juggle = 4
velset = 0,0
anim = 3102
ctrl = 0
sprpriority = 2

[State 3152, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3152, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3152, 4]
type = PlaySnd
trigger1 = animelem = 8
value = 60,11

[State 3152, velset]
type = velset
trigger1 = animelem = 10
x = -16
y = 0

[State 3152, gun]
type = Explod
triggerall = !NumExplod(3104)
trigger1 = animelem = 10
anim = 3104
id = 3104
name = "gun"
postype = P1
pos = 0,0
ownpal = 1
bindtime = 3
ontop = 1
sprpriority = 4
animtime = 21

[State 3152, gun]
type = Explod
triggerall = !NumExplod(101902)
trigger1 = animelem = 8
anim = 101902
id = 101902
name = "shot2"
postype = P1
pos = 40,0
ownpal = 1
bindtime = -1
ontop = 1
sprpriority = 4
animtime = 10

[State 3152, gun]
type = Explod
triggerall = !NumExplod(3107)
trigger1 = animelem = 8
anim = 3107
id = 3107
name = "shot2"
postype = P1
pos = 40,0
ownpal = 1
bindtime = -1
ontop = 1
sprpriority = 4
animtime = 12

[State 3152, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 40,12

[State 3152, Projectile]
type = Helper
trigger1 = animelem = 8
ID = 3105
pos = 0,0
size.xScale = 1
size.yScale = 1
stateno = 3155
helperType = Normal
name = "Gunshot"
keyctrl = 0
ownpal = 1

[State 3152, 2]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype = Medium
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 7
getPower = 0,0
givePower = 36, 36
guardflag = MA
pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -180
ground.type = Low
ground.slidetime = 6
ground.hittime  = 18
ground.velocity = -13, -4
guard.velocity = -8
air.velocity = -13, -4
airguard.velocity = -6
ground.cornerpush.veloff = -6
fall.recovertime = 46
yAccel = 0.2
fall = 1
air.fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3152, exp]
type = Explod
trigger1 = projhit(3105) = 1
anim = 3106
id = 3106
pos = -5,-85
postype = p2
sprpriority = 3
bindtime = -1
facing = 1

[State 3152, 7]
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;========================<DEATH IN THE FAMILY>=============================
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
trigger1 = Time = 0
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(0 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1000,sound]
type = Playsnd
trigger1 = time = 0
value = 60,9

[state 3100, Energy]
type = BgPalFx
trigger1 = AnimElem = 2
add = 0,0,0
mul = 256,256,256
sinadd = -255,-255,-255,150
time = 33

[State 3200, 2]
type = HitDef
trigger1 = Time = 0
attr = S, NA
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 6, Hit
pausetime = 2, 15
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -180
ground.type = High
ground.slidetime = 6
ground.hittime  = 12
ground.velocity = 2
guard.velocity = -13
air.velocity = -5
airguard.velocity = -6
p2stateno = 3213
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, ]
type = VelSet
trigger1 = animelem = 2
x = 7

[State 3200, 1]
type = ChangeState
trigger1 = movehit
value = 3202
ctrl = 1

[State 3200, 1]
type = ChangeState
trigger1 = animtime=0
value = 3201
ctrl = 1

;Hit Fail
[StateDef 3201]
type = S
movetype = A
physics = S
anim = 3201

[State 3201, 1]
type = ChangeState
trigger1 = animtime=0
value = 0
ctrl = 1

;Crowbat beat  jump
[Statedef 3202]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3202
ctrl = 0
sprpriority = 1

[State 3202, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3202, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[State 3202, ab1]
type = Explod
trigger1 = animelem = 13
sprpriority = 6
id = 3230
anim = 3230
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
removetime = 7

[State 3202, velset]
type = velset
trigger1 = animelem = 11
x = 9
y = 0

[State 3202, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, NA;NT
hitflag = MAF;-
priority = 2, miss
sparkno = -1
hitsound = S1, 1
sprpriority = 1
p2facing = 1
p1stateno = 3206
p2stateno = 3214
guard.dist = 0
fall = 1

[State 3202, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Init
[Statedef 3206]
type = S
movetype = A
physics = S
anim = 3206
velset = 0,0
sprpriority = -2

[State 3206, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3206, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[state 3206, Energy]
type = BgPalFx
trigger1 = AnimElem = 1
add = 0,0,0
mul = 256,256,256
sinadd = -255,-255,-255,150
time = 33

[State 3206, 1]
type = PlaySnd
trigger1 = Time = 1
value = 3,1

[State 3206, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,6
channel = 4

[State 3206,snd]
type = PlaySnd
trigger1 = animelem = 7
value = 40,5
channel = 6

[State 3206,snda]
type = PlaySnd
trigger1 = animelem = 12
value = 40,4
channel = 8

[State 3206,snda]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 9
trigger3 = animelem = 14
value = 0,3
channel = 1

[State 3206,snda]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 15
value = 2,2
channel = 1

[State 810, a]
type = Width
trigger1 = 1
value = 0, 0

[State 3206, 2]
type = TargetBind
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
trigger5 = AnimElem = 5
trigger6 = AnimElem = 6
trigger7 = AnimElem = 7
trigger8 = AnimElem = 8
trigger8 = AnimElem = 9
pos = 35,0

[State 3206, 2]
type = TargetBind
trigger1 = AnimElem = 10
trigger1 = AnimElem = 11
trigger1 = AnimElem = 12
trigger1 = AnimElem = 13
trigger1 = AnimElem = 14
trigger1 = AnimElem = 15
pos = 35,0

[State 3206, 7]
type = Explod
;triggerall = !NumExplod(3210)
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 15
anim = 3210
scale = .5,.5
id = 3210
pos = 70, 0
postype = p1
bindtime = 1
removetime = 24
priority = -6
ownpal = 1
removeongethit = 1

[State 3206, 7]
type = Explod
;triggerall = !NumExplod(3211)
trigger1 = animelem = 6
trigger2 = animelem = 11
trigger3 = animelem = 15
anim = 3211
scale = .5,.5
id = 3211
pos = 70, 10
postype = p1
bindtime = 1
removetime = 26
ontop = 1
ownpal = 1
removeongethit = 1

[State 3206, ea]
type = TargetLifeAdd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 15
value = -23

[State 3206, HitAdd]
type = HitAdd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 15
value = 1

[State 3206, Hit Spark]
type = Helper
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 15
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(120 * const(size.xScale)), ceil(-40 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3206, ab1]
type = Explod
trigger1 = animelem = 1
sprpriority = 6
id = 3231
anim = 3231
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 2
ID = 3231

[State 3206, ab1]
type = Explod
trigger1 = animelem = 2
sprpriority = 6
id = 3232
anim = 3232
scale =.5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 210, re]
type = RemoveExplod
trigger1 = AnimElem =3
ID = 3232

[State 3206, ab1]
type = Explod
trigger1 = animelem = 3
sprpriority = 6
id = 3233
anim = 3233
scale =.5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 3233

[State 3206, ab1]
type = Explod
trigger1 = animelem = 4
sprpriority = 6
id = 3234
anim = 3234
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 3234

[State 3206, ab1]
type = Explod
trigger1 = animelem = 5
sprpriority = 6
id = 3245
anim = 3245
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 6
ID = 3245

[State 3206, ab1]
type = Explod
trigger1 = animelem = 6
sprpriority = 6
id = 3236
anim = 3236
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 210, re]
type = RemoveExplod
trigger1 = AnimElem =7
ID = 3236

[State 3206, ab1]
type = Explod
trigger1 = animelem = 7
sprpriority = 6
id = 3237
anim = 3237
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 8
ID = 3237

[State 3206, ab1]
type = Explod
trigger1 = animelem = 8
sprpriority = 6
id = 3238
anim = 3238
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 9
ID = 3238

[State 3206, ab1]
type = Explod
trigger1 = animelem = 9
sprpriority = 6
id = 3239
anim = 3239
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 10
ID = 3239

[State 210, ab1]
type = Explod
trigger1 = animelem = 10
sprpriority = 6
id = 3240
anim = 3240
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 11
ID = 3240

[State 3206, ab1]
type = Explod
trigger1 = animelem = 11
sprpriority = 6
id = 3241
anim = 3241
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 12
ID = 3241

[State 3206, ab1]
type = Explod
trigger1 = animelem = 12
sprpriority = 6
id = 3242
anim = 3242
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 13
ID = 3242

[State 3206, ab1]
type = Explod
trigger1 = animelem = 13
sprpriority = 6
id = 3243
anim = 3243
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3206, re]
type = RemoveExplod
trigger1 = AnimElem = 14
ID = 3243

[State 3206, ab1]
type = Explod
trigger1 = animelem = 14
sprpriority = 6
id = 3244
anim = 3244
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 210, re]
type = RemoveExplod
trigger1 = AnimElem =15
ID = 3244

[State 3206, ab1]
type = Explod
trigger1 = animelem = 15
sprpriority = 6
id = 3245
anim = 3245
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1
removetime = 6

[State 3206, Invincibility]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

[State 3206, State]
type = sprpriority
trigger1 = 1
value = -2;-2

[State 3206, 1]
type = HitDef
trigger1 = animelem = 15 && time >= 345
attr = S, NA
damage = 0, 0
hitflag = MAF
hitSound = -1 + 0 * (var(31) := -1)
guardSound = -1 + 0 * (var(32) := -1)
sparkNo = -1 + 0 * (var(33) := -1)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -40
p1stateno = 3204
p2stateno = 3215

[State 3206, State]
type = ChangeState
trigger1 = time = 380
value = 0
ctrl = 1

;Final Hit
[Statedef 3204]
type = S
movetype = A
physics = S
anim = 3204
scale = .5,.5
velset = 0,0

[State 3204, b1]
Type = BGPalfx
Trigger1 = time = [0, 800];BG VANISH IN
Add = -70,-70,-90
IgnoreHitPause = 1
time = 1

[State 3204, aa]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = noFG
ignorehitpause = 1

[state 3204, Energy]
type = BgPalFx
trigger1 = AnimElem = 2
add = 0,0,0
mul = 256,256,256
sinadd = -255,-255,-255,150
time = 33

[State 3204, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 60,7
channel = 8

[State 3204,snda]
type = PlaySnd
trigger1 = animelem = 10
value = 0,3
channel = 1

[State 3204,snda]
type = PlaySnd
trigger1 = animelem = 11
value = 2,2
channel = 1

[State 3204, a]
type = Width
trigger1 = 1
value = 0, 0

[State 3204, 7]
type = Explod
;triggerall = !NumExplod(3210)
trigger1 = animelem = 11
anim = 3210
scale = .5,.5
id = 3210
pos = 70, 0
postype = p1
bindtime = 1
removetime = 24
priority = -6
ownpal = 1
removeongethit = 1

[State 3204, 7]
type = Explod
;triggerall = !NumExplod(3211)
trigger1 = animelem = 12
anim = 3211
scale = .5,.5
id = 3211
pos = 70, 10
postype = p1
bindtime = 1
removetime = 26
ontop = 1
ownpal = 1
removeongethit = 1

[State 3204, 2]
type = TargetBind
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
trigger5 = AnimElem = 5
trigger6 = AnimElem = 6
trigger7 = AnimElem = 7
trigger8 = AnimElem = 8
trigger8 = AnimElem = 9
pos = 35,0

[State 3204, 2]
type = TargetBind
trigger1 = AnimElem = 10
trigger1 = AnimElem = 11
trigger1 = AnimElem = 12
trigger1 = AnimElem = 13
trigger1 = AnimElem = 14
trigger1 = AnimElem = 15
pos = 35,0

[State 3204, EnvShake]
type = EnvShake
trigger1 = AnimElem = 11
time = 18

[State 3204, ab1]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
sprpriority = 6
id = 3250
anim = 3250
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3204, re]
type = RemoveExplod
trigger1 = AnimElem = 2
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 8
ID = 3250

[State 3204, ab1]
type = Explod
trigger1 = AnimElem = 2
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 8
sprpriority = 6
id = 3251
anim = 3251
scale = 1,1
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3204, re]
type = RemoveExplod
trigger1 = AnimElem = 3
trigger2 = animelem = 5
trigger3 = animelem = 7
trigger4 = animelem = 9
ID = 3251

[State 3204, ab1]
type = Explod
trigger1 = animelem = 9
sprpriority = 6
id = 3252
anim = 3252
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3204, re]
type = RemoveExplod
trigger1 = AnimElem = 10
ID = 3252

[State 3204, ab1]
type = Explod
trigger1 = animelem = 10
sprpriority = 6
id = 3253
anim = 3253
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3204, re]
type = RemoveExplod
trigger1 = AnimElem = 11
ID = 3253

[State 3204, ab1]
type = Explod
trigger1 = animelem = 11
sprpriority = 6
id = 3254
anim = 3254
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1

[State 3204, re]
type = RemoveExplod
trigger1 = AnimElem = 12
ID = 3254

[State 3204, ab1]
type = Explod
trigger1 = animelem = 12
sprpriority = 6
id = 3255
anim = 3255
scale = .5,.5
postype = P1
pos = 0, 0
removeongethit = 1
bindtime = -1
ownpal = 1
removetime = 10

[State 3204, Invincibility]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

[State 3204, State]
type = sprpriority
trigger1 = 1
value = -2

[State 3204, 2]
type = HitDef
trigger1 = time = 11
attr = S, NA
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
animtype = Heavy
guardflag = MA
hitflag = MAFD
priority = 6, Hit
pausetime = 2, 15
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -40
ground.type = Low
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -18,-2
guard.velocity = -11
airguard.velocity = -18,-2
dow.velocity = -18,-2
air.type = Low
air.velocity = -18,-2
fall = 1
air.fall = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3204, State]
type = ChangeState
trigger1 = animtime = 0
value = 11
ctrl = 1

;Pleyer 2
[Statedef 3213]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0, 0
poweradd = 0

[State 3213, 1]
type = SprPriority
trigger1 = time >= 0
value = 2

[State 3213, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 3213

[State 3213, 1]
type = screenbound
trigger1 = 1
value = 1

[State 3213, 6]
type = changestate
trigger1 = AnimTime =0
ctrl = 1
value = 5110;7897

;Player 2
[Statedef 3214]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0, 0
poweradd = 0

[State 3214, 1]
type = SprPriority
trigger1 = time >= 0
value = 4

[State 3214, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 3214

[State 3214, 1]
type = screenbound
trigger1 = 1
value = 1

[State 3214, 6]
type = changestate
trigger1 = Time = 380
ctrl = 1
value = 5050;7897

;Player 2
[Statedef 3215]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0, 0
poweradd = 0

[State 3215, 1]
type = SprPriority
trigger1 = time >= 0
value = 2

[State 3125, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 3215

[State 3215, 1]
type = screenbound
trigger1 = 1
value = 1

[State 3215, 6]
type = changestate
trigger1 = AnimTime = 0
ctrl = 1
value = 5120;7897

;========================<BUZZER>=============================
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
pos = ceil(0 * const(size.xScale)), ceil(-180 * const(size.yScale))
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

[State 3300, snd]
type = PlaySnd
trigger1 = Time = 1
value = 40,14
channel = 4

[State 3300, Elec]
type = Helper
trigger1= AnimElem = 2
helpertype = normal
name = "elec"
ID = 3310
pos = 0,0
size.xScale = 0.35
size.yScale = 0.35
postype = P1
facing = 1
stateno = 3310
ownpal = 0
priority = 9

[State 3300,snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 60,20
channel = 8

[State 3300, 1]
type = ChangeState
trigger1 = time = 180
value = 3303
ctrl = 1

;Finish
[StateDef 3303]
type = S
movetype = A
physics = S
anim = 3303

[State 3303, 1]
type = ChangeState
trigger1 = animtime=0
value = 0
ctrl = 1

;========================<MAX BUZZER>=============================
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
pos = ceil(0 * const(size.xScale)), ceil(-180 * const(size.yScale))
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

[State 3350, snd]
type = PlaySnd
trigger1 = Time = 1
value = 40,14
channel = 4

[State 3350, Elec]
type = Helper
trigger1= AnimElem = 2
helpertype = normal
name = "elec"
ID = 3310
pos = 0,0
size.xScale = 0.35
size.yScale = 0.35
postype = P1
facing = 1
stateno = 3360
ownpal = 0
priority = 9

[State 3350,snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 60,20
channel = 8

[State 3350, 1]
type = ChangeState
trigger1 = time = 180
value = 3303
ctrl = 1

;========================<FLAMES>=============================
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
trigger1 = AnimElemTime(5) < 0
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
pos = ceil(-30 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, snd]
type = PlaySnd
trigger1 = Time = 1
value = 40,23
channel = 4

[State 3400, Elec]
type = Helper
trigger1= AnimElem = 5
helpertype = normal
name = "fire"
ID = 3410
pos = 0,0
postype = P1
facing = 1
stateno = 3410
ownpal = 0
priority = 9

[State 3400,snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 60,23
channel = 8

[State 3400, 1]
type = ChangeState
trigger1 = time = 170
value = 3402
ctrl = 1

;Finish
[StateDef 3402]
type = S
movetype = A
physics = S
anim = 3402

[State 3402, 1]
type = ChangeState
trigger1 = animtime=0
value = 0
ctrl = 1

;========================<MAX FLAMES>=============================
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
trigger1 = AnimElemTime(5) < 0
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
pos = ceil(-30 * const(size.xScale)), ceil(-180 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3450, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 39
moveTime = 39
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3450, snd]
type = PlaySnd
trigger1 = Time = 1
value = 40,23
channel = 4

[State 3450, Elec]
type = Helper
trigger1= AnimElem = 5
helpertype = normal
name = "fire"
ID = 3410
pos = 0,0
postype = P1
facing = 1
stateno = 3460
ownpal = 0
priority = 9

[State 3450,snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 60,23
channel = 8

[State 3450, 1]
type = ChangeState
trigger1 = time = 170
value = 3402
ctrl = 1
