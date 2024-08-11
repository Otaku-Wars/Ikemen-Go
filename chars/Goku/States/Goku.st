; __________________
;| Goku by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;==============================<NORMAL / SUPER SAIYAN 2 TRANSFORMATION>==========================
;==============================================================================================

;========================< NORMAL / SUPER SAIYAN 2 START SELECTION >=============================
[Statedef 5902]
type = S

[State 0, SSJ2 Mid-Battle-Transformation]
type = VarSet
trigger1 = 1
var(57) = ifelse(palno = 12 || palno = 21, 0, 1)

[State 0, Normal Goku]
type = VarSet
trigger1 = palno = [1,12]
var(1) = 0

[State 0, SSJ2 Goku]
type = VarSet
trigger1 = palno = [13,21]
var(1) = 1

[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = 190