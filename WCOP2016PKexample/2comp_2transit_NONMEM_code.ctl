$PROBLEM - 2 COMP FIRST-ORDER ABS-2 TRANSIT  

$INPUT ID TIME AMT MDV DV CLCR
 
$DATA TwoCompFirstOrderAbsTwoTransit.csv IGNORE=C 

$SUBROUTINES  ADVAN5 TRANS1

$MODEL 
	COMP=(ABS,DEFDOSE)
	COMP=(CENTRAL,DEFOBS)
	COMP=(PERIPH)
	COMP=(TRANSIT1)
	COMP=(TRANSIT2)

$PK

   CL = THETA(1)*EXP(ETA(1))*(CLCR/100)
   V2 = THETA(2)*EXP(ETA(2))          
   Q  = THETA(3)*EXP(ETA(3))
   V3 = THETA(4)*EXP(ETA(4))
    
   KTR = THETA(5)*EXP(ETA(5))
   
   F1  = THETA(6)
   
   K20 = CL/V2
   K23 = Q/V2
   K32 = K23*V2/V3
   
   K14 = KTR
   K45 = KTR
   K52 = KTR
 
   S2 = V2
   
$ERROR 
    A1 = A(1)
    A2 = A(2)
    A3 = A(3)
    A4 = A(4)
    A5 = A(5)

	IPRED = F
	
	Y = IPRED*(1+ERR(1)) + ERR(2)
	
$THETA
    (0.01,0.5,)  ; POPCL
    (0.01,20.,)  ; POPV2
    (0.01,1.0,)  ; POPQ3
    (0.01,25.,) ; POPV3
    (0,2.05,)     ; POPKTR
	(0,0.8,)	  ; POPF1	
 
$OMEGA
	0.0225		;BSVCL
	0.0144 		;BSVV2
	0.0196   	;BSVQ
	0.0025 		;BSVV3
	0.090  		;BSVKTR
	
$SIGMA
	0.01		;RUVCV
	0.0225		;RUCVADDP
 
$SIMULATION (12345678)  ONLYSIM SUBPROBLEMS = 1

;$ESTIMATION METHOD=1 INTERACTION MAXEVALS=9999 POSTHOC NOABORT NSIG=3 SIGL=9

;$COVARIANCE  UNCONDITIONAL SLOW SIGL=12 PRINT=E

$TABLE ID TIME AMT CL V2 Q V3 KTR ETA1 ETA2 ETA3 ETA4 ETA5 MDV CWRES IPRED NOPRINT ONEHEADER FILE=*.fit




