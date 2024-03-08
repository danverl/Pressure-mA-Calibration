                                                            MET/CAL Procedure
=============================================================================
INSTRUMENT:            Pressure
DATE:                  2024-03-08 10:08:55
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       44
CONFIGURATION:         Fluke 8558A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON


  1.001  8558A        +Current = 24mA; Setup

#Tell the fluke its setpoint, then set it to control mode. 10 is its current GPIB address
  1.003  IEEE         [@10]
  1.003  IEEE         SOUR:PRES [M1]
  1.004  IEEE         OUTP:MODE control

#wait for pressure to stabilize
  1.005  WAIT         -t [M9] Waiting for stabilization
  1.006  DISP         Wait until fluke 6270A displays the READY flag, then press "advance" or enter

#Ask Fluke for its current pressure reading, then store it in MEM1 register
  1.007  IEEE         MEAS?[I]
#Calulate corresponding mA value
  1.011  MATH         MEM1 = ((MEM - M[7]) / (M[8] - M[7]) * (M[6] - M[5]) + M[5])

#Read current mA value
  1.010  8558A        +Current = 12.00000mA; Read

  1.012  MEMCX  20    mA             TOL

#stop regulating pressure, since test is finished
  2.001  IEEE         OUTP:MODE measure

  2.002  END
