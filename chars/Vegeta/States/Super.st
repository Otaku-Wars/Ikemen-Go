; __________________
;| Vegeta by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;BBA
[Statedef 3000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3000

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 30, 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 60, -78
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6
[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6

[State 0, BBA Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,5
[State 0, BBA Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,5

[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,49
[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,49

[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,21
[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,21

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 3001
ID = 3001
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 51
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, BBA]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 3005
ID = 3005
name = "BBA"
postype = p1
pos = 60, -78
size.xscale = 0.45 
size.yscale = 0.6
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 4
anim = 6028
ID = 6028
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX BBA
[StateDef 3050]
type=S
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3000

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 30, 0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 3
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 60, -78
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6
[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6

[State 0, BBA Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,5
[State 0, BBA Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,5

[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,49
[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,49

[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,21
[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,21

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 3001
ID = 3001
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 51
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, BBA]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 3055
ID = 3055
name = "Max BBA"
postype = p1
pos = 60, -78
size.xscale = 0.45 
size.yscale = 0.6
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 5
anim = 6028
ID = 6028
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I


[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Rapid Fire
[Statedef 3100]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3100

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = 30, 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 2
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -25, -133
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 2
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = -.5
y = -.5

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 22
x = -2.5
y = -4.8

[State 0, Power Up Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,15
channel = 1
[State 0, Power Up Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,15
channel = 2
[State 0, Power Up Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,15
channel = 3

[State 0, StopSnd]
type = StopSnd
trigger1 = Animelem = 3
channel = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = Animelem = 3
channel = 2
[State 0, StopSnd]
type = StopSnd
trigger1 = Animelem = 3
channel = 3

[State 0, Power Up Ball Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7
channel = 4
[State 0, Power Up Ball Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7
channel = 5

[State 0, Rapid Fire Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,36
[State 0, Rapid Fire Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,36

[State 0, Right Ball Form Explod]
type = Explod
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19
anim = 3102
ID = 3102
pos = -24, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Right Ball Form Explod]
type = Explod
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20
anim = 3102
ID = 3102
pos = -24, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Fireball]
type = helper
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19
helpertype = normal
stateno = 3105
ID = 3105
name = "Left Fireball"
postype = p1
pos = 50,-60
size.xscale = 0.24
size.yscale = 0.24
ownpal = 1

[State 0, Left Explod]
type = Explod
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19
anim = 3101
ID = 3101
pos = 30, -80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = .67,.67
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Left Ball Form Explod]
type = Explod
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 
anim = 3102
ID = 3102
pos = 8, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Left Ball Form Explod]
type = Explod
trigger1 = animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
anim = 3102
ID = 3102
pos = 11, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Fireball]
type = helper
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21
helpertype = normal
stateno = 3105
ID = 3105
name = "Right Fireball"
postype = p1
pos = 45,-50
size.xscale = 0.24
size.yscale = 0.24
ownpal = 1

[State 0, Right Explod]
type = Explod
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21
anim = 3101
ID = 3101
pos = 20, -75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = .67,.67
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;---------------------------------------------------------------------------
;MAX Rapid Fire
[StateDef 3150]
type=A
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3100

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 2
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -133
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = -.5
y = -.5

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 22
x = -2.5
y = -4.8

[State 0, Power Up Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,15
channel = 1
[State 0, Power Up Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,15
channel = 2
[State 0, Power Up Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,15
channel = 3

[State 0, StopSnd]
type = StopSnd
trigger1 = Animelem = 3
channel = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = Animelem = 3
channel = 2
[State 0, StopSnd]
type = StopSnd
trigger1 = Animelem = 3
channel = 3

[State 0, Power Up Ball Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7
channel = 4
[State 0, Power Up Ball Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7
channel = 5
[State 0, Power Up Ball Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7
channel = 3
[State 0, Power Up Ball Snd]
type = PlaySnd
trigger1 = !Time
value = S6,7
channel = 4

[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6
[State 0, Rapid Fire Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,36
[State 0, Rapid Fire Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,36

[State 0, Right Ball Form Explod]
type = Explod
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19
anim = 3102
ID = 3102
pos = -24, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Right Ball Form Explod]
type = Explod
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20
anim = 3102
ID = 3102
pos = -24, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Fireball]
type = helper
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19
helpertype = normal
stateno = 3105
ID = 3105
name = "Left Fireball"
postype = p1
pos = 50,-60
size.xscale = 0.24
size.yscale = 0.24
ownpal = 1

[State 0, Left Explod]
type = Explod
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19
anim = 3101
ID = 3101
pos = 30, -80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = .67,.67
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Fireball]
type = helper
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21
helpertype = normal
stateno = 3105
ID = 3105
name = "Right Fireball"
postype = p1
pos = 45,-50
size.xscale = 0.24
size.yscale = 0.24
ownpal = 1

[State 0, Right Explod]
type = Explod
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21
anim = 3101
ID = 3101
pos = 20, -75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = .67,.67
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Left Ball Form Explod]
type = Explod
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 
anim = 3102
ID = 3102
pos = 8, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Left Ball Form Explod]
type = Explod
trigger1 = animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
anim = 3102
ID = 3102
pos = 11, -93
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3151
ctrl = 0

;-----------------------------------------------
;MAX Rapid Fire Cont.
[StateDef 3151]
type=A
movetype=A
physics=N
poweradd=0
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3151

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = -.8
y = -.8

[State 0, BigBall Form Snd]
type = PlaySnd
trigger1 = animelem = 1 
value = S6,6
channel = 3
[State 0, BigBall Form Snd]
type = PlaySnd
trigger1 = animelem = 1 
value = S6,6
channel = 4
[State 0, BigBall Form Snd]
type = PlaySnd
trigger1 = animelem = 1 
value = S6,6
channel = 5

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2 
value = S5,46
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2 
value = S5,46
[State 0, BigBall Snd]
type = PlaySnd
trigger1 = animelem = 3 
value = S6,5

[State 0, StopSnd]
type = StopSnd
trigger1 = time > 47
channel = 3
[State 0, StopSnd]
type = StopSnd
trigger1 = time > 47
channel = 4
[State 0, StopSnd]
type = StopSnd
trigger1 = time > 47
channel = 5

[State 0, Big Ball Form Explod]
type = Explod
trigger1 = animelem = 1
anim = 3102
ID = 3102
pos = -25, -133
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 8
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Big Ball Form Explod]
type = Explod
trigger1 = animelem = 2
anim = 3102
ID = 3102
pos = -10, -133
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 5
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Big Ball Form Explod]
type = Explod
trigger1 = animelem = 3
anim = 3101
ID = 3101
pos = 15, -80
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 9
pausemovetime = 0
scale = 1,1
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Fireball]
type = helper
trigger1 = animelem = 3 
helpertype = normal
stateno = 3155
ID = 3155
name = "Big Ball"
postype = p1
pos = 30, -70
size.xscale = 0.4
size.yscale = 0.4
ownpal = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;-----------------------------------------------
;Galic Gun
[Statedef 3200]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3200

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 5, -74
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, GG Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,7
[State 0, GG Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,7

[State 0, GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,4
[State 0, GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,4

[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44

[State 3000, Galick Gun Form]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 3201
ID = 3201
name = "Galick Gun Form"
postype = p1
pos = 5, -75
supermovetime = 255
size.xscale = 0.33 
size.yscale = 0.33
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3208
ID = 3208
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 27
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Galick Gun]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3205
ID = 3205
name = "Galick Gun"
postype = p1
pos = 60, 15
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 5
anim = 6028
ID = 6028
pos = 30,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Galick Gun Hand]
type = helper
trigger1 = Time = 47
helpertype = normal
stateno = 3202
ID = 3202
name = "Galick Gun Hand"
postype = p1
pos = 30, -53
size.xscale = 0.7
size.yscale = .75
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3204
ID = 3204
pos = 63,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 44
pausemovetime = 0
scale = .7,.75
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1


[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX Galic Gun
[StateDef 3250]
type=S
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3200

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 3
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 5, -74
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, GG Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,7
[State 0, GG Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,7

[State 0, GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,4
[State 0, GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,4
 
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 20
value = S5,44

[State 3000, Galick Gun Form]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 3201
ID = 3201
name = "Galick Gun Form"
postype = p1
pos = 5, -75
supermovetime = 255
size.xscale = 0.33 
size.yscale = 0.33
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3208
ID = 3208
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 27
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Max Galick Gun]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3255
ID = 3255
name = "Max Galick Gun"
postype = p1
pos = 60, 15
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 5
anim = 6028
ID = 6028
pos = 30,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Galick Gun Hand]
type = helper
trigger1 = Time = 47
helpertype = normal
stateno = 3202
ID = 3202
name = "Galick Gun Hand"
postype = p1
pos = 30, -53
size.xscale = 0.7
size.yscale = .75
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3204
ID = 3204
pos = 63,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 44
pausemovetime = 0
scale = .7,.75
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;---------------------------------------------------------------------------
;Super Kick
[Statedef 3300]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3300

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 2
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -35
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 2
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,33
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,33

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,34
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,34

[State 0,  Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,3

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1502
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 250 < 175, 175, (fvar(12)) * 250)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -12, -6
air.velocity = -12, -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-70
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Max Super Kick
[Statedef 3350]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3350

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 2
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 0, -35
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,33
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,33

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,34
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,34

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,3

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1502
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 250 < 150, 150, (fvar(12)) * 250)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -12, -9
air.velocity = -12, -9
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-70
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = var(1) = 0
triggerall = prevstateno!=3350
trigger1=movehit && p2stateno = 1111302
value = 3353

[State 1300, ChangeState]
type = ChangeState
triggerall = var(1) = 1
triggerall = prevstateno!=3350
trigger1=movehit && p2stateno = 1111302
value = 3351

;------------------------------------------------
;Max Super Kick Cont. (Super Big Bang Attack)
[Statedef 3351]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3351

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 7
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 50, -70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 7
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[state 3351]
type = posadd
trigger1 = animelem = 4
x = -150+P2Dist x
y = -80+P2Dist y

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = -.2
y = -.2

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,35
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,35
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,35

[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,2

[State 0, Blast Charge Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,6
[State 0, Blast Charge Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,6

[State 730, SSJ Aura]
type = helper
triggerall = animelem = 7
trigger1 = !numhelper(6000) && var(1)
stateno = 6007
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.25
size.yscale = 0.33
ownpal = 1

[State 3000, BBA]
type = helper
trigger1 = time = 50
helpertype = normal
stateno = 3355
ID = 3355
name = "Super BBA"
postype = p1
pos = 48, -65
size.xscale = 1.3
size.yscale = 1.3
ownpal = 1

[State 3000, BBA]
type = helper
trigger1 = time = 50
helpertype = normal
stateno = 3358
ID = 3358
name = "Blast Hand"
postype = p1
pos = 0,0
size.xscale = .8
size.yscale = .8
ownpal = 1

[State 0, Gravity]
type = Gravity
trigger1 = time > 65

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------
;Max Super Kick Cont. (Teleport Gut Kick)
[Statedef 3352]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3352

[state 3351]
type = posadd
trigger1 = animelem = 4
x = -50+P2Dist x
y = 0+P2Dist y

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,0

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,4

[State 0, Gravity]
type = Gravity
trigger1 = time > 25

[State 3051, Hit]
type = hitdef
triggerall = !(Root, var(16)) && (Root, var(15) < 12 || Root, var(20))
trigger1 = animelem = 8
priority = 4, Hit
attr = A, HP
damage = ceil(ifelse((root, fvar(12)) * 25 < 25, 25, (root, fvar(12)) * 25)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 20,22 
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20), var(36) := -115
hitsound = s2, 5
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4,-8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -3,-8
guard.velocity = -10.52
ground.cornerpush.veloff = 0
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------
;Max Super Kick Cont. (Dash to opponent)
[Statedef 3353]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3353

[State 730, Rushing Ki Aura]
type = helper
trigger1 = !numhelper(6000) && !var(1)
stateno = 6005;ifelse(var(1),6002,6000)
ID = 6000
name = "Rushing Ki Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.47
ownpal = 1

[State 1200, VelSet]
type = VelSet
trigger1 = animelem = 2
x = P2Dist X / ((10 + ((10 ** 2) -(4 * 0.375 * (EnemyNear(0), Const(Size.Height)))) ** 0.5) / 0.75)
y = -5
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time > 40
value = 50

[State 0, ChangeState]
type = ChangeState
trigger1 = P2Dist X < 50
trigger1 = P2Dist Y < 50
value = 3354

;------------------------------------------------
;Max Super Kick Cont. (Super Rising Kick)
[Statedef 3354]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3354

[State 0, Voice Snd];CHANGE
type = PlaySnd
trigger1 = animelem = 3
value = S5,14
[State 0, Voice Snd];CHANGE
type = PlaySnd
trigger1 = animelem = 3
value = S5,14

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,4

[State 0, VelSet]
type = VelSet
trigger1 = !Time
y = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 13

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1102
ID = 1102
pos = -15,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 4
id = 1102

[State 3051, Hit]
type = hitdef
triggerall = !(var(16)) && (var(15) < 12 || var(20))
trigger1 = animelem = 3
priority = 4, Hit
attr = A, HP
damage = ceil(ifelse((fvar(12)) * 50 < 50, 50, (fvar(12)) * 50)), 8
;damage = ceil(36 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 40,42 
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20), var(36) := -115
hitsound = s2, 5
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4,-8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -3,-8
guard.velocity = -10.52
ground.cornerpush.veloff = 0
p2facing = 1
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7183) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7183
ID = 7183
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;Air Super Galick Gun
[StateDef 3400]
type = A
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[State 4200, Anim]
type=changeanim
trigger1=!time
value=3400 

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[State 3000, width]
type = width
trigger1 = animelemtime(5) < 0
value = 40, 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause]
type = superpause
trigger1 = !time
time = 53
movetime = 53
p2defmul = 1
unhittable = 1
anim = -1
sound = -1;s8500,3
darken = 0

[State 0, SuperPause PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = S8500,1

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 2
time = 104
sinadd = -255, -255, -255, 128

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(1)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(4)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
stateNo = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = 6, -90
facing = facing
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 1
add = 90,0,110
mul = 256,256,256
invertall = 0
color = 256
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3404
ID = 3404
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 100
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Super Air Galick Gun]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3401
ID = 3401
name = "Super Air Galick Gun"
postype = p1
pos = 0,0
size.xscale = 1.2 
size.yscale = 1.2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 3402
ID = 3402
pos = -10,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 156
pausemovetime = 0
scale = 1,.9
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
superMoveTime = 255

[State 0, Explod]
type = Explod
trigger1 = Animelem = 5
anim = 3403
ID = 3403
pos = 30,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 100
pausemovetime = 0
scale = .63,.63
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
superMoveTime = 255

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 156
freq = 120
ampl = 6
phase = 90

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 6
value = 255,255,255
time = 3

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 5
x = -.4
y = -.4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 56
x = -.4

[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 1 || animelem = 6
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 1 || animelem = 6
value = S6,2

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,53

[State 0,GG Charge Snd]
type = PlaySnd
trigger1 = !Time
value = S6,17

[State 0,GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,16
[State 0,GG Realease Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,18

[State 0, Gravity]
type = Gravity
trigger1 = time > 156

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 156
value = 50

;----------------------------------------
;Saiyan Beat Down (Start Dash)
[StateDef 3500]
type=S
movetype=A
physics=N
poweradd=-1000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3500

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 30, 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -50
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 38
movetime = 38
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,13
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,13

[State 102, Dust]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Step Sound]
type = PlaySnd
trigger1 = animelem = 3
value = 100, 2

[State 0, VelSet]
type = VelSet
trigger1 = TIME >=42
x = 10
y = 0

[State 220, Hit]
type=hitdef
trigger1 = animelem = 3
ID = 5000
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
pausetime = 4, 12
guard.pausetime = 12, 12
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, 0
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
forcenofall = 1
kill = 0
p1stateno = 3501
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 3500, End]
type = ChangeState
trigger1 = TIME > 55
value = 101
ctrl = 1

;-----------------------------------------------
;Saiyan Beat Down Cont.(Combo)
[StateDef 3501]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3501

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4005
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 45, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3 || Animelem = 6
value = S1,1
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 10 || Animelem = 15
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= Animelem = 3
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 8), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -50
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 6
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 25), var(36) := -90
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 10
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 8), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -90
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 0, VelSet]
type = VelSet
trigger1 = time > 32
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 13
y = -4


[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 16
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 14, 14), ifelse(var(20), 70, 70)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime 
value = 3502

;-----------------------------------------------
;Saiyan Beat Down Cont.(Blast)
[StateDef 3502]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3502

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = -.6

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
y = -.6

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,20
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,20
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,20

[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 35
channel = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 1

[State 3006, Snd]
type = playsnd
trigger1 =animelem = 5
value = 6, 4

[State 730, SSJ Aura]
type = helper
trigger1 = !numhelper(6000) && var(1)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.25
size.yscale = 0.3
ownpal = 1

[State 730, Aura Snd]
type = playsnd
trigger1 = !time
value = 730,3
[State 730, Aura Snd]
type = playsnd
trigger1 = !animtime
value = 6,2

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 1253
ID = 1253
pos = -7,-135
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 38
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 1253
ID = 1253
pos = -50,-107
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 1253
ID = 1253
pos = -7,-115
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Saiyan Beat Down Blast]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3505
ID = 3555
name = "Saiyan Beat Down Blast"
postype = p1
pos = 0, -70
size.xscale = 0.2 
size.yscale = 0.2
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;----------------------------------------
;Max Saiyan Beat Down (Start Dash)
[StateDef 3550]
type=S
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3500

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -50
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 38
movetime = 38
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,13
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,13

[State 102, Dust]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Step Sound]
type = PlaySnd
trigger1 = animelem = 3
value = 100, 2

[State 0, VelSet]
type = VelSet
trigger1 = TIME >=42
x = 10
y = 0

[State 220, Hit]
type=hitdef
trigger1 = animelem = 3
ID = 5000
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
pausetime = 4, 12
guard.pausetime = 12, 12
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, 0
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
forcenofall = 1
kill = 0
p1stateno = 3551
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 3500, End]
type = ChangeState
trigger1 = TIME > 55
value = 101
ctrl = 1

;-----------------------------------------------
;Saiyan Beat Down Cont.(Combo)
[StateDef 3551]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3551

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4005
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 45, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3 || Animelem = 6
value = S1,1
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 10 || Animelem = 15
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= Animelem = 3
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 8), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -50
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 6
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 25), var(36) := -90
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 10
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 8), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -90
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 13
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 8), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -80
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 18
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 8, 8), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=65), var(36):=-65
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 0, VelSet]
type = VelSet
trigger1 = time > 40
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 20
y = -4

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 24
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 14, 14), ifelse(var(20), 70, 70)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime 
value = 3552

;-----------------------------------------------
;Saiyan Beat Down Cont.(Blast)
[StateDef 3552]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3502

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = -.6

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
y = -.6

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,20
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,20
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,20

[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 6, 35
channel = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 1

[State 3006, Snd]
type = playsnd
trigger1 = animelem = 5
value = 6, 4

[State 730, SSJ Aura]
type = helper
trigger1 = !numhelper(6000) && var(1)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.25
size.yscale = 0.3
ownpal = 1

[State 730, Aura Snd]
type = playsnd
trigger1 = !time
value = 730,3
[State 730, Aura Snd]
type = playsnd
trigger1 = !animtime
value = 6,2	

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 1253
ID = 1253
pos = -7,-135
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 38
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 1253
ID = 1253
pos = -50,-107
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 1253
ID = 1253
pos = -7,-115
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 3
pausemovetime = 0
scale = .5,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Saiyan Beat Down Blast]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3505
ID = 3555
name = "Saiyan Beat Down Blast"
postype = p1
pos = 0, -70
size.xscale = 0.2 
size.yscale = 0.2
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;----------------------------------------
;Maximum Flasher (Start Dash)
[StateDef 3600]
type=S
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3600

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 10, -50
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,38
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,38

[State 102, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Step Sound]
type = PlaySnd
trigger1 = animelem = 2
value = 100, 2

[State 0, VelSet]
type = VelSet
trigger1 = TIME >=38
x = 10
y = 0

[State 220, Hit]
type=hitdef
trigger1 = animelem = 3
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
pausetime = 4, 12
guard.pausetime = 12, 12
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, 0
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
forcenofall = 1
kill = 0
p1stateno = 3601
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 3500, End]
type = ChangeState
trigger1 = TIME > 55
value = 101
ctrl = 1

;----------------------------------------
;Maximum Flasher (Teleport)
[StateDef 3601]
type=A
movetype=A
physics=N
poweradd=0
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3601

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 3.6
y = 0

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time 
value = S6,0

[State 3500, End]
type = ChangeState
trigger1 = !Animtime
value = 3602

;----------------------------------------
;Maximum Flasher
[StateDef 3602]
type=A
movetype=A
physics=N
poweradd=0
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3602

[state 3351]
type = posadd
trigger1 = !time
x = -150+P2Dist x

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 60, 0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8511
ID = 8501
name = "Superpause FX"
posType = P1
pos = 0,0
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >44
x = .6

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
x = .4
y = -.28

[State 0, Gravity]
type = Gravity
trigger1 = TIME > 102

[State 0, VelSet]
type = VelSet
trigger1 = TIME > 102
x = .4

[State 0, MF Form Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,15
channel = 1
[State 0, MF Form Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,15
channel = 2
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 4
channel = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 4
channel = 2

[State 0, MF Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,18
[State 0, MF Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,18

[State 0, MF Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,54
[State 0, MF Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,54
[State 0, MF Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,54
[State 0, MF Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,54

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 4
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Maximum Flasher]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 3605
ID = 3605
name = "Maximum Flasher"
postype = p1
pos = 118, -58
size.xscale = 1.2 
size.yscale = 1.2
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 4
helpertype = normal ;player
name = "Maximum Flasher Hand Blast Fade"
ID = 3608
stateno = 3608 
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1
size.yscale = 1
ignorehitpause = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 50

;---------------------------------------------------------------------------
;Berserker Blast
[StateDef 3700]
type=S
movetype=A
physics=N
poweradd=-2000
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3700

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 30, 0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 3
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 60, -78
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6
[State 0, BBA Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,6

[State 0, BBA Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,5
[State 0, BBA Release Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,5

[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,49
[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,49

[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,21
[State 0, BBA Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,21

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 3001
ID = 3001
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 51
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, BBA]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 3055
ID = 3055
name = "Max BBA"
postype = p1
pos = 60, -78
size.xscale = 0.45 
size.yscale = 0.6
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 5
anim = 6028
ID = 6028
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I


[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Saiyan Rage
[StateDef 4000]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4000

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 4
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = -10, -50
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 4
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 20
y = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,41
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,41

[State 102, Dust]
type = helper
trigger1 = animelem = 6
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Step Sound]
type = PlaySnd
trigger1 = animelem = 6
value = 100, 2

[State 220, Hit]
type=hitdef
trigger1 = animelem = 6
ID = 5000
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
pausetime = 4, 12
guard.pausetime = 12, 12
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, 0
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
forcenofall = 1
kill = 0
p1stateno = 4001
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit
value = 4001

;-----------------------------------------------
;Saiyan Rage Cont.(Combo)
[StateDef 4001]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4001

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4005
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 45, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3 || Animelem = 29
value = S1,1
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 7 || Animelem = 33
value = S1,3
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 12 || Animelem = 38
value = S1,4
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 17 || Animelem = 43
value = S1,5
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 22 || Animelem = 47
value = S1,5

[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 15
value = S5,52
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 15
value = S5,52
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 15
value = S5,52

[State 220, Hit]
type=hitdef
trigger1= Animelem = 3
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 7
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=61), var(36):=-78
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 12
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=73), var(36):=-78
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 17
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=73), var(36):=-78
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 22
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 8), ifelse(var(20), 6, 8)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= Animelem = 29
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 33
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 6), ifelse(var(20), 2, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=61), var(36):=-78
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 38
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 6), ifelse(var(20), 2, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=73), var(36):=-78
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 43
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 6), ifelse(var(20), 2, 6)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=73), var(36):=-78
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 47
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*10<7, 7, fvar(11)*10)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4001
trigger1 = !AnimTime && frontedgebodydist <= 50
value = 40007
ignorehitpause=0

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 4007+(random%2)

;-----------------------------------------------
;Saiyan Rage Cont.(Gut Galick Gun)
[StateDef 4007]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4007

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 16
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4007)) && time = [64,200]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4007)) && time = 201
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = -5, 0

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S1,5

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,51
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,51
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,51

[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,6
[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,6
[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,7
[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,7

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 4012
ID = 4012
pos = 35,-55
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 100
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
superMoveTime = 255

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 5
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= Animelem = 3
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getpower = 0
givepower = 0, 0
pausetime = 8, 160
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Hard
air.animtype = Hard
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = 2,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 2,0
air.cornerPush.velOff = 0
yAccel = 0.5
kill = 0
fall = 0
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8014)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-57
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 3100, Gut Galick Gun]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 4015
ID = 4015
name = "Gut Galick Gun"
postype = p1
pos = 125, -85
size.xscale = 0.7 
size.yscale = 0.7
ownpal = 1

[State 3500, End]
type = ChangeState
triggerall = Target, Life <= 130
trigger1 = animelem = 6
value = 4003

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Saiyan Rage Cont.(Chest Blast)
[StateDef 4008]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4008

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 16
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4008)) && time = [64,164]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4008)) && time = 165
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S1,5

[State 0, Voice Snd]
type = PlaySnd
trigger1 = time = 20
value = S5,48
[State 0, Voice Snd]
type = PlaySnd
trigger1 = time = 20
value = S5,48
[State 0, Voice Snd]
type = PlaySnd
trigger1 = time = 20
value = S5,48

[State 0, BlastForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,15
channel = 1
[State 0, BlastForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,15
channel = 2
[State 0, BlastForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,7
channel = 3
[State 0, BlastForm Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,7
channel = 4

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 2
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 3
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 5
channel = 4

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 4011
ID = 4011
pos = 45,-57
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 70
pausemovetime = 0
scale = .6,.6
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
superMoveTime = 255

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 5
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= Animelem = 3
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getpower = 0
givepower = 0, 0
pausetime = 8, 160
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Hard
air.animtype = Hard
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = 2,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 2,0
air.cornerPush.velOff = 0
yAccel = 0.5
kill = 0
fall = 0
fall.recover = 0
forcestand = 1
hitsound = -1 +0*(var(31):=800)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8014)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=112), var(36):=-57
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 3100, Chest Blast]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 4016
ID = 4016
name = "Chest Blast"
postype = p1
pos = 0,0
size.xscale = 1 
size.yscale = .7
ownpal = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Saiyan Rage Cont.(Gut Galick Gun) (FronEdgeDistance)
[StateDef 40007]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=40007

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 0, Turn]
type = Turn
trigger1 = animelem = 1
[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -55

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 16
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4001)) && time = [64,200]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4001)) && time = 201
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = -5, 0

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S1,5

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,51
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,51
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,51

[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,6
[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,6
[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,7
[State 0, GGForm Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,7

[State 0, Explod]
type = Explod
trigger1 = animelem = 9
anim = 4012
ID = 4012
pos = 35,-55
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 100
pausemovetime = 0
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
superMoveTime = 255

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 10
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= Animelem = 8
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getpower = 0
givepower = 0, 0
pausetime = 8, 160
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Hard
air.animtype = Hard
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = 2,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 2,0
air.cornerPush.velOff = 0
yAccel = 0.5
kill = 0
fall = 0
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8014)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-57
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 3100, Gut Galick Gun]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 4015
ID = 4015
name = "Gut Galick Gun"
postype = p1
pos = 125, -85
size.xscale = 0.7 
size.yscale = 0.7
ownpal = 1

[State 3500, End]
type = ChangeState
triggerall = Target, Life <= 130
trigger1 = animelem = 11
value = 4003

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Dirty Fireworks Cont.(FireWorks)
[StateDef 4003]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4006

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 0, Pause]
type = Pause
trigger1 = !Time
time = 68
movetime = 68

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4003)) && time = [1,71]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4003)) && time = 72
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = movehit
anim = 4003
ID = 4003
pos = 0,-35
postype = p2  ;p2,front,back,left,right
removetime = 59
bindtime = 1
scale = .8,.8
sprpriority = 0
ontop = 1
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 730, Ki Aura]
type = helper
trigger1 = !numhelper(6000) && !var(1)
stateno = 6000;ifelse(var(1),6002,6000)
ID = 6000
name = "Ki Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.4
size.yscale = 0.5
ownpal = 1

[State 730, Aura Snd]
type = playsnd
trigger1 = !time
value = 730,3

[State 730, Aura Snd]
type = playsnd
trigger1 = !animtime
value = 6,2

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,50
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,50

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<20 || var(20))
trigger1= !Time
attr = A,SA
hitflag = MAFD
guardflag = MAF
damage = ceil(ifelse(fvar(11)*150<75, 75, fvar(11)*150)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 50, 50), ifelse(var(20), 50, 50)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.86, -12.52
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -2.39, -8.65
air.cornerPush.velOff = 0
air.fall = 1
fall = 1
kill = 1
fall.recover = 0
hitsound = S6,11
;guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0 * (var(33) := 8010)
;guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -900
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-------------------------------
;TARGET
[Statedef 4005]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 4105, Pos]
type = posset
trigger1 = 1
y = 0
[State 4105, fall]
type = hitfallset
trigger1 = 1
value = 0
[State 4105, End]
type = selfstate
trigger1 = 1
value = 5000

;-----------------------------------------------------
;Final Flash (Kick)
[StateDef 4100]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4101

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 0, -25
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 0, SuperPause Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !TIME
time = 40
moveTime = 40 
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S5,40 
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S5,40 
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S5,40 

[State 200, Hit]
type = hitdef
trigger1 = !(var(16)) && (var(15) < 20 || var(20))
trigger1 = Animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 50 < 50, 50, fvar(11) * 50)), 8
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 18, 20), ifelse(var(20), 18, 20)
guard.pausetime = ifelse(var(20), 12, 8), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.41, -4.49), -10
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -3.31, -9.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recovertime = 120
kill = 0
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2stateno = 8850
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4100
trigger1=movehit && frontedgebodydist <= 50
value = 4115
ignorehitpause=0

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4100
trigger1=movehit
value = 4110
ignorehitpause=0

[State 3500, End]
type = ChangeState
trigger1 = !animTime
value = 0
ctrl = 1

;-----------------------------------------------------
;Final Flash
[StateDef 4110]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4110

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 150, 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(1)=-4
time = 64
add = -255, -255, -255
sinadd = 0, 0, 0, 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(1)>=0 && animelemtime(3)<0
time = 125
add = -255, -255, -255
sinadd = 0, 0, 0, 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(3)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 3

[State 4210, width]
type = width
trigger1 = 1
value = floor(40 * const(size.xscale))

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 3
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 63, -70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 0, Final FLash Snd]
type = PlaySnd
trigger1 = time = 50
value = S5,42
[State 0, Final FLash Snd]
type = PlaySnd
trigger1 = time = 50
value = S5,42

[State 0, SuperPause Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S8500,1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 3
time = 85
moveTime = 85 
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 730, SSJ Aura]
type = helper
trigger1 = Animelem = 2 && !numhelper(6000) && var(1)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.25
size.yscale = 0.33
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 4103
ID = 4103
pos = 50,-200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
SuperMoveTime = 255
scale = 1,1
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
trans = add

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3000, Final Flash Form]
type = helper
trigger1 = time = 70
helpertype = normal
stateno = 4102
ID = 4102
name = "Final Flash Form"
postype = p1
pos = 50, -74
SuperMoveTime = 255
size.xscale = 7 
size.yscale = 7
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,15
channel = 1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,15
channel = 2

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 4
channel = 1
ignorehitpause = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 4
channel = 2
ignorehitpause = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 4
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Final Flash Beam]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 4103
ID = 4103
name = "Final Flash Beam"
postype = p1
pos = 0,0
size.xscale = 2
size.yscale = 1.4
ownpal = 1
ignorehitpause = 1

[State 0, Final Flash Head Beam]
type = Explod
trigger1 = animelem = 4
anim = 4111
ID = 4111
pos = 40,-75
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = 120
pausemovetime = 0
scale = .6,.6
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 4
anim = 6028
ID = 6028
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.5,0.5
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,2

[State 3500, End]
type = ChangeState
triggerall = Target, Life <= 130
trigger1 = animelem = 5
value = 4150

[State -2,screen]
type=ChangeState
triggerall=!animtime
triggerall=Movetype != H && Stateno != 7827
trigger1=BackEdgeDist < -10 -const(size.ground.front)-const(size.ground.back)
trigger1=StateType != A
value=7827

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------------
;Final Flash If on Edge of Screen
[StateDef 4115]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4115

[state 3351]
type = posadd
trigger1 = animelem = 6
x = -250+P2Dist x

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(10)=-4
time = 64
add = -255, -255, -255
sinadd = 0, 0, 0, 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(10)>=0 && animelemtime(12)<0
time = 125
add = -255, -255, -255
sinadd = 0, 0, 0, 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(12)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 3

[State 4210, width]
type = width
trigger1 = 1
value = floor(40 * const(size.xscale))

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 12
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 63, -70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 0, Final FLash Snd]
type = PlaySnd
trigger1 = time = 50
value = S5,42
[State 0, Final FLash Snd]
type = PlaySnd
trigger1 = time = 50
value = S5,42

[State 0, SuperPause Snd]
type = PlaySnd
trigger1 = animelem = 12
value = S8500,1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 12
time = 85
moveTime = 85 
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 730, SSJ Aura]
type = helper
trigger1 = Animelem = 11 && !numhelper(6000) && var(1)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.25
size.yscale = 0.33
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 12
anim = 4103
ID = 4103
pos = 50,-200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
SuperMoveTime = 255
scale = 1,1
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1
trans = add

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3000, Final Flash Form]
type = helper
trigger1 = time = 70
helpertype = normal
stateno = 4102
ID = 4102
name = "Final Flash Form"
postype = p1
pos = 50, -74
SuperMoveTime = 255
size.xscale = 7 
size.yscale = 7
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = S6,15
channel = 1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = S6,15
channel = 2

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 13
channel = 1
ignorehitpause = 1
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 13
channel = 2
ignorehitpause = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 13
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 3000, Final Flash Beam]
type = helper
trigger1 = animelem = 13
helpertype = normal
stateno = 4103
ID = 4103
name = "Final Flash Beam"
postype = p1
pos = 0,0
size.xscale = 2
size.yscale = 1.4
ownpal = 1
ignorehitpause = 1

[State 0, Final Flash Head Beam]
type = Explod
trigger1 = animelem = 13
anim = 4111
ID = 4111
pos = 40,-75
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = 120
pausemovetime = 0
scale = .6,.6
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 13
anim = 6028
ID = 6028
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.5,0.5
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 11
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 11
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 15
value = S6,2
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 15
value = S6,2

[State 3500, End]
type = ChangeState
triggerall = Target, Life <= 130
trigger1 = animelem = 14
value = 4150

[State -2,screen]
type=ChangeState
triggerall=!animtime
triggerall=Movetype != H && Stateno != 7827
trigger1=BackEdgeDist < -10 -const(size.ground.front)-const(size.ground.back)
trigger1=StateType != A
value=7827

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------------
;Final Flash Super Punch!
[StateDef 4150]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4150

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(1)=-4
time = 64
add = -255, -255, -255
sinadd = 0, 0, 0, 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(1)>=0 && animelemtime(6)<0
time = 64
add = -255, -255, -255
sinadd = 0, 0, 0, 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(6)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 730, SSJ Aura]
type = helper
trigger1 = animelem = 4
stateno = 6008
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.36
size.yscale = 0.3
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 78
moveTime = 78
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 0, You Weakling Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,43

[state 3351]
type = posadd
trigger1 = !Time
x = -75+P2Dist x
y = 0+P2Dist y

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
x = .6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,2

[State 0, Explod]
type = Explod
trigger1 = Animelem = 6
anim = 4151
ID = 4151
pos = 50,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 15
supermovetime = 255
scale = 1,1
sprpriority = 3
ontop = 1
ownpal = 1
removeongethit = 1

[State 205, Pause]
type = Pause
trigger1 = movehit
time = 2
movetime = 1
anim = -1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 130 < 130, 130, (fvar(12)) * 130)), 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 25, 27), ifelse(var(20), 25, 27)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -12, -6
air.velocity = -12, -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=3200)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -55
envshake.time = 18
envshake.freq = 220
envshake.ampl = 12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 1504
ctrl = 0

;-----------------------------------------------
;Final Shine Attack Start
[StateDef 4200]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4200

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 0, -50
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 3
x = 20
y = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,59
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,59
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,59

[State 102, Dust]
type = helper
trigger1 = animelem = 3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Step Sound]
type = PlaySnd
trigger1 = animelem = 3
value = 100, 2

[State 220, Hit]
type=hitdef
trigger1 = animelem = 3
ID = 5000
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
pausetime = 4, 12
guard.pausetime = 12, 12
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, 0
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
forcenofall = 1
kill = 0
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit
value = 4206

;---------------------------------------------------------------------------
;Final Shine Attack 1
[Statedef 4206]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=4206

[State 0,  Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3

[State 0, Explod]
type = Explod
trigger1 = movehit  
anim = 4210
ID = 4210
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 0
vel = 0,0
accel = 0,0
random = 0,0
removetime = 20
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1502
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -12, -5
air.velocity = -12, -5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4206
trigger1=movehit && p2stateno = 1111303
value = 4207

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;Final Shine Attack 2
[Statedef 4207]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=4207

[state 1001]
type = posadd
trigger1 = animelem = 1
x = P2Dist X +75
y = p2Dist y -40

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0,  Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3

[State 0, Explod]
type = Explod
trigger1 = movehit 
anim = 4211
ID = 4211
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 0
vel = 0,0
accel = 0,0
random = 0,0
removetime = 20
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1502
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -12, -5
air.velocity = -12, -5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=60), var(36):=-55
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4207
trigger1=movehit && p2stateno = 1111303
value = 4208

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;Final Shine Attack 3
[Statedef 4208]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=4208

[state 1001]
type = posadd
trigger1 = animelem = 1
x = P2Dist X +75
y = p2Dist y -40

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0,  Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S1,3

[State 0, Explod]
type = Explod
trigger1 = movehit
anim = 4212
ID = 4212
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 0
vel = 0,0
accel = 0,0
random = 0,0
removetime = 20
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1502
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 8), ifelse(var(20), 2, 8)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -12, -6
air.velocity = -12, -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=60), var(36):=-75
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (var(29))
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
ignoreHitPause = 1

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1502) && var(14) < 3
trigger1 = (target(1502), stateno = 5000) || (target(1502), stateno = 5010) || (target(1502), stateno = 5020)
value = 1111300
ID = 1502
ignorehitpause = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4208
trigger1=movehit && p2stateno = 1111303
value = 4209

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;-----------------------------------------------
;Final Shine Attack
[StateDef 4209]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 4200, Anim]
type=changeanim
trigger1=!time
value=4209

[state 1001]
type = posset
trigger1 = animelem = 1
y = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 1
x = P2Dist X -255

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 3000, Superpause]
type = superpause
trigger1 = !Time
time = 94
movetime = 94
p2defmul = 1
unhittable = 1
anim = -1
sound = -1;s8500,3
darken = 0

[State 0, SuperPause PlaySnd]
type = PlaySnd
trigger1 = time = 44
value = S8500,1

[State 0, !!!!!]
type = PlaySnd
trigger1 = animelem = 4
value = S6,33
[State 0, !!!!!]
type = PlaySnd
trigger1 = animelem = 4
value = S6,33
[State 0, !!!!!]
type = PlaySnd
trigger1 = animelem = 4
value = S6,33

[State 0, SSJ Aura]
type = PlaySnd
trigger1 = animelem = 4
value = S6,2
[State 0, SSJ Aura]
type = PlaySnd
trigger1 = animelem = 4
value = S6,2

[State 0, SSJ Aura End]
type = PlaySnd
trigger1 = !animtime
value = S6,2
[State 0, SSJ Aura End]
type = PlaySnd
trigger1 = !animtime
value = S6,2

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 6
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4209)) && time = [64,188]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4209)) && time = 189
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = time = 44
stateno = 8520
ID = 8520
name = "Superpause FX"
postype = p1
pos = -30, -33
facing = facing
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 730, SSJ Aura]
type = helper
triggerall = animelem = 4
trigger1 = !numhelper(6000) && var(1)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.27
size.yscale = 0.33
ownpal = 1

;[State 0, Green Body Explod]
type = Explod
trigger1 = animelem = 4
anim = 4204
ID = 4204
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 58
supermovetime = 255
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 7
anim = 6029
ID = 6029
pos = 22,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = 44
scale = .4,.4
sprpriority = 3
ownpal = 1
removeongethit = 1

[State 4200, Final Shine Attack]
type = helper
trigger1 = animelem = 7
stateno = 4203
ID = 4203
name = "Final Shine Attack"
postype = p1
pos = 42,-93
facing = 1
supermovetime = 255
size.xscale = 1.3
size.yscale = 1.3
ownpal = 1
ignorehitpause = 1

[State 4200, Final Shine Attack Head]
type = helper
trigger1 = animelem = 7
stateno = 4202
ID = 4202
name = "Final Shine Attack Head"
postype = p1
pos = 42,-93
facing = 1
supermovetime = 255
ownpal = 1
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 4201
ID = 4201
pos = -30,-33
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
supermovetime = 255
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 5
id = 4201 

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 7
time = 70
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 0, Get A Load Of This]
type = PlaySnd
trigger1 = Animelem = 4
value = S5,60
[State 0, Get A Load Of This]
type = PlaySnd
trigger1 = Animelem = 4
value = S5,60
[State 0, Get A Load Of This]
type = PlaySnd
trigger1 = Animelem = 4
value = S5,60
[State 0, Final Shine Attack Yell]
type = PlaySnd
trigger1 = Animelem = 7
value = S5,61
[State 0, Final Shine Attack Yell]
type = PlaySnd
trigger1 = Animelem = 7
value = S5,61
[State 0, Final Shine Attack Yell]
type = PlaySnd
trigger1 = Animelem = 7
value = S5,61

[State 0, Final Shine Release]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,28
[State 0, Final Shine Release]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,28
[State 0, Final Shine Release]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,29
[State 0, Final Shine Release]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,29
[State 0, Final Shine Release]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,30
[State 0, Final Shine Release]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,31

[State 4200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;SSJ Transform
[StateDef 4500]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -1000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4500

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause]
type = superpause
trigger1 = !time
time = 74
movetime = 74
p2defmul = 1
unhittable = 1
anim = -1
sound = -1;s8500,3
darken = 0

[State 3000, Superpause FX]
type = helper
trigger1 = !Time
stateno = 8520
ID = 8520
name = "Superpause FX"
postype = p1
pos = 0, -45
facing = facing
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 0, SuperPause PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S8500,1

[State 0, Wind Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,24
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,1
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,1
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,1
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,2
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,2
[State 0, Power Acend Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,37

[State 0, SSJ Energy]
type = Explod
trigger1 = !time
anim = 4508
ID = 4508
pos = 0,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 255
scale = .28,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S730,2
channel = 1
loop = 1
pan = 0
persistent = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 8
channel = 1

[State 0, Palfx]
type = Palfx
trigger1 = animelem = 6
time = 15
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 4512
ID = 4512
pos = 0,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = 38
supermovetime = 255
scale = .85,.85
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 191:    Energy Outburst]
type            = Explod
trigger1        = animelem = 6
anim            = 7022
ID              = 7021
pos             = 0,-20
postype         = p1
facing          = -1
vfacing         = 1
bindtime        = 1
vel             = 0,0
accel           = 0,0
random          = 0,0
removetime      = 14
supermove       = -1
supermovetime = 255
scale           = 1, 1
sprpriority     = 5
ontop           = 0
shadow          = 0,0,0
ownpal          = 1
removeongethit  = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 6
helpertype = normal ;player
name = "SSJ Transform Aura"
ID = 4505
stateno = 4505 
pos = 0,0
scale = 5,.5
supermovetime = 255
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 6
helpertype = normal ;player
name = "SSJ Transform Aura2"
ID = 4506
stateno = 4506 
pos = 3,-50
scale = 1,1.2
supermovetime = 255
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 6
value = 255,255,255
time = 3
[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 6
time = 34
freq = 60
ampl = -4
phase = 90

[State 0, Explod]
type = Explod
trigger1 = animelem = 6 
anim = 4504
ID = 4502
pos = 0,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 21
supermovetime = 255
scale = .6,.9
ontop = 0
ownpal = 1
removeongethit = 1

[state ssj2mode]
type = varset
trigger1 = animelem = 6
v = 1
value = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;SSJ Transform Very Quick
[StateDef 4502]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -1000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4507

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 0, Palfx]
type = Palfx
trigger1 = animelem = 1
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 0, Wind Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,24
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,0
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,0
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,2
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,2
[State 0, Power Acend Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,37

[State 0, Helper]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "SSJ Transform Aura"
ID = 4505
stateno = 4505 
pos = 0,0
scale = 5,.5
supermovetime = 255
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 10
freq = 60
ampl = -4
phase = 90

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 4504
ID = 4502
pos = 0,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
pausemovetime = 0
scale = .5,.7
ontop = 0
ownpal = 1
removeongethit = 1

[State 191:    Energy Outburst]
type            = Explod
trigger1        = animelem = 1
anim            = 7022
ID              = 7021
pos             = 0,-30
postype         = p1
facing          = -1
vfacing         = 1
bindtime        = 1
vel             = 0,0
accel           = 0,0
random          = 0,0
removetime      = 14
supermove       = -1
pausemovetime   = -1
scale           = .8, .8
sprpriority     = 5
ontop           = 0
shadow          = 0,0,0
ownpal          = 1
removeongethit  = 1

[state ssj2mode]
type = varset
trigger1 = animelem = 1
v = 1
value = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Detransform
[StateDef 4501]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd =0
faceP2 = 1 

[State 0, Hair Deform]
type = Explod
trigger1 = !Time
anim = 4503
ID = 4503
pos = -3,-53
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
pausemovetime = 0
scale = .48,.7
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, Detransform Snd]
type = PlaySnd
trigger1 = !Time
value = S6,26

[state ssj2mode]
type = varset
trigger1 = !Time
v = 1
value = 0

[State 3500, End]
type = ChangeState
trigger1 = time = 1
value = 0
ctrl = 1

;---------------------------------------------------------------------------
[StateDef 7004]
type = S
physics = S
ctrl = 0
anim = 7004
sprpriority = 5

[state 0]
type = bindtoroot
trigger1 = 1
pos = 0,0

[State 0]
type = AngleDraw
trigger1 = 1
scale = 1,1

[State 0]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 100,256

[State 0]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0]
type = Helper
triggerall = root,stateno != 5110
triggerall = root,stateno != 5150
trigger1 = timemod = 10,0
helpertype = normal
name = "Effect"
ID = 7005
stateno = 7005
pos = 0+random%30-random%30,50-random%25
postype = p1
size.xscale = 0.66
size.yscale = 0.33
supermovetime = 9999

[State 0]
type = Helper
triggerall = root,stateno = 5110 || root,stateno = 5150
trigger1 = timemod = 10,0
helpertype = normal
name = "Effect"
ID = 7006
stateno = 7006
pos = 0+random%60-random%60,50-random%10
postype = p1
size.xscale = 0.66
size.yscale = 0.33
supermovetime = 9999

[State 0]
type = Destroyself
trigger1 = root,var(1) < 1
;---------------------------------------------------------------------------
[StateDef 7005]
type = S
physics = S
ctrl = 0
anim = 7005
velset = 0+random%3-random%3,-3
sprpriority = 5

[State 0]
type = AngleDraw
trigger1 = 1
scale = 1,1

[State 0]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 50-(time*1),256

[State 0]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0]
type = Destroyself
trigger1 = Time = 50
;---------------------------------------------------------------------------
[StateDef 7006]
type = S
physics = S
ctrl = 0
anim = 7005
velset = 0+random%3-random%3,-1
sprpriority = 5

[State 0]
type = AngleDraw
trigger1 = 1
scale = 1,1

[State 0]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 50-(time*1),256

[State 0]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0]
type = Destroyself
trigger1 = Time = 50
;---------------------------------------------------------------------------

; Omega Galick Gun
[Statedef 4400]
type = S
physics = N
movetype = I
anim = 4400
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
;
;[State 700, Snd]
;type = playsnd
;trigger1 = TIME!
;value = 5,0

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 4,2
CHANNEL = 1
;
;[State 700, Snd]
;type = playsnd
;trigger1 = animelem = 6
;value = 4,0
;CHANNEL = 1

[State 710, End]
type = changestate
trigger1 = (partner,stateno = 4402 && partner, time >=11) || partner, stateno != [4400,4409]
value = 4401
ctrl = 0

;
[Statedef 4401]
type = S
physics = N
movetype = I
anim = 4401
ctrl = 0
velset = 0, 0
sprpriority = 1

[state -2, Continue Palette]
type = remappal
trigger1= 1
source = 1, 1
dest = 1, var(11)+100
ignorehitpause = 1

[State 0, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 0, PosSet]
type = PosSet
trigger1 = !time && partner, stateno = [4400,4409]
x = partner, pos x ;+ 10*facing

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
;
;[State 700, Snd]
;type = playsnd
;trigger1 = TIME!
;value = 5,0

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 4,2
CHANNEL = 1
;
;[State 700, Snd]
;type = playsnd
;trigger1 = animelem = 6
;value = 4,0
;CHANNEL = 1

[State 710, End]
type = changestate
trigger1 = partner, stateno = 4403 || partner, stateno != [4400,4409]
value = ifelse((partner, stateno != [4400,4409]),0,4402)
ctrl = ifelse((partner, stateno != [4400,4409]),1,0)

; 
[StateDef 4402]
type=S
movetype=A
physics=N
poweradd=0
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=4402

[State 730, SSJ Aura]
type = helper
trigger1 = !numhelper(6000)
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.25
size.yscale = 0.33
ownpal = 1

[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,52
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,52
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,52
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,52
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,52
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = !time
value = S5,52

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 7

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
var(17) = 40

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = partner, numhelper(8522)
stateNo = 8521
ID = 8500
name = "Superpause FX"
posType = P1
pos = 5, -74
superMoveTime = 255
size.xScale = 1
size.yScale = 1
persistent = 0
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 108
moveTime = 108
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, GG Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,7
[State 0, GG Form Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,7

[State 0, GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,4
[State 0, GG Release Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,4
 
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 70
value = S5,53
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 70
value = S5,53
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 70
value = S5,53
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 70
value = S5,53
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 70
value = S5,53
[State 0, GG Voice Snd]
type = PlaySnd
trigger1 = Time = 70
value = S5,53

[State 3000, Galick Gun Form]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 3201
ID = 3201
name = "Galick Gun Form"
postype = p1
pos = 5, -75
supermovetime = 255
size.xscale = 0.33 
size.yscale = 0.33
ownpal = 1

[state -2, Continue Palette]
type = remappal
trigger1= time = 240
source = 1, 1
dest = 1, var(11)+100*var(1)
ignorehitpause = 1

[State 3000, Max Galick Gun]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3255
ID = 3299
name = "Max Galick Gun"
postype = p1
pos = 60, 15
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1
;
;[State 3000, Galick Gun Hand]
;type = helper
;trigger1 = Time = 47
;helpertype = normal
;stateno = 3202
;ID = 3202
;name = "Galick Gun Hand"
;postype = p1
;pos = 30, -53
;size.xscale = 0.7
;size.yscale = .75
;ownpal = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
