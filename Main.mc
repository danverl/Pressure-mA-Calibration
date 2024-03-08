                                                            MET/CAL Procedure
=============================================================================
INSTRUMENT:            Main
DATE:                  2024-03-08 10:47:14
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       73
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  DISP         Calibration of DP Cell 0-10 BarG with mA reading
  1.002  LABEL        Test_Setup
#======================================================================
#Signal LRV
  1.003  MATH         M[5] = 4
#Signal URV
  1.004  MATH         M[6] = 20

#Pressure LRV
  1.005  MEM2         Enter LRV in mBar
  1.006  MATH         M[7] = MEM2
#Pressure URV
  1.007  MEM2         Enter URV in mBar
  1.008  MATH         M[8] = MEM2
#Stabilization time (seconds)

  1.009  MATH         M[9] = 30

#Test tolerance
  1.010  TOL          0.2/
#=======================================================================
  1.011  LABEL        Find_Test_Points

  1.012  MATH         L[1] = M[7]
  1.013  MATH         L[2]= M[8]/4
  1.014  MATH         L[3] = M[8]/2
  1.015  MATH         L[4] = M[8]/4*3
  1.016  MATH         L[5] = M[8]
#=======================================================================
  1.017  LABEL        TEST

  1.018  LABEL        Rising_Pressure

  1.019  MATH         M[1] = L[1]
  1.020  CALL         Pressure

  1.021  MATH         M[1] = L[2]
  1.022  CALL         Pressure

  1.023  MATH         M[1] = L[3]
  1.024  CALL         Pressure

  1.025  MATH         M[1] = L[4]
  1.026  CALL         Pressure

  1.027  MATH         M[1] = L[5]
  1.028  CALL         Pressure

  1.029  LABEL        Falling_Pressure

  1.030  MATH         M[1] = L[4]
  1.031  CALL         Pressure

  1.032  MATH         M[1] = L[3]
  1.033  CALL         Pressure

  1.034  MATH         M[1] = L[2]
  1.035  CALL         Pressure

  1.036  MATH         M[1] = L[1]
  1.037  CALL         Pressure
