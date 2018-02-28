EESchema Schematic File Version 2
LIBS:wshito
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:motor_driver
LIBS:a3982slb_board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "A3982 Evaluation Board"
Date "2017-05-15"
Rev ""
Comp "Designed by Wataru Shito"
Comment1 "A3982 stepping motor driver evaluation board."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 9500 1600 0    60   Input ~ 0
OUT2A
Text GLabel 5550 3950 0    60   Output ~ 0
OUT2A
Text GLabel 5550 4250 0    60   Output ~ 0
OUT2B
Text GLabel 7250 3950 2    60   Output ~ 0
OUT1A
Text GLabel 7250 4250 2    60   Output ~ 0
OUT1B
Text GLabel 9500 1700 0    60   Input ~ 0
OUT2B
Text GLabel 7450 2100 0    60   Input ~ 0
OUT1A
Text GLabel 7450 2000 0    60   Input ~ 0
OUT1B
Text GLabel 7250 4850 2    60   Input ~ 0
VDD_LOGIC
Text GLabel 7450 1500 0    60   Input ~ 0
VDD_LOGIC
$Comp
L TEST_1P W1
U 1 1 59158DFF
P 8900 4550
F 0 "W1" H 8900 4820 50  0000 C CNN
F 1 "TEST_1P" H 8900 4750 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 9100 4550 50  0001 C CNN
F 3 "" H 9100 4550 50  0000 C CNN
	1    8900 4550
	1    0    0    -1  
$EndComp
Text Notes 750  1950 0    60   ~ 0
Vdd = 3V to 5.5V.\nMake sure to set the R? big enough to make\nVref less than 4V when you use Vdd > 4,\nsince Vref Max is 4V.\nUse TP1 to check the Vref voltage.\n\nVddに4V以上印可する場合はVrefに4V以上印可しないように\n可変抵抗を調節すること．
Text Notes 3750 1550 0    60   ~ 0
Vbb Max 35V\nOutput max 2A
$Comp
L POT RV1
U 1 1 591596EC
P 9300 4650
F 0 "RV1" V 9125 4650 50  0000 C CNN
F 1 "10K" V 9200 4650 50  0000 C CNN
F 2 "wshito_FootPrints:G43A" H 9300 4650 50  0001 C CNN
F 3 "" H 9300 4650 50  0000 C CNN
F 4 "G43ATB103" V 9300 4650 60  0001 C CNN "Model"
F 5 "http://akizukidenshi.com/catalog/g/gP-10785/" V 9300 4650 60  0001 C CNN "Available at"
	1    9300 4650
	-1   0    0    -1  
$EndComp
Text GLabel 9300 4250 1    60   Input ~ 0
VDD_LOGIC
$Comp
L GND #PWR01
U 1 1 59164B4A
P 9300 5800
F 0 "#PWR01" H 9300 5550 50  0001 C CNN
F 1 "GND" H 9300 5650 50  0000 C CNN
F 2 "" H 9300 5800 50  0000 C CNN
F 3 "" H 9300 5800 50  0000 C CNN
	1    9300 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 59164B8C
P 8550 5800
F 0 "#PWR02" H 8550 5550 50  0001 C CNN
F 1 "GND" H 8550 5650 50  0000 C CNN
F 2 "" H 8550 5800 50  0000 C CNN
F 3 "" H 8550 5800 50  0000 C CNN
	1    8550 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 59164BC7
P 3200 5800
F 0 "#PWR03" H 3200 5550 50  0001 C CNN
F 1 "GND" H 3200 5650 50  0000 C CNN
F 2 "" H 3200 5800 50  0000 C CNN
F 3 "" H 3200 5800 50  0000 C CNN
	1    3200 5800
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 59167012
P 4300 4050
F 0 "R1" V 4380 4050 50  0000 C CNN
F 1 "0.33" V 4300 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 4230 4050 50  0001 C CNN
F 3 "" V 4380 4050 50  0000 C CNN
F 4 "2W" V 4220 4050 50  0000 C CNN "Power"
F 5 "Panasonic ERJ1TRQFR33U (using 1W due to the availability)" V 4300 4050 60  0001 C CNN "Model"
F 6 "http://jp.rs-online.com/web/p/products/7216230/" V 4300 4050 60  0001 C CNN "Available at"
	1    4300 4050
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5916728D
P 7950 4150
F 0 "R2" V 8030 4150 50  0000 C CNN
F 1 "0.33" V 7950 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_2512_HandSoldering" V 7880 4150 50  0001 C CNN
F 3 "" V 8030 4150 50  0000 C CNN
F 4 "2W" V 7870 4150 50  0000 C CNN "Power"
F 5 "Panasonic ERJ1TRQFR33U (using 1W due to the availability)" V 7950 4150 60  0001 C CNN "Model"
F 6 "http://jp.rs-online.com/web/p/products/7216230/" V 7950 4150 60  0001 C CNN "Available at"
	1    7950 4150
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 59167319
P 9300 5400
F 0 "R4" V 9380 5400 50  0000 C CNN
F 1 "2.4K" V 9300 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9230 5400 50  0001 C CNN
F 3 "" V 9380 5400 50  0000 C CNN
F 4 "1/8W" V 9220 5400 50  0000 C CNN "Power"
F 5 "Panasonic ERJPA3F2401V" V 9300 5400 60  0001 C CNN "Model"
F 6 "http://jp.rs-online.com/web/p/products/8626855/" V 9300 5400 60  0001 C CNN "Available at"
	1    9300 5400
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 5916745A
P 5500 4650
F 0 "C3" H 5510 4720 50  0000 L CNN
F 1 "0.1u" H 5510 4570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5500 4650 50  0001 C CNN
F 3 "" H 5500 4650 50  0000 C CNN
F 4 "50V" H 5480 4570 50  0000 R CNN "Voltage"
F 5 "GRM188F11H104ZA01" H 5500 4650 60  0001 C CNN "Model"
F 6 "http://akizukidenshi.com/catalog/g/gP-04940/" H 5500 4650 60  0001 C CNN "Available at"
	1    5500 4650
	0    1    1    0   
$EndComp
Text GLabel 7250 4350 2    60   Input ~ 0
DIR
Text GLabel 7250 4750 2    60   Input ~ 0
STEP
Text GLabel 5550 4350 0    60   Input ~ 0
ENABLE
Text GLabel 5550 5050 0    60   Input ~ 0
MS1
$Comp
L R R3
U 1 1 59167D4A
P 7950 4750
F 0 "R3" V 8030 4750 50  0000 C CNN
F 1 "25K" V 7950 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7880 4750 50  0001 C CNN
F 3 "" V 8030 4750 50  0000 C CNN
F 4 "1/10W" V 7870 4750 50  0000 C CNN "Power"
F 5 "Panasonic ERJPA3F3002V (30KΩ)" V 7950 4750 60  0001 C CNN "Model"
F 6 "http://jp.rs-online.com/web/p/products/8626896/" V 7950 4750 60  0001 C CNN "Available at"
	1    7950 4750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR04
U 1 1 5916DBC2
P 8200 5800
F 0 "#PWR04" H 8200 5550 50  0001 C CNN
F 1 "GND" H 8200 5650 50  0000 C CNN
F 2 "" H 8200 5800 50  0000 C CNN
F 3 "" H 8200 5800 50  0000 C CNN
	1    8200 5800
	1    0    0    -1  
$EndComp
Text GLabel 7250 5050 2    60   Input ~ 0
RESET
$Comp
L C_Small C7
U 1 1 5916DD02
P 7600 5600
F 0 "C7" H 7610 5670 50  0000 L CNN
F 1 "0.22u" H 7610 5520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7600 5600 50  0001 C CNN
F 3 "" H 7600 5600 50  0000 C CNN
F 4 "10V" H 7580 5520 50  0000 R CNN "Voltage"
F 5 "GRM188F11H224ZA01" H 7600 5600 60  0001 C CNN "Model"
F 6 "http://akizukidenshi.com/catalog/g/gP-05624/" H 7600 5600 60  0001 C CNN "Available at"
	1    7600 5600
	0    1    1    0   
$EndComp
$Comp
L CP1_w/voltage C6
U 1 1 5916EAE4
P 7600 5300
F 0 "C6" H 7610 5370 50  0000 L CNN
F 1 "10u" H 7610 5220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7600 5300 50  0001 C CNN
F 3 "" H 7600 5300 50  0000 C CNN
F 4 "10V" H 7590 5220 50  0000 R CNN "Voltage"
F 5 "GRM188R61E106MA" H 7600 5300 60  0001 C CNN "Model"
F 6 "http://akizukidenshi.com/catalog/g/gP-07768/" H 7600 5300 60  0001 C CNN "Available at"
	1    7600 5300
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C1
U 1 1 591716BC
P 4800 4700
F 0 "C1" H 4810 4770 50  0000 L CNN
F 1 "0.1u" H 4810 4620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4800 4700 50  0001 C CNN
F 3 "" H 4800 4700 50  0000 C CNN
F 4 "50V" H 4780 4620 50  0000 R CNN "Voltage"
F 5 "GRM188F11H104ZA01" H 4800 4700 60  0001 C CNN "Model"
F 6 "http://akizukidenshi.com/catalog/g/gP-04940/" H 4800 4700 60  0001 C CNN "Available at"
	1    4800 4700
	-1   0    0    1   
$EndComp
$Comp
L CP1_w/voltage C4
U 1 1 59171AA7
P 6900 3100
F 0 "C4" H 6910 3170 50  0000 L CNN
F 1 "100u" H 6910 3020 50  0000 L CNN
F 2 "wshito_FootPrints:UCB1H101MNL1GS_HandSoldering" H 6900 3100 50  0001 C CNN
F 3 "" H 6900 3100 50  0000 C CNN
F 4 "50V" H 6890 3020 50  0000 R CNN "Voltage"
F 5 "Nichicon UCB1H101MNL1GS" H 6900 3100 60  0001 C CNN "Model"
F 6 "http://jp.rs-online.com/web/p/products/0269329/" H 6900 3100 60  0001 C CNN "Available at"
	1    6900 3100
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C5
U 1 1 59171B08
P 6900 3350
F 0 "C5" H 6910 3420 50  0000 L CNN
F 1 "0.22u" H 6910 3270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6900 3350 50  0001 C CNN
F 3 "" H 6900 3350 50  0000 C CNN
F 4 "50V" H 6880 3270 50  0000 R CNN "Voltage"
F 5 "GRM188F11H224ZA01" H 6900 3350 60  0001 C CNN "Model"
F 6 "http://akizukidenshi.com/catalog/g/gP-05624/" H 6900 3350 60  0001 C CNN "Available at"
	1    6900 3350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 59171D92
P 7900 3750
F 0 "#PWR05" H 7900 3500 50  0001 C CNN
F 1 "GND" H 7900 3600 50  0000 C CNN
F 2 "" H 7900 3750 50  0000 C CNN
F 3 "" H 7900 3750 50  0000 C CNN
	1    7900 3750
	1    0    0    -1  
$EndComp
Text GLabel 6400 2900 1    60   Input ~ 0
VBB_LOAD
$Comp
L C_Small C2
U 1 1 5917277C
P 5100 4950
F 0 "C2" H 5110 5020 50  0000 L CNN
F 1 "0.22u" H 5110 4870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5100 4950 50  0001 C CNN
F 3 "" H 5100 4950 50  0000 C CNN
F 4 "25V" H 5080 4870 50  0000 R CNN "Voltage"
F 5 "GRM188F11H224ZA01" H 5100 4950 60  0001 C CNN "Model"
F 6 "http://akizukidenshi.com/catalog/g/gP-05624/" H 5100 4950 60  0001 C CNN "Available at"
	1    5100 4950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 5917299D
P 3900 5800
F 0 "#PWR06" H 3900 5550 50  0001 C CNN
F 1 "GND" H 3900 5650 50  0000 C CNN
F 2 "" H 3900 5800 50  0000 C CNN
F 3 "" H 3900 5800 50  0000 C CNN
	1    3900 5800
	1    0    0    -1  
$EndComp
Text GLabel 7450 1700 0    60   Input ~ 0
STEP
Text GLabel 7450 1900 0    60   Input ~ 0
DIR
Text GLabel 7450 1600 0    60   Input ~ 0
RESET
Text GLabel 9500 2000 0    60   Input ~ 0
MS1
Text GLabel 9500 1900 0    60   Input ~ 0
ENABLE
$Comp
L GND #PWR07
U 1 1 591738FD
P 6750 2050
F 0 "#PWR07" H 6750 1800 50  0001 C CNN
F 1 "GND" H 6750 1900 50  0000 C CNN
F 2 "" H 6750 2050 50  0000 C CNN
F 3 "" H 6750 2050 50  0000 C CNN
	1    6750 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5917393E
P 8950 2250
F 0 "#PWR08" H 8950 2000 50  0001 C CNN
F 1 "GND" H 8950 2100 50  0000 C CNN
F 2 "" H 8950 2250 50  0000 C CNN
F 3 "" H 8950 2250 50  0000 C CNN
	1    8950 2250
	1    0    0    -1  
$EndComp
Text GLabel 9500 1500 0    60   Input ~ 0
VBB_LOAD
$Comp
L +3.3V #PWR09
U 1 1 59180156
P 3050 1350
F 0 "#PWR09" H 3050 1200 50  0001 C CNN
F 1 "+3.3V" H 3050 1490 50  0000 C CNN
F 2 "" H 3050 1350 50  0000 C CNN
F 3 "" H 3050 1350 50  0000 C CNN
	1    3050 1350
	1    0    0    -1  
$EndComp
Text GLabel 3050 1550 3    60   Input ~ 0
VDD_LOGIC
$Comp
L A3982 U1
U 1 1 5918F2BA
P 6400 4500
F 0 "U1" H 6800 3750 60  0000 C CNN
F 1 "A3982" H 6400 4350 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-24W_7.5x15.4mm_Pitch1.27mm" H 6500 4550 60  0001 C CNN
F 3 "" H 6500 4550 60  0001 C CNN
F 4 "A3982SLBTR-T" H 6400 4500 60  0001 C CNN "Model"
F 5 "http://akizukidenshi.com/catalog/g/gI-06739/" H 6400 4500 60  0001 C CNN "Available at"
	1    6400 4500
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR010
U 1 1 59190C2F
P 3550 1350
F 0 "#PWR010" H 3550 1200 50  0001 C CNN
F 1 "+12V" H 3550 1490 50  0000 C CNN
F 2 "" H 3550 1350 50  0000 C CNN
F 3 "" H 3550 1350 50  0000 C CNN
	1    3550 1350
	1    0    0    -1  
$EndComp
Text GLabel 3550 1550 3    60   Input ~ 0
VBB_LOAD
$Comp
L CONN_01X06 P2
U 1 1 59192200
P 10050 1750
F 0 "P2" H 10050 2100 50  0000 C CNN
F 1 "CONN_01X06" V 10150 1750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 10050 1750 50  0001 C CNN
F 3 "" H 10050 1750 50  0000 C CNN
	1    10050 1750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X07 P1
U 1 1 5919270E
P 7950 1800
F 0 "P1" H 7950 2200 50  0000 C CNN
F 1 "CONN_01X07" V 8050 1800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07" H 7950 1800 50  0001 C CNN
F 3 "" H 7950 1800 50  0000 C CNN
	1    7950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3950 5550 3950
Wire Wire Line
	7050 3950 7250 3950
Wire Wire Line
	7050 4250 7250 4250
Wire Wire Line
	5750 4250 5550 4250
Wire Wire Line
	7050 4850 7250 4850
Wire Wire Line
	7050 4650 9150 4650
Wire Wire Line
	9300 4800 9300 5250
Wire Wire Line
	9300 5550 9300 5800
Wire Wire Line
	9300 4500 9300 4250
Connection ~ 8900 4650
Wire Wire Line
	8900 4650 8900 4550
Wire Wire Line
	5750 4050 4450 4050
Wire Wire Line
	4150 4050 3200 4050
Wire Wire Line
	7050 4150 7800 4150
Wire Wire Line
	8100 4150 8550 4150
Wire Wire Line
	8550 4150 8550 5800
Wire Wire Line
	3200 4050 3200 5800
Wire Wire Line
	3200 4450 5750 4450
Connection ~ 3200 4450
Wire Wire Line
	5750 4650 5600 4650
Wire Wire Line
	5400 4650 5250 4650
Wire Wire Line
	5250 4650 5250 4750
Wire Wire Line
	5250 4750 5750 4750
Wire Wire Line
	7050 4350 7250 4350
Wire Wire Line
	7050 4750 7250 4750
Wire Wire Line
	5750 4350 5550 4350
Wire Wire Line
	5750 5050 5550 5050
Wire Wire Line
	7050 4950 7950 4950
Wire Wire Line
	7050 4550 8200 4550
Wire Wire Line
	7050 4450 8550 4450
Connection ~ 8550 4450
Wire Wire Line
	8200 4550 8200 5800
Connection ~ 7950 4550
Wire Wire Line
	7050 5050 7250 5050
Wire Wire Line
	7150 4850 7150 5600
Wire Wire Line
	7150 5600 7500 5600
Connection ~ 7150 4850
Wire Wire Line
	7700 5600 8200 5600
Connection ~ 8200 5600
Wire Wire Line
	7150 5300 7500 5300
Connection ~ 7150 5300
Wire Wire Line
	7700 5300 8200 5300
Connection ~ 8200 5300
Wire Wire Line
	5750 4150 4800 4150
Wire Wire Line
	4800 3550 4800 4600
Wire Wire Line
	4800 4800 4800 4850
Wire Wire Line
	4800 4850 5750 4850
Wire Wire Line
	6400 2900 6400 3650
Wire Wire Line
	6400 3100 6800 3100
Connection ~ 6400 3100
Wire Wire Line
	6800 3350 6400 3350
Connection ~ 6400 3350
Wire Wire Line
	7000 3350 7900 3350
Wire Wire Line
	7900 3100 7900 3750
Wire Wire Line
	7000 3100 7900 3100
Connection ~ 7900 3350
Wire Wire Line
	7950 4550 7950 4600
Wire Wire Line
	7950 4950 7950 4900
Wire Wire Line
	5750 4550 3900 4550
Wire Wire Line
	3900 4550 3900 5800
Wire Wire Line
	5750 4950 5200 4950
Wire Wire Line
	5000 4950 3900 4950
Connection ~ 3900 4950
Wire Wire Line
	9850 1700 9500 1700
Wire Wire Line
	8950 1800 9850 1800
Wire Wire Line
	9850 1900 9500 1900
Wire Wire Line
	9850 2000 9500 2000
Wire Wire Line
	6750 1800 7750 1800
Wire Wire Line
	7750 1900 7450 1900
Wire Wire Line
	7750 2000 7450 2000
Wire Wire Line
	7750 2100 7450 2100
Wire Wire Line
	3050 1350 3050 1550
Wire Wire Line
	3550 1350 3550 1550
Wire Wire Line
	9850 1500 9500 1500
Wire Wire Line
	7750 1500 7450 1500
Wire Wire Line
	4800 3550 6400 3550
Connection ~ 4800 4150
Connection ~ 6400 3550
Text Notes 9350 4500 0    60   ~ 0
Swapped the pin in schematic. \nThe top pin is the pin 1.
Wire Wire Line
	7750 1600 7450 1600
Wire Wire Line
	6750 1800 6750 2050
Wire Wire Line
	7750 1700 7450 1700
Wire Wire Line
	9850 1600 9500 1600
Wire Wire Line
	8950 1800 8950 2250
$EndSCHEMATC
