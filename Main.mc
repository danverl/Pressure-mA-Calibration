                                                            MET/CAL Procedure
=============================================================================
INSTRUMENT:            Main
DATE:                  2024-03-08 10:06:16
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       23
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  DISP         Calibration of DP Cell 0-10 BarG with mA reading
  1.002  LABEL        Test_Setup
#======================================================================
#Signal LRV
  1.002  MATH         M[5] = 4
#Signal URV
  1.003  MATH         M[6] = 20

#Pressure LRV
  1.004  MATH         M[7] = 0
#Pressure URV
  1.005  MATH         M[8] = 10000
#Stabilization time
  1.006  MATH         M[9] = 30

#Test tolerance
  1.002  TOL          0.2/
#=======================================================================
  2.001  LABEL        Find_Test_Points

  2.002  MATH         L[1] = M[7]
  2.003  MATH         L[2]= M[8]/4
  2.004  MATH         L[3] = M[8]/2
  2.005  MATH         L[4] = M[8]/4*3
  2.006  MATH         L[5] = M[8]
#=======================================================================
  2.001  LABEL        TEST

  2.002  LABEL        Rising_Pressure

  1.006  MATH         M[1] = L[1]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[2]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[3]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[4]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[5]
  1.008  CALL         Pressure

  3.001  LABEL        Falling_Pressure

  1.006  MATH         M[1] = L[4]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[3]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[2]
  1.008  CALL         Pressure

  1.006  MATH         M[1] = L[1]
  1.008  CALL         Pressure
