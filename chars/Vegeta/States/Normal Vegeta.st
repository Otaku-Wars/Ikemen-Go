; __________________
;| Vegeta by DJMouF |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>========================================
;==============================================================================================

;========================< NORMAL / SUPER SAIYAN START SELECTION >=============================
[Statedef 5902]
type = S

[State 0, SSJ Mid-Battle-Transformation: No]
type = VarSet
trigger1 = 1
var(57) = ifelse(palno = 6 || palno = 12, 1, 0)

[State 0, Normal Vegeta]
type = VarSet
trigger1 = palno = [1,12]
var(1) = 0

[State 5900, Intro Decider]
type = ChangeState
trigger1 = 1
value = 190