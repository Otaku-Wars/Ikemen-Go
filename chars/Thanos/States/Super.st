;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================
;---------------------------------------------------------------------------
; GEM
[Statedef 4010]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741;4011
sprpriority = 5
velset = 0,0

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4011
trigger1 = parent,stateno = 3000
var(0) = 4011

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4011
trigger1 = parent,stateno = 3050
var(0) = 4011

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4015
trigger1 = parent,stateno = 3100
var(0) = 4015

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4014
trigger1 = parent,stateno = 3200
var(0) = 4012

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4014
trigger1 = parent,stateno = 3250
var(0) = 4013


[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4013
trigger1 = parent,stateno = 3300
var(0) = 4010

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4014
trigger1 = parent,stateno = 3350
var(0) = 4014

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4015
trigger1 = parent,stateno = 3400
var(0) = 4015

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4010
trigger1 = parent,stateno = 3500
var(0) = 4013

[State 0, ChangeAnim]
type = VarSet
trigger1 = var(0) != 4014
trigger1 = parent,stateno = 3550
var(0) = 4013

[State 0, VarSet]
type = VarAdd
trigger1 = time
fvar(0) = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x - 25*const(size.xscale)
y = parentdist y - 162*const(size.yscale); +(sin(time*.11)*8)
;ignorehitpause =
;persistent =

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = var(0)
ID = 4010
pos = ceil(cos(time*.48)*fvar(0)),ceil(sin(time*.48)*fvar(0))
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 38
pausemovetime = 65535
supermovetime = 65535
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
;ontop = 1
shadow = -1,-1,-1
ownpal = 1
removeongethit = 0
[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = var(0)
ID = 4011
pos = 0-ceil(cos(time*.48)*fvar(0)),0-ceil(sin(time*.48)*fvar(0))
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 38
pausemovetime = 65535
supermovetime = 65535
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
;ontop = 1
shadow = -1,-1,-1
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = ModifyExplod
trigger1 = numexplod(4010)
ID = 4010
pos = ceil(cos(time*.48)*fvar(0)),ceil(sin(time*.48)*fvar(0))
postype = p1
bindtime = 1
[State 0, Explod]
type = ModifyExplod
trigger1 = numexplod(4011)
ID = 4011
pos = 0-ceil(cos(time*.48)*fvar(0)),0-ceil(sin(time*.48)*fvar(0))
postype = p1
bindtime = 1

[State 0, RemoveExplod]
type = RemoveExplod
triggerall = numexplod(4010)
trigger1 = time
trigger1 = parent,stateno != 3000
trigger1 = parent,stateno != 3050
trigger1 = parent,stateno != 3100
trigger1 = parent,stateno != 3200
trigger1 = parent,stateno != 3250
trigger1 = parent,stateno != 3300
trigger1 = parent,stateno != 3350
trigger1 = parent,stateno != 3400
trigger1 = parent,stateno != 3500
trigger1 = parent,stateno != 3550
id = 4010

[State 0, RemoveExplod]
type = RemoveExplod
triggerall = numexplod(4011)
trigger1 = time
trigger1 = parent,stateno != 3000
trigger1 = parent,stateno != 3050
trigger1 = parent,stateno != 3100
trigger1 = parent,stateno != 3200
trigger1 = parent,stateno != 3250
trigger1 = parent,stateno != 3300
trigger1 = parent,stateno != 3350
trigger1 = parent,stateno != 3400
trigger1 = parent,stateno != 3500
trigger1 = parent,stateno != 3550
id = 4011


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time; >= 38
trigger1 = !numexplod(4010)
trigger1 = !numexplod(4011)
;trigger1 = parent,stateno != 3000
;trigger1 = parent,stateno != 3100
;trigger1 = parent,stateno != 3200
;trigger1 = parent,stateno != 3300
;trigger1 = parent,stateno != 3400
;trigger1 = parent,stateno != 3500

;-----------
; TIME
; 202
[Statedef 3100]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -2000;-2000
sprpriority = 2
facep2 = 1
velset = 0,0



[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = anim = 3000
;trigger1 = animelem = 4
;value = S2,16
;channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S2,19
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A



[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
;triggerall = time <= 240
;triggerall = numhelper(3301)
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
time = 1
add = 256,-50,-50
mul = 256,200,200
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "Time Vortex"
ID = 3101
stateno = 3101
pos = 0,0
postype = p1
facing = 1
ownpal = 1
persistent = 0
supermovetime = 90
pausemovetime = 90

[State 0, NotHitBy]
type = NotHitBy
trigger1 = numhelper(3108)
;trigger1 = numhelper(3401)
;trigger1 = helper(3401),stateno = 3402
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = movetype = A
trigger1 = numhelper(3101)
trigger1 = helper(3101),stateno = 3102
trigger1 = helper(3101),time
movetype = I
ignorehitpause = 1


[State 200, 7]
type = ChangeState
trigger1 = time >= 116
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Time Vortex
[Statedef 3101]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3100
poweradd = 0
sprpriority = 5
velset = 0,0
facep2 = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 1
anim = 3101
ID = 3101
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = 65535
scale = const(size.xscale),const(size.yscale)
sprpriority = -5
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,53
channel = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,NA,SA,NT,ST,HT
time = 2
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 7.08594 * (4.0/3.0);8*(4.0/3.0)
[State 0, VelSet]
type = VelSet
trigger1 = movecontact
trigger2 = movereversed
x = 0

[State ProRation]
type = VarSet
trigger1 = 1
var(13) = parent,var(13)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
var(13) = 1
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = !movecontact
var(0) = ifelse((enemynear,anim=5300),1,0)

[State 200, 1]
type = HitDef
trigger1 = time = 1
attr = S, HP
damage = 700, 12
animtype = hard
guardflag = MA
hitflag = MAFD
pausetime = 0,6
sparkno = S1009
guard.sparkno = S908
sparkxy = 0,-60
hitsound = S2, 7
guardSound = S3,0
ground.type = High
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -10.18
guard.velocity = -10.18
airguard.velocity = -4.99536,-0.79687 * (4.0/3.0) * const(size.yscale)
air.type = High
air.velocity = -5,-9.9 * const(size.yscale)
air.hittime = 24
;air.fall = 1
guard.ctrltime = 20
fall.recovertime = 24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 5
getpower = 0
forcenofall = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = movehit
trigger1 = numtarget
x = p2dist x
y = p2dist y
ignorehitpause = 1
;persistent = 0

[State 0, DestroySelf]
type = ChangeState
trigger1 = time > 3
trigger1 = frontedgedist < -64
trigger2 = movecontact >= 16
trigger3 = movereversed >= 16
value = 3102

;---------------------------------------------------------------------------
; Time Vortex
[Statedef 3102]
type    = A
movetype= I
physics = N
ctrl = 0
;lanim = 1004
poweradd = 0
sprpriority = 5
velset = 0,0

[State 0, StopSnd]
type = StopSnd
trigger1 = time >= 5
channel = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(3101)
id = 3101

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 5

;---------------------------------------------------------------------------
; Bullet Time Countdown
[Statedef 3108]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741
poweradd = 0
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
ignorehitpause = 1
flag = nokoslow
flag2 = nomusic
flag3 = timerfreeze

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,51
abspan = 0

[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
var(19) = 400

[State 0, ParentVarSet]
type = ParentVarAdd
trigger1 = time
trigger1 = parent,var(19) > 0
var(19) = -1

[State 0, ChangeState]
type = ChangeState
triggerall = time
trigger1 = parent,var(19) <= 0
trigger2 = win
trigger3 = lose
value = 3109
ctrl = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = 1
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = 1
[State 0, VarSet]
type = VarSet
trigger1 = time
fvar(0) = fvar(0) * 0.93
[State 0, VarSet]
type = VarSet
trigger1 = time
fvar(1) = fvar(1) * 0.8

[State 0, BGPalFX]
type = BGPalFX
trigger1 = 1
time = 2
add = ceil(256*fvar(1)),ceil(256*fvar(1)),ceil(256*fvar(1))
mul = 256,256,256
color = ceil(256*fvar(0))
ignorehitpause = 1

;---------------------------------------------------------------------------
; Bullet Time End
[Statedef 3109]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741
poweradd = 0
velset = 0,0



[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
ignorehitpause = 1
flag = nokoslow
flag2 = nomusic
flag3 = timerfreeze

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,52
abspan = 0

[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
var(19) = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = 0
[State 0, VarSet]
type = VarSet
trigger1 = time
fvar(1) = fvar(1) + 0.0003
[State 0, VarSet]
type = VarSet
trigger1 = time
fvar(0) = fvar(0) + fvar(1)

[State 0, ChangeState]
type = DestroySelf
trigger1 = fvar(0) >= 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = fvar(0) < 1
time = 2
add = 0,0,0
mul = 256,256,256
color = ceil(256*fvar(0))
ignorehitpause = 1

;-----------
; REALITY
; 257-299
[Statedef 3250]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -2000
sprpriority = 2
facep2 = 1
velset = 0,0


[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0



[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S2,17
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A


[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
trigger2 = anim = 3001
trigger2 = animelemtime(5) < 0
time = 1
add = 256,256,-50
mul = 256,256,200
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 5
fvar(0) = p2dist x
[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 5
trigger1 = fvar(0) < 160;(18*6)+75
fvar(0) = 160;(18*6)+75
[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 5
trigger1 = fvar(0)+(15*(5.125*(4.0/3.0))) > frontedgedist
fvar(0) = frontedgedist-(15*(5.125*(4.0/3.0)))

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "PILLAR-B"
ID = 3251
stateno = 3251
pos = ceil(fvar(0)-(15*(5.125*(4.0/3.0)))),0
postype = p1
facing = 1
ownpal = 1
;persistent = 0
pausemovetime = var(19)

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "PILLAR-F"
ID = 3252
stateno = 3252
pos = ceil(fvar(0)+(15*(5.125*(4.0/3.0)))),0
postype = p1
facing = 1
ownpal = 1
;persistent = 0
pausemovetime = var(19)

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = movetype = A
trigger1 = numhelper(3251)
trigger1 = helper(3251),stateno = 3209
trigger2 = numhelper(3252)
trigger2 = helper(3252),stateno = 3209
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = time >= 142;136
value = 0
ctrl = 1
; REALITY
[Statedef 3251]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 3110
sprpriority = 4
velset = 0,0

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
helpertype = normal
name = "Debris"
ID = 908
stateno = 908
pos = -30+random%60,0
postype = p1
facing = ifelse(random<500,1,-1)
ownpal = 1
pausemovetime = parent,var(19)

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 30
freq = 222
ampl = -4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,10

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 1
fvar(13) = (parent,fvar(13)) * 0.97
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
trigger5 = animelem = 6
trigger6 = animelem = 7
trigger7 = animelem = 8
trigger8 = animelem = 9
attr = A, HP
damage = 60,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,1
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -10 + ( -15*(animelemtime(2)) )
hitsound = S2, 2
guardSound = S3,0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = -9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = -13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = 0.375 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
guard.dist = 0
kill = 0

[State 200, 1]
type = HitDef
trigger1 = animelemtime(11) >= 0
trigger1 = movecontact != [1,6]
trigger1 = movereversed != [1,6]
trigger2 = animelemtime(14) = 0
trigger3 = animtime = -1
attr = A, HP
damage = 60,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,ifelse(animtime < -1,4,8)
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -100 + floor(p2dist y / 2)
hitsound = S2, 2
guardsound = S6, 0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = ifelse(animelemtime(14) < 0,-3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = -ifelse(animelemtime(14) < 0,-3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = -13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = ifelse(animtime <-1,0.375,0.6875) * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
mindist = ifelse(animelemtime(14) < 0,35,-8),-145
maxdist = 999,0
kill = (animtime >= -1)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = S0,33
channel = 1
loop = 1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 15
value = S0,34
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 11
x = 5.125*(4.0/3.0)
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 15
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = parent,stateno != 3250
trigger2 = parent,stateno != 3000
value = 3209
ctrl = 0

;-----------
; REALITY
[Statedef 3252]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 3111
sprpriority = 4
velset = 0,0

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
helpertype = normal
name = "Debris"
ID = 908
stateno = 908
pos = -30+random%60,0
postype = p1
facing = ifelse(random<500,1,-1)
ownpal = 1
pausemovetime = parent,var(19)


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,10

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 1
fvar(13) = (parent,fvar(13)) * 0.97
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
trigger5 = animelem = 6
trigger6 = animelem = 7
trigger7 = animelem = 8
trigger8 = animelem = 9
attr = A, HP
damage = 60,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,1
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -10 + ( -15*(animelemtime(2)) )
hitsound = S2, 2
guardSound = S3,0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = 9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
airguard.velocity = 4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = 9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = 13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = 0.375 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
guard.dist = 0
kill = 0

[State 200, 1]
type = HitDef
trigger1 = animelemtime(11) >= 0
trigger1 = movecontact != [1,6]
trigger1 = movereversed != [1,6]
trigger2 = animelemtime(14) = 0
trigger3 = animtime = -1
attr = A, HP
damage = 60,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,ifelse(animtime < -1,4,8)
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -100 + floor(p2dist y / 2)
hitsound = S2, 2
guardsound = S6, 0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = ifelse(animelemtime(14) < 0,3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = ifelse(animelemtime(14) < 0,3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = 13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = ifelse(animtime <-1,0.375,0.6875) * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
mindist = -999,-145
maxdist = ifelse(animelemtime(14) < 0,-35,8),0
kill = (animtime >= -1)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 11
x = -5.125*(4.0/3.0)
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 15
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = parent,stateno != 3250
trigger2 = parent,stateno != 3000
value = 3209
ctrl = 0


; REALITY
; 257-299
[Statedef 3200]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -1000
sprpriority = 2
facep2 = 1
velset = 0,0


[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S2,17
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A


[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
trigger2 = anim = 3001
trigger2 = animelemtime(5) < 0
time = 1
add = 256,256,-50
mul = 256,256,200
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 5
fvar(0) = p2dist x
[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 5
trigger1 = fvar(0) < 160;(18*6)+75
fvar(0) = 160;(18*6)+75
[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 5
trigger1 = fvar(0)+(15*(5.125*(4.0/3.0))) > frontedgedist
fvar(0) = frontedgedist-(15*(5.125*(4.0/3.0)))

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "PILLAR-B"
ID = 3201
stateno = 3201
pos = ceil(fvar(0)-(15*(5.125*(4.0/3.0)))),0
postype = p1
facing = 1
ownpal = 1
;persistent = 0
pausemovetime = var(19)

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "PILLAR-F"
ID = 3202
stateno = 3202
pos = ceil(fvar(0)+(15*(5.125*(4.0/3.0)))),0
postype = p1
facing = 1
ownpal = 1
;persistent = 0
pausemovetime = var(19)

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = movetype = A
trigger1 = numhelper(3201)
trigger1 = helper(3201),stateno = 3209
trigger2 = numhelper(3202)
trigger2 = helper(3202),stateno = 3209
movetype = I

[State 200, 7]
type = ChangeState
trigger1 = time >= 142;136
value = 0
ctrl = 1

;-----------
; REALITY
[Statedef 3201]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 3110
sprpriority = 4
velset = 0,0

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
helpertype = normal
name = "Debris"
ID = 908
stateno = 908
pos = -30+random%60,0
postype = p1
facing = ifelse(random<500,1,-1)
ownpal = 1
pausemovetime = parent,var(19)

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 30
freq = 222
ampl = -4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,10

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 1
fvar(13) = (parent,fvar(13)) * 0.97
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
trigger5 = animelem = 6
trigger6 = animelem = 7
trigger7 = animelem = 8
trigger8 = animelem = 9
attr = A, HP
damage = 38,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,1
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -10 + ( -15*(animelemtime(2)) )
hitsound = S2, 2
guardSound = S3,0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = -9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = -13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = 0.375 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
guard.dist = 0
kill = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, 1]
type = HitDef
trigger1 = animelemtime(11) >= 0
trigger1 = movecontact != [1,6]
trigger1 = movereversed != [1,6]
trigger2 = animelemtime(14) = 0
trigger3 = animtime = -1
attr = A, HP
damage = 38,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,ifelse(animtime < -1,4,8)
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -100 + floor(p2dist y / 2)
hitsound = S2, 2
guardSound = S3,0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = ifelse(animelemtime(14) < 0,-3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = -ifelse(animelemtime(14) < 0,-3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = -13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = ifelse(animtime <-1,0.375,0.6875) * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
mindist = ifelse(animelemtime(14) < 0,35,-8),-145
maxdist = 999,0
kill = (animtime >= -1)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = S0,33
channel = 1
loop = 1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 15
value = S0,34
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 11
x = 5.125*(4.0/3.0)
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 15
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = parent,stateno != 3200
trigger2 = parent,stateno != 3000
value = 3209
ctrl = 0

;-----------
; REALITY
[Statedef 3202]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 3111
sprpriority = 4
velset = 0,0

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
helpertype = normal
name = "Debris"
ID = 908
stateno = 908
pos = -30+random%60,0
postype = p1
facing = ifelse(random<500,1,-1)
ownpal = 1
pausemovetime = parent,var(19)


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,10

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 1
fvar(13) = (parent,fvar(13)) * 0.97
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
trigger5 = animelem = 6
trigger6 = animelem = 7
trigger7 = animelem = 8
trigger8 = animelem = 9
attr = A, HP
damage = 38,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,1
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -10 + ( -15*(animelemtime(2)) )
hitsound = S2, 2
guardSound = S3,0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = 9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
airguard.velocity = 4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = 9.2388,-4.2172 * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = 13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = 0.375 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
guard.dist = 0
kill = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, 1]
type = HitDef
trigger1 = animelemtime(11) >= 0
trigger1 = movecontact != [1,6]
trigger1 = movereversed != [1,6]
trigger2 = animelemtime(14) = 0
trigger3 = animtime = -1
attr = A, HP
damage = 38,7; ceil(55/(1+hitcount) ), 7
animtype = up
guardflag = MA
hitflag = MAFPD
pausetime = 0,ifelse(animtime < -1,4,8)
sparkno = S901
guard.sparkno = S908
sparkxy = -10, -100 + floor(p2dist y / 2)
hitsound = S2, 2
guardSound = S3,0
ground.type = hard
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = ifelse(animelemtime(14) < 0,3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
airguard.velocity = -4.99072,-0.8454 * (4.0/3.0) * const(size.yscale)
air.type = hard
air.velocity = ifelse(animelemtime(14) < 0,3.31659,0),ifelse(animtime < -1,-9.23335,-26.625) * (4.0/3.0) * const(size.yscale)
air.hittime = 42
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = 13.31
guard.ctrltime = 16
fall.recovertime = 42
yaccel = ifelse(animtime <-1,0.375,0.6875) * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
getpower = 0
mindist = -999,-145
maxdist = ifelse(animelemtime(14) < 0,-35,8),0
kill = (animtime >= -1)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 11
x = -5.125*(4.0/3.0)
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 15
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = parent,stateno != 3200
trigger2 = parent,stateno != 3000
value = 3209
ctrl = 0

;---------------------------------------------------------------------------
; POP
[Statedef 3209]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 9741
poweradd = 0
sprpriority = 4
velset = 0,0

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 30
freq = 222
ampl = -4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = prevstateno = 3201
trigger1 = time = 0
value = S0,11
channel = 1

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Debris"
ID = 907
stateno = 907
pos = 0,ceil(-180*const(size.yscale));ifelse(prevstateno=3102,-8,8),ceil(ifelse(prevstateno=3102,-180,-120)*const(size.yscale))
postype = p1
facing = -1
ownpal = 1
pausemovetime = parent,var(19)

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Debris"
ID = 907
stateno = 907
pos = 0,ceil(-150*const(size.yscale));ifelse(prevstateno=3102,-8,8),ceil(ifelse(prevstateno=3102,-100,-80)*const(size.yscale))
postype = p1
facing = -1
ownpal = 1
pausemovetime = parent,var(19)

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Debris"
ID = 907
stateno = 907
pos = 0,ceil(-120*const(size.yscale)); ifelse(prevstateno=3102,-8,8),ceil(ifelse(prevstateno=3102,-60,-40)*const(size.yscale))
postype = p1
facing = -1
ownpal = 1
pausemovetime = parent,var(19)

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Debris"
ID = 907
stateno = 907
pos = 0,ceil(-90*const(size.yscale));ifelse(prevstateno=3102,-8,8),ceil(ifelse(prevstateno=3102,-60,-40)*const(size.yscale))
postype = p1
facing = -1
ownpal = 1
pausemovetime = parent,var(19)

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Debris"
ID = 907
stateno = 907
pos = 0,ceil(-60*const(size.yscale));ifelse(prevstateno=3102,-8,8),ceil(ifelse(prevstateno=3102,-60,-40)*const(size.yscale))
postype = p1
facing = -1
ownpal = 1
pausemovetime = parent,var(19)


[State 0, ChangeState]
type = DestroySelf
trigger1 = time > 8


;---------------------------------------------------------------------------
; POWER
[Statedef 3050]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -2000
sprpriority = 2
facep2 = 1
velset = 0,0

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0



[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S3,15
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
trigger2 = anim = 3001
trigger2 = animelem = 2
movetype = A


[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
trigger2 = anim = 3001
trigger2 = animelemtime(5) < 0
time = 1
add = 256,-50,256
mul = 256,200,256
sinadd = 0,0,0,1
invertall = 0
color = 128
;add = 256,-50,-50
;mul = 256,200,200
;sinadd = 0,0,0,1
;invertall = 0
;color = 128

[State 200, 1]
type = PlaySnd
trigger1 = anim = 3001
trigger1 = animelem = 2
value = 0, 17

[State 0, Helper]
type = Helper
trigger1 = anim = 3001
trigger1 = animelem = 2
helpertype = normal
name = "FX"
ID = 3002
stateno = 3002
pos = 0,0
postype = p1
facing = 1
ownpal = 1
persistent = 0
pausemovetime = var(19)


[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= -1
trigger2 = anim = 3001
trigger2 = animelemtime(2) = -1
helpertype = normal
name = "POWER"
ID = 3053
stateno = 3053
pos = ceil(-39*const(size.xscale)),ceil(-119*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)


[State 200, 7]
type = ChangeAnim
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= -1 ; AnimTime = 0
value = 3001

[State 200, 7]
type = ChangeState
trigger1 = anim = 3001
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; POWER (held)
[Statedef 3053]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3005
sprpriority = 4
velset = 0,0

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 3005
time = -1
forceair = 1
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
;trigger1 = parent,anim = 3001
trigger1 = parent,animelemtime(2) < 0
fvar(12) = 0
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
;trigger1 = parent,anim = 3001
trigger1 = parent,animelemtime(2) < 0
fvar(13) = 0
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(2) >= 0
trigger1 = parent,animelemtime(3) < 0
fvar(12) = (-53*const(size.xscale))
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(2) >= 0
trigger1 = parent,animelemtime(3) < 0
fvar(13) = (-123*const(size.yscale))
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(3) >= 0
trigger1 = parent,animelemtime(4) < 0
fvar(12) = (-30*const(size.xscale))
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(3) >= 0
trigger1 = parent,animelemtime(4) < 0
fvar(13) = (-67*const(size.yscale))
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(4) >= 0
fvar(12) = (79*const(size.xscale))
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(4) >= 0
fvar(13) = (-60*const(size.yscale))
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
trigger1 = 1
x = parentdist x + fvar(12)
y = parentdist y + fvar(13)
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = parent,anim = 3001
trigger1 = parent,animelemtime(4) >= 0	
trigger2 = parent,stateno = 105
trigger3 = parent,stateno = [1100,1120]
;trigger2 = parent,anim != [3000,3009]
;trigger2 = parent,movetype = A
;trigger2 = parent,animelemtime(4) >= 0
;trigger1 = fvar(0) > 1
value = 3054
ctrl = 0

[State 0, ChangeState]
type = ChangeState
;trigger1 = parent,anim != 3001
trigger1 = parent,movetype = H
trigger2 = parent,stateno = 840
value = 3005
ctrl = 0

[State 0, VarSet]
type = VarAdd
trigger1 = fvar(0) < 1
fvar(0) = 0.1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = fvar(0) < 1
value = 0
scale = fvar(0),fvar(0)
;ignorehitpause = (parent,var(49)>=0)

;---------------------------------------------------------------------------
; POWER (hit)
[Statedef 3054]
type    = A
movetype= A
physics = N
ctrl = 0
poweradd = 0
sprpriority = 5
velset = 7.08594 * (4.0/3.0) ,0;10,0

[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3011
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0
[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3012
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0
[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3013
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0
[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3014
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0


[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 3005
time = -1
forceair = 1
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%4)=0
time = 1
add = 256,256,256
mul = 200,150,0
sinadd = 0,0,0,1
invertall = 0
color = 0

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = VarSet
trigger1 = 1
var(21) = ifelse(movehit=1,var(21)+1,0)
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.95
ignorehitpause = 1

[State 0, VelAdd]
type = VelAdd
trigger1 = time >= 8
y = -0.23 * (16.0/9.0) * const(size.yscale)
;y = -0.31 * (16.0/9.0) * const(size.yscale)



[State 3000, HitDef]
type = HitDef
trigger1 = movecontact != [1,2]
trigger1 = movereversed != [1,2]
attr = S, HP
damage = 150,60 ; 10 + ceil(70 / (hitcount + 1) ), 7    ; 63     ; 355
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
getPower = 0,0
givePower = 36, 36
pauseTime = 6, 12
guard.pauseTime = 6, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -7.51, -3.66
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.46, -4.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = S2,9
guardSound = S3,0
sparkNo = S901
guard.sparkNo = S908
sparkXY = 0,0
palfx.time = 20
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,10
palfx.invertall = 0
palfx.color = 0
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120


[State 0, VelSet]
type = VarSet
trigger1 = 1
var(22) = ifelse(moveguarded=1,var(22)+1,0)
ignorehitpause = 1
[State 0, VelSet]
type = VarAdd
trigger1 = var(22) = 1
var(7) = 1
ignorehitpause = 1

[State 0, DestroySelf]
type = ChangeState
trigger1 = frontedgedist < -100
trigger2 = hitcount >= 6
trigger3 = var(7) >= 6
value = 3005

[State 0, VarSet]
type = VarAdd
trigger1 = fvar(0) < 1
fvar(0) = 0.1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = fvar(0) < 1
value = 0
scale = fvar(0),fvar(0)
;ignorehitpause = (parent,var(49)>=0)


;---------------------------------------------------------------------------
; POWER
[Statedef 3000]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -1000
sprpriority = 2
facep2 = 1
velset = 0,0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0



[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S3,15
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
trigger2 = anim = 3001
trigger2 = animelem = 2
movetype = A


[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
trigger2 = anim = 3001
trigger2 = animelemtime(5) < 0
time = 1
add = 256,-50,256
mul = 256,200,256
sinadd = 0,0,0,1
invertall = 0
color = 128
;add = 256,-50,-50
;mul = 256,200,200
;sinadd = 0,0,0,1
;invertall = 0
;color = 128

[State 200, 1]
type = PlaySnd
trigger1 = anim = 3001
trigger1 = animelem = 2
value = 0, 17

[State 0, Helper]
type = Helper
trigger1 = anim = 3001
trigger1 = animelem = 2
helpertype = normal
name = "FX"
ID = 3002
stateno = 3002
pos = 0,0
postype = p1
facing = 1
ownpal = 1
persistent = 0
pausemovetime = var(19)


[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= -1
trigger2 = anim = 3001
trigger2 = animelemtime(2) = -1
helpertype = normal
name = "POWER"
ID = 3003
stateno = 3003
pos = ceil(-39*const(size.xscale)),ceil(-119*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)


[State 200, 7]
type = ChangeAnim
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= -1 ; AnimTime = 0
value = 3001

[State 200, 7]
type = ChangeState
trigger1 = anim = 3001
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; FX
[Statedef 3002]
type    = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 3002
sprpriority = 3

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,anim != 3001
trigger3 = parent,anim = 3001
trigger3 = parent,animelemtime(4) >= 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add1
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

;---------------------------------------------------------------------------
; POWER (held)
[Statedef 3003]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 3005
sprpriority = 4
velset = 0,0

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 3005
time = -1
forceair = 1
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
;trigger1 = parent,anim = 3001
trigger1 = parent,animelemtime(2) < 0
fvar(12) = 0
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
;trigger1 = parent,anim = 3001
trigger1 = parent,animelemtime(2) < 0
fvar(13) = 0
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(2) >= 0
trigger1 = parent,animelemtime(3) < 0
fvar(12) = (-53*const(size.xscale))
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(2) >= 0
trigger1 = parent,animelemtime(3) < 0
fvar(13) = (-123*const(size.yscale))
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(3) >= 0
trigger1 = parent,animelemtime(4) < 0
fvar(12) = (-30*const(size.xscale))
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(3) >= 0
trigger1 = parent,animelemtime(4) < 0
fvar(13) = (-67*const(size.yscale))
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(4) >= 0
fvar(12) = (79*const(size.xscale))
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = parent,anim = 3001 || parent,movetype = A
trigger1 = parent,animelemtime(4) >= 0
fvar(13) = (-60*const(size.yscale))
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
trigger1 = 1
x = parentdist x + fvar(12)
y = parentdist y + fvar(13)
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = parent,anim = 3001
trigger1 = parent,animelemtime(4) >= 0	
trigger2 = parent,stateno = 105
trigger3 = parent,stateno = [1100,1120]
;trigger2 = parent,anim != [3000,3009]
;trigger2 = parent,movetype = A
;trigger2 = parent,animelemtime(4) >= 0
;trigger1 = fvar(0) > 1
value = 3004
ctrl = 0

[State 0, ChangeState]
type = ChangeState
;trigger1 = parent,anim != 3001
trigger1 = parent,movetype = H
trigger2 = parent,stateno = 840
value = 3005
ctrl = 0

[State 0, VarSet]
type = VarAdd
trigger1 = fvar(0) < 1
fvar(0) = 0.1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = fvar(0) < 1
value = 0
scale = fvar(0),fvar(0)
;ignorehitpause = (parent,var(49)>=0)

;---------------------------------------------------------------------------
; POWER (hit)
[Statedef 3004]
type    = A
movetype= A
physics = N
ctrl = 0
poweradd = 0
sprpriority = 5
velset = 7.08594 * (4.0/3.0) ,0;10,0

[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3011
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0
[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3012
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0
[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3013
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0
[State 0, Explod]
type = Explod
trigger1 = fvar(0) >= 1
anim = 3014
ID = 3011
pos = ceil((-80+random%160)*const(size.xscale)),ceil((-60+random%120)*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = parent,var(19)
scale = 1,1
sprpriority = 6
ownpal = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0


[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 3005
time = -1
forceair = 1
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%4)=0
time = 1
add = 256,256,256
mul = 200,150,0
sinadd = 0,0,0,1
invertall = 0
color = 0

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = VarSet
trigger1 = 1
var(21) = ifelse(movehit=1,var(21)+1,0)
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.95
ignorehitpause = 1

[State 0, VelAdd]
type = VelAdd
trigger1 = time >= 8
y = -0.23 * (16.0/9.0) * const(size.yscale)
;y = -0.31 * (16.0/9.0) * const(size.yscale)



[State 3000, HitDef]
type = HitDef
trigger1 = movecontact != [1,2]
trigger1 = movereversed != [1,2]
attr = S, HP
damage = 140,50
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
getPower = 0,0
givePower = 36, 36
pauseTime = 6, 12
guard.pauseTime = 6, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -7.51, -3.66
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.46, -4.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = S2,9
guardSound = S3,0
sparkno = S901
guard.sparkno = S908
sparkxy = 0,0
palfx.time = 20
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,10
palfx.invertall = 0
palfx.color = 0
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120


[State 0, VelSet]
type = VarSet
trigger1 = 1
var(22) = ifelse(moveguarded=1,var(22)+1,0)
ignorehitpause = 1
[State 0, VelSet]
type = VarAdd
trigger1 = var(22) = 1
var(7) = 1
ignorehitpause = 1

[State 0, DestroySelf]
type = ChangeState
trigger1 = frontedgedist < -100
trigger2 = hitcount >= 6
trigger3 = var(7) >= 6
value = 3005

[State 0, VarSet]
type = VarAdd
trigger1 = fvar(0) < 1
fvar(0) = 0.1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = fvar(0) < 1
value = 0
scale = fvar(0),fvar(0)
;ignorehitpause = (parent,var(49)>=0)

;---------------------------------------------------------------------------
; POWER (shrink into nothing)
[Statedef 3005]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3005
velset = 3.54297*(4.0/3.0),0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(3011)
id = 3011
ignorehitpause = 1


[State 0, VelMul]
type = VelMul
trigger1 = time
x = 0.9
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
trigger1 = (time%4)=0
time = 1
add = 256,256,256
mul = 200,150,0
sinadd = 0,0,0,1
invertall = 0
color = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = (time%3)=0
flag = invisible
ignorehitpause = 1

[State 0, VarSet]
type = VarAdd
trigger1 = 1
fvar(0) = -0.1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = 0
scale = fvar(0),fvar(0)
;ignorehitpause = (parent,var(49)>=0)

[State 0, ChangeState]
type = DestroySelf
trigger1 = fvar(0) <= 0

;-----------
; MIND
[Statedef 3300]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -3000;-2000
sprpriority = 2
facep2 = 1
velset = 0,0

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
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
trigger1 = AnimElemTime(9) < 0 || AnimElem = 9
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8520
ID = 8520
name = "Superpause FX"
posType = p1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0


[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S2,20
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S2,20
channel = 0



[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
;triggerall = time <= 240
;triggerall = numhelper(3301)
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
time = 1
add = -50,-50,256
mul = 200,200,256
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 200, 7]
type = ChangeState
;trigger1 = time >= 124
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
value = 3301
ctrl = 0

;-----------
; MIND
[Statedef 3301]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3300
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
ignorehitpause = 1
flag = nomusic
flag2 = timerfreeze

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,26

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,54
loop = 1
channel = 0
abspan = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = random%360

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(3) = 0

;[State 0, PosSet]
;type = PosSet
;trigger1 = animtime = 0
;x = 0
;y = 0

[State 0, Helper]
type = Helper
trigger1 = !numhelper(3302)
helpertype = player;normal
name = "Wrong"
ID = 3302
stateno = 3302
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 9
keyctrl = 1

[State 0, Helper]
type = Helper
trigger1 = !numhelper(3303)
helpertype = player;normal
name = "Wrong"
ID = 3303
stateno = 3303
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 9
keyctrl = 1

[State 0, Helper]
type = Helper
trigger1 = !numhelper(3304)
helpertype = player;normal
name = "Wrong"
ID = 3304
stateno = 3304
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 9
keyctrl = 1

[State 0, Helper]
type = Helper
trigger1 = !numhelper(3305)
helpertype = player;normal
name = "Correct"
ID = 3305
stateno = 3305
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 9
keyctrl = 1


[State 0, ChangeState]
type = ChangeState
triggerall = time
trigger1 = var(1) = -1
trigger2 = time >= 528
trigger3 = winko
value = 3310
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = time
trigger1 = var(1) = 1
value = 3311
ctrl = 0

[State 0, EASY]
type = ChangeState
;triggerall = !ishelper
trigger1 = numhelper(3302)
trigger1 = helper(3302),stateno = stateno
trigger2 = numhelper(3303)
trigger2 = helper(3303),stateno = stateno
trigger3 = numhelper(3304)
trigger3 = helper(3304),stateno = stateno
trigger4 = numhelper(3305)
trigger4 = helper(3305),stateno = stateno
value = 3313
ctrl = 0
; W
[Statedef 3302]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3302
velset = 0,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = (parent,var(0))

[State 0, ChangeState]
type = ChangeState
trigger1 = 1
value = 3330
ctrl = 0

; W
[Statedef 3303]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3302
velset = 0,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = (parent,var(0))+40

[State 0, ChangeState]
type = ChangeState
trigger1 = 1
value = 3330
ctrl = 0

; W
[Statedef 3304]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3302
velset = 0,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = (parent,var(0))+80

[State 0, ChangeState]
type = ChangeState
trigger1 = 1
value = 3330
ctrl = 0

; W
[Statedef 3305]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3303
velset = 0,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = (parent,var(0))+120

[State 0, ChangeState]
type = ChangeState
trigger1 = 1
value = 3330
ctrl = 0


; W
[Statedef 3330]
type    = A
movetype= I
physics = N
ctrl = 0
;anim = 3502
velset = 0,0
sprpriority = 10

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3302
trigger1 = enemynear,movetype=A
movetype = A

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, ReversalDef]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA,NA,SA,HA,NP,SP,HP
pausetime = 0,12
sparkno = -1
hitsound = S2,2
p1stateno = 3332
ignorehitpause = 1
guard.dist = 0

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = ifelse(anim=3303,3333,3332)
time = -1
forceair = 1
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VarSet]
type = VarAdd
trigger1 = fvar(0) < 1
fvar(0) = 0.02

[State 0, PosAdd]
type = PosSet
trigger1 = 1
x = sin((time+var(0))*.04)*(100*fvar(0))
y = cos((time+var(0))*.04)*(100*fvar(0))

[State 0, ChangeState]
type = ChangeState
triggerall = time
trigger1 = parent,stateno != 3301
value = 3331
ctrl = 0

; Just Dissapear
[Statedef 3331]
type    = S
movetype= H
physics = S
ctrl = 0
anim = 3300
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ChangeState]
type = DestroySelf
trigger1 = animtime = 0
;value = 3530

; Incorrect Hit
[Statedef 3332]
type    = A
movetype= H
physics = N
ctrl = 0
anim = 3300
velset = 0,0

[State 0, TargetState]
type = TargetState
triggerall = numtarget
triggerall = time = 0
trigger1 = !(target,ishelper)
;trigger2 = PlayerIDExist(target,ID)
value = 3329
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
var(1) = -1

[State 0, ChangeState]
type = DestroySelf
trigger1 = animtime = 0
value = 3330

; Correct Hit
[Statedef 3333]
type    = A
movetype= H
physics = N
ctrl = 0
anim = 3300
velset = 0,0

[State 0, VarSet]
type = ParentVarSet
trigger1 = time = 0
var(3) = gethitvar(damage)

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
var(1) = 1
[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
fvar(0) = parentdist x
[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
fvar(1) = parentdist y

[State 0, ChangeState]
type = DestroySelf
trigger1 = animtime = 0
value = 3530

;---------------------------------------------------------------------------
; OOPS
[Statedef 3329]
type    = A
movetype= H
physics = N
velset = 0,0
juggle  = 0
ctrl = 0
sprpriority = 2
poweradd = 0

[State 0, Cancel Invul]
type = HitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1
ignorehitpause = 1
;persistent = 


[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 0, SelfState]
type = SelfState
trigger1 = time >= 32
value = 5050

;---------------------------------------------------------------------------
; HAH
[Statedef 3310]
type    = A
movetype= A
physics = N
juggle  = 0
ctrl = 0
anim = 3310
sprpriority = -4


[State 0, Helper]
type = Helper
trigger1 = !numhelper(3320)
helpertype = normal
name = "Andrew Jackson"
ID = 3320
stateno = 3320
pos = 0,0
postype = p1
facing = 1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1
persistent = 0

[State 0, SuperPause]
type = SuperPause
trigger1 = time >= 2
trigger1 = !movecontact
time = 1
anim = -1
sound = -1
pos = 0,0
movetime = 1
darken = 0
p2defmul = 1
poweradd = 0
unhittable = 1
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = (movecontact),0
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = p2dist x - 280
y = (p2dist y - 320) * const(size.yscale)

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 22
y = 22*const(size.yscale)

;[State 0, Turn]
;type = Turn
;trigger1 = time = 0
;trigger1 = facing != enemynear, facing
;ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = time = 0
value = 0, 23
channel = 0

[State 200, 1]
type = HitDef
trigger1 = time = 1
attr = S, HA
damage = 490, 0
animtype = hard
guardflag =
hitflag = MAFD
pausetime = 12-var(49), 11
sparkno = S901
guard.sparkno = S908
sparkxy = -10, ceil(48*const(size.yscale) )
hitsound = S2, 2
guardSound = S3,0
ground.type = high
ground.slidetime = 24
ground.hittime  = 24
ground.velocity = -18.01388,11.1614375 * const(size.yscale)
airguard.velocity = -4.99072,-1.52344 * const(size.yscale)
air.type = high
air.velocity = -18.01388,11.1614375 * const(size.yscale)
air.hittime = 24
fall = 1
guard.velocity = -7.83
guard.ctrltime = 10
fall.recovertime = 24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
id = 3310
getpower = 0
p2facing = 1
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State this method is superior]
type = TargetState
trigger1 = numtarget(3310)
trigger1 = var(21) = 1
trigger1 = !(target(3310),ishelper) || (PlayerIDExist((target(3310),id)) )
value = 624
ID = 3310
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = vel y + pos y >= -48*const(size.yscale)
value = 3312
ctrl = 0

;---------------------------------------------------------------------------
; HAH
[Statedef 3312]
type    = A
movetype= I
physics = N
juggle  = 0
ctrl = 0
anim = 3310
sprpriority = -4
velset = 0,0



[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S5,14

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,19

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 13
freq = 255
ampl = -6

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 918
ID = 918
pos = 32,floor(0-pos y)
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = var(19)
scale = 1,1
sprpriority = 62
ontop = 1
ownpal = 1
ignorehitpause = 1

[State 0, Helper]
type = Helper
trigger1 = time = [0,13]
helpertype = normal ;player
name = "Debris"
ID = 3321
stateno = 3321
pos = ceil((-67+random%166)*const(size.xscale)),-16+random%32
postype = p1
facing = ifelse(random<500,-1,1)
ownpal = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = time >= 13
x = -16*const(size.xscale)
y = 16*const(size.yscale)

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 13
value = 658
ctrl = 0



;---------------------------------------------------------------------------
; ACK
[Statedef 3311]
type    = A
movetype= H
physics = N
juggle  = 0
ctrl = 0
anim = 5070


[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
trigger1 = var(3) > 0
value = 0-var(3)
kill = 0
absolute = 1
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = enemynear,hitpausetime
value = 5070

[State 0, NotHitBy]
type = NotHitBy
trigger1 = enemynear,hitpausetime
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 3
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0-fvar(0)
y = 0-fvar(1)

[State 0, PosAdd]
type = PosSet
trigger1 = time = 0
trigger1 = pos y > -16
y = -16

[State 200, 1]
type = PlaySnd
trigger1 = time = 0
value = 5000, 4
channel = 0

[State 0, VelAdd]
type = VelAdd
trigger1 = !(enemynear,hitpausetime)
y = 0.79

[State 0, ChangeState]
type = ChangeState
trigger1 = !(enemynear,hitpausetime)
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 0
value = 5100
ctrl = 0


;-----------
; The_None thinks of everything
[Statedef 3313]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3313
velset = 0,0

[State INVALID COMBO]
type = VarSet
trigger1 = time = 0
trigger1 = !ishelper
var(37) = (parent,var(37)) | floor(exp(7*ln(2)) + 0.5)
ignorehitpause = 1

[State 200, 1]
type = PlaySnd
trigger1 = time = 0
value = 0, 22
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = ishelper
x = -6+random%12
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 30
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; GAMMA CRUSH
[Statedef 3320]
type    = A
movetype= I
physics = N
juggle  = 0
ctrl = 0
anim = 3320
sprpriority = 4

[State 0, PosAdd]
type = PosAdd
trigger1 = parent,anim = 3310
x = parentdist x
y = parentdist y
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = parent,anim != 3310

;---------------------------------------------------------------------------
; Rise up
[Statedef 3321]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3322 + floor((numhelper(3321)-1)/2)
sprpriority = 3

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = -25+random%50
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = -10-random%115

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = fvar(0)/10
y = fvar(1)/10

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.22 * (16.0/9.0) * const(size.yscale)

[State 0, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 3322

;---------------------------------------------------------------------------
; Bounced
[Statedef 3322]
type    = A
movetype= I
physics = N
ctrl = 0
;anim = 256

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = [3322,3325]
value = anim+3

[State 0, VelAdd]
type = VelSet
trigger1 = time = 0
x = vel x * 0.5
y = vel y * -0.5

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.22 * (16.0/9.0) * const(size.yscale)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = (time%3)=1
flag = invisible
ignorehitpause = 1


[State 0, ChangeState]
type = DestroySelf;ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= 0
ctrl = 0

;-----------
; SOUL
; 202
[Statedef 3550]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -2000
sprpriority = 2
facep2 = 1
velset = 0,0


[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0





[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S3,16
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A



[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
;triggerall = time <= 240
triggerall = numhelper(3501)
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
time = 1
add = -50,256,-50
mul = 200,256,200
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "ZAP ZAP"
ID = 3501
stateno = 3501
pos = ceil(-24*const(size.xscale)),ceil(-163*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
;persistent = 0
;supermovetime = 5
pausemovetime = var(19)

[State 0, Explod]
type = Explod
;trigger1 = time = 55
trigger1 = !numexplod(3550)
trigger1 = anim = 3000
trigger1 = animelem = 5
anim = 3550
ID = 3550
pos = ceil(-24*const(size.xscale)),ceil(-163*const(size.yscale))
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 0, LifeAdd]
type = LifeAdd
trigger1 = numhelper(3501)
trigger1 = helper(3501),stateno = 3503
trigger1 = (helper(3501),time%11)=10
value = 40
kill = 0
absolute = 1
ignorehitpause = 1

;[State 0, RemoveExplod]
;type = RemoveExplod
;trigger1 = time >= 61
;trigger1 = numexplod(3300)
;trigger1 = !numhelper(3301)
;id = 3300

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = movetype = A
trigger1 = numhelper(3501)
trigger1 = helper(3501),stateno = 3502
movetype = I

[State 0, NotHitBy]
type = NotHitBy
trigger1 = numhelper(3501)
trigger1 = helper(3501),stateno = 3503
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 200, 7]
type = ChangeState
trigger1 = time >= 106
trigger1 = !numhelper(3501)
value = 0
ctrl = 1

;-----------
; SOUL
; 202
[Statedef 3500]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -1000
sprpriority = 2
facep2 = 1
velset = 0,0


[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 10
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0




[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S3,16
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A



[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
;triggerall = time <= 240
triggerall = numhelper(3501)
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
time = 1
add = -50,256,-50
mul = 200,256,200
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 0, Helper]
type = Helper
;trigger1 = time = 55
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
name = "ZAP ZAP"
ID = 3501
stateno = 3501
pos = ceil(-24*const(size.xscale)),ceil(-163*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
;persistent = 0
;supermovetime = 5
pausemovetime = var(19)

[State 0, Explod]
type = Explod
;trigger1 = time = 55
trigger1 = !numexplod(3500)
trigger1 = anim = 3000
trigger1 = animelem = 5
anim = 3500
ID = 3500
pos = ceil(-24*const(size.xscale)),ceil(-163*const(size.yscale))
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 0, LifeAdd]
type = LifeAdd
trigger1 = numhelper(3501)
trigger1 = helper(3501),stateno = 3503
trigger1 = (helper(3501),time%11)=10
value = 30
kill = 0
absolute = 1
ignorehitpause = 1

;[State 0, RemoveExplod]
;type = RemoveExplod
;trigger1 = time >= 61
;trigger1 = numexplod(3300)
;trigger1 = !numhelper(3301)
;id = 3300

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = movetype = A
trigger1 = numhelper(3501)
trigger1 = helper(3501),stateno = 3502
movetype = I

[State 0, NotHitBy]
type = NotHitBy
trigger1 = numhelper(3501)
trigger1 = helper(3501),stateno = 3503
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 200, 7]
type = ChangeState
trigger1 = time >= 106
trigger1 = !numhelper(3501)
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Hook
[Statedef 3501]
type    = A
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 3501
sprpriority = 10

[State 0, PalFXWiz]
type = PalFX
trigger1 = (time%3)=2
time = 1
add = 0,0,0
mul = 128,128,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,25
channel = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(6) = p2dist x
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(7) = p2dist y + enemynear,const(size.mid.pos.y)

[State ****: Null]
type = Null
trigger1 = time = 0
trigger1 = (FVar(0) := (fvar(6) * 28) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))
trigger1 = (FVar(1) := (fvar(7) * 28) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))
;trigger1 = (FVar(0) := (fvar(6) * 32) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))
;trigger1 = (FVar(1) := (fvar(7) * 32) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))

[State ****: VelSet]
type = VelSet
trigger1 = time = 0
x = FVar(0)
y = FVar(1)
[State 0, Turn]
type = Turn
trigger1 = time = 0
trigger1 = vel x < 0

[State whatever, Set]
type = AngleSet
trigger1 = vel y != 0
value = (atan(Vel Y/Vel X)) *(-180/Pi)
[State whatever, Set]
type = AngleSet
trigger1 = vel y = 0
value = (atan(0)) *(-180/Pi)

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Lina"
ID = 3508
stateno = 3508
pos = 0,0
postype = p1
facing = 1
ownpal = 0
pausemovetime = parent,var(19)

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = parent,fvar(13);.25 + ((parent,fvar(13) * .75))
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = !movecontact
var(0) = ifelse((enemynear,anim=5500),1,0)

[State 200, 1]
type = HitDef
trigger1 = time = 1
attr = S, HP
damage = 63, 7
animtype = hard
guardflag = MA
hitflag = MAFD
pausetime = 0,0;8-(parent,var(49)),8
guard.pausetime = 0,8
sparkno = S901
guard.sparkno = S908
sparkxy = 0,0
hitsound = S2, 7
guardSound = S3,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -3.91
guard.velocity = -3.91
airguard.velocity = -3.99536,-0.39062 * (4.0/3.0) * const(size.yscale)
air.type = High
air.velocity = -3.99536,-0.39062 * (4.0/3.0) * const(size.yscale)
air.hittime = 16
air.fall = 1
guard.ctrltime = 16
fall.recovertime = 30
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
getpower = 0
kill = 0
id = 3550
palfx.time = 30
palfx.add = 100,100,180
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 0
p2facing = 1
[State this method is superior]
type = ChangeState
trigger1 = numtarget(3500)
trigger1 = movehit >= 1
trigger1 = !(target(3500),ishelper) || (PlayerIDExist((target(3500),id)) )
value = 3503
;ignorehitpause = 1


[State 200, 1]
type = HitDef
trigger1 = time = 1
attr = S, HP
damage = 63, 7
animtype = hard
guardflag = MA
hitflag = MAFD
pausetime = 0,0;8-(parent,var(49)),8
guard.pausetime = 0,8
sparkno = S901
guard.sparkno = S908
sparkxy = 0,0
hitsound = S2, 7
guardSound = S3,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -3.91
guard.velocity = -3.91
airguard.velocity = -3.99536,-0.39062 * (4.0/3.0) * const(size.yscale)
air.type = High
air.velocity = -3.99536,-0.39062 * (4.0/3.0) * const(size.yscale)
air.hittime = 16
air.fall = 1
guard.ctrltime = 16
fall.recovertime = 30
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 4
getpower = 0
kill = 0
id = 3500
palfx.time = 30
palfx.add = 100,100,180
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 0
p2facing = 1
[State this method is superior]
type = ChangeState
trigger1 = numtarget(3500)
trigger1 = movehit >= 1
trigger1 = !(target(3500),ishelper) || (PlayerIDExist((target(3500),id)) )
value = 3503
;ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time > 13
trigger2 = moveguarded
value = 3502
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = parent,stateno != 3500
trigger1 = parent,stateno != 3550
value = 3509
ctrl = 0

;---------------------------------------------------------------------------
; Retract Back
[Statedef 3502]
type    = A
movetype= I
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 9741
sprpriority = 10

[State 0, PalFXWiz]
type = PalFX
trigger1 = (time%3)=2
time = 1
add = 0,0,0
mul = 128,128,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1

[State 0, TargetState]
type = TargetState
trigger1 = time = 0
trigger1 = numtarget
trigger1 = prevstateno = 3503
value = 3529

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(6) = parentdist x - (24*const(size.xscale))
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(7) = parentdist y - (163*const(size.yscale))

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = (parentdist x - (24*const(size.xscale))) * 0.1
y = (parentdist y - (163*const(size.yscale))) * 0.1
ignorehitpause = 1


;[State ****: Null]
;type = Null
;trigger1 = time = 0
;trigger1 = (FVar(0) := (fvar(6) * 8) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))
;trigger1 = (FVar(1) := (fvar(7) * 8) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;x = fvar(0)
;y = fvar(1)

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 24
;trigger1 = parentdist x - (-24*const(size.xscale)) = [-34,34]
;trigger1 = parentdist y - (163*const(size.yscale)) = [-34,34]
value = 3509
ctrl = 0

;---------------------------------------------------------------------------
; GOTCHA
[Statedef 3503]
type    = A
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 3503
sprpriority = 10
velset = 0,0

[State 0, PalFXWiz]
type = PalFX
trigger1 = (time%3)=2
time = 1
add = 0,0,0
mul = 128,128,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = (parentdist x + 180*const(size.xscale)) * 0.1
y = (parentdist y - 162*const(size.yscale)) * 0.1
;ignorehitpause =
;persistent =
[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1
[State 0, Width]
type = Width
trigger1 = 1
edge = 32,0
player = 0,0
;value = 0,0
ignorehitpause = 1
;persistent = 


[State 0, TargetState]
type = TargetState
trigger1 = time = 0
trigger2 = (time%11)=10
value = 3520
[State 0, TargetBind]
type = TargetBind
trigger1 = 1
time = 1
id = 3500
pos = 32*const(size.xscale) + (time%3),(time%2)
[State 0, TargetBind]
type = TargetBind
trigger1 = 1
time = 1
id = 3550
pos = 32*const(size.xscale) + (time%3),(time%2)
[State 0, PlaySnd]
type = PlaySnd
trigger1 = (time%11)=10
value = S5,6;0,16
;[State 0, HitAdd]
;type = HitAdd
;trigger1 = (time%11)=10
;value = 1
[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = (time%11)=1
;value = ceil(-14 * (parent,fvar(13))  )
value = ceil(-100 * (.25 + (parent,fvar(13) * .75))  )
kill = 0
absolute = 0
ignorehitpause = 1
[State 0, VarSet]
type = ParentVarSet
trigger1 = (time%11)=10
fvar(13) = (parent,fvar(13)) * 0.98
[State 0, Helper]
type = Helper
trigger1 = (time%11)=10
helpertype = normal
name = "Gulp"
ID = 3504
stateno = 3504
pos = 0,0
postype = p1
facing = 1
ownpal = 0
pausemovetime = parent,var(19)


[State ProRation]
type = VarSet
trigger1 = 1
var(31) = parent,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((parent,fvar(13) * .75))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.95
ignorehitpause = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 81
value = ceil(-42 * (.25 + (parent,fvar(13) * .75))  )
kill = 1
absolute = 0
ignorehitpause = 1
[State 0, TargetState]
type = TargetState
trigger1 = time = 81
value = 3521

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 81
value = 3502
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = parent,stateno != 3500
trigger1 = parent,stateno != 3550
value = 3509
ctrl = 0

;---------------------------------------------------------------------------
; HEAL
[Statedef 3504]
type    = A
movetype= I
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 3504
sprpriority = 9

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(6) = rootdist x - (24*const(size.xscale))
[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(7) = rootdist y - (163*const(size.yscale))

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = (rootdist x - (24*const(size.xscale))) * 0.1625
y = (rootdist y - (163*const(size.yscale))) * 0.1625
ignorehitpause = 1

;[State ****: Null]
;type = Null
;trigger1 = time = 0
;trigger1 = (FVar(0) := (fvar(6) * 12) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))
;trigger1 = (FVar(1) := (fvar(7) * 12) / (Exp(0.5*ln((fvar(6) * fvar(6)) + (fvar(7) * fvar(7))))))

;[State ****: VelSet]
;type = VelSet
;trigger1 = time = 0
;x = FVar(0)
;y = FVar(1)

[State 0, ChangeState]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno = 3509


;---------------------------------------------------------------------------
; ACK
[Statedef 3520]
type    = A
movetype= H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 8

[State 0, PalFXWiz]
type = PalFX
trigger1 = time = 0
time = 24
add = 100,100,180
mul = 256,256,256
sinadd = -80,-80,-80,10
invertall = 0
color = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3520

[State 0, SelfState]
type = SelfState
trigger1 = time >= 240
value = 5050

[Statedef 3521]
type    = A
movetype= H
physics = N
ctrl = 0
sprpriority = 8

[State 0, VelSet]
type = VelSet
trigger1 = time = [0,1]
x = -5.10245
y = -14.21957 * (4.0/3.0) * 1.07

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0-const(size.mid.pos.x)
y = 0-const(size.mid.pos.y)

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5052),5052,ifelse(selfanimexist(5030),5030,5050))
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = animtime = 0
value = ifelse(selfanimexist(5035),5035,5050)
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = animtime = 0
value = 5050

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .5625 * (16.0/9.0) * 1.07

[State 0, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 10
value = 5100

[Statedef 3529]
type    = A
movetype= H
physics = N
ctrl = 0
sprpriority = 8

[State 0, VelSet]
type = VelSet
trigger1 = time = [0,1]
x = -3.3780625
y = -8.0713375 * 1.07

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0-const(size.mid.pos.x)
y = 0-const(size.mid.pos.y)

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5052),5052,ifelse(selfanimexist(5030),5030,5050))
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = animtime = 0
value = ifelse(selfanimexist(5035),5035,5050)
[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = animtime = 0
value = 5050

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .87890625

[State 0, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = vel y + pos y >= 10
value = 5100



;---------------------------------------------------------------------------
; CABLR
[Statedef 3508]
type    = S
movetype= I
physics = N
velset = 0,0
anim = 3502
ctrl = 0
sprpriority = 9

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y
ignorehitpause = 1

[State 0, VarSet]
type = Null
trigger1 = (root,anim = 3000)
trigger1 = (fvar(2):=-24*const(size.xscale))
trigger1 = (fvar(3):=-163*const(size.yscale))
;[State 0, VarSet]
;type = Null
;trigger1 = (root,anim = 1100) || (root, anim = 1110) || (root,anim = 11100) || (root, anim = 11110)
;trigger1 = (root,animelemtime(10)>=0)
;trigger1 = (fvar(2):=72*const(size.xscale))
;trigger1 = (fvar(3):=-442*const(size.yscale))
[State 0, Turn]
type = Turn
trigger1 = rootdist x + (fvar(2) * facing * (root,facing)) > 0
[State 0, VarSet]
type = VarSet
trigger1 = 1
fvar(20) = rootdist x + (fvar(2) * facing * (root,facing))
[State 0, VarSet]
type = VarSet
trigger1 = 1
fvar(21) = rootdist y + fvar(3)
[State 0, Thx FlowaGirl]
type = Null
trigger1 = 1
trigger1 = (FVar(10) := (fvar(20) * 10) / (Exp(0.5*ln((fvar(20) * fvar(20)) + (fvar(21) * fvar(21))))))
trigger1 = (FVar(11) := (fvar(21) * 10) / (Exp(0.5*ln((fvar(20) * fvar(20)) + (fvar(21) * fvar(21))))))
;trigger1 = (FVar(10) := ((rootDist X + fvar(2)) * 10) / (Exp(0.5*ln(((rootDist X + fvar(2)) * (rootDist X + fvar(2))) + ((rootDist Y + fvar(3)) * (rootDist Y + fvar(3)))))))
;trigger1 = (FVar(11) := ((rootDist Y + fvar(3)) * 10) / (Exp(0.5*ln(((rootDist X + fvar(2)) * (rootDist X + fvar(2))) + ((rootDist Y + fvar(3)) * (rootDist Y + fvar(3)))))))

;trigger1 = (FVar(10) := (P2Dist X * 10) / (Exp(0.5*ln((P2Dist X * P2Dist X) + ((P2Dist Y + fvar(2)) * (P2Dist Y + fvar(2)))))))
;trigger1 = (FVar(11) := ((P2Dist Y + fvar(2)) * 10) / (Exp(0.5*ln((P2Dist X * P2Dist X) + ((P2Dist Y + fvar(2)) * (P2Dist Y + fvar(2)))))))

[State 0, VarSet]
type = VarSet
trigger1 = 1
fvar(0) = rootdist x
[State 0, VarSet]
type = VarSet
trigger1 = 1
fvar(1) = rootdist y
;[State 0, VarSet]
;type = VarSet
;trigger1 = 1
;fvar(36) = rootdist y
;[State 0, VarSet]
;type = VarSet
;trigger1 = 1
;fvar(37) = rootdist y
;[State 0, VarSet]
;type = VarSet
;trigger1 = 1
;fvar(38) = rootdist y

[State 0, VarSet]
type = VarSet
trigger1 = 1
;fvar(1) = fvar(0) / 793
fvar(5) = ((fvar(21)*fvar(21) + fvar(20)*fvar(20))**.5)/-192;-224
;fvar(5) = exp(0.5*ln(fvar(38)))

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = (atan((fvar(11)/fvar(10))) + (0)) *(-180/Pi)
scale = fvar(5),1
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno = 3509
trigger2 = root,movetype = H

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "fvar(2) = %f | fvar(3) = %f | fvar(10) = %f | fvar(11) = %f | "
params = fvar(2),fvar(3),fvar(10),fvar(11)
;ignorehitpause =
;persistent =


;---------------------------------------------------------------------------
; Hook
[Statedef 3509]
type    = A
movetype= I
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 9741
movehitpersist = 1

[State 0, TargetState]
type = TargetState
trigger1 = time = 0
trigger1 = numtarget
trigger1 = prevstateno = 3503
value = 3529

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 32

;-----------
; SPACE
; 195-306
[Statedef 3350]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 3000
poweradd = -3000
sprpriority = 2
facep2 = 1
velset = 0,0

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
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
trigger1 = AnimElemTime(9) < 0 || AnimElem = 9
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 10
helperType = Normal
stateNo = 8520
ID = 8520
name = "Superpause FX"
posType = p1
pos = -24,-163
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0


[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = prevstateno = [3000,3999]
trigger1 = anim = 3000
value = anim
elem = 3

;[State 0, VelSet]
;type = VelSet
;trigger1 = time = 0
;y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = animelem = 4
value = S2,18
channel = 0

[State 0, Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = animelem = 2
trigger1 = !numhelper(4010)
helpertype = normal
name = "GEM"
ID = 4010
stateno = 4010
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
pausemovetime = var(19)
supermovetime = 38

[State 0, VarSet]
type = VarSet
trigger1 = anim = 3000
trigger1 = animelem = 4
var(6) = 30

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = animelemtime(4) = [-6,-1]
trigger2 = animelemno(0) = 4
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = animelem = 4
movetype = A


[State 0, SuperPause]
type = SuperPause
trigger1 = anim = 3000
trigger1 = animelem = 4
time = 30
movetime = 30
anim = -1
sound = S0,ifelse((prevstateno=[3000,3999]),31,30)
pos = ceil(-25*const(size.xscale)),ceil(-162*const(size.yscale))
darken = 0
p2defmul = 1
unhittable = 1
ignorehitpause = 1

[State 0, PalFXWiz]
type = PalFX
triggerall = (time%2)=0
triggerall = time <= 180
trigger1 = anim = 3000
trigger1 = animelemtime(5) >= 0
time = 1
add = 128,-50,128
mul = 128,64,128
sinadd = 0,0,0,1
invertall = 0
color = 128

[State 0, VarSet]
type = VarSet
trigger1 = time = 70
fvar(0) = p2dist x

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "TORNADO"
ID = 3351
stateno = 3351
pos = ceil(80*const(size.xscale)),ceil(-150*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
persistent = 0
;supermovetime = 5
pausemovetime = var(19)

[State 0, Helper]
type = Helper
trigger1 = time = 71
helpertype = normal
name = "TORNADO"
ID = 3352
stateno = 3352
pos = ceil(fvar(0)),ceil(-168*const(size.yscale))
postype = p1
facing = 1
ownpal = 1
persistent = 0
;supermovetime = 5
pausemovetime = var(19)

[State 200, 7]
type = ChangeState
trigger1 = time >= 163
value = 0
ctrl = 1

;-----------
; Sucker Tornado
[Statedef 3351]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3350
sprpriority = -5
velset = 0,-0.8 * (4.0/5.0) * const(size.yscale)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
y = 0

[State 0, Explod]
type = Explod
trigger1 = time = 7
anim = 3351
ID = 3352
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
;supermovetime = 5
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 75
id = 3352

[State 0, Explod]
type = Explod
trigger1 = time = 75
anim = 3352
ID = 3352
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
supermovetime = 5
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0;18
value = S0,18
channel = 0

[State 0, Helper]
type = Helper
;trigger1 = time = [19,135]
;trigger1 = (time%4)=0
triggerall = parent,stateno = 3350
triggerall = time = [14,39]
trigger1 = time = 14
trigger2 = ((time-14)%5)=0
trigger3 = ((time-14)%5)=1
trigger4 = ((time-14)%5)=2
helpertype = normal
name = "Sucker"
ID = 3360
stateno = 3360
pos = -70+(gametime*16)%140,0-ceil(pos y);-60+random%120,0-ceil(pos y)
postype = p1
facing = 1
ownpal = 1
pausemovetime = parent,var(19)

[State 0, VarSet]
type = ParentVarSet
trigger1 = var(3) > 0
fvar(13) = (parent,fvar(13) ) * 0.97

[State 0, VarSet]
type = VarAdd
trigger1 = var(3) > 0
var(3) = -1

[State 0, ChangeState]
type = ChangeState
;trigger1 = time >= 180
triggerall = !numhelper(3360)
trigger1 = time >= 36
trigger2 = parent,stateno != 3350
value = 3358
ctrl = 0

;-----------
; Blower Tornado
[Statedef 3352]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3354
sprpriority = -4
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 2
anim = 3355
ID = 3355
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
supermovetime = 5
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1

[State 0, Helper]
type = Helper
triggerall = time = [10,48]
triggerall = (parent,stateno = 3350) || (time = [10,20])
trigger1 = time = 10
trigger2 = ((time-10)%5)=0
trigger3 = ((time-10)%5)=1
trigger4 = ((time-10)%5)=2
helpertype = normal
name = "Sucker"
ID = 3361
stateno = 3361
pos = 0,0
postype = p1
facing = 1
ownpal = 1
pausemovetime = parent,var(19)

[State 0, VarSet]
type = ParentVarSet
trigger1 = var(3) > 0
fvar(13) = (parent,fvar(13) ) * 0.97

[State 0, VarSet]
type = VarAdd
trigger1 = var(3) > 0
var(3) = -1

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 86
;trigger1 = time >= 30
;trigger1 = !numhelper(3211)
;trigger2 = parent,stateno != [3000,3300] ; parent,stateno != 3200
value = 3359
ctrl = 0


;-----------
; NOPE
[Statedef 3358]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3358

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
trigger1 = parent,stateno != 3350
channel = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = prevstateno = 3351
trigger1 = numexplod(3352)
id = 3352

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;-----------
; NOPE
[Statedef 3359]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 3358

[State 0, VarSet]
type = ParentVarSet
trigger1 = var(3) > 0
fvar(13) = (parent,fvar(13) ) * 0.97

[State 0, VarSet]
type = VarAdd
trigger1 = var(3) > 0
var(3) = -1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(3355)
id = 3355

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time
trigger1 = !numhelper(3361)


;---------------------------------------------------------------------------
; Suckered Rock
[Statedef 3360]
type    = A
movetype= A
physics = N
ctrl = 0
poweradd = 0
anim = 9741
sprpriority = 4
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,NA,SA,NT,ST
time = 2
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 3369
pos = 0,0
postype = p1
facing = ifelse(random<500,1,-1)
vfacing = 1
bindtime = 1
removetime = -2
scale = const(size.xscale),const(size.yscale)
sprpriority = 3
ownpal = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 1
value = 3360
elem = 1+random%23

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time > 1
value = anim
elem = animelemno(0)

[State 0, VelSet]
type = VelAdd
trigger1 = time >= 1
y = -0.76 * (16.0/9.0) * const(size.yscale)

[State 0, VelSet]
type = PosAdd
trigger1 = time > 1
x = parentdist x * 0.05

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 913
time = -1
forceair = 1
ignorehitpause = 1

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = root,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((root,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarAdd
trigger1 = movehit = 2
var(3) = 1
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = time >= 1
trigger1 = !movecontact
trigger1 = !movereversed
attr = A, HP
damage = 44, 7
animtype = diagup
guardflag = MA
hitFlag = MAF
pausetime = 0,4
sparkno = S901
guard.sparkno = S908
sparkxy = 0,0
hitsound = S2, 2
guardSound = S3,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = (parentdist x/-11),-2.63838 * (4.0/3.0) * const(size.yscale)
guard.velocity = -7.04
airguard.velocity = -4.99536,-0.42197 * (4.0/3.0) * const(size.yscale)
air.type = High
air.velocity = (parentdist x/-11),-2.63838 * (4.0/3.0) * const(size.yscale)
air.hittime = 16;24
fall = 1
guard.ctrltime = 16
fall.recovertime = 16;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 5
getpower = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, DestroySelf]
type = DestroySelf
trigger1 = parentdist y > 0
;ignorehitpause =
;persistent =

[State 0, VarSet]
type = VarAdd
trigger1 = parentdist y > -64
trigger1 = fvar(0) < 1
fvar(0) = 0.1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = fvar(0) > 0
value = 0
scale = 1-fvar(0),1-fvar(0)
ignorehitpause = 1

;---------------------------------------------------------------------------
; Blowed Rock
[Statedef 3361]
type    = A
movetype= A
physics = N
ctrl = 0
poweradd = 0
anim = 9741
sprpriority = 4
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,NA,SA,NT,ST
time = 2
ignorehitpause = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 3360
elem = 1+random%23

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time
value = anim
elem = animelemno(0)

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = -40+random%80

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = fvar(1)/10
y = 10 * (4.0/3.0) * const(size.yscale)

[State 0, VelSet]
type = VelSet
trigger1 = time
y = vel y + (0.75 * (16.0/9.0) * const(size.yscale))

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 913
time = -1
forceair = 1
ignorehitpause = 1

[State ProRation]
type = VarSet
trigger1 = 1
var(31) = root,var(31)
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = .25 + ((root,fvar(13)*.75))
;value = parent,fvar(13);.25 + ((parent,fvar(13)*.75))
ignorehitpause = 1
[State ProRation]
type = ParentVarAdd
trigger1 = movehit = 2
var(3) = 1
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = time >= 1
trigger1 = !movecontact
trigger1 = !movereversed
attr = A, HP
damage = 44, 7
animtype = diagup
guardflag = MA
hitFlag = MAF
pausetime = 0,4
sparkno = S901
guard.sparkno = S908
sparkxy = 0,0
hitsound = S2, 2
guardSound = S3,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -1.02049,3.64391 * (4.0/3.0) * const(size.yscale)
guard.velocity = -7.04
airguard.velocity = -4.99536,-0.42197 * (4.0/3.0) * const(size.yscale)
air.type = High
air.velocity = -1.02049,3.64391 * (4.0/3.0) * const(size.yscale)
air.hittime = 16;24
fall = 1
guard.ctrltime = 16
fall.recovertime = 18;24
yaccel = 0.6875 * (16.0/9.0) * const(size.yscale)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sprpriority = 5
getpower = 0
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120


[State 0, DestroySelf]
type = ChangeState
trigger1 = vel y + pos y > 0
value = 3362

;---------------------------------------------------------------------------
; Sliding Rock
[Statedef 3362]
type    = A
movetype= I
physics = N
ctrl = 0
poweradd = 0

[State 0, VelSet]
type = PosSet
trigger1 = time = 0
trigger1 = pos y < 0
y = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = vel x * 1.5
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time
x = vel x * 0.97

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = (time%3)=0
flag = invisible
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 40

;----------------------------------------------------------------------
[Statedef 3375]
type = A
movetype = H
physics = N

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = ifelse(selfanimexist(5061),5061,5050)
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = anim
elem = animelemno(90)
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time
trigger1 = !hitshakeover
value = anim
elem = animelemno(0)

[State 0, HitVelSet]
type = HitVelSet
trigger1 = time = 0
x = 1
y = 1
ignorehitpause = 1

[State 3321, 1] ;Gravity
type = VelAdd
Trigger1 = hitshakeover
y = .88

[State 3321, 4] ;Hit ground
type = ChangeState
;Trigger1 = hitshakeover
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3376 ;Hit ground
ignorehitpause = 1

;---------------------------------------------------------------------------
;
[Statedef 3376]
type    = L
movetype= H
physics = N
juggle  = 0
;velset = 0,0
ctrl = 0

[State 0, HitVelSet]
type = VelSet
trigger1 = time = 0
;trigger1 = prevstateno = 3225
;x = -1
y = 0

[State 0, HitVelSet]
type = HitVelSet
trigger1 = time = 0
trigger1 = gethitvar(xvel)
x = 1

[State 0, PosSet]
type = PosSet
trigger1 = 1;time = 0
y = 0
ignorehitpause = 1

[State 0, PosFreeze]
type = PosFreeze
trigger1 = !hitshakeover
value = 1
[State 0, VelMul]
type = VelMul
trigger1 = hitshakeover
x = 0.9
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !hitshakeover
trigger2 = abs(vel x) >= 1
trigger3 = time = 0
value = ifelse(selfanimexist(5171),5171,5170)
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = hitshakeover
trigger1 = anim = [5170,5179]
trigger1 = animtime = 0
value = ifelse(selfanimexist(5110+(anim%10)),5110+(anim%10),5110)

[State 0, VarSet]
type = VarSet
trigger1 = time >= 24
sysvar(0) = 1
[State 0, SelfState]
type = SelfState
trigger1 = time >= 24
value = ifelse(!alive,5150,5110)

