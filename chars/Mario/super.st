;---------------------------------------------------------------------------
;Mega Fireball
[Statedef 3100]
type = S
movetype = A
physics = S
anim = 3100
ctrl = 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
velset = 0,0

[State 3000, No Corner Push]
type=VarSet
trigger1=!time
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=!time && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=49
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S46,1
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 3000, Super Pause FX]
type = helper
trigger1 = animelem = 2
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(10*(const(size.xscale))), ceil(-41*(const(size.yscale)))
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3100, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 41
anim = -1
sound = s8500, 0
poweradd = -1000
p2defmul = 1
darken = 0

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[state 3000, invulnerable]
type = nothitby
trigger1 = time < 3
value = SCA

[State 0, AfterImage]
type = AfterImage
trigger1 = animelem = 7
time = 70
TimeGap  = 2
FrameGap = 3
length = 10
PalBright = 1,1,1
PalContrast = 1, 10, 150
PalAdd = 0,0,0
PalMul = .5,.5,.5
trans = add1

[State 1301, 0]
type = PlaySnd
trigger1 = animelem = 1
value = S180, 2
volume = 60

[State 1301, 0]
type = PlaySnd
trigger1 = time = 27
value = S180, 4
volume = 60

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S46,1
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = [27,115]
trigger1 = (time-43)%10
trigger1 = command = "z"
value = S1000,1
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =
[State 40501, Explod]
type = Explod
trigger1 = time = [27,115]
trigger1 = (time-43)%10
trigger1 = command = "z"
anim = 3104
ID = 3104
pos = 50,15
postype = p1
facing = -1
bindtime = 1
removetime = -2
scale = 0.8,1.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1


[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[state 1000, helper]
type = helper
trigger1 = time = [27,115]
trigger1 = (time-43)%10
trigger1 = command = "z"
stateno = 1022
id = 3100
size.xscale = 0.4
size.yscale = 0.4
postype = p1    ;p2,front,back,left,right
name = "Fireball"
pos = 40,-15

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [1,8]
value = ,NA,SA,HA,NP,SP,HP
;value2 = S,NA
time = 1
;ignorehitpause =
;persistent =

[State 3000, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Mega Fireball
[Statedef 3105]
type = S
movetype = A
physics = S
anim = 3105
ctrl = 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
velset = 0,0

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S46,1
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 3160, Super Pause FX]
type = helper
trigger1 = animelem = 2
stateno = 8510
ID = 8510
name = "Super Charge"
postype = p1
pos = floor(10*(const(size.xscale))), ceil(-43*(const(size.yscale)))
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3100, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 41
anim = -1
sound = s8500, 1
poweradd = -2000
p2defmul = 1
darken = 0

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[state 3000, invulnerable]
type = nothitby
trigger1 = time < 3
value = SCA

[State 0, AfterImage]
type = AfterImage
trigger1 = animelem = 7
time = 70
TimeGap  = 2
FrameGap = 3
length = 10
PalBright = 1,1,1
PalContrast = 1, 10, 150
PalAdd = 0,0,0
PalMul = .5,.5,.5
trans = add1

[State 1301, 0]
type = PlaySnd
trigger1 = animelem = 1
value = S180, 3
volume = 60

[State 1301, 0]
type = PlaySnd
trigger1 = time = 27
value = S710, 2
volume = 60

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S46,1
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = [27,195]
trigger1 = (time-43)%10
trigger1 = command = "z"
value = S1000,1
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =
[State 40501, Explod]
type = Explod
trigger1 = time = [27,195]
trigger1 = (time-43)%10
trigger1 = command = "z"
anim = 3104
ID = 3104
pos = 50,15
postype = p1
facing = -1
bindtime = 1
removetime = -2
scale = 0.8,1.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1


[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[state 1000, helper]
type = helper
trigger1 = time = [27,195]
trigger1 = (time-43)%10
trigger1 = command = "z"
stateno = 1022
id = 3105
size.xscale = 0.4
size.yscale = 0.4
postype = p1    ;p2,front,back,left,right
name = "Fireball"
pos = 40,-15

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [1,8]
value = ,NA,SA,HA,NP,SP,HP
;value2 = S,NA
time = 1
;ignorehitpause =
;persistent =

[State 3000, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Hammer Rush Start
[Statedef 2000]
type = S
physicS = S
movetype = A
ctrl = 0
poweradd = 0
anim = 2100
velSet = 0,0
sprpriority=7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S2,6
volume = 225
channel = 0
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 0, AfterImage]
type = AfterImage
trigger1 = animelem = 5
time = 8
TimeGap  = 2
FrameGap = 3
length = 10
PalBright = 1,1,1
PalContrast = 150, 10, 1
PalAdd = 0,0,0
PalMul = .5,.5,.5
trans = add1

[State 3300, No Corner Push]
type=VarSet
trigger1=!time
fvar(5)=0
[State 3300, Unguardable]
type=VarSet
trigger1=!time && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=49
[State 3300, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3300, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3300, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3300, 4th Wall Reset]
type=VarSet
trigger1=time<20
var(14)=0
ignoreHitPause=1

[State 3300, SuperPause FX]
type=Helper
trigger1= animelem = 5
helperType=Normal
stateNo=8520
ID=8520
name="Superpause FX"
posType=P1
pos=0,-75
superMoveTime=255
size.xScale=1
size.yScale=1
ownPal=1
[State 3300, SuperPause]
type=SuperPause
trigger1= animelem = 5
time=50
p2DefMul=1
unHittable=1
anim=-1
poweradd = -3000
sound=s8550,2
darken=0
poweradd=0

[State 3300,BlackBG]
type=helper
trigger1 =animelem = 5 
helpertype=normal
stateno=3550
ID=3550
name="BlackBG"
postype=Back
supermovetime=99999
pausemovetime=99999
ownpal=1
ignorehitpause=1
size.xScale=5
size.yScale=5

[State 2000, HammerTime]
type = ChangeState
trigger1 = AnimTime = 0
value = 2001

;---------------------------------------------------------------------------
;Hammer Rush Swing
[Statedef 2001]
type = S
movetype = A
physics = S
anim = 2101
ctrl = 0
velset = 0,0
sprpriority=7

[State 2001, slide]
type = VelSet
trigger1 = AnimElem = 1
x = 4

[State 2001, 1]
type = PlaySnd
trigger1 = Animelem = 2
value = S0,6

[State 2001, 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = heavy
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 10, 10
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
hitsound = s5, 5
guardsound = s6, 0
ground.type = high
ground.slidetime = 8
ground.hittime  = 18
ground.velocity = -5 
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -5.4,-3
air.hittime = 18
p2stateno = 3324
getpower = 0
kill = 0
guard.kill = 0
envshake.time = 10
envshake.ampl = 4
envShake.freq = 100  

[State 2001, if hammer hits]
type = changestate
trigger1 = movehit = 1
value = 2003

[State 2001, if hammer doesn't hit]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Hammer Rush Start
[Statedef 2003]
type = S
physicS = S
movetype = A
ctrl = 0
poweradd = 0
anim = 2103
velSet = 0,0
sprpriority=1

[State 40501, NoFG]
Type = AssertSpecial
Trigger1 = 1
flag = nomusic

[State 2002, 1]
type = PlaySnd
trigger1 = Time = 0
value = S44, 5
channel = 4

[State 2002, 1]
type = PlaySnd
trigger1 = Time = 0
value = S5,21

[State 2002, 1]
type = PlaySnd
trigger1 = Time = 30
value = S5,22

[State 0, AfterImage]
type = AfterImage
trigger1 = animelem = 1
time = 300
TimeGap  = 2
FrameGap = 3
length = 10
PalBright = 1,1,1
PalContrast = 150, 10, 1
PalAdd = 0,0,0
PalMul = .5,.5,.5
trans = add1

[State 0, SuperPause]
type = null;Pause
trigger1 = 1
time = 35
movetime = 35

[State 2000, HammerTime]
type = ChangeState
trigger1 = AnimTime = 0
value = 2002

;---------------------------------------------------------------------------
;Hammer Rush Combo
[Statedef 2002]
type = S
movetype = A
physics = N
anim = 2102
ctrl = 0
velset = 3,0
sprpriority=1

[state 1300, swing]
type = playsnd
trigger1 = animelem = 1 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 7 || animelem = 10
trigger2 = animelem = 11 || animelem = 14 || animelem = 17 || animelem = 19 || animelem = 22 || animelem = 25
trigger3 = animelem = 27 || animelem = 30 || animelem = 33 || animelem = 35 || animelem = 38 || animelem = 42
value = 0,6
channel = 1

[State 2002, 1]
type = StopSnd
trigger1 = Time = 230
channel = 4

[State 2002, 1]
type = PlaySnd
trigger1 = Time = 231
value = 44, 6
channel = 4

[State -2, Too Many Shrooms]
type = PalFX
trigger1 = timemod = 10,0
mul = floor(Random/3), floor(Random/3), floor(Random/3)
add = floor(Random/5), floor(Random/5), floor(Random/5)
ignorehitpause = 1
time = 45

[State 3300,Speed]
type=helper
triggerall =animelemtime(4)>=0
trigger1 = time%2
helpertype=normal
stateno=3560
ID=3560
name="lines"
postype=p1
supermovetime=99999
pausemovetime=99999
ownpal=1
ignorehitpause=1
size.xScale=1
size.yScale=1

[State 3550, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1

[State 0, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 0

[State 40501, Explod]
type = AssertSpecial
trigger1 = time < 202
flag = nomusic
ignorehitpause = 1

[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1
[State 40501, Explod]
type = Explod
trigger1 = time < 202
trigger1 = timemod = 2,0
anim = 2110+random%5
ID = 2110
pos = 15-random%21,-5-random%71
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 6
ontop = 0
vel = -10,0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, AfterImage]
type = hitby
trigger1 = 1
value = 

[State 1001, 1]
type = helper
trigger1 = time < 202
trigger1 = timemod = 2,0
helpertype = normal ;player
name = "RAfterimage"
ID =2010
stateno =2010
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
size.xscale=1
size.yscale=1
ignorehitpause=1

[State 2002, 1]
type = HitDef
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 11
trigger4 = AnimElem = 14
trigger5 = AnimElem = 17
trigger6 = AnimElem = 21
trigger7 = AnimElem = 25
trigger8 = Animelem = 29
trigger9 = AnimElem = 33
attr = S, HA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Hard
hitflag = MAf
guardflag = MA
pausetime = 0,45
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitsound = S22,9
ground.type = High
ground.slidetime = 4
ground.hittime  = 25
ground.velocity = 0,0
air.velocity = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
getpower = 0
kill = 0
envshake.time = 10
envshake.ampl = 4
envShake.freq = 100  

[State 2002, 1]
type = HitDef
trigger1 = AnimElem = 37
attr = S, HA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Hard
hitflag = MAf
guardflag = MA
pausetime = 0,45
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitsound = S22,9
ground.type = High
ground.slidetime = 4
ground.hittime  = 25
ground.velocity = 0,0
air.velocity = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
id = 4000
getpower = 0
p2stateno = 3323
kill = 0
envshake.time = 10
envshake.ampl = 4
envShake.freq = 100  

[State 2101, slide]
type = VelSet
trigger1 = AnimElem = 42
x = 4

[State 2002, 1]
type = PlaySnd
trigger1 = Animelem = 38
value = S180, 3
[State 2002, 1]
type = PlaySnd
trigger1 = Animelem = 42
value = S2, 9+random%3

[State 2002, PalFx]
type = PalFX
time = 5
mul = 800, 800, 800
trigger1 = AnimElem = 39

[State 2002, Shaking]
type = EnvShake
trigger1 = AnimElem = 43
time = 40
freq = 120

[State 2002, 2]
type = velset
trigger1 = AnimElem = 42
x = 8

[State 2002, 2]
type = HitDef
trigger1 = AnimElem = 42
attr = S, HA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 5
animtype = Hard
hitflag = MAf
guardflag = MA
pausetime = 30,30
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitsound = S22,10
ground.type = High
ground.slidetime = 5
ground.hittime  = 18
ground.velocity = -12,-27
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -2.4,-8
air.hittime = 18
envshake.time = 10
envshake.ampl = 4
fall = 1
fall.recover = 0
getpower = 0
envshake.time = 20
envshake.ampl = 6
envShake.freq = 140  

[State 2002, 2]
type = playsnd
trigger1 = AnimElem = 43
value = S5,10
[State 2002, 2]
type = playsnd
trigger1 = AnimElem = 43
value = S5,10
channel = 4

[State 2002, End]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Hammer Rush Afterimage Helper
[Statedef 2010]
type = S
movetype = I
physics = N
anim = 2102
ctrl = 0
sprpriority = -1
velset = 0,0

[State -2, Too Many Shrooms]
type = PalFX
trigger1 = timemod = 10,0
mul = floor(Random/3), floor(Random/3), floor(Random/3)
add = floor(Random/5), floor(Random/5), floor(Random/5)
ignorehitpause = 1
time = 30

[State 2002, End]
type = hitby
trigger1 = 1
value = 

[State 2002, End]
type = playerpush
trigger1 = 1
value = 0

[State 2002, End]
type = varset
trigger1 = time = 0
v = 1
value = Root, AnimElemNo(0);parent,var(11)

[State 2002, End]
type = changeanim
trigger1 = 1
value = 2102
elem = var(1)

[State 0, AfterImage]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 0, AfterImage]
type = null;AfterImage
trigger1 = time = 0
time = 10
persistent = 1
TimeGap  = 1
FrameGap = 1
length = 1
;PalBright = 1,1,1
;PalContrast = 100, 100, 100
palmul = floor(Random/3), floor(Random/3), floor(Random/3)
paladd = floor(Random/5), floor(Random/5), floor(Random/5)
trans = add1

[State 2002, End]
type = destroyself
trigger1 = time = 8

;Marioreppa
[statedef 3000]
type = s
movetype = A
physics = s
anim = 3000
ctrl = 0
velset = 0,0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1
poweradd = -1000

[State 3000, No Corner Push]
type=VarSet
trigger1=!time
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=!time && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=49
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[state 3000, vel]
type = velset
trigger1 = animelem = 4 || animelem = 13
x = 7
ignorehitpause = 1

[state 3000, voice]
type = playsnd
trigger1 = animelem = 4
trigger1 = var(24) = 0
value = 710,0
channel = 0
ignorehitpause = 1

[state 3000, voice]
type = playsnd
trigger1 = animelem = 4
trigger1 = var(24) = 1
value = 2,0
channel = 0
ignorehitpause = 1

[state 3000, voice2]
type = playsnd
trigger1 = animelem = 13
trigger1 = var(24) = 0
value = 710,1
channel = 0
ignorehitpause = 1

[state 3000, voice2]
type = playsnd
trigger1 = animelem = 13
trigger1 = var(24) = 1
value = 180,4
channel = 0
ignorehitpause = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[state 3100, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 190,0
channel = 0

[state 3100, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,6
channel = 0

[State 3000, Super Pause FX]
type = helper
trigger1 = animelem = 2
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(10*(const(size.xscale))), ceil(-41*(const(size.yscale)))
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3100, Super Pause]
type = superpause
trigger1 = animelem = 3
time = 41
anim = -1
sound = s3000, 0
p2defmul = 1
darken = 0

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[state 3000, invulnerable]
type = nothitby
trigger1 = time < 3
value = SCA

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 || animelem = 13
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -14), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forcestand = 1

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5 || animelem = 14
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -18
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forcestand = 1

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6 || animelem = 15
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forcestand = 1

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 7 || animelem = 8 || animelem = 16 || animelem = 17
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20))
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forcestand = 1

[state 3000, next]
type = changestate
trigger1 = animtime = 0
value = 3001

;---------------------------------------------------------------
;Marioreppa - Final
[statedef 3001]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 1

[state 3001, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 1,3+(random%2)
channel = 0
ignorehitpause = 1

[state 3001, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,9+(random%3)
channel = 0
ignorehitpause = 1

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -14), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -18
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = S, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1200, jump]
type = changestate
trigger1 = animtime = 0
value = 3002

;-----------------------------------
;Marioreppa - Final Rising
[statedef 3002]
type = A
physics = N
movetype = A
anim = 1505
ctrl = 0
velset = 5, -5
sprpriority = 1

[State 205, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
attr = A, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1201, newvel]
type = velset
trigger1 = animelem = 6
x = 0
y = 0

[state 1201, grav]
type = veladd
trigger1 = time >= 13
y = .5

[state 1201, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[state 1201, land]
type = changestate
trigger1 = pos y >= 0
trigger1 = time > 1
value = 1202

;--------------------------------------------
;Divine Jump Punch
[statedef 3010]
type = s
movetype = A
physics = s
anim = 3010
ctrl = 0
velset = 0,0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1
poweradd = -2000

[State 3160, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3160, Super Pause FX]
type = helper
trigger1 = animelem = 3
stateno = 8510
ID = 8510
name = "Super Charge"
postype = p1
pos = floor(10*(const(size.xscale))), ceil(-43*(const(size.yscale)))
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3160, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3160, Super Pause]
type = superpause
trigger1 = animelem = 3
time = 42;53
anim = -1
sound = s3000, 0
p2defmul = 1
darken = 0
movetime = 10

[state 3010, nhb]
type = nothitby
trigger1 = time < 3
value = SCA

[state 3010, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 190,0
channel = 0

[state 3010, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,6
channel = 0

[state 3010, next]
type = changestate
trigger1 = animtime = 0
value = 3011

;-----------------------------------------------
;Divine Jump Punch - Flying High Up
[statedef 3011]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3011
velset = 0,-7
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)

[State 205, Hit]
type = hitdef
trigger1 = p2dist x > 0
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelemno(0) = [2,15]
attr = A, HA
damage = ceil(ifelse(fvar(12) * 30 < 7, 7, fvar(12) * 30)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), 1.3, 2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), 1.5, 2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 205, Hit]
type = hitdef
trigger1 = p2dist x <= 0
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelemno(0) = [1,15]
attr = A, HA
damage = ceil(ifelse(fvar(12) * 30 < 7, 7, fvar(12) * 30)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -1.3, -2.51), -5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.5, -2.6), -5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -48), var(36) := -89
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 3011, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 180,0
channel = 0
ignorehitpause = 1

[state 3011, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,7
channel = 0
ignorehitpause = 1

[state 3011, jumpsnd]
type = playsnd
trigger1 = animelem = 1
value = 1000,2
ignorehitpause = 1

[state 3011, newvel]
type = velset
trigger1 = animelem = 16
y = 0

[state 3011, fall]
type = veladd
trigger1 = time > 17
y = .5

[state 3011, land]
type = changestate
trigger1 = time > 1
trigger1 = pos y >= 0
value = 1202

[state 3011, nopush]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1



;----------------------------------------------------------
;Hammer Time
[statedef 3020]
type = s
movetype = A
physics = s
anim = 2100
ctrl = 0
velset = 0,0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1
poweradd = -3000

[State 3160, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 3160, Super Pause FX]
type = helper
trigger1 = animelem = 1
stateno = 8520
ID = 8520
name = "Super Charge"
postype = p1
pos = floor(17*(const(size.xscale))), ceil(-27*(const(size.yscale)))
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3160, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3160, Super Pause]
type = superpause
trigger1 = animelem = 1
time = 53
anim = -1
sound = s3000, 0
p2defmul = 1
darken = 0
movetime = 51

[state 3010, nhb]
type = nothitby
trigger1 = time < 3
value = SCA

[state 3010, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 190,0
channel = 0

[state 3010, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 2,6
channel = 0

[state 3010, next]
type = changestate
trigger1 = animtime = 0
value = 3021

;------------------------------------------------------------------------
;Hammer Time - Attack
[statedef 3021]
type = S
movetype = A
physics = S
ctrl = 0
anim = 2101
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 210, Hit]
type = hitdef
triggerall = !var(16) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 18 || animelem = 26 || animelem = 34
trigger2 = animelem = 43 || animelem = 47 || animelem = 51 || animelem = 59 || animelem = 67
attr = S, HA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -2.77, -4.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -6.3, -12.6), -3
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
kill = enemynear, statetype = A || enemynear, stateno = [120,155]

[State 210, Hit]
type = hitdef
triggerall = !var(16) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 75
attr = S, HA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 16, 24)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 55 + 4 * var(29)
ground.hittime = 55 + 4 * var(29)
ground.velocity = ifelse(var(20), -2.77, -4.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -6.3, -12.6), -3
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -28
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
kill = enemynear, statetype = A || enemynear, stateno = [120,155]

[State 210, Hit]
type = hitdef
triggerall = !var(16) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 15 || animelem = 23 || animelem = 31 || animelem = 39 || animelem = 56 || animelem = 64
trigger2 = animelem = 72
attr = S, HA
damage = ceil(ifelse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -2.77, -4.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -6.3, -12.6), -3
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 0
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 5), var(36) := -93
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
kill = enemynear, statetype = A || enemynear, stateno = [120,155]

[state 3021, vel]
type = velset
trigger1 = animelem = 1 || animelem = 5 || animelem = 9 || animelem = 14 || animelem = 17 || animelem = 22 || animelem = 25 || animelem = 30 || animelem = 33
trigger2 = animelem = 38 || animelem = 42 || animelem = 46 || animelem = 50 || animelem = 55 || animelem = 58 || animelem = 63 || animelem = 66 || animelem = 71 || animelem = 74
x = 4.5

[state 3021, velfinal]
type = velset
trigger1 = animelem = 79
x = 7

[State 210, Hit]
type = hitdef
triggerall = !var(16) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 80
attr = S, HA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 5
animtype = Heavy
air.animtype = Heavy
fall.animtype = Heavy
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), -17
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -6.3, -12.6), -17.3
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 0
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 5), var(36) := -93
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 1300, idle]
type = statetypeset
trigger1 = animelem = 81
movetype = I

[state 1300, swing]
type = playsnd
trigger1 = animelem = 1 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 7 || animelem = 10
trigger2 = animelem = 11 || animelem = 14 || animelem = 17 || animelem = 19 || animelem = 22 || animelem = 25
trigger3 = animelem = 27 || animelem = 30 || animelem = 33 || animelem = 35 || animelem = 38 || animelem = 42
trigger4 = animelem = 44 || animelem = 46 || animelem = 48 || animelem = 50 || animelem = 52 || animelem = 55
trigger5 = animelem = 58 || animelem = 60 || animelem = 63 || animelem = 66 || animelem = 68 || animelem = 71
trigger6 = animelem = 74 || animelem = 76 || animelem = 79
value = 0,6
channel = 1

[state 1300, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
[Statedef 3324]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = 7

[State 3324, Anim]
type = changeanim
trigger1 = !time
value = 5300
;---------------------------------------------------------------------------
[Statedef 3323]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = 7
[State 3323, Pause]
type = Pause
trigger1 =1
time = 1
movetime =1
ignorehitpause =1
[State 3323, Anim]
type = changeanim2
trigger1 = !time
value = 5000

;-------------------------------------------------------------------------------
[Statedef 3550]
physics=N
anim=3550
Sprpriority=-9999

[State 3350, SprPriority]
type = SprPriority
trigger1 =root,stateno=2001
value = -6
ignorehitpause =1

[State 3550, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 3550, PosSet]
type = PosSet
trigger1 =1
x =screenpos x
y =floor((GameHeight / GameWidth) * 120)
ignorehitpause=1
[State 3550, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3550, end]
type=destroyself
trigger1 = root,MoveType = H
[State 3550, ChangeState]
type = ChangeState
trigger1 =root,stateno=2001&&root,anim=2101&&root,animelem=8
trigger2 =root,stateno=2002&&root,animelemtime(50)>=0
trigger3 = (Root,StateNo != [2001,2002])&& (Root,StateNo != [2003,3401])
value =3551
;-------------------------------------------------------------------------------
[Statedef 3551]
physics=N

[State 3551, Assert]
type=trans
trigger1=1
trans=addalpha
alpha=256-8*time, 0+8*time
ignorehitpause=1
[State 3551, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 0, PosSet]
type = PosSet
trigger1 =1
x =screenpos x
y =floor((GameHeight / GameWidth) * 120)
ignorehitpause=1
[State 3551, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3551, end]
type=destroyself
trigger1 =time>=32
;---------------------------------------------------------------------
;Streak Fx
[Statedef 3560]
physics=N
anim=9998
ctrl=0
velset=Ifelse(root,facing=1,2+random%4,-2-random%4), 0
sprpriority=8+random%12

[State 3360, SprPriority]
type = SprPriority
trigger1 =root,stateno=2002
value = 8+random%4
ignorehitpause =1
[State 3560, PosSet]
type = PosSet
trigger1 =1
x =floor(pos x-GameWidth)+random/2
y =ceil(pos y-GameHeight)+random/2

[State 3560, VarRandom]
type = VarRandom
trigger1 =!time
v =41
range = 0,8
ignorehitpause =1

[State 3560, AngleDraw]
type = AngleDraw
trigger1 =var(41)
scale = .5+Ifelse(var(41)>=7,.25,Ifelse((var(41)=[3,5]),.125,Ifelse((var(41)=[1,2]),.1,.35))),.75+Ifelse(var(41)>=7,.25,Ifelse((var(41)=[3,5]),.125,Ifelse((var(41)=[1,2]),.1,.35)))
ignorehitpause =1

[State 3560, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3560, Assert]
type=trans
trigger1=1
trans=addalpha
alpha=256-8*var(41), 256
ignorehitpause=1

[State 3560, End]
type=destroyself
trigger1=root,Movetype=H
trigger2=time>=16
trigger3=root,stateno!=[2002,2010]
trigger5=root,stateno=2002&&anim=2102&&animelemtime(50)>=0