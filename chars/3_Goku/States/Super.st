; ________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Ground Kame (Base)
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
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -25, -55
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 47
movetime = 47
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3000, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S8500,0

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 3016
ID = 3016
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

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 3003
ID = 3003
pos = 83, 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 44
pausemovetime = 0
scale = .8,.8
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Kame]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3005
ID = 3005
name = "Kame"
postype = p1
pos = 60, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 3000 && animelemtime(5)=0
trigger1 = command = "holdup"
trigger2 = var(59)>=1 && anim = 3000 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y>=-60) && (p2bodydist x=[20,0])
value = 3100

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------------
;Ground SSJ2 Kame
[Statedef 3020]
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
value=133010

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -25, -55
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 47
movetime = 47
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3000, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S8500,0

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 3016
ID = 3016
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

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Kame Wave]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3022
ID = 3022
name = " SSJ2 Kame Wave"
postype = p1
pos = 50, -66
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 133010 && animelemtime(5)=0
trigger1 = command = "holdup"
trigger2 = var(59)>=1 && anim = 133010 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y>=-60) && (p2bodydist x=[20,0])
value = 3110

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3021

;-----------------------------------------------------
;Ground SSJ2 Kame End
[Statedef 3021]
type=S
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
value=133011

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Air Kame (Base)
[Statedef 3030]
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
value=3050

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -25, -83
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 47
movetime = 47
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3000, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S8500,0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 48
x = -.3

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -83
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 6
anim = 3003
ID = 3003
pos = 73, -18
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 44
pausemovetime = 0
scale = .8,.8
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Kame]
type = helper
triggerall = var(1) = 0
trigger1 = animelem = 6
helpertype = normal
stateno = 3005
ID = 3005
name = "Kame"
postype = p1
pos = 60, -18
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Kame Wave]
type = helper
triggerall = var(1) = 1
trigger1 = animelem = 6
helpertype = normal
stateno = 3010
ID = 3010
name = " SSJ2 Kame Wave"
postype = p1
pos = 75, -73
size.xscale = 0.8 
size.yscale = 0.5
ownpal = 1

[State 3000, SSJ Teleport PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = command = "up" && Time < 13
value = S6,0
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 6
value = S5,34
[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 6
value = S5,34

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 3050 && animelemtime(5)=0
trigger1 = command = "holddown"
trigger2 = AILevel && NumEnemy
trigger2 = var(59)>=1 && anim = 3050 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y<=0) && (p2bodydist x=[0,150])
value = 3035

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;Air Kame Down (Base)
[Statedef 3035]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3100, Anim]
type=changeanim
trigger1=!time
value=3055

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, Kame Down Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3134
ID = 3134
name = "Kame Down Head"
postype = p1
pos = 0, 0
size.xscale = 0.75 
size.yscale = 0.75
ownpal = 1

[State 3100, Kame Down Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3136
ID = 3136
name = "Kame Down Head FX"
postype = p1
pos = 0, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1
[State 3100, Kame Down Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3136
ID = 3136
name = "Kame Down Head FX"
postype = p1
pos = 0, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3100, Kame Down Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3135
ID = 3135
name = "Kame Down Blast"
postype = p1
pos = 10, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 1
x = -1
y = -1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;SSJ2 Air Kame
[Statedef 3036]
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
value=3051

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -25, -83
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 47
movetime = 47
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3000, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S8500,0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 48
x = -.3

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -83
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 3000, Kame Wave]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3025
ID = 3025
name = " SSJ2 Kame Wave"
postype = p1
pos = 45, -85
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,19
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 3051 && animelemtime(5)=0
trigger1 = command = "holddown"
trigger2 = AILevel && NumEnemy
trigger2 = var(59)>=1 && anim = 3050 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y<=0) && (p2bodydist x=[0,150])
value = 3037

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;SSJ2 Air Kame Down 
[Statedef 3037]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3100, Anim]
type=changeanim
trigger1=!time
value=3056

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, Kame Down Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3138
ID = 3138
name = "SSJ2 Kame Down Wave"
postype = p1
pos = 45, -60
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 1
x = -1
y = -1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;------------------------------------------
;Max Air Kame (Base)
[Statedef 3040]
type=A
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
value=3050

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3050, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -83
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 48
x = -.3

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6010;ifelse(var(1),6002,6000)
ID = 6000
name = "Air Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.6
size.yscale = 0.45
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 907
ID = 907
pos = -5,-10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 65535
supermovetime = 65535
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = -8,-20
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -83
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
triggerall = var(1) = 0
trigger1 = animelem = 6
anim = 3004
ID = 3004
pos = 78, -10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 51
pausemovetime = 0
scale = .9,.9
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Kame]
type = helper
triggerall = var(1) = 0
trigger1 = animelem = 6
helpertype = normal
stateno = 3015
ID = 3055
name = "Max Kame"
postype = p1
pos = 53, -8
size.xscale = 0.9 
size.yscale = 0.9
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Kame Wave]
type = helper
triggerall = var(1) = 1
trigger1 = animelem = 6
helpertype = normal
stateno = 3010
ID = 3010
name = " SSJ2 Kame Wave"
postype = p1
pos = 75, -73
size.xscale = 0.8 
size.yscale = 0.5
ownpal = 1

[State 3000, SSJ Teleport PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = command = "up" && Time < 13
value = S6,0
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 6
value = S5,34
[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = animelem = 6
value = S5,34

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 3050 && animelemtime(5)=0
trigger1 = command = "holddown"
trigger2 = AILevel && NumEnemy
trigger2 = var(59)>=1 && anim = 3050 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y<=0) && (p2bodydist x=[20,0])
value = 3045

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;------------------------------------------
;SSJ2 Max Air Kame 
[Statedef 3041]
type=A
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
value=3051

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -83
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 48
x = -.3

[State 730, SSJ Aura]
type = helper
trigger1 = !numhelper(6000) && var(1)
stateno = 6009
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.3
size.yscale = 0.33
ownpal = 1

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -83
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Kame Wave]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3042
ID = 3042
name = " SSJ2 Max Kame Wave"
postype = p1
pos = 45, -85
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3000, SSJ Teleport PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = command = "up" && Time < 13
value = S6,0
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 3051 && animelemtime(5)=0
trigger1 = command = "holddown"
trigger2 = AILevel && NumEnemy
trigger2 = var(59)>=1 && anim = 3050 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y<=0) && (p2bodydist x=[20,0])
value = 3046

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;Max Air Kame Down (Base)
[Statedef 3045]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3100, Anim]
type=changeanim
trigger1=!time
value=3055

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 1
x = -1
y = -1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6010;ifelse(var(1),6002,6000)
ID = 6000
name = "Air Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.6
size.yscale = 0.45
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = -8,-20
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 3100, Kame Down Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3144
ID = 3144
name = "Max Air Kame Down Head"
postype = p1
pos = 0, 0
size.xscale = 0.75 
size.yscale = 0.75
ownpal = 1

[State 3100, Kame Down Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3146
ID = 3146
name = "Max Air Kame Down Head FX"
postype = p1
pos = 0, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1
[State 3100, Kame Down Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3146
ID = 3146
name = "Max Air Kame Down Head FX"
postype = p1
pos = 0, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3100, Kame Down Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3145
ID = 3145
name = "Max Air Kame Down Blast"
postype = p1
pos = 10, 0
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 1
x = -1
y = -1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;SSJ2 Max Air Kame Down 
[Statedef 3046]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3100, Anim]
type=changeanim
trigger1=!time
value=3056

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, Kame Down Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3148
ID = 3148
name = "SSJ2 Kame Down Wave"
postype = p1
pos = 45, -60
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time > 1
x = -1
y = -1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;---------------------------------------------------------------------------
;Ground Max Super Kame (Base)
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
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3050, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.53
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 65535
supermovetime = 65535
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = .6
size.yScale = .6
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 3016
ID = 3016
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

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 3004
ID = 3004
pos = 86, 10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 51
pausemovetime = 0
scale = .9,.9
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Kame]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3015
ID = 3015
name = "Max Kame"
postype = p1
pos = 53, 9
size.xscale = 0.9 
size.yscale = 0.9
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
ownpal = 1
scale = 1,1
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
ownpal = 1
scale = 1,1
ontop = 1

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 3000 && animelemtime(5)=0
trigger1 = command = "holdup"
trigger2 = var(59)>=1 && anim = 3000 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y<=-60) && (p2bodydist x=[20,140])
value = 3150

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------------
;Ground Max SSJ2 Kame
[Statedef 3060]
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
value=133010

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(6) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

[State 3050, width]
type = width
trigger1 = animelemtime(6) = 0
value = 40, 0

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
trigger1 = animelem = 4
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 0.5
size.yScale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 3016
ID = 3016
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

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

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
size.xscale = 0.3
size.yscale = 0.33
ownpal = 1

[State 3000, Kame Wave]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3024
ID = 3024
name = " SSJ2 Kame Wave"
postype = p1
pos = 50, -66
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 55, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = .8,.8
ontop = 1

[state 1215, Change to up Kmh]
type = ChangeState
trigger1 = var(59)<=0 && anim = 133010 && animelemtime(5)=0
trigger1 = command = "holdup"
trigger2 = var(59)>=1 && anim = 133010 && animelemtime(5)=0
trigger2 = numenemy && (p2dist y>=-60) && (p2bodydist x=[20,0])
value = 3160

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3021

;---------------------------------------------------------------------------
;Ground Kame Up (Base)
[Statedef 3100]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3100, Anim]
type=changeanim
trigger1=!time
value=3100

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[state 3100,Posset]
type=posset
trigger1=!time
y=0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 2
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3104
ID = 3104
name = "Kame Head"
postype = p1
pos = 115, -83
size.xscale = 0.75 
size.yscale = 0.75
ownpal = 1

[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3106
ID = 3106
name = "Kame Up Head FX"
postype = p1
pos = 50, -110
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1
[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3106
ID = 3106
name = "Kame Up Head FX"
postype = p1
pos = 50, -110
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3100, Kame Up Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3105
ID = 3105
name = "Kame Up Blast"
postype = p1
pos = 125, -85
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Ground SSJ2 Kame Up
[Statedef 3110]
type=S
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
value=3110

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[state 3100,Posset]
type=posset
trigger1=!time
y=0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 40, 0

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 2
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3109
ID = 3109
name = "Kame Up Head FX"
postype = p1
pos = 65, -100
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3100, Kame Up Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3122
ID = 3122
name = "Kame Up Blast"
postype = p1
pos = 70, -100
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3111

;-----------------------------------------------------
;Ground SSJ2 Kame Up End
[Statedef 3111]
type=S
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
value=3111

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Ground Max Kame Up (Base)
[StateDef 3150]
type=S
movetype=A
physics=N
poweradd=0
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3150, Anim]
type=changeanim
trigger1=!time
value=3100

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[state 3150,Posset]
type=posset
trigger1=!time
y=0

[State 3150, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 2
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.53
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 65535
supermovetime = 65535
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ownpal = 1
removeongethit = 1

[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3104
ID = 3104
name = "Kame Head"
postype = p1
pos = 115, -83
size.xscale = 0.75 
size.yscale = 0.75
ownpal = 1

[State 3150, Super Kame Up Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3107
ID = 3155
name = "Super Kame Up Blast"
postype = p1
pos = 135, -85
size.xscale = .9
size.yscale = .9
ownpal = 1

[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3106
ID = 3106
name = "Kame Up Head FX"
postype = p1
pos = 50, -110
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1
[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3106
ID = 3106
name = "Kame Up FX"
postype = p1
pos = 50, -110
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3150, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3150, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3150, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Ground SSJ2 Max Kame Up
[Statedef 3160]
type=S
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
value=3110

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[state 3100,Posset]
type=posset
trigger1=!time
y=0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = animelemtime(2) = 0
value = 40, 0 

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 2
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 730, SSJ Aura]
type = helper
trigger1 = !time
stateno = 6002
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.3
size.yscale = 0.33
ownpal = 1

[State 3100, Kame Up Head FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3109
ID = 3109
name = "Kame Up Head FX"
postype = p1
pos = 65, -100
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 3100, Kame Up Blast]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3124
ID = 3124
name = "Kame Up Blast"
postype = p1
pos = 70, -100
size.xscale = 0.8 
size.yscale = 0.8
ownpal = 1

[State 0, DUSTO]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3
ownpal = 1

[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6
[State 3100, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,6

[State 3100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3111

;-----------------------------------------------------
;Ground SSJ2 Max Kame Up End
[Statedef 3161]
type=S
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
value=3111

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Super Kaioken Attack (Start)
[Statedef 3200]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3200

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(20) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, Superpause FX]
type = helper
trigger1 = animelem = 2
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -45
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = anim = 101 && !Time
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 42
movetime = 42
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S8500,0

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 20
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 20
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(2) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = animelem = 2
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !numhelper(6000) && !var(1) 
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = .45
size.yscale = .5
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = !time
value = 5,54
[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = !time
value = 5,54
[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = !time
value = 5,54

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 20
x = 20

[State 220, Hit]
type=hitdef
trigger1 = !Time
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
p1stateno = 3210
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

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

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 101

;-----------------------------------------
;Super Kaioken Attack 1
[Statedef 3210]
type=S
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
value=3210

[State 3000, width]
type = width
trigger1 = Time > 0
value = 0, 0

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 40, 0
ID = 5000
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6004
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4

[State 3200, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,4

[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7

[State 205, Pause]
type = Pause
trigger1 = movehit
time = 2
movetime = 1
anim = -1
[State 205, EnvShake]
type = EnvShake
trigger1 = movehit
time = 10
freq = 50
ampl = -2
phase = 60

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 90 < 90, 90, (fvar(12)) * 90)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 10, 14), ifelse(var(20), 10, 14)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
p1stateno = 3220
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Super Kaioken Attack (Teleport Dash)
[Statedef 3220]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3220

[state 0]
type = posadd
trigger1 = !Time
x = P2Dist X +255

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 1
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6007;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = -30,20
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.6
size.yscale = 0.53
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 16.5

[State 220, Hit]
type=hitdef
trigger1 = !Time
ID = 5000
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
pausetime = 4, 12
guard.pausetime = 4, 12
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
p1stateno = 3230
guardsound = -1 + 0*(var(32):=0) 
sparkno = -2
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

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

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 101

;-----------------------------------------
;Super Kaioken Attack 2
[Statedef 3230]
type=S
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
value=3230

[State 3000, width]
type = width
trigger1 = Time > 0
value = 20, 0

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 40, 0
ID = 5000
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6006;ifelse(var(1),6002,6000)
ID = 6004
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,67
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,67
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,67
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,67
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,67
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,67
[State 3200, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,4
[State 3200, Aura Snd]
type = PlaySnd
trigger1 = !animtime
value = S6,7
[State 3200, Aura Snd]
type = PlaySnd
trigger1 = !animtime
value = S6,7

[State 205, Pause]
type = Pause
trigger1 = movehit
time = 2
movetime = 1
anim = -1
[State 205, EnvShake]
type = EnvShake
trigger1 = movehit
time = 10
freq = 50
ampl = -2
phase = 60

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 90 < 90, 90, (fvar(12)) * 90)), 4         
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 22, 24), ifelse(var(20), 22, 24)
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
ground.velocity = -8, -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = -8, -8
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-50
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Max Super Kaioken Attack (Start)
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
trigger1 = animelemtime(20) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

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
trigger1 = Time = 5 && NumEnemy
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
trigger1 = animelem = 2
stateNo = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -57
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 42
movetime = 42
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S8500,0

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 20
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 20
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 20
x = 20

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(2) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Time
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !numhelper(6004) 
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6004
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = !time
value = 5,54
[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = !time
value = 5,54

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 907
ID = 907
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
pausemovetime = 0
scale = .7,.7
ontop = 1
removeongethit = 1

[State 220, Hit]
type=hitdef
trigger1 = !Time
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
p1stateno = 3251
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 1006, Counter FX]
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

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 101


;-----------------------------------------
;Max Super Kaioken Attack 1
[Statedef 3251]
type=S
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
value=3250

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 40, 0
ID = 5000
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !Time
stateno = 6004;ifelse(var(1),6002,6000)
ID = 6004
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,4

[State 3200, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,4

[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7
[State 1600, Aura Energy Snd]
type = PlaySnd
trigger1 = !Animtime
value = 6,7

[State 205, Pause]
type = Pause
trigger1 = animelem = 3
time = 2
movetime = 1
anim = -1
[State 205, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 10
freq = 50
ampl = -2
phase = 60

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 3
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 12, 14), ifelse(var(20), 12, 14)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=30), var(36):=-75
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 10
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 2), ifelse(var(20), 0, 2)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=63), var(36):=-50
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 15
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4        
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 2), ifelse(var(20), 0, 2)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 19
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 14), ifelse(var(20), 0, 14)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
p1stateno = 3252
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Max Super Kaioken Attack (Teleport Dash Kick 1)
[Statedef 3252]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3251

[state 0]
type = posadd
trigger1 = !Time
x = P2Dist X +255

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S100,2

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

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !Time
stateno = 6007;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.45
size.yscale = 0.5
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 16.5

[State 220, Hit]
type=hitdef
trigger1= animelem = 2
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 22, 24), ifelse(var(20), 22, 24)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0,0
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
sparkxy = -10 + 0*(var(35):=63), var(36):=-55
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p1stateno = 3253
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

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 50

;-----------------------------------------------
;Max Super Kaioken Attack (Teleport Dash Kick 2)
[Statedef 3253]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3252

[state 0]
type = posadd
trigger1 = !Time
x = P2Dist X +255
y = P2Dist Y -15

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !Time
stateno = 6007;ifelse(var(1),6002,6000)
ID = 6000
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.6
size.yscale = 0.4
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 22.5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,4

[State 220, Hit]
type=hitdef
trigger1= animelem = 2
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 22, 22), ifelse(var(20), 22, 22)
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
ground.velocity = -8, -10
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = -8, -10
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-45
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

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3253
trigger1=movehit 
value = 1605

[State 3200, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 50

;-----------------------------------------------
;Super Rapid Kicks (Start)
[Statedef 3300]
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
value=3300
[State 3000, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=133300

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

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -15, -25
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 1051, vel]
type = Velset
trigger1 = time > 38 && time < 46
x = 1.2
y = -1.2

[State 0, Gravity]
type = Gravity
trigger1 = time > 46

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3 
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,23

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 30 < 25, 25, fvar(11) * 30)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -1.61, -6.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -1, -5
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3100, ChangeState]
type = ChangeState
trigger1 = MoveHit
value = 3301

[State 3252, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Super Rapid Kicks (Cont.)
[Statedef 3301]
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
value=3301
[State 3000, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=133300

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 0, Gravity]
type = Gravity
trigger1 = time > 56

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 14
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 5
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 30 < 25, 25, fvar(11) * 30)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -4.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -0, -4
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 9
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 30 < 25, 25, fvar(11) * 30)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Light
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -4.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -0, -4
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-92
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 14
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 30 < 25, 25, fvar(11) * 30)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -4.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -0, -4
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-102
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3252, ChangeState]
type = ChangeState
trigger1 = Time = 56
value = 3302

;-----------------------------------------------
;Super Rapid Kicks Final Kick
[Statedef 3302]
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
value=3302
[State 3000, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=133300

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = 40, 0

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 0, Gravity]
type = Gravity
trigger1 = time > 15

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = 5,17
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = 5,17
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = 5,17

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
attr = A,SA
hitflag = MAF
guardflag = MA
ID = 5000
damage = ceil(ifelse(fvar(11) * 30 < 25, 25, fvar(11) * 30)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 14, 16), ifelse(var(20), 14, 16)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -4.61, -4.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -4, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-62
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3302
trigger1=movehit
value = 3303 

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;-----------------------------------------------

;------------------------------------------------------------------
;Kaioken Diagonal Kick (Air Land)
[Statedef 3303]
type = A
physics = S
movetype = A
anim = 1605
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 2
x = -4
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time > 7
x = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 7

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Max Super Rapid Kicks
[Statedef 3350]
type=A
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
value=3300
[State 3000, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=133300

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
trigger1 = Time = 5 && NumEnemy
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

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = animelem = 1
stateNo = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = -15, -25
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = animelem = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 1051, vel]
type = Velset
trigger1 = time > 38 && time < 46
x = 1.2
y = -1.2

[State 0, Gravity]
type = Gravity
trigger1 = time > 46

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3 
value = 1,2
[State 1000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = 5,23

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
attr = A,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -1.61, -6.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -1, -5
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3100, ChangeState]
type = ChangeState
trigger1 = MoveHit
value = 3351

[State 3252, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Max Super Rapid Kicks Contin.
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
value=3301

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 0, Gravity]
type = Gravity
trigger1 = time > 56

[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = time = 30
value = 5,54
[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = time = 30
value = 5,54
[State 900, Kaioken Voice Snd]
type = playsnd
trigger1 = time = 30
value = 5,54

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 14
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 5
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -2.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -0, -4
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 9
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Light
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -2.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -0, -4
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-92
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 14
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 3, 3)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -2.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -0, -4
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-102
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3252, ChangeState]
type = ChangeState
trigger1 = Time = 56
value = 3352

;-----------------------------------------------
;Max Super Rapid Kicks Contin. (Kaioken)
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
value=3350

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1

[State 0, Gravity]
type = Gravity
trigger1 = time > 26

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6011;ifelse(var(1),6002,6000)
ID = 6011
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.52
size.yscale = 0.51
ownpal = 1

[State 900, AfterImage]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 192, 64, 64
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 14
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 5
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 1, 1), ifelse(var(20), 1, 1)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -1
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -1, -1
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 9
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 1, 1), ifelse(var(20), 1, 1)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Light
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -1
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -1, -1
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-92
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 14
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 1, 1), ifelse(var(20), 1, 1)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -0.61, -1
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -1, -1
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
sparkxy = -10 + 0*(var(35):=75), var(36):=-102
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3252, ChangeState]
type = ChangeState
trigger1 = Time = 26
value = 3353

;-----------------------------------------------
;Max Super Rapid Kicks Final Kick
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
value=3302
[State 3000, Anim]
type=changeanim
triggerall = var(1) = 1
trigger1=!time
value=133300

[State 3000, width]
type = width
trigger1 = animelemtime(3) = 0
value = 40, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S6,0 

[State 0, Turn]
type = Turn
trigger1 = animelem = 1

[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -50

[State 1051, vel]
type = Velset
trigger1 = time > 0
x = 1.2
y = -1.5

[State 0, Gravity]
type = Gravity
trigger1 = time > 15

[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) >= 0
time = 2
add = 10,-70,-40
mul = 256,256,256
invertall = 0
color = 200
ignorehitpause = 1

[State 3000, Kaioken Spark FX]
type = helper
trigger1 = !Animtime
stateno = 3203
ID = 3203
name = "Kaioken Spark FX"
postype = p1
pos = 0, 0
supermovetime = 255
size.xscale = .7
size.yscale = .7
ownpal = 1

[State 730, Ki Aura]
type = helper
trigger1 = !time
stateno = 6011;ifelse(var(1),6002,6000)
ID = 6011
name = "Kaioken Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
attr = A,SA
hitflag = MAF
guardflag = MA
ID = 5000
damage = ceil(ifelse(fvar(11) * 20 < 20, 20, fvar(11) * 20)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 14, 16), ifelse(var(20), 14, 16)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -4.61, -4.89
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -4, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=75), var(36):=-82
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3353
trigger1=movehit && Time > 5
value = 3303

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50

;-----------------------------------------------
;Hand Spirit Bomb
[Statedef 3400]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3400

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(7) < 0
value = SCA
time = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = animelemtime(7) = 0
value = 55, 0

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

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=85
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>85
trigger1 = time<=95
scale = 1.1 - (0.01*(time-85))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = animelem = 5
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 25, -70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 135
moveTime = 135
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S8500,0

[State 730, FX]
type = helper
trigger1 = animelem = 2
stateno = 3401
ID = 3401
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 0, Palfx]
type = Palfx
trigger1 = time = 72
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 72
value = S6,25
channel = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 7
channel = 1

[State 0, Lend Me Your Energy Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,27
[State 0, Lend Me Your Energy Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,27

[State 0, Spirit Bomb Voice Snd]
type = PlaySnd
trigger1 = time = 130
value = S5,28
[State 0, Spirit Bomb Voice Snd]
type = PlaySnd
trigger1 = time = 130
value = S5,28
[State 0, Spirit Bomb Voice Snd]
type = PlaySnd
trigger1 = time = 130
value = S5,28

[State 0, Spirit Bomb Throw FX Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,26
[State 0, Spirit Bomb Throw FX Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,26
[State 0, Spirit Bomb Throw FX Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,26

[State 0, SB Energy]
type = Explod
trigger1 = animelem = 5
anim = 3402
ID = 3402
pos = 25,-95
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 38
supermovetime = 255
scale = .073,.12
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, SSJ Energy]
type = Explod
trigger1 = animelem = 5
anim = 3404
ID = 3404
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 60
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
anim = 6028
ID = 6028
pos = 40,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.4,0.4
sprpriority = 3
ownpal = 1

[State 3000, Hand Spirit Bomb]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3405
ID = 3405
name = "Hand Spirit Bomb"
postype = p1
pos = 75, -70
size.xscale = 0.6 
size.yscale = 0.6
ownpal = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Kick Burst Blast
[Statedef 3500]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3500

[State 3000, width]
type = width
trigger1 = animelemtime(4) > 0
value = 55, 0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 45, 0
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 42
movetime = 42
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 0, Gravity]
type = Gravity
trigger1 = time >= 54

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 3.7
y = -3.7

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 3.7
y = -.8

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 6.5

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,4

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,53

[State 220, Hit]
type=hitdef
trigger1= animelem = 4
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((root, fvar(12)) * 35 < 35, 35, (root, fvar(12)) * 35)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 10, 10), ifelse(var(20), 18, 18)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-85
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

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3500
trigger1=movehit
value = 3501

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Kick Burst Blast (Cont. 2Kicks)
[Statedef 3501]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3501

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 55, 0
ID = 5000
ignorehitpause = 1

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 4
value = 1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 2
ID = 5000
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((root, fvar(12)) * 15 < 15, 15, (root, fvar(12)) * 15)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 4), ifelse(var(20), 18, 18)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = MEDIUM
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 0
fall = 0
kill = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-85
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= animelem = 4
ID = 5000
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((root, fvar(12)) * 15 < 15, 15, (root, fvar(12)) * 15)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 10, 10), ifelse(var(20), 24, 24)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-70
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
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
triggerall = prevstateno!=3501
trigger1= movehit && time = 20
value = 3502

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 1702

;-----------------------------------------------
;Kick Burst Blast (Cont. Blast)
[Statedef 3502]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=0
poweradd=-0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3502

[State 3000, width]
type = width
trigger1 = !time
value = 40, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X +65
y = -10+P2Dist y

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = -1

[State 0, Gravity]
type = Gravity
trigger1 = time > 40

[State 0, VelSet]
type = VelSet
trigger1 = time > 40
x = -4

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,49
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,49

[State 3000, Kame]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3505
ID = 3505
name = "Kick Blast"
postype = p1
pos = -10, 0
size.xscale = 0.7
size.yscale = 0.9
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Max Kick Burst Blast
[Statedef 3550]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3500

[State 3000, width]
type = width
trigger1 = animelemtime(4) > 0
value = 55, 0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

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
trigger1 = Time = 5 && NumEnemy
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
stateNo = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = 45, 0
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 42
movetime = 42
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 0, Gravity]
type = Gravity
trigger1 = time >= 54

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 3.7
y = -3.7

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 3.7
y = -.8

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 6.5

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,4

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,53
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,53

[State 220, Hit]
type=hitdef
trigger1= animelem = 4
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((root, fvar(12)) * 45 < 45, 45, (root, fvar(12)) * 45)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 10, 10), ifelse(var(20), 18, 18)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-85
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

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3550
trigger1=movehit
value = 3551

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Max Kick Burst Blast (Cont. 2Kicks)
[Statedef 3551]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3501

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 55, 0
ID = 5000
ignorehitpause = 1

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 4
value = 1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 2
ID = 5000
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((root, fvar(12)) * 45 < 45, 45, (root, fvar(12)) * 45)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 4), ifelse(var(20), 18, 18)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = MEDIUM
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 0
fall = 0
kill = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-85
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= animelem = 4
ID = 5000
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((root, fvar(12)) * 45 < 45, 45, (root, fvar(12)) * 45)), 4          
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 10, 10), ifelse(var(20), 24, 24)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-70
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
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
triggerall = prevstateno!=3551
trigger1= movehit && time = 20
value = 3552

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 1702

;-----------------------------------------------
;Max Kick Burst Blast (Cont. Blast)
[Statedef 3552]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=0
poweradd=-0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3502

[State 3000, width]
type = width
trigger1 = !time
value = 40, 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X +65
y = -10+P2Dist y

[State 0, Turn]
type = Turn
trigger1 = !Time

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = -1

[State 0, Gravity]
type = Gravity
trigger1 = time > 40

[State 0, VelSet]
type = VelSet
trigger1 = time > 40
x = -4

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,49
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,49

[State 3000, Kame]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3506
ID = 3506
name = "Kick Blast"
postype = p1
pos = -10, 0
size.xscale = 0.7
size.yscale = 0.9
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Meteor Strike Bomb (Strike 1 start)
[Statedef 3600]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3600

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -45
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 30, 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,10
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,10
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 4
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 20, 20)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -85
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

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3600
trigger1=movehit 
value = 3601
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Meteor Strike Bomb (Strike 2)
[Statedef 3601]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3601

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 50, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 3
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 18, 18)
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
ground.velocity = -2, -14
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  -2, -14
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -95
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

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3601
trigger1=movehit && Time = 12 && frontedgebodydist <= 70
value = 3604
ignorehitpause=0

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3601
trigger1=movehit && Time = 12
value = 3602
ignorehitpause=0

;-----------------------------------------------
;Meteor Strike Bomb Form 
[Statedef 3602]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3602

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=43
scale = 1.3
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>43
trigger1 = time<=53
scale = 1.3 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 205, Pause]
type = Pause
trigger1 = timemod = 2,1
time = 1
movetime = 1
anim = -1

[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,31
[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,4

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3604
ID = 3604
pos = -40,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 3604

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3606
ID = 3606
pos = -40,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3603

;-----------------------------------------------
;Meteor Strike Blast Form (FrontEdgeDistance)
[Statedef 3604]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=36022

[state 3351]
type = posadd
trigger1 = !Time
x = -95+P2Dist x

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=43
scale = 1.3
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>43
trigger1 = time<=53
scale = 1.3 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 205, Pause]
type = Pause
trigger1 = timemod = 2,1
time = 1
movetime = 1
anim = -1

[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,31
[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,4

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3604
ID = 3604
pos = -40,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 3604

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3606
ID = 3606
pos = -40,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3603

;-----------------------------------------------
;Meteor Strike Bomb
[Statedef 3603]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3603

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,92
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,92

[State 3005, PlaySnd]
type = playsnd
trigger1 = animelem = 2
value = 6, 21
[State 3005, PlaySnd]
type = playsnd
trigger1 = animelem = 2
value = 6, 21

[State 3000, Meteor Bomb]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3605
ID = 3605
name = "Meteor Bomb"
postype = p1
pos = 80, -97
size.xscale = 0.4 
size.yscale = 0.4
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Max Meteor Strike Bomb (Strike 1 start)
[Statedef 3650]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3650

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

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

[State 3200, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -60
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 30, 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,10
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S5,10
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 3
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 20, 20)
guard.pausetime = ifelse(var(20), 12, 12), ifelse(var(20), 12, 12)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -65
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

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3650
trigger1=movehit 
value = 3651 
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Max Meteor Strike Bomb (Cont. Strikes)
[Statedef 3651]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3651

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 50, 0
ID = 5000
ignorehitpause = 1

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 7
value = 1,2

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 15 < 10, 10, fvar(11) * 15)), 4
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  0, 0
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=65), var(36):=-63
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 7
attr = A,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11) * 15 < 10, 10, fvar(11) * 15)), 4
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 3, 3), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
animtype = Light
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  0, 0
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-65
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3252, ChangeState]
type = ChangeState
trigger1 = Time = 52
value = 3652

;-----------------------------------------------
;Max Meteor Strike Bomb (Final Strike)
[Statedef 3652]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3601

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 50, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 3
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 18, 18)
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
ground.velocity = -4, -12
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  -4, -12
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -95
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

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3652
trigger1=movehit && Time = 12 && frontedgebodydist <= 70
value = 3657
ignorehitpause=0

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3652
trigger1=movehit && Time = 12
value = 3653
ignorehitpause=0

;-----------------------------------------------
;Max Meteor Strike Bomb Form
[Statedef 3653]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3652

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=43
scale = 1.3
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>43
trigger1 = time<=53
scale = 1.3 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 205, Pause]
type = Pause
trigger1 = timemod = 2,1
time = 1
movetime = 1
anim = -1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86

[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,31
[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,4

;-------- Left Ball
[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3604
ID = 3604
pos = 15,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 3
id = 3604

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3606
ID = 3606
pos = 15,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

;-------- Right Ball
[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3604
ID = 3604
pos = 45,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 3
id = 3604

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3606
ID = 3606
pos = 45,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

;-------- Big Ball
[State 0, Explod]
type = Explod
trigger1 = Animelem = 3
anim = 3604
ID = 3609
pos = 65,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .6,.6
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 3609

[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = Animelem = 3
value = S6,4

[State 0, Explod]
type = Explod
trigger1 = Animelem = 3
anim = 3606
ID = 3606
pos = 45,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3654

;-----------------------------------------------
;Max Meteor Strike Bomb
[Statedef 3654]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3653

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3005, PlaySnd]
type = playsnd
trigger1 = animelem = 1
value = 6, 21
[State 3005, PlaySnd]
type = playsnd
trigger1 = animelem = 1
value = 6, 21

[State 3000, Max Meteor Bomb]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 3655
ID = 3655
name = "Meteor Bomb"
postype = p1
pos = 65, -70
size.xscale = 0.6 
size.yscale = 0.6
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Max Meteor Strike Bomb Form (FrontEdgeDistance)
[Statedef 3657]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3654

[state 3351]
type = posadd
trigger1 = !Time
x = -90+P2Dist x

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=43
scale = 1.3
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>43
trigger1 = time<=53
scale = 1.3 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 205, Pause]
type = Pause
trigger1 = timemod = 2,1
time = 1
movetime = 1
anim = -1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86
[State 0, Voice Snd]
type = PlaySnd
trigger1 = Animelem = 1
value = S5,86

[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,31
[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = !Time
value = S6,4

;-------- Left Ball
[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3604
ID = 3604
pos = 15,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 6
id = 3604

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3606
ID = 3606
pos = 15,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

;-------- Right Ball
[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3604
ID = 3604
pos = 45,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 6
id = 3604

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 3606
ID = 3606
pos = 45,-75
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

;-------- Big Ball
[State 0, Explod]
type = Explod
trigger1 = Animelem = 6
anim = 3604
ID = 3609
pos = 65,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .6,.6
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 3609

[State 0, Blast Form Snd]
type = PlaySnd
trigger1 = Animelem = 6
value = S6,4

[State 0, Explod]
type = Explod
trigger1 = Animelem = 6
anim = 3606
ID = 3606
pos = 45,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .3,.3
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3654

;-----------------------------------------------
;Fierce Rush (Start)
[Statedef 3700]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3700

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(7) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 5 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, Superpause FX]
type = helper
trigger1 = animelem = 1
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -45
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 7
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !TIME
value = S5,93
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !TIME
value = S5,93

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 20

[State 220, Hit]
type=hitdef
trigger1 = !Time
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
p1stateno = 3701
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 1006, Counter FX]
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

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 101

;-----------------------------------------------
;Fierce Rush Kick
[Statedef 3701]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3701

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 50, 0
ID = 5000
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 8
anim = 3705
ID = 3705
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 39
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,95
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,95
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 3
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 24, 24)
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
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -95
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

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit && time > 9
value = 3702

;-----------------------------------------------
;Fierce Rush Back Hand
[Statedef 3702]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3702

[State 0, Turn]
type = Turn
trigger1 = !Time

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X -50
y = -30+P2Dist y

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 11
anim = 3706
ID = 3706
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 39
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,101
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,101
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 8
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 24, 24)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -65
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

[State 0, ChangeState]
type = ChangeState
triggerall = prevstateno!=3702
trigger1=movehit && time > 12
value = 3703 
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 1

;-----------------------------------------------
;Fierce Rush Ground Kick
[Statedef 3703]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3703

[State 0, Turn]
type = Turn
trigger1 = !Time

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X -50

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 13
anim = 3707
ID = 3707
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 39
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,99
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,99
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 7
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 24, 24)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -18, -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  -18, -8
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 1 
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
ID = 1502
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

[State 0, ChangeState]
type = ChangeState
triggerall = prevstateno!=3703
trigger1=movehit && p2stateno = 1111302
value = 3704 
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Fierce Rush Teleport Flips
[Statedef 3704]
type=A
physics=S
movetype=A
anim = 3704
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,96
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !Time
value = S5,96

[state 0]
type = posadd
trigger1 = animelem = 1
y = P2Dist Y -30
x = P2Dist X -215

[State 1200, VelSet]
type = VelSet
trigger1 = 1
x = 8
y = -4

[State 0, Gravity]
type = Gravity
trigger1 = Time > 30

[State 0, ChangeState]
type = ChangeState
trigger1 = P2Dist X < 50
value = 3705

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Fierce Rush Flip Kick
[Statedef 3705]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=37055

[State 3000, width]
type = width
trigger1 = animelemtime(4) = 0
value = 60, 0

[State 0, Gravity]
type = Gravity
trigger1 = Time > 0

[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,3

[State 750, Lightning FX]
type = helper
trigger1 = animelem = 4
stateno = 8350
ID = 8350
name = "Lightning Kick"
postype = p1
pos = 35, -83
supermovetime = 255
ownpal = 1

[State 220, Hit]
type=hitdef
trigger1= animelem = 4
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 10, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1,10
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = -1, 10
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 1
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -65
envshake.time = 16
envshake.freq = 160
envshake.ampl = 8
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

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=3705
trigger1=movehit && Time > 4
value = 3706

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;------------------------------------------------------------------
;SSJ Drop Kick (Air Land)
[Statedef 3706]
type = A
physics = S
movetype = A
anim = 37066
ctrl = 0
velset = 0, 0
poweradd=0
sprpriority = 1
juggle = 8
facep2 = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 2
x = -7
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time > 12
x = -4

[State 0, Gravity]
type = Gravity
trigger1 = time > 2

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;Max Fierce Rush (Start)
[StateDef 3750]
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

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(7) < 0
value = SCA
time = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

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
trigger1 = Time = 5 && NumEnemy
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
stateNo = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -45
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 3200, SuperPlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,0

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S100,2

[State 102, Dust]
type = helper
trigger1 = animelem = 7
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = !TIME
value = S5,93
[State 0, Voice Snd]
type = PlaySnd
trigger1 = !TIME
value = S5,93

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 20

[State 220, Hit]
type=hitdef
trigger1 = !Time
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
p1stateno = 3751
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 1006, Counter FX]
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

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 101

;-----------------------------------------------
;Max Fierce Rush Combo
[Statedef 3751]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3750

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, width]
type = width
trigger1 = Time > 0
value = 0, 0

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 40, 0
ID = 5000
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = TIME = 60
anim = 3708
ID = 3708
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 39
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,101
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S5,101
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,100
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,100
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 14
value = S5,95
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 14
value = S5,95
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 17
value = S5,96
[State 3200, Voice Snd]
type = PlaySnd
trigger1 = animelem = 17
value = S5,96

[State 3200, Swing Snd]
type = PlaySnd
trigger1 = animelem = 4 || animelem = 8 || animelem = 14 || animelem = 19
value = S1,4

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 4
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 12, 14), ifelse(var(20), 12, 14)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=30), var(36):=-75
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 8
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 2), ifelse(var(20), 0, 2)
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=63), var(36):=-95
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 14
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4        
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 2), ifelse(var(20), 0, 2)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Light
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
guard.velocity = ifElse(var(20), 0, 0)
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
sparkxy = -10 + 0*(var(35):=63), var(36):=-83
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 19
forcenofall = !var(20)
ID = 5000
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4       
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 14), ifelse(var(20), 0, 14)
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
ground.velocity = 0, -7
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, -10
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 1
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
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

[State 0, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 3752

;-----------------------------------------------
;Max Fierce Rush Teleport Kick 1
[Statedef 3752]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3751

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, Turn]
type = Turn
trigger1 = !Time

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X -50
y = 30+P2Dist y

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 10
anim = 3709
ID = 3709
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 39
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,95
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S5,95
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 7
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 12, 12)
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
ground.velocity = 0, -6.5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  0, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 50), var(36) := -95
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

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit && time > 11
value = 3753

;-----------------------------------------------
;Max Fierce Rush Teleport Kick 2
[Statedef 3753]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3751

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, Turn]
type = Turn
trigger1 = !Time

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X -60
y = 30+P2Dist y

[State 0, Explod]
type = Explod
trigger1 = MOVEHIT && TIME = 8
anim = 3710
ID = 3710
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 39
pausemovetime = 0
scale = .85,.85
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,95
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,95
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= animelem = 7
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 16, 16), ifelse(var(20), 12, 12)
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
ground.velocity = 0, -6.5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity = 0, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -95
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

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit && time > 9
value = 3754

;-----------------------------------------------
;Max Fierce Rush Dive Bomb
[Statedef 3754]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3752

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 3200, Superpause]
type = superpause
trigger1 = animelem = 5
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3604
ID = 3604
pos = 50,-83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 255
scale = .09,.09
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = movehit
id = 3604

[State 0, Ball Form Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S6,31

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3606
ID = 3606
pos = 50,-83
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 30
supermovetime = 255
scale = .05,.05
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3005, Vel]
type = velset
trigger1 = animelem = 5
y = .2

[State 3005, Vel]
type = velset
trigger1 = animelem = 5
x = .2

[state 3351]
type = posadd
trigger1 = !Time
x = P2Dist X -85
y = -50+P2Dist y

[State 0, AfterImage]
type = AfterImage
trigger1 = !time
time = 20
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,104
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,104
[State 0, Swing Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S1,3

[State 3005, Vel]
type = velset
trigger1 = animelem = 6
y = 20

[State 3005, Vel]
type = velset
trigger1 = animelem = 6
x = 20

[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3300, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= animelem = 6
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 45 < 45, 45, (fvar(12)) * 45)), 4          
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 0, 0), ifelse(var(20), 30, 30)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Diagup
fall.animtype = Diagup
ground.type = High
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 7, -6.5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), 0, 0)
guard.cornerPush.velOff = 0
air.velocity =  7, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
kill = 0
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -25
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 1006, Counter FX]
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

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3752 && animelemtime(2) > 0 && pos y >= -5
value = 3753
persistent = 0

[State 4004, hitadd]
type = hitadd
triggerall = anim = 3753
trigger1 = time = 75
value = 1

[State 4004, hitdamage]
type = targetlifeadd
triggerall = anim = 3753
trigger1 = time = 75 
value = -17 -(var(41) = 456) * 4 + (!var(41)) * 12
;-ceil(ifelse((var(30) = 456), (target, lifemax * 0.8), (target, lifemax * 0.6)) / 33)
kill = 1
absolute = 1

[State 4004, givepower]
type = targetpoweradd
triggerall = anim = 3753
trigger1 = time = 75
value = 36

[State 4004, HitSound]
type = playsnd
triggerall = anim = 3753
trigger1 = time = 75 
value = 6,5
channel = 2

[State 3610, Hit Sparks]
type = Helper
triggerall = anim = 3753
trigger1 = time = 75 
helperType = Normal
stateNo = 3755
ID = 3755
name = "Explosion"
sprPriority = 5
posType = p2
pos = 0, (target, const(size.mid.pos.y))
ownPal = 1
onTop = 1
 
[State 1405, flames]
type = helper
triggerall = anim = 3753
trigger1 = time = 75 
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 0, TargetVelAdd]
type = TargetVelAdd
triggerall = anim = 3753
trigger1 = time = 75 
x = 0
y = -1
ID = -1

[State 4004, Shake]
type = envshake
triggerall = anim = 3753
trigger1 = time = 75 
time = 6
freq = 120
ampl = -4

[State 3300, Type]
type = statetypeset
trigger1 = anim = 3753
statetype = S
physics = N
[State 3300, Type]
type = velmul
trigger1 = anim = 3753
x = 0.8

[State 3300, Stop]
type = posset
trigger1 = anim = 3753
y = 0
[State 3300, Stop]
type = velset
trigger1 = anim = 3753
y = 0

[State 3300, End]
type = changestate
trigger1 = anim = 3753 && !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;Spirit Bomb
[StateDef 3900]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 0
powerAdd = -3000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3900

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
trigger1 = time = 2
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(3900)) && time = [64,900]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = !winko||(numtarget(3900)) && time = 901
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1
 
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=330
scale = 1.7
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>554
trigger1 = time<=930
scale = 1.7
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time < 370
value = 1
movecamera = 2,1
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time > 554
value = 1
movecamera = 2,1
ignorehitpause = 1

[state 1051]
type = posadd
trigger1 = animelem = 6
x = P2Dist X -1000
y = P2Dist Y -150

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = Time < 901
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 9
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 0, -255
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 0]
type = Helper
triggerall = time >= 29
triggerall = time < 113
trigger1 = timemod = 5,0
helpertype = normal
name = "Spirit Bomb Goku Effect"
ID = 3901
stateno = 3901
pos = 0,0
postype = p1
superMoveTime = 255
size.xscale = 1
size.yscale = 1
supermovetime = 9999

[State 3500, Spirit Bomb Form]
type = Helper
trigger1 = animelem = 9
stateNo = 3902
ID = 3902
name = "Spirit Bomb Form"
posType = p1
pos = 0, -255
superMoveTime = 255
size.xScale = 1.5
size.yScale = 1.5
ownpal = 1

[State 0, Palfx]
type = Palfx
trigger1 = time = 200
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 3500, Spirit Bomb]
type = Helper
trigger1 = animelem = 11
stateNo = 3903
ID = 3903
name = "Spirit Bomb"
posType = p1
pos = 0*const(size.xscale)/camerazoom,-255*const(size.yscale)/camerazoom
superMoveTime = 255
size.xScale = 1.5
size.yScale = 1.5
ownpal = 1
ignorehitpause = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 8
time = 119
moveTime = 119
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[state ssj2mode]
type = varset
trigger1 = animelem = 14
v = 1
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 14
value = S6,34

[State 0, Palfx]
type = Palfx
trigger1 = animelem = 14
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 3500, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0 
[State 3500, Spirit Bomb Form Sound Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,25 
[State 0, Take this!!!!! Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,20
[State 0, Take this!!!!! Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,20
[State 0, Lend me you energy Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,7
[State 0, Lend me you energy Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S5,7
[State 0, Spirit Bomb Release Snd]
type = PlaySnd
trigger1 = animelem = 11
value = 6,8 
[State 0, StopSnd]
type = StopSnd
trigger1 = animelem = 11
channel = 1
[State 0, Goku Talks b4 Blow'n Spirit Bomb Snd]
type = PlaySnd
trigger1 = animelem = 14
value = 5,88 
[State 0, Goku Talks b4 Blow'n Spirit Bomb Snd]
type = PlaySnd
trigger1 = animelem = 14
value = 5,88 
[State 0, Goku Talks b4 Blow'n Spirit Bomb Snd]
type = PlaySnd
trigger1 = animelem = 14
value = 5,88
[State 0, Goku Yell to Blow Spirit Bomb Snd]
type = PlaySnd
trigger1 = animelem = 16
value = 5,89 
[State 0, Goku Yell to Blow Spirit Bomb Snd]
type = PlaySnd
trigger1 = animelem = 16
value = 5,89 
[State 0, Goku Yell to Blow Spirit Bomb Snd]
type = PlaySnd
trigger1 = animelem = 16
value = 5,89 

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;-----------------------------------------------
;Meteor Break
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
trigger1 = animelemtime(3) < 0
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
trigger1 = animelem = 2
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
trigger1 = animelem = 2
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

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

[State 0, Dash Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S100,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,70
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S5,70

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 3
x = 20
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
p1stateno = 4001
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-63

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 101

;-----------------------------------------------
;Meteor Break Cont.(Combo)
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

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[state 3500,Posset]
type=posset
trigger1=!time
y=0 

[State 3000, width]
type = width
trigger1 = Time > 0
value = 20, 0

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 18
x = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = Pos X + CameraPos X < FrontEdge
value = 1
movecamera = 1,1

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 4050
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 2
value = S1,1
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 5
value = S1,3
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 11
value = S1,2
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 17
value = S1,5
[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 22
value = S1,2

[State 220, Hit]
type=hitdef
trigger1= Animelem = 2
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
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
sparkxy = -10 + 0*(var(35):=80), var(36):=-80
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 5
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 6), ifelse(var(20), 4, 6)
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
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=61), var(36):=-55
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 11
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 8), ifelse(var(20), 6, 8)
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
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
air.fall = 1
fall = 0
kill = 0
fall.recover = 0
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-50
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 17
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
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
sparkxy = -10 + 0*(var(35):=55), var(36):=-75
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
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
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
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-85
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 4002

;-----------------------------------------------
;Meteor Break Cont.(Combo2)
[StateDef 4002]
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
value=4002

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,1
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
x = 1.7

[State 3000, width]
type = width
trigger1 = Time > 0
value = 20, 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = Pos X + CameraPos X < FrontEdge
value = 1
movecamera = 1,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S5,57
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S5,57

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 5000
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 2 || Animelem = 5
value = S1,3

[State 220, Hit]
type=hitdef
trigger1= Animelem = 2
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 1, 3), ifelse(var(20), 1, 3)
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
sparkxy = -10 + 0*(var(35):=80), var(36):=-80
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Animelem = 5
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 1, 3), ifelse(var(20), 1, 3)
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
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=61), var(36):=-55
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4002
triggerall = Target, Life <= 130
trigger1 = Time > 60
value = 40033

[State 3500, End]
type = ChangeState
trigger1 = Time > 60
value = 4003

;-----------------------------------------------
;Meteor Break Cont.(Gut Punch)
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
value=4003

[State 0, VelSet]
type = VelSet
trigger1 = Time < 10
x = 1.7

[State 3000, width]
type = width
trigger1 = Time > 0
value = 20, 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,1

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 4
value = S1,3

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,0

[State 220, Hit]
type=hitdef
trigger1= Animelem = 4
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 20, 22), ifelse(var(20), 20, 22)
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
sparkxy = -10 + 0*(var(35):=80), var(36):=-80
ID = 3027
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 3025, p2state]
type = targetstate
trigger1 = movehit && numtarget(3027)
trigger1 = target(3027), gethitvar(hitcount) >= 1
trigger1 = (target(3027), stateno = 5000) || (target(3027), stateno = 5010) || (target(3027), stateno = 5020)
value = 7698
ID = 3027
ignorehitpause = 1

[State 3500, End]
type = ChangeState
trigger1 = !Animtime
value = 4004

;-----------------------------------------------
;Meteor Break Cont.(Gut Punch to Spirit Bomb)
[StateDef 40033]
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
value=4003

[State 0, VelSet]
type = VelSet
trigger1 = Time < 10
x = 1.7

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 4
value = S1,3

[State 0, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 7
value = S6,0

[State 220, Hit]
type=hitdef
trigger1= Animelem = 4
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*15<7, 7, fvar(11)*15)), 4
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 20, 22), ifelse(var(20), 20, 22)
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
ground.velocity = 8, 0
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
sparkxy = -10 + 0*(var(35):=80), var(36):=-80
ID = 3026
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6

[State 3025, p2state]
type = targetstate
trigger1 = movehit && numtarget(3026)
trigger1 = target(3026), gethitvar(hitcount) >= 1
trigger1 = (target(3026), stateno = 5000) || (target(3026), stateno = 5010) || (target(3026), stateno = 5020)
value = 7697
ID = 3026
ignorehitpause = 1

[State 3500, End]
type = ChangeState
trigger1 = !Animtime
value = 3900

;-----------------------------------------------
;Meteor Break Cont.(Kame)
[StateDef 4004]
type = A
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = 0
faceP2 = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4004

[state 0]
type = posadd
trigger1 = !Time
x = P2Dist X-15
y = P2Dist Y -125

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1/CameraZoom + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=45
scale = 1.1/CameraZoom
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>45
trigger1 = time<=55
scale = 1.1/CameraZoom - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 2
time = 64
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

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 6
stateNo = 4008
ID = 4008
name = "Kame Ball FX"
posType = P1
pos = 0, 0
superMoveTime = 255
size.xScale = 0.9
size.yScale = 0.9
ownpal = 1

[State 1000, Fireball]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 4006
ID = 4006
name = "Kame Blast Down"
postype = p1
pos = -50,-80
size.xscale = .9
size.yscale = .9
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 4005
ID = 4005
pos = 18,-125
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 45
pausemovetime = 65535
supermovetime = 65535
scale = .2,.2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 3001
ID = 4005
pos = 18,-125
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 45
pausemovetime = 65535
supermovetime = 65535
scale = .2,.2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Kame Form Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3

[State 0, Kame Release Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 0, Kame Release Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,21

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,0

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,82
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,82
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S5,82

[State 0, Pause]
type = Pause
trigger1 = !Time
time = 50
movetime = 50

[State 0, VelSet]
type = VelSet
trigger1 = Time > 0
y = -.4

[State 0, VelSet]
type = VelSet
trigger1 = Time > 55
y = -2.5

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 4005

;-----------------------------------------------
;Meteor Break Cont.(Teleport to Ground)
[StateDef 4005]
type = A
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

[State 0, Teleport Snd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[state 0]
type = posadd
trigger1 = Time = 6
x = -150

[state 0]
type = posset
trigger1 = Time = 6
y = 0

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-----TARGET -----
[Statedef 4050]
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

;-----------------------------------------------
;Warp Kamehameha(Start)
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
value=4100

[state 3500,Posset]
type=posset
trigger1=!time
y=0

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

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 0, -75
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8500,1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 205, Pause]
type = Pause
trigger1 = movehit
time = 2
movetime = 1
anim = -1
[State 205, EnvShake]
type = EnvShake
trigger1 = movehit
time = 10
freq = 50
ampl = -2
phase = 60

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 4100 && animelem = 3
reversal.attr = SCA, AA
p1stateno = 4101
ID = 5000
pausetime = 0, 2
sparkno = -1;s7001
;sparkxy = 0, 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
numhits = 0

[State 3500, End]
type = ChangeState
trigger1 = Time >= 80
value = 0
ctrl = 1

;-----------------------------------------------
;Warp Kamehameha(Success Reverseal Hit)
[StateDef 4101]
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
value=4101

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(1) < 0
value = SCA
time = 1

[state 3351]
type = posadd
trigger1 = animelem = 1
x = -10+P2Dist x
y = 0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=44
scale = 1.75
pos = pos x, pos y;zoom
ignorehitpause = 1

[STATE 4101,NOT HIT BY]
type = NotHitBy
trigger1 = Anim = 4101
trigger1 = AnimElemNo(0) = [1,5]
value = SCA
time = 1

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 0, Teleport Snd]
type = PlaySnd
trigger1 =  Animelem = 1
value = S6,0
[State 0, Swing Snd]
type = PlaySnd
trigger1 =  Animelem = 3
value = S1,4
[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 3
value = S5,72
[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 3
value = S5,72
[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 3
value = S5,72

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 84
channel = 1
persistent = 0
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= Animelem = 3
forcenofall = !var(20)
attr = S,SP
hitflag = MAF
guardflag = M
damage = ceil(ifelse((fvar(12)) * 250 < 250, 250, (fvar(12)) * 250)), 8
getpower = 0
givepower = 36, 36
pausetime = 14,18
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
ground.velocity = -85, 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -85, 0
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
sparkxy = -10 + 0*(var(35):=80), var(36):=-40
ID = 3025
envshake.time = 16
envshake.freq = 160
envshake.ampl = 9

[State 3025, p2state]
type = targetstate
trigger1 = movehit && numtarget(3025)
trigger1 = target(3025), gethitvar(hitcount) >= 1
trigger1 = (target(3025), stateno = 5000) || (target(3025), stateno = 5010) || (target(3025), stateno = 5020)
value = 7696
ID = 3025
ignorehitpause = 1

[State 3500, End]
type = ChangeState
trigger1 = !animtime
value = 4102

;-----------------------------------------------
;Warp Kamehameha(Kame Form to Teleport)
[StateDef 4102]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd =0
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=4102

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1.4 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=25
scale = 1.6
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 32
moveTime = 32
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 4
value = S5,79
[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 4
value = S5,79
[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 4
value = S5,79
[State 0, Voice Snd]
type = PlaySnd
trigger1 =  Animelem = 4
value = S5,79

[State 0, Teleport Snd]
type = PlaySnd
trigger1 =  Animelem = 5
value = S6,0

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 4103+(random%2)

;-----------------------------------------------
;Warp Kamehameha (Teleport Kame Wave Diagonal Air)
[StateDef 4103]
type = A
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
value=4103

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
trigger1 = time = 45
stateNo = 8522
ID = 8500
name = "Superpause FX"
posType = p1
pos = -10, -100
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !time
time = 87
moveTime = 87
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 45
value = S8500,1

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 4
time = 104
sinadd = -255, -255, -255, 128

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(4)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(6)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[state 1001]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -100
y = P2Dist Y -50

[State 0, VelSet]
type = VelSet
trigger1 = !TIME
y = .2

[State 0, VelSet]
type = VelSet
trigger1 = TIME > 87
x = -.2
y = -.2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S730,2
channel = 1
loop = 1
pan = 0
persistent = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !animtime
channel = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,83
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,83
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,83

[State 0, !!!! Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,20

[State 0, Kame Form Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,23

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 4005
ID = 4005
pos = -20,-100
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 45
pausemovetime = 65535
supermovetime = 65535
scale = .5,.5
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 3002
ID = 4005
pos = -10,-90
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 80
pausemovetime = 65535
supermovetime = 65535
scale = .8,.8
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 4106
ID = 4106
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 132
pausemovetime = 65535
supermovetime = 65535
scale = .85,.85
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 730, SSJ Aura]
type = helper
trigger1 = !numhelper(6000) && var(1)
stateno = 6009
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.3
size.yscale = 0.33
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 6
helpertype = normal ;player
name = "Warp Kame Wave"
ID = 4105
stateno = 4105
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
removeongethit = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 50

;-----------------------------------------------
;Warp Kamehameha (Teleport Kame Wave in front of opponent near ground)
[StateDef 4104]
type = A
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
value=4104

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
trigger1 = time = 45
stateNo = 8522
ID = 8500
name = "Superpause FX"
posType = p1
pos = -30, -90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !time
time = 87
moveTime = 87
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 45
value = S8500,1

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 4
time = 104
sinadd = -255, -255, -255, 128

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(4)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = animelemtime(6)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[state 1001]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -100
y = P2Dist Y -5

[State 0, VelSet]
type = VelSet
trigger1 = TIME > 0
x = -.4

[State 0, VelSet]
type = VelSet
trigger1 = TIME > 45
x = -.2

[State 0, VelSet]
type = VelSet
trigger1 = TIME > 87
x = -.4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S730,2
channel = 1
loop = 1
pan = 0
persistent = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !animtime
channel = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,83
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,83
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,83

[State 0, !!!! Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,20

[State 0, Kame Form Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,23

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 4005
ID = 4005
pos = -20,-100
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 45
pausemovetime = 65535
supermovetime = 65535
scale = .5,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 3002
ID = 4005
pos = -10,-90
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 80
pausemovetime = 65535
supermovetime = 65535
scale = .8,.8
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 730, SSJ Aura]
type = helper
trigger1 = !numhelper(6000) && var(1)
stateno = 6009
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.35
size.yscale = 0.33
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 6
helpertype = normal ;player
name = "Warp Kame Wave"
ID = 4107
stateno = 4107
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
removeongethit = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 50

;-----------------------------------------------
;SSJ2 Transform
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

[State 3000, Superpause]
type = superpause
trigger1 = !time
time = 108
movetime = 108
p2defmul = 1
unhittable = 1
anim = -1
sound = -1;s8500,3
darken = 0

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 9
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4602)) && time = [64,95]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4602)) && time = 96
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = Animelem = 18
stateno = 8522
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
trigger1 = Animelem = 18
value = S8500,1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=111
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>111
trigger1 = time<=120
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 0, Wind Snd]
type = PlaySnd
trigger1 = animelem = 3
value = S6,12
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,87
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,87
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 28
value = S6,7
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 28
value = S6,7
[State 0, Power Acend Snd]
type = PlaySnd
trigger1 = animelem = 28
value = S6,30

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 28
value = S6,7

[State 0, EnvShake]
type = EnvShake
trigger1 = Time < 83
time = 34
freq = 60
ampl = -4
phase = 90

[State 0, Palfx]
type = Palfx
trigger1 = animelem = 28
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 4503
ID = 4503
pos = 0,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = 75
supermovetime = 255
scale = .85,.85
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 191:    Energy Outburst]
type            = Explod
trigger1        = animelem = 28
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

[State 0, Explod]
type = Explod
trigger1 = animelem = 28
anim = 4507
ID = 4507
pos = 0,0
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

[State 0, SSJ Energy]
type = Explod
trigger1 = animelem = 3
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

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 28
id = 4508

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
trigger1 = animelem = 28
channel = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 28
helpertype = normal ;player
name = "SSJ Transform Aura2"
ID = 4504
stateno = 4504 
pos = 3,-50
scale = 1,1.2
supermovetime = 255
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 28
anim = 4510
ID = 4510
pos = 5,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 24
supermovetime = 255
scale = .45,.45
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 28
helpertype = normal ;player
name = "SSJ Transform Aura"
ID = 4511
stateno = 4511
pos = 0,0
scale = 45,.65
supermovetime = 255
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[state ssj2mode]
type = varset
trigger1 = animelem = 28
v = 1
value = 1

[State 3500, End]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1

;-----------------------------------------------
;SSJ2 Quick Transform
[StateDef 4501]
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
value=4501

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 10
freq = 60
ampl = -4
phase = 90

[State 0, Palfx]
type = Palfx
trigger1 = animelem = 2
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 191:    Energy Outburst]
type            = Explod
trigger1        = animelem = 2
anim            = 7022
ID              = 7021
pos             = 5,-20
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

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 4507
ID = 4507
pos = 10,0
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

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal ;player
name = "SSJ Transform Aura"
ID = 4511
stateno = 4511
pos = 10,0
scale = 45,.65
supermovetime = 255
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 4510
ID = 4510
pos = 5,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 24
supermovetime = 255
scale = .45,.45
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Wind Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,12
[State 0, Wind Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,12

[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,30
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,7
[State 0, Aura Snd]
type = PlaySnd
trigger1 = animelem = 2
value = S6,7

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,91
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,91
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,91
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,91

[state ssj2mode]
type = varset
trigger1 = animelem = 2
v = 1
value = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Detransform
[StateDef 4550]
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
anim = 4506
ID = 4506
pos = 15,-60
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
pausemovetime = 0
scale = .49,.7
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, Detransform Snd]
type = PlaySnd
trigger1 = !Time
value = S6,13

[state ssj2mode]
type = varset
trigger1 = !Time
v = 1
value = 0

[State 3500, End]
type = ChangeState
trigger1 = !time
value = 0
ctrl = 1

;-----------------------------------------------
;DragonFist (Startup)
[StateDef 4600]
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
value=4600

[State 0, Invulnerable]
type = NotHitBy
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[state 3500,Posset]
type=posset
trigger1=!time
y=0

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

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=33
scale = 1.1
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>33
trigger1 = time<=43
scale = 1.1 - (0.01*(time-33))
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3400, Super Pause FX]
type = Helper
trigger1 = Animelem = 3
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 35, -50
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, SuperPlaySnd]
type = PlaySnd
trigger1 = !Time
value = S8500,1

[State 3000, Superpause]
type = superpause
trigger1 = !Time
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 102, Dust]
type = helper
trigger1 = animelem = 5
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000, Dash Snd]
type = PlaySnd
trigger1 = animelem = 5
value = S100,2
[State 3000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,81
[State 3000, Voice Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,81

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 5
x = 16.5

[State 220, Hit]
type=hitdef
trigger1 = !Time
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

[State 3200, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
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
triggerall = prevstateno!=4600
trigger1=movehit && frontedgebodydist <= 150
value = 4605
ignorehitpause=0

[State 1300, ChangeState]
type = ChangeState
triggerall = prevstateno!=4600
trigger1=movehit
value = 4601
ignorehitpause=0

[State 3500, End]
type = ChangeState
trigger1 = Time > 50
value = 101

;-------------------------------------------
;DragonFist (Kick Attempt)
[StateDef 4601]
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
value=4601

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 5000
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[State 1600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 8
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 35, 35), ifelse(var(20), 35, 35)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2, -9.5
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -9.5
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=80), var(36):=-70
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 4602
ctrl = 0

;-----------------------------------------------
;DragonFist Contin. (Success SSJ3 DragonFist)
[StateDef 4602]
type = A
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
value=4602

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

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay
ignorehitpause = 1

[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time<=10
scale = 1 + (0.01*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(51) = 2
trigger1 = time>10
trigger1 = time<=107
scale = 1.6
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 3400, Super Pause FX]
type = Helper
trigger1 = Animelem = 8
stateNo = 8523
ID = 8500
name = "Superpause FX"
posType = p1
pos = 25, -50
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, SuperPlaySnd]
type = PlaySnd
trigger1 = Animelem = 8
value = S8500,1

[State 3000, Superpause]
type = superpause
trigger1 = !Time
time = 117
movetime = 117
p2defmul = 1
unhittable = 1
anim = -1
darken = 0

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 9
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4602)) && time = [64,162]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4602)) && time = 163
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 3301, bind]
type=targetbind
trigger1= Time > 0 && TIME < 161
pos=90,-45

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
x = 5
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 112
x = .5
y = -.5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 162
x = 3

[State 0, Gravity]
type = Gravity
trigger1 = Animelem = 14 

[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,7
[State 0, Power Aura Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,7
[State 0, Voice Your Gonna Pay!!! Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,85
[State 0, Voice Your Gonna Pay!!! Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,85
[State 0, Voice Your Gonna Pay!!! Snd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,85
[State 0, DragonFist Voice Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,60
[State 0, DragonFist Voice Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,60
[State 0, Dragon Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,77
[State 0, Dragon Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,78
[State 0, Dragon Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,77
[State 0, Dragon Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S5,78
[State 0, Dragon Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S6,29
[State 0, Dragon Snd]
type = PlaySnd
trigger1 = animelem = 10
value = S6,29

[State 3600, Helper]
type = Helper
trigger1 = animelem=10
helpertype = normal ;player
name = "Dragon Fist"
ID = 4615
stateno = 4615
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 9999
pausemovetime = 9999
size.xscale = .9
size.yscale = .9

[State 0, Outline Explod]
type = Explod
trigger1 = animelem = 10
anim = 4625
ID = 4625
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = 40
scale = .85,.85
sprpriority = 80
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 4
value = 255,255,255
time = 3
[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 34
freq = 60
ampl = -4
phase = 90

[State 3051, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = A, HA
damage = ceil(ifelse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
;damage = ceil(36 * root, fvar(11)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4, 8
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=150), var(36):=-100
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5,-3
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5,-3
guard.velocity = -10.52
ground.cornerpush.veloff = 0
p2facing = 1
kill = 0
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 0, 0;36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 54

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3500, End]
type = ChangeState
trigger1 = !Animtime
value = 4603
ctrl = 0

;-----------------------------------------------
;DragonFist Contin. (Last Hit)
[StateDef 4603]
type = A
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
value=4603

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay
ignorehitpause = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4603)) && time = 1
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4603)) && time = 1
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 5.5
y = -5.5

[State 0, VelSet]
type = VelSet
trigger1 = Time > 11
x = 4.5

[State 0, Gravity]
type = Gravity
trigger1 = Time > 11

[State 0, Back to SSJ2 Snd]
type = PlaySnd
trigger1 = pos y > -vel y
value = S6,33

[State 0, Palfx]
type = Palfx
trigger1 = pos y > -vel y
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 3051, Hit]
type = hitdef
trigger1 = ANIMELEM = 1
priority = 4, Hit
attr = A, HA
damage = ceil(ifelse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
;damage = ceil(36 * root, fvar(11)), 8
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 10, 10)
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=150), var(36):=-100
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7,-8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -7,-8
guard.velocity = -10.52
ground.cornerpush.veloff = 0
p2facing = 1
kill = 0
fall = 1;(var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 0, 0;36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 54

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3500, End]
type = ChangeState
triggerall = Target, Life <= 130
trigger1 = animelem = 1
value = 4604

[State 3500, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;-----------------------------------------------
;SSJ3 Kamehameha!!!!!
[StateDef 4604]
type = A
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
value=4604

[State 8520, Assert]
type = assertspecial
trigger1 = time < 480
flag = nobardisplay
ignorehitpause = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !time
time = 313
moveTime = 313
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 4
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
trigger1 = animelemtime(9)=-4
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = time = 1
time = 64
sinadd = -255, -255, -255, 256

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4604)) && time = [0,313]
time = 1
add = -255, -255, -255
sinadd = 0, 0, 0, 1
ignorehitpause = 1
persistent = 1

[State 4001, fadeout]
type = bgpalfx
trigger1 = (!winko||numtarget(4604)) && time = 314
time = 64
add = -255, -255, -255
sinadd = 255, 255, 255, 256
ignorehitpause = 1

[State 0, Turn]
type = Turn
trigger1 = !Time

[state 0]
type = posset
trigger1 = !Time
y = P2Dist Y -75

[state 0]
type = posadd
trigger1 = !Time
x = P2Dist X -55

[State 0, VelSet]
type = VelSet
trigger1 = TIME < 310
x = -.2

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
trigger1 = !animtime
channel = 1

[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,105
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,105
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,105
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,106
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,106
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,106
[State 0, Voice Snd]
type = PlaySnd
trigger1 = animelem = 8
value = S5,106

[State 0, !!!! Snd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,20

[State 0, Kame Form Snd]
type = PlaySnd
trigger1 = animelem = 7
value = S6,23

[State 0, Kame Release Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,14
[State 0, Kame Release Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,18
[State 0, Kame Release Snd]
type = PlaySnd
trigger1 = animelem = 9
value = S6,19

[State 0, Explod]
type = Explod
trigger1 = animelem = 7
anim = 4005
ID = 4005
pos = -20,-100
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 45
pausemovetime = 65535
supermovetime = 65535
scale = .8,.8
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 7
anim = 3001
ID = 4005
pos = -30,-90
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 300
pausemovetime = 65535
supermovetime = 65535
scale = .4,.4
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 730, SSJ Aura]
type = helper
trigger1 = animelem = 6
stateno = 6009
ID = 6000
name = "SSJ Aura"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
size.xscale = 0.3
size.yscale = 0.33
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 9
helpertype = normal ;player
name = "SSJ3 Kame Wave"
ID = 4108
stateno = 4108
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
removeongethit = 1

[State 0, Palfx]
type = Palfx
trigger1 = time = 480
time = 20
add = 150,150,150
mul = 240,230,190;256,256,256
sinadd = 100,100,100,22
ignorehitpause = 1

[State 0, Back to SSJ2 Snd]
type = PlaySnd
trigger1 = time = 480
value = S6,33

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 50

;-------------------------------------------
;DragonFist (Kick Attempt) FronEdgeDist
[StateDef 4605]
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
value=4605

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S6,0

[State 0, Turn]
type = Turn
trigger1 = animelem = 1
[state 0]
type = posadd
trigger1 = animelem = 1
x = P2Dist X -55

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(5000)
value = 5000
ID = 5000
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(5000)
pos = 30, 0
ID = 5000
ignorehitpause = 1

[State 1600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 45 < 25, 25, fvar(11) * 45)), 8
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 35, 35), ifelse(var(20), 35, 35)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity =  -2, -9.5
ground.cornerpush.veloff = 0
guard.velocity = -2 
guard.cornerpush.veloff = 0
air.velocity = -2, -9.5
air.cornerPush.velOff = 0
yaccel = .45
kill = 0
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=80), var(36):=-70
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 4602
ctrl = 0

;---------------------------------------------------------
;Omega Kamehameha
[Statedef 4400]
type = S
physics = N
movetype = I
anim = 4400+var(1)*3
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

;Max Super Kame
[StateDef 4402]
type=S
movetype=A
physics=N
poweradd=0
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3000, Anim]
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
size.xscale = 0.3
size.yscale = 0.33
ownpal = 1

[State 3050, width]
type = width
trigger1 = animelemtime(6) = 0
value =30, 0

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
trigger1 = partner, numhelper(8522)
stateNo = 8521
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -57
persistent = 0
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 3050, Kame Ball FX]
type = Helper
trigger1 = animelem = 4
stateNo = 3001
ID = 3001
name = "Kame Ball FX"
posType = P1
pos = -25, -57
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, Kame]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3015
ID = 3015
name = "Max Kame"
postype = p1
pos = 53, 7
size.xscale = 0.9 
size.yscale = 0.9
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

[State 3000, SSJ Teleport PlaySnd]
type = PlaySnd
triggerall = var(1) = 1
trigger1 = command = "up" && Time < 13
value = S6,0
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,30
[State 3000, Kame Ball Load PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6,3
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, Kame Release PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S6,6
[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,9
[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,9
[State 3000, SSJ2 Voice PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,9

[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = 1,1
ontop = 1
[State 3000, Hand Fireball Aura Explod]
type = Explod
trigger1 = animelem = 6
anim = 1004
ID = 1004
pos = 60, -70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 0
scale = 1,1
ontop = 1

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1