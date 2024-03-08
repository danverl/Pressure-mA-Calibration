                                                            MET/CAL Procedure
=============================================================================
INSTRUMENT:            Pressure
DATE:                  2024-03-08 11:05:43
AUTHOR:                Dan Erlandsen
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       41
CONFIGURATION:         Fluke 8558A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON


  1.001  8558A        +Current = 24mA; Setup

#Tell the fluke its setpoint, then set it to control mode. 10 is its current GPIB address
  1.002  IEEE         [@10]
  1.002  IF           (M[1] == 0)
  1.003  IEEE         OUTP:MODE vent
  1.003  ELSE
  1.002  IEEE         SOUR:PRES [M1]
  1.003  IEEE         OUTP:MODE control
  1.004  ENDIF


#wait for pressure to stabilize
  1.004  WAIT         -t [M9] Waiting for stabilization
  1.005  DISP         Wait until fluke 6270A displays the READY flag, then press "advance" or enter

#Ask Fluke for its current pressure reading, then store it in MEM1 register
  1.006  IEEE         MEAS?[I]
  1.007  RSLT         =[MEM] mBar

#Calulate corresponding mA value
  1.008  MATH         MEM1 = ((MEM - M[7]) / (M[8] - M[7]) * (M[6] - M[5]) + M[5])

#Read current mA value
  1.009  8558A        +Current = 12.00000mA; Read

  1.010  MEMCX  20    mA             TOL

#stop regulating pressure, since test is finished
  2.001  IEEE         OUTP:MODE measure

  2.002  END
