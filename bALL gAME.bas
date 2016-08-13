DECLARE SUB COINS ()
COMMON SHARED dy, m$, C, B1, PB1, CC, PCC
DECLARE SUB HOLE ()
DECLARE SUB HOMESCREEN ()
DECLARE SUB HOWTOPLAY ()
SCREEN 13
HP = 0
LINE1:
P = 0
CLS

CALL HOMESCREEN

CLS
CIRCLE (10, 130), 5, 3
PAINT (10, 130), 7, 3
PSET (13, 129), 11: PSET (12, 129), 11
LINE (11, 132)-(13, 132), 11

DIM A%(290)
GET (0, 120)-(20, 145), A%()
CLS
A$ = "ASASAS "
X = 11
Y = 121
CC = 40
PX = X: PY = Y
B1 = 100: PB1 = 360
LINE (0, 135)-(400, 190), 0, B
LINE (0, 136)-(400, 189), 14, BF
LINE (0, 15)-(339, 134), 11, BF

'START (RUNNING PART)----------------------------------------------------------
WALK:
IF P > HP OR P = HP THEN HP = P
LOCATE 1, 21: PRINT "HIGH SCORE = "; HP
LINE (280, 95)-(320, 123), 11, BF
PUT (PX, PY), A%():
WHILE A$ <> " "
    LOCATE 1, 2: PRINT "SCORE ="; P
    A$ = UCASE$(INKEY$)
    X = X + 1
    Y = Y - 0
    B1 = B1 + 1
    CC = CC + 57
    IF B1 = 285 OR B1 > 285 THEN B1 = 100
    IF CC = 230 OR CC > 230 THEN CC = 40
    IF X = 290 OR X > 290 THEN X = 1
    PUT (PX, PY), A%()
    PUT (X, Y), A%()
    PX = X
    PY = Y
    IF X > PB1 - 10 AND X < PB1 + 23 AND C = 1 THEN GOTO GAMEOVER
    IF A$ = "A" THEN GOTO jump
    FOR I = 1 TO 400000: NEXT I
    IF X = 1 THEN
        LINE (2, 95)-(320, 123), 11, BF
        CIRCLE (PB1 + PCC, 110), 2, 11: PAINT (PB1 + PCC, 110), 11, 11: CIRCLE (PB1 - PCC, 110), 2, 11: PAINT (PB1 - PCC, 110), 11, 11: CALL COINS: PCC = CC
        LINE (PB1, 135)-(PB1 + 35, 189), 14, BF: LINE (PB1, 135)-(PB1 + 35, 135), 16: CALL HOLE: PB1 = B1
        C = 1
    END IF
    IF A$ = " " THEN GOTO LINE1
WEND

'JUMPING PART---------------------------------------------------------
jump:
FOR j = 1 TO 7

    X = X + j
    Y = Y - j
    PUT (PX, PY), A%()
    IF A$ = " " THEN GOTO LAST
    PUT (X, Y), A%()
    PX = X
    PY = Y
    IF X = 290 OR X > 290 THEN
        PX = X: PY = Y: X = 1
        LINE (280, 95)-(320, 123), 11, BF
    END IF
    FOR I = 1 TO 1000000: NEXT I
    IF X = 1 THEN
        LINE (2, 95)-(320, 123), 11, BF
        CIRCLE (PB1 + PCC, 110), 2, 11: PAINT (PB1 + PCC, 110), 11, 11: CIRCLE (PB1 - PCC, 110), 2, 11: PAINT (PB1 - PCC, 110), 11, 11: CALL COINS: PCC = CC
        LINE (PB1, 135)-(PB1 + 35, 189), 14, BF: LINE (PB1, 135)-(PB1 + 35, 135), 16: CALL HOLE: PB1 = B1
        C = 1
    END IF
    '------FOR EATING COINS
    IF (X > PB1 - PCC - 16 AND X < PB1 - PCC - 4 AND Y > 95 AND Y < 105) THEN DD = DD + 1
    IF DD = 1 THEN
        P = P + 10: AAA = 1
        CIRCLE (PB1 - PCC, 110), 15, 11: PAINT (PB1 - PCC, 110), 11, 11: PUT (X, Y), A%()
    END IF
    DD = 0
    IF (X > PB1 + PCC - 16 AND X < PB1 + PCC - 4 AND Y > 95 AND Y < 105) THEN DD = DD + 1
    IF DD = 1 THEN
        P = P + 10: BBB = 1
        CIRCLE (PB1 + PCC, 110), 15, 11: PAINT (PB1 + PCC, 110), 11, 11: PUT (X, Y), A%()
    END IF
    DD = 0
NEXT j
'------------------------------
FOR j = 1 TO 7
    X = X + j
    Y = Y + j
    PUT (PX, PY), A%()
    IF A$ = " " THEN GOTO LAST
    PUT (X, Y), A%()
    PX = X: PY = Y
    IF X = 290 OR X > 290 THEN
        PX = X: PY = Y: X = 1
    END IF
    FOR I = 1 TO 1000000: NEXT I
    IF X = 1 THEN
        LINE (2, 95)-(320, 123), 11, BF
        CIRCLE (PB1 + PCC, 110), 2, 11: PAINT (PB1 + PCC, 110), 11, 11: CIRCLE (PB1 - PCC, 110), 2, 11: PAINT (PB1 - PCC, 110), 11, 11: CALL COINS: PCC = CC
        LINE (PB1, 135)-(PB1 + 35, 189), 14, BF: LINE (PB1, 135)-(PB1 + 35, 135), 16: CALL HOLE: PB1 = B1
        C = 1
    END IF
    '------FOR EATING COINS
    IF (X > PB1 - PCC - 16 AND X < PB1 - PCC - 4 AND Y > 95 AND Y < 105) AND AAA <> 1 THEN DD = DD + 1
    IF DD = 1 THEN
        P = P + 10
        CIRCLE (PB1 - PCC, 110), 15, 11: PAINT (PB1 - PCC, 110), 11, 11: PUT (X, Y), A%()
    END IF
    DD = 0
    IF (X > PB1 + PCC - 16 AND X < PB1 + PCC - 4 AND Y > 95 AND Y < 105) AND BBB <> 1 THEN DD = DD + 1
    IF DD = 1 THEN
        P = P + 10
        CIRCLE (PB1 + PCC, 110), 15, 11: PAINT (PB1 + PCC, 110), 11, 11: PUT (X, Y), A%()
    END IF
    DD = 0
NEXT j
AAA = 0: BBB = 0

PUT (PX, PY), A%()
GOTO WALK
'JUMP FINISH------------------------------------------------------------

GAMEOVER:
FOR I = 1 TO 15000000: NEXT I
WHILE Y <> 174.5
    PUT (PX, PY), A%()
    PUT (X, Y), A%()
    FOR I = 1 TO 100000: NEXT I
    PX = X: PY = Y
    Y = Y + .5
WEND
GOTO LINE1

LAST:

SUB COINS
CIRCLE (B1 + CC, 110), 2, 0
PAINT (B1 + CC, 110), 14, 0
CIRCLE (B1 - CC, 110), 2, 0
PAINT (B1 - CC, 110), 14, 0
END SUB

SUB HOLE
LINE (B1, 135)-(B1 + 35, 189), 11, BF
LINE (B1, 135)-(B1, 189), 16: LINE (B1 + 35, 135)-(B1 + 35, 189), 16
END SUB

SUB HOMESCREEN
CLS

BA:
FOR Y = 1 TO 200
    X1 = 15: X2 = 300
    PSET (X1, Y), 1: PSET (X2, Y), 1
NEXT Y

FOR X = 15 TO 300
    Y1 = 15: Y2 = 180
    PSET (X, Y1), 4: PSET (X, Y2), 4
NEXT X
A = 15

'I
FOR Y = 40 TO 70
    PSET (50, Y), A
NEXT Y
FOR X = 35 TO 200
    Y1 = 39: Y2 = 71
    PSET (X, Y1), A: PSET (X, Y2), A
NEXT X

'S
FOR X = 60 TO 80
    Y1 = 43: Y2 = 67
    PSET (X, Y1), A: PSET (X, Y2), A
NEXT X
PSET (82, 67), A: PSET (81, 67), A: PSET (83, 67), A
X = 60
FOR Y = 43 TO 67
    PSET (X, Y), A
    X = X + 1
NEXT Y
PSET (60, 66), A: PSET (60, 65), A: PSET (60, 64), A: PSET (60, 63), A:
PSET (80, 44), A: PSET (80, 45), A: PSET (80, 46), A: PSET (80, 47), A:

'H
FOR Y = 43 TO 67
    X1 = 93: X2 = 113
    PSET (X1, Y), A: PSET (X2, Y), A
NEXT Y
FOR X = 94 TO 112
    PSET (X, 55), A
NEXT X

'A
FOR Y = 43 TO 67
    X1 = 125: X2 = 145
    PSET (X1, Y), A: PSET (X2, Y), A
NEXT Y
FOR X = 126 TO 144
    PSET (X, 55), A: PSET (X, 43), A
NEXT X

'N
FOR Y = 43 TO 67
    X1 = 155: X2 = 179
    PSET (X1, Y), A: PSET (X2, Y), A
NEXT Y
X = 155
FOR Y = 43 TO 67
    PSET (X, Y), A
    X = X + 1
NEXT Y

'BALL
CIRCLE (90, 125), 40, 15
PAINT (90, 125), 4, 15
X = 90
FOR Y = 110 TO 120
    PSET (X, Y), 0
    X = X + 1
NEXT Y
X = 89
FOR Y = 110 TO 120
    PSET (X, Y), 0
    X = X + 1
NEXT Y
X = 112
FOR Y = 120 TO 113 STEP -1
    PSET (X, Y), 0
    X = X + 1
NEXT Y
X = 111
FOR Y = 120 TO 113 STEP -1
    PSET (X, Y), 0
    X = X + 1
NEXT Y
CIRCLE (118, 123), 5, 0: PAINT (118, 123), 15, 0: CIRCLE (118, 123), 1.5, 0: PAINT (118, 123), 0, 0: PSET (118, 123), 15
CIRCLE (91, 122), 5, 0: PAINT (91, 122), 15, 0: CIRCLE (91, 122), 2, 0: PAINT (91, 122), 0, 0: PSET (91, 122), 15
X = 105
FOR Y = 135 TO 140
    PSET (X, Y), 0
    X = X + 2
NEXT Y
X = 106
FOR Y = 135 TO 140
    PSET (X, Y), 0
    X = X + 2
NEXT Y
X = 105
FOR Y = 135 TO 143
    PSET (X, Y), 0
    X = X - 2
NEXT Y
X = 107
FOR Y = 135 TO 143
    PSET (X, Y), 0
    X = X - 2
NEXT Y

COLOR 14
LOCATE 13, 23: PRINT "1  Play game"
LOCATE 15, 23: PRINT "2  How to play"
LOCATE 17, 23: PRINT "3  Exit"

FIRST:
A$ = UCASE$(INKEY$)
IF A$ = "1" THEN
    GOTO LAS
ELSEIF A$ = "2" THEN
    CALL HOWTOPLAY
ELSEIF A$ = "3" THEN
    END
ELSE
    GOTO FIRST:
END IF

LAS:

END SUB

SUB HOWTOPLAY
LINE (155, 95)-(295, 160), 0, BF
LOCATE 13, 20: PRINT "PRESS -A- TO JUMP"
LOCATE 15, 20: PRINT "COLLECT AS MANY"
LOCATE 17, 20: PRINT "POINTS TO GET THE"
LOCATE 19, 20: PRINT "HIGH SCORE"
LOCATE 22, 20: PRINT "PRESS SPACE BAR"

SURU:
A$ = INKEY$
IF A$ = " " THEN CALL HOMESCREEN ELSE GOTO SURU
END SUB

