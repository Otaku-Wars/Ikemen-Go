; ADD004 BASIC PIEs ReBuilded CNS (01/03/2023)
;==============================================
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==============================================

;--------------------------------------------------------------------------------------
;Pal Select
[Statedef 256]
physics = N
anim = 256
velset=0,0
sprpriority=99999
 
[State 256, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-90
y = 20
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 256, Reset]
type=varset
trigger1=!time
var(29)=200
[State 256, Pal]
type=varset
trigger1=!time
var(26)=root,palno

[State 256, Varset]
type=varset
trigger1=var(26)<1||var(26)>40
var(26)=1+(var(26)<1)*39

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 20
[State 256, PlaySnd]
type = PlaySnd
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=var(29)<=5
value = S256,1
volumescale = 50
channel = 20
persistent =0 

[State 256, Countdown]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 256, Countdown]
type = VarAdd
trigger1=!var(10)&&var(29)<150
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=25

[State 256, Varadd]
type=varadd
trigger1=!var(10)
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(26)=1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

[State 256, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 256, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 256, End]
type=destroyself
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=var(29)<=0
trigger3=root,AILevel
;Stand Light Punch
[statedef 200]
type = S
movetype = A
physics = S
ctrl = 0
anim = 200
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = S, NA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -85
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7.35
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 29), var(36):= -43
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,0
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,0
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------
;Stand Medium Punch
[statedef 210]
type = S
movetype = A
physics = S
ctrl = 0
anim = 210
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 205, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, NA
damage = ceil(ifelse(fvar(12) * 40 < 7, 7, fvar(12) * 40)), 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 11 + 3 * var(29)
ground.hittime = 11 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,1
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,(random%3)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------
;Stand Strong Punch
[statedef 220]
type = S
movetype = A
physics = S
ctrl = 0
anim = 220
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, NA
damage = ceil(ifelse(fvar(12) * 67 < 7, 7, fvar(12) * 67)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -15, -69
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 10 + 4 * var(29)
ground.hittime = 10 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -33
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,2
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,1+(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,4+(random%2)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 7
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------
;Stand Light Kick
[statedef 230]
type = S
movetype = A
physics = S
ctrl = 0
anim = 230
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 215, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20)) ;&& p2stateno != 5040
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = S, NA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -35
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 14 + 2 * var(29)
ground.hittime = 14 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 21), var(36) := -16
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,0
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,0
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------
;Stand Medium Kick
[statedef 240]
type = S
movetype = A
physics = S
ctrl = 0
anim = 240
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 220, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = S, NA
damage = ceil(ifelse(fvar(12) * 40 < 7, 7, fvar(12) * 40)), 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -93
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 33), var(36) := -21
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,1
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,1+(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,3
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------
;Stand Strong Kick
[statedef 250]
type = S
movetype = A
physics = S
ctrl = 0
anim = 250
velset = 5*(prevstateno = 210),0 
sprpriority = 1
facep2 = 1

[State 225, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 7
attr = S, NA
damage = ceil(ifelse(fvar(12) * 62 < 7, 7, fvar(12) * 62)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -92
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 11 + 4 * var(29)
ground.hittime = 11 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.77, -12.52), -3*(prevstateno = 710 || prevstateno = 210 && !var(20))
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = prevstateno = 710 || (prevstateno = 210 && !var(20))
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 42), var(36) := -35
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 5
value = 0,2
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 5
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,2
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 5
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,4+(random%2)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 9
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------------------------------
;Crouch Light Punch
[statedef 400]
type = C
movetype = A
physics = C
ctrl = 0
anim = 400
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 230, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA 
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -51
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -25
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,0
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,0
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1

;---------------------------------------------
;Crouch Medium Punch
[statedef 410]
type = C
movetype = A
physics = C
ctrl = 0
anim = 410
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 235, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = C, NA 
damage = ceil(ifelse(fvar(12) * 40 < 7, 7, fvar(12) * 40)), 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = M 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -46
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 11 + 3 * var(29)
ground.hittime = 11 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 31), var(36) := -25
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,1
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,(random%3)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1

;---------------------------------------------
;Crouch Strong Punch
[statedef 420]
type = C
movetype = A
physics = C
ctrl = 0
anim = 420
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 240, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -73
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 13 + 4 * var(29)
ground.hittime = 13 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -66
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,2
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,1+(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,4+(random%2)
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1

;----------------------------------------------------------------
;Crouch Light Kick
[statedef 430]
type = C
movetype = A
physics = C
ctrl = 0
anim = 430
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 245, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA 
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -4
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 14 + 2 * var(29)
ground.hittime = 14 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
down.velocity = -2, -2
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -7
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,0
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,0
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1

;---------------------------------------------
;Crouch Medium Kick
[statedef 440]
type = C
movetype = A
physics = C
ctrl = 0
anim = 440
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 250, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && var(1)!= 2
trigger2 = animelem = 4 && var(1) = 2
attr = C, NA 
damage = ceil(ifelse(fvar(12) * 40 < 7, 7, fvar(12) * 40)), 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -5
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 12 + 3 * var(29)
ground.hittime = 12 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
down.velocity = -3, -3
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 39), var(36) := -10
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,1
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,1+(random%2)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,3
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1

;---------------------------------------------
;Crouch Strong Kick
[statedef 450]
type = C
movetype = A
physics = C
ctrl = 0
anim = 450
velset = 0,0 
sprpriority = 1
facep2 = 1

[State 255, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && prevstateno!= 750
attr = C, NA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -6
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Trip
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = -1, -8.24
air.type = Trip
air.hittime = 120
air.velocity = -1, ifelse(var(20), -8.24, -2.85);-8.24
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.67
fall = 1
fall.recover = 0
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -9
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 255, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 9 && prevstateno!= 750 && !movehit
attr = C, NA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -6
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Trip
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = 1, -8.24
air.type = Trip
air.hittime = 120
air.velocity = 1, ifelse(var(20), -8.24, -2.85);-8.24
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.67
fall = 1
fall.recover = 0
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -8
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 255, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 && prevstateno = 750
attr = C, SA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -6
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = -5, -6.2
air.type = Low
air.hittime = 120
air.velocity = -5, -6.2
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = 0, 0
givepower = 36, 36
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -9
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 255, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 9 && prevstateno = 750 && !movehit
attr = C, SA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -6
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = 5, -6.2
air.type = Low
air.hittime = 120
air.velocity = 5, -6.2
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = 0, 0
givepower = 36, 36
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -8
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 200, swingsnd]
type = playsnd
trigger1 = animelem = 1
value = 0,5
channel = 1

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,2+(random%3)
channel = 0

[state 200, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,8
channel = 0

[state 200, idle]
type = statetypeset
trigger1 = animelem = 12
movetype = I

[state 200, end]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1

;-----------------------------------------------------------------------------------------------------
;Air Light Punch
[statedef 600]
type = A
movetype = A
physics = A
ctrl = 0
anim = 600
sprpriority = 1
facep2 = 1

[State 260, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = A, NA 
damage = ceil(ifelse(fvar(12) * 25 < 7, 7, fvar(12) * 25)), 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -50
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 33), var(36) := -40
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, sound]
type = playsnd
trigger1 = animelem = 1
value = 0,0
channel = 1

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,0
channel = 0

[state 600, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

;-----------------------------------------------------------------------------------------------------
;Air Medium Punch
[statedef 610]
type = A
movetype = A
physics = A
ctrl = 0
anim = 610
sprpriority = 1
facep2 = 1

[State 265, Hit]
type = hitdef
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
attr = A, NA 
damage = ceil(ifelse(fvar(12) * 40 < 7, 7, fvar(12) * 40)), 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -52
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 34), var(36) := -43
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, sound]
type = playsnd
trigger1 = animelem = 1
value = 0,1
channel = 1

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,(random%3)
channel = 0

[state 600, idle]
type = statetypeset
trigger1 = animelem = 5
movetype = I

;-----------------------------------------------------------------------------------------------------
;Air Heavy Punch
[statedef 620]
type = A
movetype = A
physics = A
ctrl = 0
anim = 620
sprpriority = 1
facep2 = 1

[state 600, sound]
type = playsnd
trigger1 = animelem = 1
value = 0,3
channel = 1

[State 270, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = A, NA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -52
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -42
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,1+(random%2)
channel = 0

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,4+(random%2)
channel = 0

[state 600, idle]
type = statetypeset
trigger1 = animelem = 7
movetype = I

;-----------------------------------------------------------------------------------------------------
;Air Light Kick
[statedef 630]
type = A
movetype = A
physics = A
ctrl = 0
anim = 630
sprpriority = 1
facep2 = 1

[State 275, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = A, NA 
damage = ceil(ifelse(fvar(12) * 25 < 7, 7, fvar(12) * 25)), 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -42
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -24
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, sound]
type = playsnd
trigger1 = animelem = 1
value = 0,0
channel = 1

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,0
channel = 0

[state 600, idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

;-----------------------------------------------------------------------------------------------------
;Air Medium Kick
[statedef 640]
type = A
movetype = A
physics = A
ctrl = 0
anim = 640
sprpriority = 1
facep2 = 1

[State 280, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = A, NA 
damage = ceil(ifelse(fvar(12) * 40 < 7, 7, fvar(12) * 40)), 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -48
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 49), var(36) := -33
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, sound]
type = playsnd
trigger1 = animelem = 1
value = 0,1
channel = 1

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,(random%2)
channel = 0

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,3
channel = 0

[state 600, idle]
type = statetypeset
trigger1 = animelem = 6
movetype = I

;-------------------------------------------------------
;Drill Kick
[statedef 645]
type = A
movetype = A
physics = A
ctrl = 0
anim = 1300
sprpriority = 1
facep2 = 1

[State 280, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
attr = A, NA 
damage = ceil(ifelse(fvar(12) * 25 < 7, 7, fvar(12) * 25)), 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -48
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -6
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
value = 0,1
channel = 1

;-----------------------------------------------------------------------------------------------------
;Air Heavy Kick
[statedef 650]
type = A
movetype = A
physics = A
ctrl = 0
anim = 650
sprpriority = 1
facep2 = 1

[state 600, sound]
type = playsnd
trigger1 = animelem = 1
value = 0,3
channel = 1

[State 285, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
;trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = A, NA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7010 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -48
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -23
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 0
value = 1,1+(random%2)
channel = 0

[state 600, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = random <= 300
trigger1 = var(24) = 1
value = 2,4+(random%2)
channel = 0

[state 600, idle]
type = statetypeset
trigger1 = animelem = 8
movetype = I

;------------------------------------------------------------
;Forward Punch Throw Attempt
[statedef 800]
type = S
movetype = A
physics = S
ctrl = 0
anim = 800
velset = 0,0
sprpriority = 2

[state 800, attempt]
type = hitdef
trigger1 = animelem = 1 && !var(38)
attr = S,NT
hitflag = M-
priority = 1,Miss
sparkno = -1
hitsound = S800,0
p2facing = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
p1stateno = 810
p2stateno = 804

[state 800, idle]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[state 800, missvoice]
type = playsnd
trigger1 = animelem = 2
value = 5210,var(24)
channel = 0

[state 800, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------
;Backward Punch Throw Attempt
[statedef 801]
type = S
movetype = A
physics = S
ctrl = 0
anim = 800
velset = 0,0
sprpriority = 2

[state 800, attempt]
type = hitdef
trigger1 = animelem = 1 && !var(38)
attr = S,NT
hitflag = M-
priority = 1,Miss
sparkno = -1
hitsound = S800,0
p2facing = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
p1stateno = 811
p2stateno = 804

[state 800, idle]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[state 800, missvoice]
type = playsnd
trigger1 = animelem = 2
value = 5210,var(24)
channel = 0

[state 800, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------
;Forward Kick Throw Attempt
[statedef 802]
type = S
movetype = A
physics = S
ctrl = 0
anim = 800
velset = 0,0
sprpriority = 2

[state 800, attempt]
type = hitdef
trigger1 = animelem = 1 && !var(38)
attr = S,NT
hitflag = M-
priority = 1,Miss
sparkno = -1
hitsound = S800,0
p2facing = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
p1stateno = 812
p2stateno = 805

[state 800, idle]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[state 800, missvoice]
type = playsnd
trigger1 = animelem = 2
value = 5210,var(24)
channel = 0

[state 800, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------
;Backward Kick Throw Attempt
[statedef 803]
type = S
movetype = A
physics = S
ctrl = 0
anim = 800
velset = 0,0
sprpriority = 2

[state 800, attempt]
type = hitdef
trigger1 = animelem = 1 && !var(38)
attr = S,NT
hitflag = M-
priority = 1,Miss
sparkno = -1
hitsound = S800,0
p2facing = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
p1stateno = 813
p2stateno = 805

[state 800, idle]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[state 800, missvoice]
type = playsnd
trigger1 = animelem = 2
value = 5210,var(24)
channel = 0

[state 800, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-------------------------------------
;Punch Throw Forward
[statedef 810]
type = S
movetype = A
physics = N
ctrl = 0
anim = 810
sprpriority = 5
velset = 0,0

[state 810, sound]
type = playsnd
trigger1 = animelem = 2
value = 0,5

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 0
value = 710,(random%2)
channel = 0

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 1
value = 710,2+(random%2)
channel = 0

[state 810, sprpriority]
type = sprpriority
trigger1 = animelem = 4
value = 3

[state 810, face]
type = targetfacing
trigger1 = animelem = 3
value = 1

[state 810, face2]
type = targetfacing
trigger1 = animelem = 5
value = -1

[state 810, bind1]
type = targetbind
trigger1 = animelem = 1
pos = floor(29*(const(size.yscale))),0
time = 30

[state 810, bind2]
type = targetbind
trigger1 = animelem = 2
pos = floor(26*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind3]
type = targetbind
trigger1 = animelem = 3
pos = floor(-21*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind4]
type = targetbind
trigger1 = animelem = 4
pos = floor(-22*(const(size.xscale))),ceil(-44*(const(size.yscale)))
time = 3

[state 810,bind5]
type = targetbind
trigger1 = animelem = 5
pos = floor(27*(const(size.xscale))),ceil(-46*(const(size.yscale)))
time = 4

[State 805, hurt]
type = targetlifeadd
trigger1 = animelem = 6
value = -ceil(128 * fvar(12))

[state 810, targetstate]
type = targetstate
trigger1 = animelem = 6
value = 806

[state 806, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-------------------------------------
;Punch Throw Backward
[statedef 811]
type = S
movetype = A
physics = N
ctrl = 0
anim = 811
sprpriority = 5
velset = 0,0

[state 810, sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0,5
channel = 1

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 0
value = 710,(random%2)
channel = 0

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 1
value = 710,2+(random%2)
channel = 0

[state 810, sprpriority]
type = sprpriority
trigger1 = animelem = 4 || animelem = 8
value = 3

[state 810, sprpriority2]
type = sprpriority
trigger1 = animelem = 6
value = 5

[state 810, face]
type = targetfacing
trigger1 = animelem = 3 || animelem = 7
value = 1

[state 810, face2]
type = targetfacing
trigger1 = animelem = 5
value = -1

[state 810, bind1]
type = targetbind
trigger1 = animelem = 1
pos = floor(29*(const(size.yscale))),0
time = 30

[state 810, bind2]
type = targetbind
trigger1 = animelem = 2 || animelem = 6
pos = floor(26*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind3]
type = targetbind
trigger1 = animelem = 3 || animelem = 7
pos = floor(-21*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind4]
type = targetbind
trigger1 = animelem = 4 || animelem = 8
pos = floor(-22*(const(size.xscale))),ceil(-44*(const(size.yscale)))
time = 3

[state 810,bind5]
type = targetbind
trigger1 = animelem = 5
pos = floor(27*(const(size.xscale))),ceil(-46*(const(size.yscale)))
time = 3

[state 810, turn]
type = turn
trigger1 = animelem = 9

[state 810, bind6]
type = targetbind
trigger1 = animelem = 9
pos = floor(22*(const(size.xscale))),ceil(-44*(const(size.yscale)))
time = 1

[State 805, hurt]
type = targetlifeadd
trigger1 = animelem = 9
value = -ceil(128 * fvar(12))

[state 810, targetstate]
type = targetstate
trigger1 = animelem = 9
value = 806

[state 806, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-------------------------------------
;Kick Throw Forward
[statedef 812]
type = S
movetype = A
physics = N
ctrl = 0
anim = 812
sprpriority = 5
velset = 0,0

[state 810, sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
value = 0,5
channel = 1

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 0
value = 1,3+(random%2)
channel = 0

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 1
value = 2,9+(random%3)
channel = 0

[state 810, sprpriority]
type = sprpriority
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
value = 3

[state 810, sprpriority2]
type = sprpriority
trigger1 = animelem = 6 || animelem = 10
value = 5

[state 810, face]
type = targetfacing
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 1

[state 810, face2]
type = targetfacing
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = -1

[state 810, bind1]
type = targetbind
trigger1 = animelem = 1
pos = floor(29*(const(size.yscale))),0
time = 30

[state 810, bind2]
type = targetbind
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
pos = floor(26*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind3]
type = targetbind
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
pos = floor(-21*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind4]
type = targetbind
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
pos = floor(-22*(const(size.xscale))),ceil(-44*(const(size.yscale)))
time = 3

[state 810,bind5]
type = targetbind
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
pos = floor(27*(const(size.xscale))),ceil(-46*(const(size.yscale)))
time = 4

[State 805, hurt]
type = targetlifeadd
trigger1 = animelem = 14
value = -ceil(128 * fvar(12))

[state 810, targetstate]
type = targetstate
trigger1 = animelem = 14
value = 807

[state 806, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-------------------------------------
;Kick Throw Backward
[statedef 813]
type = S
movetype = A
physics = N
ctrl = 0
anim = 813
sprpriority = 5
velset = 0,0

[state 810, sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14
value = 0,5
channel = 1

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 0
value = 1,3+(random%2)
channel = 0

[state 810, voice]
type = playsnd
trigger1 = animelem = 2
trigger1 = var(24) = 1
value = 2,9+(random%3)
channel = 0

[state 810, sprpriority]
type = sprpriority
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16
value = 3

[state 810, sprpriority2]
type = sprpriority
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
value = 5

[state 810, face]
type = targetfacing
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15
value = 1

[state 810, face2]
type = targetfacing
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = -1

[state 810, bind1]
type = targetbind
trigger1 = animelem = 1
pos = floor(29*(const(size.yscale))),0
time = 30

[state 810, bind2]
type = targetbind
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14
pos = floor(26*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind3]
type = targetbind
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15
pos = floor(-21*(const(size.xscale))),ceil(-48*(const(size.yscale)))
time = 3

[state 810, bind4]
type = targetbind
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16
pos = floor(-22*(const(size.xscale))),ceil(-44*(const(size.yscale)))
time = 3

[state 810,bind5]
type = targetbind
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
pos = floor(27*(const(size.xscale))),ceil(-46*(const(size.yscale)))
time = 3

[state 810, turn]
type = turn
trigger1 = animelem = 17

[state 810, bind6]
type = targetbind
trigger1 = animelem = 17
pos = floor(22*(const(size.xscale))),ceil(-44*(const(size.yscale)))
time = 1

[State 805, hurt]
type = targetlifeadd
trigger1 = animelem = 17
value = -ceil(128 * fvar(12))

[state 810, targetstate]
type = targetstate
trigger1 = animelem = 17
value = 807

[state 806, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------
;P2 Punch Throw
[statedef 804]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 4

[state 804, anim]
type = changeanim2
trigger1 = time = 0
value = 804

[state 804, safety]
type = selfstate
trigger1 = !gethitvar(isbound)
value = 5050

;----------------------------------
;P2 Kick Throw
[statedef 805]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 4

[state 804, anim]
type = changeanim2
trigger1 = time = 0
value = 805

[state 805, rotate]
type = angledraw
trigger1 = time > 15
value = 90

[state 804, safety]
type = selfstate
trigger1 = !gethitvar(isbound)
value = 5050

;------------------------------------
;P2 Flying
[statedef 806]
type = A
movetype = H
physics = N
ctrl = 0
velset = -7,-3
sprpriority = 0

[state 806, anim]
type = changeanim2
trigger1 = time = 0
value = 806

[state 806, fall]
type = veladd
trigger1 = 1
y = .5

[state 806, land]
type = selfstate
trigger1 = pos y >= 0
value = 5100

;------------------------------------
;P2 Flying
[statedef 807]
type = A
movetype = H
physics = N
ctrl = 0
velset = -10,-3
sprpriority = 0

[state 806, anim]
type = changeanim2
trigger1 = time = 0
value = 806

[state 806, fall]
type = veladd
trigger1 = 1
y = .5

[state 806, land]
type = selfstate
trigger1 = pos y >= 0
value = 5100

;==========< PARRY >==========
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 700, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 700, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 5210,var(24)
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 700, 3

[State 700, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = floor(20*(const(size.xscale))), ceil(-27*(const(size.yscale)))
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 700, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 701, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 701, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 701, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 5210,var(24)
channel = 0
[State 701, Snd]
type = playsnd
trigger1 = !time
value = 700, 3

[State 701, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = floor(20*(const(size.xscale))), ceil(-24*(const(size.yscale)))
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 701, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- AERIAL ---
[Statedef 702]
type = A
physics = A
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = time < 15
value = SCA, AT
time = 1

[State 702, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 702, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 702, Type]
type = statetypeset
trigger1 = time < 15
physics = N
[State 702, Stop]
type = posfreeze
trigger1 = time < 15
value = 1

[State 702, Vel]
type = velset
trigger1 = time = 15
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 702, Type]
type = statetypeset
trigger1 = time >= 15
physics = A
[State 702, Ctrl]
type = ctrlset
trigger1 = time >= 15
value = 1

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 5210,var(24)
channel = 0
[State 702, Snd]
type = playsnd
trigger1 = !time
value = 700, 3

[State 702, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = floor(18*(const(size.xscale))), ceil(-26*(const(size.yscale)))
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 702, asserts]
type = assertspecial
trigger1 = 1
flag = noairguard
[State 702, Ctrl]
type = ctrlset
trigger1 = time > 10
value = 1

;---------------------------------------------------------------------------
;Neutral Dodge
[statedef 710]
type = S
movetype = I
physics = S
ctrl = 0
anim = 710
velset = 0,0

[state 710, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 710,0
channel = 0

[state 710, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 710,2+(random%2)
channel = 0

[state 710, nopush]
type = playerpush
trigger1 = 1
value = 0

[state 710, hitby]
type = hitby
trigger1 = 1
value = SCA,NT,ST,HT

[state 710, punch]
type = changestate
trigger1 = command = "x" || command = "y" || command = "z"
trigger1 = time > 1
value = 220

[state 710, kick]
type = changestate
trigger1 = command = "a" || command = "b" || command = "c"
trigger1 = time > 1
value = 250

[state 710, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------
;Foreward Roll
[statedef 711]
type = C
movetype = I
physics = C
ctrl = 0
anim = 110
velset = 0,0

[state 110, vel]
type = velset
trigger1 = animelemno(0) = [2,5]
x = 6

[state 711, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 710,(random%2)
channel = 0

[state 711, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 710,2+(random%2)
channel = 0

[state 711, nopush]
type = playerpush
trigger1 = 1
value = 0

[state 711, hitby]
type = hitby
trigger1 = 1
value = SCA,NT,ST,HT

[state 711, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------
;Backward Roll
[statedef 712]
type = C
movetype = I
physics = C
ctrl = 0
anim = 111
velset = 0,0

[state 712, vel]
type = velset
trigger1 = animelemno(0) = [2,5]
x = -6

[state 711, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 710,(random%2)
channel = 0

[state 711, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 710,2+(random%2)
channel = 0

[state 711, nopush]
type = playerpush
trigger1 = 1
value = 0

[state 711, hitby]
type = hitby
trigger1 = 1
value = SCA,NT,ST,HT

[state 711, end]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;==========< POWER CHARGE >==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
triggerall = anim = 740 && power < powermax
trigger1 = (command = "holdb" && command = "holdy")
value = 2 + ifelse(time < 60, 0, (time -60) / 10)

[State 740, Snd]
type = playsnd
trigger1 = anim = 740 && time = 8
trigger1 = var(24) = 0
value = 1,7
channel = 0

[State 740, Snd]
type = playsnd
trigger1 = anim = 740 && time = 8
trigger1 = var(24) = 1
value = 180,2+(random%2)
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(7240)
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(7243)
stateno = 7243
ID = 7243
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Anim]
type = changeanim
triggerall = anim != 741
trigger1 = (command != "holdb" || command != "holdy")
trigger2 = power >= const(data.power) || power >= powermax || roundstate != 2
value = 741

[State 740, Ctrl]
type = ctrlset
trigger1 = anim = 741
value = 1

[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 0
persistent = 0
[State 740, Snd]
type = playsnd
trigger1 = anim = 741 && power >= powermax
trigger1 = var(24) = 0
value = 190,0
channel = 0
persistent = 0
[State 740, Snd]
type = playsnd
trigger1 = anim = 741 && power >= powermax
trigger1 = var(24) = 1
value = 190,3
channel = 0
persistent = 0
[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1

;==========< ZERO COUNTER >==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = varset
trigger1 = !time
var(10) = ifelse((command = "Counter_P"), 1, 2)
ignorehitpause = 1

[State 750, Snd]
type = playsnd
trigger1 = !time && var(24) = 0
value = 190,0
channel = 0
[State 750, Snd]
type = playsnd
trigger1 = !time && var(24) = 1
value = 190,4
channel = 0
[State 750, Super Pause FX]
type = helper
trigger1 = !time
stateno = 7250
ID = 7250
postype = p1
pos = 16, -79
ownpal = 1
persistent = 0
supermovetime = 999
[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 20
movetime = 20
anim = -1
sound = s700, 4
p2defmul = 1
darken = 0
movetime = -1
[State 750, End]
type = changestate
trigger1 = time >= 20
value = ifelse(var(10) = 1, 1210, 450)

;===================< CUSTOM COMBO >===================
[Statedef 760]
type = U
physics = U
movetype = A
anim = ifelse(statetype = A, 761, 760)
ctrl = 0
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)
poweradd = -1000
[State 760, Stop]
type = posfreeze
trigger1 = anim = 761
value = 1

[State 760, Snd]
type = playsnd
trigger1 = !time
trigger1 = var(24) = 0
value = 190,0
channel = 0
[State 760, Snd]
type = playsnd
trigger1 = !time
trigger1 = var(24) = 1
value = 190,3
channel = 0
[State 760, Super Pause FX]
type = helper
trigger1 = !time
stateno = 7260
ID = 7260
postype = p1
pos = ifelse((anim = 760), -2, ifelse((anim = 762), -5, -8)), ifelse((anim = 760), -62, ifelse((anim = 762), -77, -43))
ownpal = 1
size.xscale = 1
size.yscale = 1
persistent = 0
supermovetime = 9999
[State 760, superchargepause]
type = superpause
trigger1 = !time
time = 30
anim = -1
sound = s700, 2
darken = 0
movetime = 30 * (anim != 761)

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 760, Var]
type = varset
trigger1 = (anim = 760) && !animtime
trigger2 = anim = 761 && !time
var(20) = 180

[State 760, NHB]
type = nothitby
trigger1 = (anim = 760)
trigger2 = anim = 761 && time <= 1
time = 8
value = SCA

[State 760, Shadows]
type = afterimage
trigger1 = (anim = [760, 761]) && time = 30
trigger2 = anim = 762 && time = 1
time = 2
timegap = 1
framegap = 4
length = 13
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
trans = add1

[State 760, End]
type = changeanim
trigger1 = anim = 761 && !animtime
value = 41
elem = 6

[State 760, Type]
type = statetypeset
trigger1 = anim = 41
statetype = A
physics = A
[State 760, Ctrl]
type = ctrlset
trigger1 = anim = 41
value = 1

[State 760, End]
type = changestate
trigger1 = (anim = 760) && !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Run forward
[Statedef 100]
type    = S
physics = S
ctrl = 0
anim = 100
sprpriority = 1

[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, 4]
type = ChangeState
trigger1 = command != "holdfwd"
value = 0
ctrl = 1

[state 100, sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 6 || animtime = 0
value = 100,0

;----------------------------------------------------------------------------
;Super Jump
[Statedef 703]; change these for the number that you want
type = A
movetype = I
physics = N
anim = 40 ; these is the jump anim
velset = 0,0
ctrl = 0

[State 0, ]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 0, ]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 0, ]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 0, ]
type = VelSet
trigger1 = animtime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = const(velocity.jump.y)*1.2 ; you can change these value, to make it fit how you want the superjump


[State 0, ]
type = ChangeState
trigger1 = animtime = 0
value = 50
ctrl = 1

[State 0, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 30
length = 10

[state 700, sound]
type = playsnd
trigger1 = !time
value = 40,1

;---------------------------------------------------------
;Lose
[statedef 170]
type = S
movetype = I
physics = S
ctrl = 0
anim = 170
velset = 0,0

[state 170, voice]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 170,0

;----------------------------------------------------------
;Win Pose Decider
[statedef 180]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0

[state 180, divinejpfinish]
type = changestate
trigger1 = !time && var(26)
value = 181

[state 180, random]
type = changestate
trigger1 = !time && !var(26)
value = 182+(random%2)

;------------------------------------
;Win Divine Jump Punch Finish
[statedef 181]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 181

[state 181, null]
type = null
trigger1 = 1

;----------------------------------
;Win Peace Sign
[statedef 182]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 182

[state 182, voice]
type = playsnd
trigger1 = animelem = 1
value = 180,var(24)

;-------------------------------
;Win Punch
[statedef 183]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 183

[state 183, voice1]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 710,0

[state 183, voice2]
type = playsnd
trigger1 = animelem = 18
trigger1 = var(24) = 0
value = 1,3+(random%3)

[state 183, voice1]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 180,2+(random%2)

[state 183, voice2]
type = playsnd
trigger1 = animelem = 18
trigger1 = var(24) = 1
value = 180,4

[state 183, whoosh]
type = playsnd
trigger1 = animelem = 18
value = 0,2

;-------------------------------------------------
;Preintro
[statedef 190]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0

[state 190, next]
type = changestate
trigger1 = !time
value = 191+(random%2)

;------------------------------------------------
;Intro Pipe
[statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S190,3
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S190,1
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S40,1
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = S40, 0
volume = 255
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan =
;ignorehitpause =
;persistent =

[State 190, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

[State 190, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4] ;Change to stand state
type = ChangeState
trigger1 = AnimTime = 0
value = 0

[State 190, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4] ;Change to stand state
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;-------------------------------------
;Intro Grow
[statedef 192]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0

[state 192, intro]
type = assertSpecial
trigger1 = 1
flag = intro

[state 192, freeze]
type = changeanim
trigger1 = roundstate = 0
value = 192

[state 192, sound]
type = playsnd
trigger1 = animelem = 2
value = 190,2

[state 192, voice]
type = playsnd
trigger1 = animelem = 8
trigger1 = var(24) = 0
value = 190,0

[state 192, voice]
type = playsnd
trigger1 = animelem = 8
trigger1 = var(24) = 1
value = 190,3

[state 192, end]
type = changestate
trigger1 = animtime = 0
value = 0

;---------------------------------
;Taunt
[statedef 195]
type = S
movetype = I
physics = S
poweradd = 72 * !var(20)
ctrl = 0
anim = 196
velset = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S1,41

[State 1962, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;==========< FALL RECOVERY >==========
[Statedef 5200]
type = A
movetype = H
physics = N
[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050
[State 5200, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5201

[Statedef 5201]
type = S
movetype = I
physics = N
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0
[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0
[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5210,var(24)
channel = 0
[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10
[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200
[State 5201, Dust]
type = playsnd
trigger1 = !time
value = 0, 101
[State 5201, Dust]
type = null;explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = 1, 0
scale = 1, 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 5201, Recover FX]
type = Helper
trigger1 = !Time
stateNo = 7200
ID = 7200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Snd]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 0
value = 710,(random%2)
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = animelem = 1
trigger1 = var(24) = 1
value = 710,2+(random%2)
channel = 0

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;==========< TARGET SAFE FALL >==========
[Statedef 5205]
type = A
physics = N
movetype = H

[State 5205, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 5205, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5205, Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 5205, Air]
type = selfstate
trigger1 = time >= 60
value = 5210

;----------------------------------------------
;Cheese KO
[statedef 5130]
type = S
movetype = H
physics = S
ctrl = 0
velset = 0,0
anim = 5950

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S11,2

[state 5130, pos]
type = posset
trigger1 = pos y != 0
y = 0

[state 5130, liedead]
type = changestate
trigger1 = animtime = 0
value = 5150

;========================<RECOVER FX>=============================
[StateDef 7200]
type = A
velSet = 0,0
anim = 8200
sprPriority = 5

[State 7200, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 7200, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.017 * Time), 0.25 + (0.017 * Time)
ignoreHitPause = 1

[State 7200, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = ceil(256 - 17.1 * Time), 256
ignoreHitPause = 1

[State 7200, End]
type = DestroySelf
trigger1 = Time >= 15

;========================< POWER CHARGE >=============================
;--- MAIN FX ---
[Statedef 7240]
type = S
anim = 9741
velset = 0, 0
ctrl = 0

[State 7240, Bind]
type = bindtoroot
trigger1 = (root, stateno = 740) && (root, anim = 740)
pos = -10, 0
[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 700, 0
channel = 0

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7242)
ID = 7242
anim = 7242
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1
[State 7240, Power Charge Dust]
type = Explod
trigger1 = !(Time % 6)
anim = 7240
sprPriority = -3
posType = P1
pos = 0, -ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power < 3000)
ID = 7242
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)
[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power >= 3000)
ID = 7242
scale = 0.5, 0.5

[State 7240, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7240, End]
type = stopsnd
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
channel = 0
[State 7240, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7240, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;--- PARTICLES ---
[Statedef 7243]
type = S
anim = 9741
velset = 0, 0
ctrl = 0

[State 7243, Bind]
type = bindtoroot
trigger1 = !(time % 4)
pos = ceil(-90 + (random / 6.25)), ceil(20 -(random / 6.25))

[State 7243, Particle]
type = explod
trigger1 = (time % 4) = 1
anim = 7243
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -10) / 16.0), ((rootdist y -60) / 16.0)
scale = ifelse(random < 500, 0.5, -.5), ifelse(random < 500, 0.5, -.5)
removetime = 16
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7243, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7243, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;========================< ZERO COUNTER CHARGE >=============================
[Statedef 7250]
physics = N
velset = 0, 0
anim = 9741

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 7250, palfx]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80

[State 7250, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = 30
ownpal = 1
[State 7250, thunder]
type = explod
trigger1 = !time
anim = 7250
ID = 7250
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
;[State 7250, Circle]
;type = explod
;trigger1 = !time
;anim = 7251
;ID = 7251
;sprpriority = 3
;postype = p1
;removetime = 20
;supermovetime = 30

[State 7250, Circle Explod]
type = Explod
trigger1 = !Time
anim = 7255
ID = 7255
sprPriority = 3
posType = P1
removeTime = 16
superMoveTime = -1
ownPal = 1

[State 8350, Scale]
type = ModifyExplod
trigger1 = NumExplod(7255)
ID = 7255
scale = (0.0625 * Time), (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

;[State 7250, Shrink]
;type = modifyexplod
;trigger1 = numexplod(7251)
;ID = 7251
;scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 7250, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7250, End]
type = destroyself
trigger1 = time >= 20


;========================< ORIGINAL COMBO CHARGE >=============================
[Statedef 7260]
physics = N
moveType = I
anim = 8400
ctrl = 0
velSet = 0,0
sprPriority = 5

[State 8400, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8400, BGpalFX]
type = BGpalFX
trigger1 = Time < 25
time = 1
mul = 128,128,128

[State 8400, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8400, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8400, Scale]
type = AngleDraw
trigger1 = Time < 8
scale = (0.0625 * Time), (0.0625 * Time)
ignoreHitPause = 1

[State 8400, Scale]
type = AngleDraw
trigger1 = Time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time < 16
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time >= 16
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignoreHitPause = 1

[State 7260, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 30
add = -255, -255, -128
sinadd = 255, 255, 128, 120
[State 7260, palfx]
type = palfx
trigger1 = time = 20
time = 11
sinadd = -255, -255, -255, 40
persistent = 0

[State 7260, main]
type = explod
trigger1 = !time
anim = 7260
ID = 7260
sprpriority = 5
facing = ifelse(random < 500, 1, -1)
vfacing = ifelse(random < 500, 1, -1)
postype = p1
removetime = 20
supermovetime = 300
[State 7260, Circle]
type = explod
trigger1 = time = 20
anim = 7265
ID = 7265
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300

;[State 7260, shrinkcircle]
;type = modifyexplod
;trigger1 = 1
;ID = 7260
;scale = 2 -(0.1 * time), 2 -(0.1 * time)
;[State 7260, shrinkcircle]
;type = modifyexplod
;trigger1 = 1
;ID = 7261
;scale = 0.017 * time, 0.017 * time
;[State 7260, shrinkcircle]
;type = modifyexplod
;trigger1 = time >= 20
;ID = 7262
;scale = 0.1 + (0.1 * (time -20)), 0.1 + (0.1 * (time -20))

[State 8400, Scale Lines Explod]
type = ModifyExplod
trigger1 = NumExplod(7260)
ID = 7260
scale = 2 - (0.125 * Time), 2 - (0.125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8400, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(7265)
ID = 7265
scale = (0.1 * (Time - 16)), (0.1 * (Time - 16))
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignorehitpause = 1
[State 7260, bound]
type = screenbound
trigger1 = 1
value = 0
[State 7260, Safety]
type = removeexplod
trigger1 = time >= 30
[State 6110, End]
type = destroyself
trigger1 = time >= 30


;========================< SUPER CHARGE >=============================
[Statedef 7500]
physics = N
velset = 0, 0
anim = 9741

[State 7500, Lv1]
type = bgpalfx
trigger1 = time <= 10 && root, var(10) = 5
time = 1
add = 256 -ceil(25.6 * time), 256 -ceil(25.6 * time), 256 -ceil(25.6 * time)
mul = 256 -floor(25.6 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)
[State 7500, Lv1]
type = bgpalfx
trigger1 = (time = [11, 39]) && root, var(10) = 5
time = 1
mul = 0, 0, 256
color = 0
[State 7500, Lv1]
type = bgpalfx
trigger1 = time >= 40 && root, var(10) = 5
time = 1
mul = ceil(51.2 * (time -40)), ceil(51.2 * (time -40)), 256
color = floor(51.2 * (time -40))

[State 7500, Lv2]
type = bgpalfx
trigger1 = time <= 15 && root, var(10) = 6
time = 1
add = 256 -ceil(17.07 * time), 256 -ceil(17.07 * time), 256 -ceil(17.07 * time)
mul = 256 -floor(17.07 * time), 256 -floor(17.07 * time), 256
color = 256 -floor(17.07 * time)
[State 7500, Lv2]
type = bgpalfx
trigger1 = (time = [16, 47]) && root, var(10) = 6
time = 1
mul = 0, 0, 256
color = 0
[State 7500, Lv2]
type = bgpalfx
trigger1 = time >= 48 && root, var(10) = 6
time = 1
mul = ceil(51.2 * (time -48)), ceil(51.2 * (time -48)), 256
color = floor(51.2 * (time -48))

[State 7500, Lv3]
type = bgpalfx
trigger1 = time <= 20 && root, var(10) = 7
time = 1
add = 256 -ceil(12.8 * time), 256 -ceil(12.8 * time), 256 -ceil(12.8 * time)
mul = 256 -floor(12.8 * time), 256 -floor(12.8 * time), 256 -floor(12.8 * time)
color = 256 -floor(12.8 * time)
[State 7500, Lv3]
type = bgpalfx
trigger1 = (time = [21, 54]) && root, var(10) = 7
time = 1
mul = 0, 0, 0
color = 0
[State 7500, Lv3]
type = bgpalfx
trigger1 = time >= 55 && root, var(10) = 7
time = 1
mul = ceil(51.2 * (time -55)), ceil(51.2 * (time -55)), ceil(51.2 * (time -55))
color = floor(51.2 * (time -55))

[State 7500, Spiral]
type = helper
trigger1 = !time && root, var(10) >= 6
stateno = 7509
ID = 7509
name = "Super Charge Spiral"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 7500, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
postype = p1
removetime = -1
pausemovetime = -1
supermovetime = -1
[State 7500, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Portrait]
type = explod
trigger1 = time = 1 && root, var(10) = 7 && Root, StateNo != 3601
anim = ifelse((root, var(1) = 2), 7511, 7510)
ID = 7510
postype = back
pos = 160, 120
sprpriority = -16
bindtime = -1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = !time
anim = 7502
ID = 75021
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 7
anim = 7502
ID = 75022
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 14
anim = 7502
ID = 75023
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 21
anim = 7502
ID = 75024
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 28
anim = 7502
ID = 75025
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 5
ID = 7500
scale = 1.5 -(0.0333 * time), 1.5 -(0.0333 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 6
ID = 7500
scale = 1.5 -(0.0283 * time), 1.5 -(0.0283 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 7
ID = 7500
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7501)
ID = 7501
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time < 8
ID = 7510
postype = back
pos = -160 + (40 * time), 120
scale = 0.5, 0.5
trans = addalpha
alpha = (32 * time), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && (time = [8, 50])
ID = 7510
postype = back
pos = 160, 120
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50 && root, var(1) != 2
ID = 7510
postype = back
pos = 160 -(20 * (time -50)), 120 + (40 * (time -50))
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50 && root, var(1) = 2
ID = 7510
postype = back
pos = 160 -(18 * (time -50)), 120 + (32 * (time -50))
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75021)
ID = 75021
scale = 0.25 + (0.0375 * time), 0.25 + (0.0375 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75022)
ID = 75022
scale = 0.25 + (0.0375 * (time -7)), 0.25 + (0.0375 * (time -7))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75023)
ID = 75023
scale = 0.25 + (0.0375 * (time -14)), 0.25 + (0.0375 * (time -14))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75024)
ID = 75024
scale = 0.25 + (0.0375 * (time -21)), 0.25 + (0.0375 * (time -21))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75025)
ID = 75025
scale = 0.25 + (0.0375 * (time -28)), 0.25 + (0.0375 * (time -28))

[State 7500, Safety]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
[State 7500, No bars]
type = assertspecial
trigger1 = root, var(10) = 7
flag = nobardisplay
flag2 = noFG

[State 7500, Safety]
type = removeexplod
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60
[State 7500, End]
type = destroyself
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60


;--- Spiral ---
[Statedef 7509]
physics = N
anim = 7509
sprpriority = 5
[State 7509, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7509, Spin]
type = angleset
trigger1 = !time
value = -15 * (random % 24)
[State 7509, Spin]
type = angleadd
trigger1 = 1
value = -15

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 6
scale = 1 -(time / 53.0), 1 -(time / 53.0)
[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 6
trans = addalpha
alpha = floor(4.83 * time), 256

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 7
scale = 1 -(time / 60.0), 1 -(time / 60.0)
[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 7
trans = addalpha
alpha = floor(4.267 * time), 256

[State 7509, End]
type = destroyself
trigger1 = root, var(10) = 6 && time >= 53
trigger2 = time >= 60


[Statedef 7510]
physics=N
velset=0,0
anim=9741

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 50
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Portrait (Ken)]
type = Explod
trigger1 = !Time
anim = 7514
ID = 22
sprPriority = -18
posType = Back
removeTime = 60
superMoveTime = -1

[State 8520, ModifyExplod 1 (Ken)]
type = ModifyExplod
trigger1 = NumExplod(22) && Time <= 7
ID = 22
posType = Back
pos = 400 - (34 * (Time)), 120
scale = 0.5, 0.5

[State 8520, ModifyExplod 2 (Ken)]
type = ModifyExplod
trigger1 = NumExplod(22) && Time >= 53
ID = 22
posType = Back
pos = 162 - (40 * (Time - 53)),120
scale = 0.5 + (0.25 * (Time - 53)),0.5 + (0.25 * (Time - 53))
trans = AddAlpha
alpha = 256 - ceil(25.6 * (Time - 53)),256

[State 8520, Portrait (Ryu)]
type = Explod
trigger1 = Time = 7
anim = 7512
ID = 23
sprPriority = -16
posType = Back
pos = 130,120
scale = 0.5,0.5
removeTime = 60
superMoveTime = -1

[State 8520, ModifyExplod 1 (Ryu)]
type = ModifyExplod
trigger1 = NumExplod(23) && Time <= 14
ID = 23
posType = Back
pos = -261 + (56 * (Time - 7)), 120
scale = 0.5, 0.5

[State 8520, ModifyExplod 2 (Ryu)]
type = ModifyExplod
trigger1 = NumExplod(23) && Time >= 53
ID = 23
posType = Back
pos = 131 + (40 * (Time - 53)),120
scale = 0.5 + (0.25 * (Time - 53)),0.5 + (0.25 * (Time - 53))
trans = AddAlpha
alpha = 256 - ceil(25.6 * (Time - 53)),256

[State 8520, ModifyExplod 1 (Mask)]
type = ModifyExplod
trigger1 = NumExplod(24) && Time <= 14
ID = 24
posType = Back
pos = -261 + (56 * (Time - 7)), 120
scale = 0.5, 0.5

[State 8520, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(24) && Time >= 32
ID = 24

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 60

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 60



;========================< COUNTER F.X. >=============================
[Statedef 7400]
type = A
physics = N
anim = 9741

[State 7400, superchargebgpalfx]
type = allpalfx
trigger1 = !time
time = 8
add = 255, 255, 255
sinadd = -255, -255, -255, 32

[State 7400, slow]
type = pause
trigger1 = time < 8
time = 1

[State 7400, End]
type = destroyself
trigger1 = time >= 8


;========================< SUPER FINISH >=============================
[Statedef 7600]
type = A
velset = 0, 0
anim = 9741

[State 7600, Bind]
type = posset
trigger1 = 1
x = 0
y = ceil(pos y -screenpos y) + 120

[State 7600, Snd]
type = playsnd
trigger1 = !time
value = 3000, 1
channel = 1

[State 7600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

;[State 7600, Snd]
;type = assertspecial
;trigger1 = time <= 80
;flag = nomusic

[State 8600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && !(root, stateno = [3000,3999])
var(39) = Root, var(39)

[State 8600, Text 1]
type = Explod
trigger1 = !Time && var(39)
anim = 861 + var(39)
ID = 10
onTop = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.55, 0.55 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 2]
type = Explod
trigger1 = !Time && var(39)
anim = 8610 + var(39)
ID = 11
onTop = 1
posType = left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.55, 0.55 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 1 Fade]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), ifElse(Time < 16, 0, 32 * (Time - 16))

[State 8600, Text 2 Fade]
type = ModifyExplod
trigger1 = NumExplod(11)
ID = 11
scale = 0.5 + (0.0625 * Time), 0.5 + (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time), 32 * Time

;[State 7600, BG PalFX]
;type = bgpalfx
;trigger1 = time < 10
;time = 1
;mul = 0, 0, 0
;[State 7600, BG PalFX]
;type = bgpalfx
;trigger1 = time = [10, 20]
;time = 1
;mul = (time -10) * 25, (time -10) * 25, (time -10) * 25

[State 7600, BG PalFX]
type = BGpalFX
trigger1 = Time < 16
time = 1
mul = 0, 0, 0

[State 7600, BG PalFX]
type = BGpalFX
trigger1 = Time = [16,24)
time = 1
mul = 32 * (Time - 16), 32 * (Time - 16), 32 * (Time - 16)

[State 8600, Super Finish Explod]
type = Explod
trigger1 = !Time
anim = 8600
ID = 8600
ontop = 1
postype = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Super Finish Explod Fade]
type = ModifyExplod
trigger1 = NumExplod(8600)
ID = 8600
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), 256

[State 8600, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8601
ID = 8601
under = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
bindTime = -1
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Circle Fade]
type = ModifyExplod
trigger1 = NumExplod(8601)
ID = 8601
scale = (0.25 * Time) * (1.3333333 * GameHeight / GameWidth), (0.25 * Time) * (1.3333333 * GameHeight / GameWidth)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

;[State 7600, MvC]
;type = explod
;trigger1 = !time
;anim = 7601
;ID = 7601
;ontop = 1
;postype = left
;pos = 0, 0
;scale = 1, (1.3333333 * gameheight / gamewidth)
;bindtime = -1
;removetime = 20
;pausemovetime = -1
;supermovetime = -1

;[State 7600, Fade]
;type = modifyexplod
;trigger1 = numexplod(7601)
;ID = 7601
;trans = addalpha
;alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

;[State 7600, Circle]
;type = explod
;trigger1 = !time
;anim = 7600
;ID = 7600
;sprpriority = -255
;postype = left
;pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
;bindtime = -1
;removetime = 20
;pausemovetime = -1
;supermovetime = -1
;
;[State 7600, Scale]
;type = modifyexplod
;trigger1 = numexplod(7600)
;ID = 7600
;scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
;trans = addalpha
;alpha = ceil(256 -12.8 * time), 256

;[State 7600, Safety]
;type = removeexplod
;trigger1 = time < 24 && numexplod
;trigger2 = roundstate < 3
;[State 7600, nobars]
;type = assertspecial
;trigger1 = time < 24
;flag = nobardisplay
;flag2 = noFG
;flag3 = globalnoshadow

[State 8600, Assert: NoFG]
type = AssertSpecial
trigger1 = Time < 16
flag = NoFG

[State 8600, Assert: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 24
flag = NoBarDisplay

[State 8600, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 24
trigger2 = RoundState < 3

[State 7600, End]
type = destroyself
trigger1 = roundstate < 3

;========================< CAMERA CONTROL >=============================
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9741
[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 7650, End]
type = destroyself
trigger1 = roundstate = 2

;========================<SPARKS>=============================
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, PosSet]
type = BindToRoot
trigger1 = root, stateno = 890
pos = 15, -55
ignorehitpause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, Impact Explod]
type = Explod
trigger1 = (root, stateno = 368)
trigger1 = !Time
anim = 8001
ID = 1
posType = P2
facing = 1
sprPriority = 5
pos = 0, -70
random = 60, 60
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8001, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8001, Remove Explods]
type = RemoveExplod
trigger1 = !(root, stateno = 368)
trigger1 = time >= 8

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8

;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16


;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16


;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3100,3999]), -1, ifelse(Random < 500, -1, 1))
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, P2 Back Explod (STSK)]
type = Explod
triggerAll = (Root, StateNo = 3200) && (Root, AnimElemTime(2) >= 0)
trigger1 = !Time
anim = 8015
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3100,3200]), -1, 1)
vFacing = 1
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16

;Super Hit Spark (Shun Goku Satsu)
[StateDef 8015]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 4015, BindToRoot]
type = BindToRoot
triggerAll = (Root, StateNo = 4001) && (Root, AnimElemTime(2) > 0) && (Root, AnimElemTime(16) < 0)
trigger1 = !Time
pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
facing = 1

[State 8015, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8010
ID = 10
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
trigger1 = time < 10
ID = 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Center Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16

;Super Hit Spark (Ryu Koku Hado)
[StateDef 8016]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

;[State 4015, BindToRoot]
;type = BindToRoot
;trigger1 = !Time
;pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
;facing = 1

[State 8015, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16

;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8

;======================<IMPACT DUST>===========================
[StateDef 8110]
type = A
anim = 9741
velSet = 0,0
sprPriority = 5

[State 8110, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8110
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8120
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod

;========================<COUNTER FX>=============================
[StateDef 8290]
type = A
physics = N
velSet = 0,0
anim = 9741

[State 8290, "Counter!" Text Explod]
type = Explod
trigger1 = !NumExplod(8290)
anim = 8290
ID = 8290
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8290
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8290
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8290, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8290, End]
type = DestroySelf
trigger1 = Time >= 16


;========================<SUPER PAUSE FX>=============================
;Level 1 Super FX
[StateDef 8500]
type = A
velSet = 0,0
anim = 8500
sprPriority = 5

[State 8500, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8500, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 0,0,256

[State 8500, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8500, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8500, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8500, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5,0.5
ignoreHitPause = 1

[State 8500, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8500, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8501
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8500, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8500, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8502
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8500, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8500, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 2 Super FX
[StateDef 8510]
type = A
velSet = 0,0
anim = 8510
sprPriority = 5

[State 8510, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8510, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 192,0,256

[State 8510, Rotate]
type = AngleSet
trigger1 = !Time
value =6 * (Random % 60)

[State 8510, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8510, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8510, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8510, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8511
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8510, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8510, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8510, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8510, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 -(0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8510, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8512
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 32
superMoveTime = -1

[State 8510, Scale]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24)<4, 64 * (Time - 24), 256), 256

[State 8510, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8510, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 3 Super FX
[StateDef 8520]
type = A
velset = 0,0
anim = 8520
sprPriority = 9

[State 8520, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 40
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8520, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8520, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8520, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8520, Portrait 1]
type = Explod
trigger1 = !Time
anim = 8525 + Root, var(40)
ID = 20
sprPriority = 16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Portrait 2]
type = Explod
trigger1 = !Time
anim = 8525 + Root, var(40)
ID = 21
sprPriority = 16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Scale Portrait 1a]
type = ModifyExplod
trigger1 = NumExplod(20) && Time < 16
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 1 - (0.03125 * Time), 1 - (0.03125 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 2a]
type = ModifyExplod
trigger1 = NumExplod(21) && Time < 16
ID = 21
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 2 - (0.09375 * Time), 2 - (0.09375 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 1b]
type = ModifyExplod
trigger1 = NumExplod(20) && (Time = [16,32])
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines Explod]
type = explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8521
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8520, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8520, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1-(0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8520, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8520, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8522
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1 ,1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8520, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 40

;========================<CAMERA CONTROL>=============================
[StateDef 8999]
type = S
velSet = 0,0
anim = 9741

[State 8999, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2

;----------------------------------------------------------------------------------------------------------
;-2
[statedef -2]

;#ADD004BASIC PIEs#
;##[a4b_-2_start.v20200523]##
;//==========================
;// add004-sctrls-start
;//==========================
;sys::-2::partners_standby ; ???????
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	;;---
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(??)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(??)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(??????)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(??)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; ??????
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ?????
[state 0]
	type=helper
	triggerall=!ishelper && !numhelper(90900)
	trigger1=numpartner
	trigger1=id<(partner,id) && partner,numhelper(90900)=0
	trigger2=!numpartner
	id=90900
	stateno=90900
	helpertype=normal
	ownpal=1
;op;	size.ground.front=###
;op;	size.ground.back=###
	size.air.front=2108130 ;; <<-version
;op;	size.air.back=###
	size.height=0 ;; 1;; <<-powerbar off mode
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	;---
;op;	size.xscale=0
;op;	size.yscale=0
	;---
	pos=0,88888

;sys::-2::get_helper::bar004_id ; ID??
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=(helper(90900),id)

;sys::-2::get_players_id2
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=(partner,sysfvar(0)))
	sysfvar(0)=(partner,sysfvar(0))

;sys::-2::bk/jd_system ; ?????/????D
[state 0]
	type=hitoverride
	triggerall=!ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	trigger1=numprojid(195502)||numprojid(195503)
	trigger2=numpartner
	trigger2=partner,numprojid(195502)||partner,numprojid(195503)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1


;//==========================
;//==========================
;;>>@Config.Face>>
;sys::-2::face_d_mod
[state 0]
	type=removeexplod
	trigger1=roundstate!=2 || (stateno=5150 && time=5 && !alive)
	trigger2=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger2=(playerid(floor(sysfvar(0))),var(0)=90900)
	trigger2=!(playerid(floor(sysfvar(0))),var(9)&4) || (playerid(floor(sysfvar(0))),var(9)&262144)
	id=490600
	ignorehitpause=1

;sys::-2::face_d_main ; portrait (?)
[state 0]
	type=explod
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909002)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0))) && roundstate=2
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490600)
	trigger1=id=playerid(floor(sysfvar(0))),var(15)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909002
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(20))), floor(const240p(playerid(floor(sysfvar(0))),fvar(22)))
	scale=playerid(floor(sysfvar(0))),fvar(24), playerid(floor(sysfvar(0))),fvar(26)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(32))
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(28))/1000, floor(playerid(floor(sysfvar(0))),fvar(28))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;;sys::-2::face_d_partner_#+option
[state 0]
	type=explod
	trigger1=numpartner
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909001)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0))) && roundstate=2
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490601+(gametime%numpartner))
	trigger1=(id+numpartner+1-playerid(floor(sysfvar(0))),var(15))%(numpartner+1)=(gametime%numpartner)+1
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909001
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(21) +playerid(floor(sysfvar(0))),fvar(34)*(gametime%numpartner) )), floor(const240p(playerid(floor(sysfvar(0))),fvar(23) +playerid(floor(sysfvar(0))),fvar(35)*(gametime%numpartner) ))
	scale=playerid(floor(sysfvar(0))),fvar(25) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner), playerid(floor(sysfvar(0))),fvar(27) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(33))+(gametime%numpartner)*10
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(29))/1000, floor(playerid(floor(sysfvar(0))),fvar(29))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;#Options_Char_Name
;sys::-2::name_d_main_left&right
[state 0]
	type=explod
	trigger1=numexplod(490600)=1 && selfanimexist(909010+teamside)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && id=playerid(floor(sysfvar(0))),var(15)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909010+teamside
	space=screen
	postype=left
	facing=1
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(10))), floor(const240p(playerid(floor(sysfvar(0))),fvar(12)))
	scale=playerid(floor(sysfvar(0))),fvar(14), playerid(floor(sysfvar(0))),fvar(16)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(32))+2
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(18))/1000, floor(playerid(floor(sysfvar(0))),fvar(18))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;;sys::-2::name_d_partner_#left&right
[state 0]
	type=explod
	trigger1=numpartner
	trigger1=numexplod(490600)=1 && selfanimexist(909010+teamside)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490601+(gametime%numpartner))
	trigger1=(id+numpartner+1-playerid(floor(sysfvar(0))),var(15))%(numpartner+1)=(gametime%numpartner)+1
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909010+teamside
	space=screen
	postype=left
	facing=1
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(11) +playerid(floor(sysfvar(0))),fvar(34)*(gametime%numpartner) )), floor(const240p(playerid(floor(sysfvar(0))),fvar(13) +playerid(floor(sysfvar(0))),fvar(35)*(gametime%numpartner) ))
	scale=playerid(floor(sysfvar(0))),fvar(15) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner), playerid(floor(sysfvar(0))),fvar(17) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(33))+(gametime%numpartner)*10+3
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(19))/1000, floor(playerid(floor(sysfvar(0))),fvar(19))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;//==========================
;;>>@Config.Camera>>
;sys::-2::camera_nc ; ????
[state 0]
	type=screenbound
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	movecamera=0,0
	ignorehitpause=1
;sys::-2::camera_np
[state 0]
	type=playerpush
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	ignorehitpause=1
;sys::-2::camera_nc2
[state 0]
	type=screenbound
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==========================
;sys::-2::add.option2-noko
[state 0] ;; opt-noko
	type=assertspecial
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && (playerid(floor(sysfvar(0))),var(9)&65536) ;; opt-noko
	flag=noko
	ignorehitpause=1
;sys::-2::add.option3-life-mod
[state 0] ;; opt-life-mod
	type=lifeadd
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && playerid(floor(sysfvar(0))),var(23)!=0 ;; opt-mod-life
	value=playerid(floor(sysfvar(0))),var(23)
	kill=0
	ignorehitpause=1

;//==========================
;// optional settings
;sys::-2::guard_crush_fx ; ????????
[state 0]
	type=palfx
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (gametime%5=0) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=800
	time=2
	add=200,0,0
;sys::-2::guard_crush_cs
[state 0]
	type=changestate
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=1000
	value=190010
	ignorehitpause=1
;;--- dizzy
;sys::-2::goto-dizzy_s/c
[state 0] ;[.03-2d1]
	type=selfstate
	trigger1=(stateno=5001 || stateno=5011) && hitover      && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195201;; (goto-dizzy:190116)
;sys::-2::goto-dizzy_a/l
[state 0] ;[.03-2d2]
	type=selfstate
	trigger1=(stateno=5030 || stateno=5071) && hitshakeover && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195050
;sys::-2::goto-dizzy_fd
[state 0] ;[.03-2e1]
	type=selfstate
	trigger1=(stateno=[5110,5111]) && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195110
;;--- fadeout when KOed ; KO????
;sys::-2::st5150-1
[state 0]
	type=varset
	trigger1=stateno=5150 && time=1 && alive=0 && !ishelper && numpartner
	sysvar(1)=(roundstate<=2)
;sys::-2::st5150-2
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && sysvar(1) && (((time=[80,150]) && time%10<5) || time>150)
	flag=invisible
	flag2=noshadow
;;--- intro-pos-reset
;;--- <<IKEMEN????>>
;sys::-2::st5900-f
[state 0]
	type=turn
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && facing=ifelse(teamside=1,-1,1)
;sys::-2::st5900-pp3
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && playeridexist(id-2)
	trigger1=playerid(id-2),ishelper=0 && playerid(id-2),teamside=teamside
	x=const240p(120)*ifelse(teamside=1,-1,1)
;sys::-2::st5900-pp4
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>2 && playeridexist(id-3)
	trigger1=playerid(id-3),ishelper=0 && playerid(id-3),teamside=teamside
	x=const240p(145)*ifelse(teamside=1,-1,1)
;//==========================
;// add004-sctrls-end
;//==========================
;##[a4b_-2_end]##


[state -2, No Clones]
type = remappal
triggerall=numenemy && (var(26)=[1,40])
trigger1=var(27)&&!numhelper(256)&&matchno=1&&roundno=1
trigger1=enemy,authorname="Golde Briggs"&&enemy,name="Mario"&&enemy,var(26)=var(26) 
source = 1, 1
dest = 1, Ifelse(teamside!=1 && enemynear,Numhelper(256)=0,enemy,var(26)+teamside,var(26))
ignorehitpause = 1
[state -2, Palette]
type = varset
trigger1 = numhelper(256)
trigger1=helper(256),var(26)=[1,40]
var(26)= helper(256),var(26)
ignorehitpause = 1
[state -2, Palette Selection]
type = remappal
trigger1 = numhelper(256)
trigger1=helper(256),var(26)=[1,40]
source = 1, 1
dest = 1, var(26)
ignorehitpause = 1
[state -2, Continue Palette]
type = remappal
trigger1=var(27)&&!AILevel&&matchno>1
source = 1, 1
dest = 1, var(26)
ignorehitpause = 1

[State -2, KO snd]
type = varset
trigger1 = alive && var(8) > 0
trigger2 = !alive && var(8) < 2
var(8) = ifelse(alive, 0, var(8) + 1)
ignorehitpause = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11+var(24), ifelse((var(1) = 2), 2, 1) + 2 * (stateno = 5130)
ignorehitpause = 1

[state -2, hitvoice]
type = playsnd
triggerall = time = 1
triggerall = alive
triggerall = random <= 500
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
trigger4 = stateno = 5070
trigger5 = stateno = 5080
value = 5000+var(24),(random%4)
channel = 0
ignorehitpause = 1

[State -2, Super Finish Detection]
type = VarSet
triggerAll = !(Enemy, Alive)
trigger1 = StateNo = 3120
var(11) = 1
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
trigger1 = (stateno!=[4000,4001])
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 5, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 6, var(32)
channel = 2
ignoreHitPause = 1

[state -2, coin snd]
type = playsnd
triggerall = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = stateno = [1200,1231]
trigger2 = stateno = [3000,3002]
trigger3 = stateno = [3010,3011]
value = 5,7
channel = 3
ignorehitpause = 1

[state -2, coin]
type = helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerall = NumEnemy
trigger1 = stateno = [1200,1231]
trigger2 = stateno = [3000, 3002]
trigger3 = stateno = [3010, 3011]
stateno = 1203
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
scale = 1,1
id = 1200
name = "Coin"
ignorehitpause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = ((StateNo != [1200,1260]) && StateNo != 3200) || ((StateNo = [1200,1260]) && P2Dist x >= 0) || (StateNo = 3200 && P2Dist x >= 0)
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (Tatsumaki's, Opponent Behind)]
type = Helper
triggerAll = ((StateNo = [1200,1260]) && P2Dist x < 0) || (StateNo = 3200 && P2Dist x < 0) || (stateno = 450 && p2dist x < 0)
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
trigger3 = movehit = 1 && numenemy
trigger3 = var(33) = 8012
trigger4 = moveguarded = 1 && numenemy
trigger4 = var(34) = 8000
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x >= 0, 0, ifElse(P2Dist x >= var(35), ceil(P2Dist x), var(35))), var(36)
facing = 1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(29)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

[State -2, P2 Facing]
type = targetfacing
trigger1 = movecontact = 1 && numtarget
trigger1 = !(target, hitshakeover) && !(target, hitfall) && (target, time <= 1)
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 5205
ignorehitpause = 1

[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(29) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Wall Bounce Count]
type = VarAdd
trigger1 = MoveHit = 1 && Numtarget(1310)
var(14) = 1

[State -2, Wall Bounce Count Reset]
type = VarSet
trigger1 = NumEnemy && var(14)
;trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
;trigger2 = !Numtarget(1310)
var(14) = 0
ignoreHitPause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Normal Atk Juggle Count]
type = VarAdd
triggerall = !var(20)
trigger1 = var(27)
trigger1 = (Stateno = [200, 650])
trigger1 = MoveHit = 1
var(15) = 9

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 1)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(0), Time >= 1)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
trigger2 = var(20)>0
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Modified Juggle Count]
type = VarAdd
triggerall = MoveHit = 1 && Numtarget && !var(20)
trigger1 = stateno = [1100,1120]
var(17) = 1

[State -2, Modified Juggle Count Reset]
type = VarSet
trigger1 = NumEnemy && var(17)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
trigger2 = var(20)
var(17) = 0
ignoreHitPause = 1

[state -2, SJP Juggle Count]
type = varadd
triggerall = movecontact = 1
trigger1 = stateno = [1200,1233]
var(18) = 1

[state -2, SJP Juggle Count Reset]
type = VarSet
trigger1 = var(18)
trigger1 = stateno != [1200,1233]
var(18) = 0
ignorehitpause = 1

[State -2, Custom Combo End]
type = VarSet
trigger1 = var(20) < 0
trigger2 = MoveType = H
trigger3 = RoundState != 2
trigger4 = (StateNo = [3000,4999])
var(20) = 0
ignoreHitPause=1

[State -2, Custom Combo Time]
type = VarAdd
trigger1 = var(20) > 0
var(20) = -1
ignoreHitPause = 1

[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
var(38) = 0
[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, stateno = [150, 155]
trigger2 = (enemynear, stateno = 51 || enemynear, stateno = 140) && (enemynear, prevstateno = [150, 155])
trigger3 = enemynear, movetype = H && enemynear, statetype != A && !var(20)
trigger4 = (enemynear, stateno = [5020, 5040]) && enemynear, hitfall = 0
trigger5 = enemynear, stateno = 40 && enemynear, prevstateno != 52 && (enemynear, anim != [0, 29])
var(38) = 1
ignorehitpause = 1

[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy
;fvar(10) = ifelse(enemynear, gethitvar(hitcount) < 3, 24, ifelse(enemynear, gethitvar(hitcount) >= 24, 2, 26 - enemynear, gethitvar(hitcount))) / 24.0
fvar(10) = ifelse(var(13) < 3, 24, ifelse(var(13) >= 24, 2, 26 - var(13))) / 24.0
ignorehitpause = 1
[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy && var(20)
;fvar(10) = 0.72 * (10 -ifelse(enemynear, gethitvar(hitcount) >= 10, 10, enemynear, gethitvar(hitcount))) / 10.0
fvar(10) = 0.72 * (10 -ifelse(var(13) >= 10, 10, var(13))) / 10.0
ignorehitpause = 1
[State -2, attackvarbyhits]
type = VarSet
trigger1 = (stateNo = [3000,4999])
fvar(10) = ifelse(var(22), 0.6, ifelse(var(21) || var(23), 0.8, 1.0))
ignoreHitPause = 1
[State -2, attackvarbyhitsreset]
type = varset
trigger1 = numenemy
trigger1 = (enemynear, movetype != H)
trigger2 = !numenemy
fvar(10) = ifelse(var(20), 0.72, 1)
ignorehitpause = 1

[State -2, dampenervar]
type = varset
trigger1 = 1
fvar(12) = fvar(10) * ifElse(var(29), 1.2, 1) * ifElse(var(1) = 1, 0.92, 1)
ignorehitpause = 1
;[State -2, dampener]
;type = attackmulset
;trigger1 = 1
;value = fvar(12)
;ignorehitpause = 1

[State -2, Defence Levels]
type = lifeadd
trigger1 = var(1) = 2 || var(1) = 3
trigger1 = gethitvar(hitcount) = 1 && gethitvar(damage)
value = -ceil(ifelse(var(1) = 3, 0.25, 0.125) * gethitvar(damage))
kill = 0
ignorehitpause = 1
[State -2, Defence Levels]
type = defencemulset
trigger1 = var(1) = 2 || var(1) = 3
value = ifelse(var(1) = 3, 1.25, 1.125) * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1
[State -2, VarSet]
type = VarSet
trigger1 = stateno!= 52
trigger1 = !(stateno = [3000,4999])
var(23) = 0
ignorehitpause = 1

[State -2, Assert: nostandguard]
type = AssertSpecial
triggerall = stateno = 52
trigger1 = (anim = [1102,1104])
trigger2 = anim = 1208
trigger3 = anim = 3102
flag = nostandguard
flag2 = nocrouchguard
ignoreHitPause = 1

[State -2, Free Juggling]
type = assertspecial
trigger1 = var(20) > 0 || numtarget(3120) || numtarget(3180)
trigger2 = roundstate != 2
flag = nojugglecheck
ignorehitpause = 1
[State -2, Original Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1
[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1

[State -2, stopsnd3]
type = stopsnd
trigger1 = time <= 1
trigger1 = prevstateno = 3040
channel = 3
[State -2, stopsnd4]
type = stopsnd
trigger1 = time <= 1
trigger1 = prevstateno = 3040
channel = 4

[State -2, PosAdd]
type = PosAdd
trigger1 = var(1) = 2
trigger1 = (stateno = [1000,3999]) && time = 1
trigger1 = prevstateno = 250
x = 10
ignorehitpause = 1
persistent = 0

[State -2, resetmetsushoryukenvar]
type = varset
trigger1 = (stateno != 3100 || anim != 3101) && var(43)
var(43) = 0

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[state -2, confighelper]
type = helper
trigger1 = !numhelper(900)
stateno = 900
id = 900
name = "Config Helper"

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Mode = %d Damage = %f Hits = %d Juggle = %d Free Juggle = %d"
params = AIlevel, var(1), fvar(12), var(13), var(15), var(39)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy TylorGoldenYoshi & POTS"
ignorehitpause = 1

;------------------------------------------------------------------------------------------------------
;-3
[statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

;[State -3, Wrong StateType]
;type= superpause
;trigger1= pos y!=0 && statetype!=A && statetype!=L
;time= 99999
;ignorehitpause= 1

[State -3, Shadows]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && var(9) = 3
trigger2 = stateno = 710 || stateno = 711 || stateno = 712
time = 2
timegap = 1
framegap = 3
length = 12
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1

[State -3, ExSnd]
type = playsnd
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4
value = 1000, 0
ignorehitpause = 1

[State -3, EX FX Decrement]
type = VarAdd
trigger1 = var(25) > 0
var(25) = -1

[State -3, EX FX Reset]
type = VarSet
trigger1 = (StateNo != [1000,2999]) || MoveType = H
var(25) = 0

[State -3, EX Flash]
type = PalFX
trigger1 = !(GameTime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignoreHitPause = 1

;[State -3, ExShadow]
;type = afterimage
;trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4
;time = 2
;timegap = 1
;framegap = 1
;length = 8
;palbright = 32, 32, 0
;palcontrast = 128, 128, 128
;paladd = -10, -10, -10
;palmul = 1.1, 1, 0.5
;trans = add
;ignorehitpause = 1
;[State -3, ExFlash]
;type = palfx
;trigger1 = (stateno = [1000, 2999]) && movetype = A && var(10) = 4
;triggerall = (anim != [1101, 1103]) && anim != 1207
;time = 1
;add = 32 + ceil(sin(gametime / 1.5) * 32), 32 + ceil(sin(gametime / 1.5) * 32), 0
;mul = 300, 300, 200
;ignorehitpause = 1

[State -3, Lv1 Shadows]
type = afterimage
trigger1 = stateno = 3000 && animelemtime(1) = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Lv2 Shadows]
type = afterimage
trigger1 = stateno = 3011 && animelemtime(1) = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Lv3 Shadows]
type = afterimage
trigger1 = stateno = 3040 && anim = 3040 && animelem = 4
trigger1 = stateno = 2002 && anim = 2102 && animelem = 4
trigger2 = stateno = 2001 && anim = 2101 && animelem = 1
trigger3 = stateno = 4000 && time = 1
trigger4 = stateno = 368 && time = 1
trigger5 = stateno = 3601 && time = 1
trigger6 = stateno = 3701 && animelem = 31
trigger7 = stateno = 3150 && time = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1
ignorehitpause = 1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = stateno = 50 && var(9) = 3 && vel y < -1
trigger2 = var(20) > 0
trigger3 = stateno = 710 || stateno = 711 || stateno = 1400 || stateno = 712
trigger4 = (stateno = [1000, 2999]) && var(10) = 4 && (anim != [1101, 1103]) && anim != 1207
trigger5 = (stateno = [3000, 4999]) && (anim != [1101, 1102]) && (anim != [1111, 1112])
trigger6 = stateno = 368 && animelemtime(2) < 0
trigger7 = stateno = 5982 && anim = 1400
time = 2

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1
[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = (statetype = S || statetype = C) && numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)
[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State -3, Prevent Crossup]
type = width
trigger1 = movetype != H
edge = 8, 0
ignorehitpause = 1

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A && movetype != H && numenemy = 1
triggerall = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)) , 0]
trigger1 = p2statetype = S
trigger1 = p2dist y >= (enemynear, const(size.height) - 30)
trigger2 = p2statetype = C
trigger2 = p2dist y >= (enemynear, const(size.height) - 56)
trigger3 = p2statetype = L
trigger3 = p2dist y >= 12
value = 0
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = prevstateno = 700
trigger1 = stateno = 0 && time < 7
flag = nowalk

[State -3, Cancel Reset]
type = varset
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Restriction]
type = VarSet
triggerall = !var(20)
trigger1 = (stateno = 210 && (anim = 210 || anim = 213))
trigger2 = stateno = 212
trigger3 = stateno = 213
trigger4 = (stateno = 220 && anim = 220)
trigger5 = (stateno = 225 && (anim = 225 || (anim = 226 && animelemtime(5)>= 0)))
trigger6 = (stateno = [260,286])
trigger7 = (stateno = 1500 && anim = 1501) && var(1)!= 1
trigger8 = stateno = 210 && ((anim = 211 || anim = 2110) && animelemtime(4)>= 0)
trigger9 = stateno = 240 && ((anim = [240,241]) && animelemtime(5)>= 0)
trigger10 = (stateno = 205 && anim = 205) && var(1) = 2
trigger11 = stateno = 1310
trigger12 = stateno = 1300 && var(1) = 3
var(6) = 1
ignoreHitPause = 1

[State -3, Target Combo Reset]
type = varset
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Target Combo Check]
type = VarSet
triggerall = !var(20)
trigger1 = (stateno = 205 && anim = 208) && var(1) = 2
trigger2 = (stateno = 205 && anim = 206) && var(1) = 3
var(7) = 1
ignoreHitPause = 1

[State -3, Cheap KO]
type = changestate
trigger1 = !alive && (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5130
ignorehitpause = 1

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = var(20) && !numhelper(7600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(3)
trigger3 = numhelper(1015)
trigger3 = helper(1015), var(3)
trigger4 = numhelper(1017)
trigger4 = helper(1017), var(3)
trigger5 = numhelper(1025)
trigger5 = helper(1025), var(3)
trigger6 = numhelper(1035)
trigger6 = helper(1035), var(3)
trigger7 = stateno = 805 && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger8 = stateno = 810 && (animelemtime(4) = [0, 1])
stateno = 7600
ID = 7600 + 0 * (var(39) := 1)
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerAll = WinKO
triggerAll = RoundState = 3 && !NumHelper(7600)
trigger1 = MoveHit = 1 && (StateNo = [2000,4999])
trigger1 = var(23) := StateNo
trigger2 = (StateNo = [3000,3099])
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3100,3199])
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = (StateNo = [3300,3399])
trigger5 = var(23) := 3300
trigger6 = StateNo = [3400,3499]
trigger6 = var(23) := 3400
stateno = 7600 ;+ 0 * (var(0) := stateno)
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[state -3, jumpsnd]
type = playsnd
trigger1 = stateno = 40 && !time
value = 40,0

[state -3, landsnd]
type = playsnd
trigger1 = stateno = 52
trigger1 = time = 1
value = 40,2

[state -3, backdash]
type = playsnd
trigger1 = stateno = 105 && time = 1
value = 105,0

