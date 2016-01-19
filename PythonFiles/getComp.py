# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 07:07:43 2015

@author: RAHUL JAIN
"""

from xml.dom.minidom import parse
import xml.dom.minidom
DOMTree = xml.dom.minidom.parse("chemsep1.xml")
compounds = DOMTree.documentElement
compound = compounds.getElementsByTagName("compound")
i = 1
for comp in compound:
   compName = comp.getElementsByTagName("CompoundID")[0].getAttribute("value")
   CompName = compName.replace(" ","")
   CompName = CompName.replace("-","")
   CompName = CompName.replace(",","")
   CompName = CompName.replace("1","One")
   CompName = CompName.replace("2","Two")
   CompName = CompName.replace("3","Three")
   CompName = CompName.replace("4","Four")
   CompName = CompName.replace("5","Five")
   CriticalTemp = comp.getElementsByTagName("CriticalTemperature")[0].getAttribute("value")
   CriticalPres = comp.getElementsByTagName("CriticalPressure")[0].getAttribute("value")  
   CriticalVol = comp.getElementsByTagName("CriticalVolume")[0].getAttribute("value")
   CriticalComp = comp.getElementsByTagName("CriticalCompressibility")[0].getAttribute("value")   
   try:
     NormalBoilPoint = comp.getElementsByTagName("NormalBoilingPointTemperature")[0].getAttribute("value")
   except IndexError:
     NormalBoilPoint = "0"
   try:  
     NormalMeltingPoint = comp.getElementsByTagName("NormalMeltingPointTemperature")[0].getAttribute("value")   
   except IndexError:
     NormalMeltingPoint = "0"
   try:
     TripPntTemp = comp.getElementsByTagName("TriplePointTemperature")[0].getAttribute("value")  
   except IndexError:
     TripPntTemp = "0" 
   try:
     TripPntPres = comp.getElementsByTagName("TriplePointPressure")[0].getAttribute("value")
   except IndexError:
     TripPntPres = "0"
   MolWt =  comp.getElementsByTagName("MolecularWeight")[0].getAttribute("value")  
   try:   
     LiqVolAtBoilPnt = comp.getElementsByTagName("LiquidVolumeAtNormalBoilingPoint")[0].getAttribute("value")  
   except IndexError:
     LiqVolAtBoilPnt = "0"
   try:
     AcenFactor = comp.getElementsByTagName("AcentricityFactor")[0].getAttribute("value")   
   except IndexError:
     AcenFactor = "0"
   try:
     SolParam = comp.getElementsByTagName("SolubilityParameter")[0].getAttribute("value")
   except IndexError:
     SolParam = "0"
   try:  
     DipoleMoment = comp.getElementsByTagName("DipoleMoment")[0].getAttribute("value")  
   except IndexError:
     DipoleMoment = "0"
   try:   
     IGHF = comp.getElementsByTagName("HeatOfFormation")[0].getAttribute("value")
   except IndexError:
     IGHF = "0"
   try:  
     GEF = comp.getElementsByTagName("GibbsEnergyOfFormation")[0].getAttribute("value")
   except IndexError:
     GEF = "0"
   try:   
     AbsEntropy = comp.getElementsByTagName("AbsEntropy")[0].getAttribute("value")
   except IndexError:
     AbsEntropy = "0"
   try:  
     HeatFusionMeltPnt = comp.getElementsByTagName("HeatOfFusionAtMeltingPoint")[0].getAttribute("value")
   except IndexError:
     HeatFusionMeltPnt = "0"  
   try:   
     HOC = comp.getElementsByTagName("HeatOfCombustion")[0].getAttribute("value")
   except IndexError: 
     HOC = "0"
   try:   
     LiqDen = comp.getElementsByTagName("LiquidDensity")[0]
     LiqDenEqn = LiqDen.getElementsByTagName("eqno")[0].getAttribute("value")
     A=LiqDen.getElementsByTagName("A")[0].getAttribute("value")
     B=LiqDen.getElementsByTagName("B")[0].getAttribute("value")
     C=LiqDen.getElementsByTagName("C")[0].getAttribute("value")
     D=LiqDen.getElementsByTagName("D")[0].getAttribute("value")
     try:
          E=LiqDen.getElementsByTagName("E")[0].getAttribute("value")
     except IndexError:
          E = "0"
   except IndexError:
     LiqDenEqn = "0"
     A = "0"
     B = "0"
     C = "0"
     D = "0"
     E = "0"
   try:   
      VapPres = comp.getElementsByTagName("VaporPressure")[0]
      VapPresEqn = VapPres.getElementsByTagName("eqno")[0].getAttribute("value")
      VA=VapPres.getElementsByTagName("A")[0].getAttribute("value")
      VB=VapPres.getElementsByTagName("B")[0].getAttribute("value")
      VC=VapPres.getElementsByTagName("C")[0].getAttribute("value")
      try:
          VD=VapPres.getElementsByTagName("D")[0].getAttribute("value")
      except IndexError:
          VD = "0"
      try:
          VE=VapPres.getElementsByTagName("E")[0].getAttribute("value")
      except IndexError:
          VE = "0"
   except IndexError:
     VapPresEqn = "0"     
     VA = "0"
     VB = "0"
     VC = "0"
     VD = "0"
     VE = "0"
   try:   
      LiqCp = comp.getElementsByTagName("LiquidHeatCapacityCp")[0]
      LiqCpEqn = LiqCp.getElementsByTagName("eqno")[0].getAttribute("value")
      LCpA=LiqCp.getElementsByTagName("A")[0].getAttribute("value")
      LCpB=LiqCp.getElementsByTagName("B")[0].getAttribute("value")
      LCpC=LiqCp.getElementsByTagName("C")[0].getAttribute("value")
      try:
          LCpD=LiqCp.getElementsByTagName("D")[0].getAttribute("value")
      except IndexError:
          LCpD = "0"
      try:
          LCpE=LiqCp.getElementsByTagName("E")[0].getAttribute("value")
      except IndexError:
          LCpE = "0"
   except IndexError:
     LiqCpEqn = "0"
     LCpA = "0"
     LCpB = "0"
     LCpC = "0"
     LCpD = "0"
     LCpE = "0"
   try:   
      HOV = comp.getElementsByTagName("HeatOfVaporization")[0]
      HOVEqn = HOV.getElementsByTagName("eqno")[0].getAttribute("value")
      HOVA=HOV.getElementsByTagName("A")[0].getAttribute("value")
      HOVB=HOV.getElementsByTagName("B")[0].getAttribute("value")
      HOVC=HOV.getElementsByTagName("C")[0].getAttribute("value")
      try:
          HOVD=HOV.getElementsByTagName("D")[0].getAttribute("value")
      except IndexError:
          HOVD = "0"
      try:
          HOVE=HOV.getElementsByTagName("E")[0].getAttribute("value")
      except IndexError:
          HOVE = "0"
   except IndexError:
     HOVEqn = "0"
     HOVA = "0"
     HOVB = "0"
     HOVC = "0"
     HOVD = "0"
     HOVE = "0"
   if (float(NormalBoilPoint) >  298.15 ):
     HA = float(HOVA)
     HB = float(HOVB)
     HC = float(HOVC)
     HD = float(HOVD)
     HE = float(HOVE)
     Tr = 298.15/float(CriticalTemp)
     SHOV = HA*(pow((1-Tr),(HB + HC*Tr + HD*pow(Tr,2) + HE*pow(Tr,3))))
     AbsEnthalpy = float(IGHF) -  SHOV
   else:
     AbsEnthalpy = float(IGHF)  
   SH = str(AbsEnthalpy)
   try:   
      VapCp = comp.getElementsByTagName("IdealGasHeatCapacityCp")[0]
      VapCpEqn = VapCp.getElementsByTagName("eqno")[0].getAttribute("value")
      VCpA=VapCp.getElementsByTagName("A")[0].getAttribute("value")
      VCpB=VapCp.getElementsByTagName("B")[0].getAttribute("value")
      VCpC=VapCp.getElementsByTagName("C")[0].getAttribute("value")
      try:
          VCpD=VapCp.getElementsByTagName("D")[0].getAttribute("value")
      except IndexError:
          VCpD = "0"
      try:
          VCpE=VapCp.getElementsByTagName("E")[0].getAttribute("value")
      except IndexError:
          VCpE = "0"
   except IndexError:
     VapCpEqn = "0"
     VCpA = "0"
     VCpB = "0"
     VCpC = "0"
     VCpD = "0"
     VCpE = "0"
   f = open('File1.txt','a')
   f.write('model '+CompName)
   f.write('\n')
   f.write('extends General_Properties(')
   f.write('\n')
   f.write('SN ' + '=' + str(i) +',')
   f.write('\n')
   f.write('name' + '=' + '"'+ CompName + '",')
   f.write('\n')
   f.write('Tc ' + '=' + CriticalTemp + ',')
   f.write('\n')
   f.write('Pc ' + '=' + CriticalPres + ',')
   f.write('\n')
   f.write('Vc ' + '=' + CriticalVol + ',')
   f.write('\n')
   f.write('Cc ' + '=' + CriticalComp + ',')
   f.write('\n')
   f.write('Tb ' + '=' + NormalBoilPoint + ',')
   f.write('\n')
   f.write('Tm ' + '=' + NormalMeltingPoint + ',')
   f.write('\n')
   f.write('TT ' + '=' + TripPntTemp + ',')
   f.write('\n')
   f.write('TP ' + '=' + TripPntPres + ',')
   f.write('\n')
   f.write('MW ' + '=' + MolWt + ',')
   f.write('\n')
   f.write('LVB ' + '=' + LiqVolAtBoilPnt + ',')
   f.write('\n')
   f.write('AF ' + '=' + AcenFactor + ',')
   f.write('\n')
   f.write('SP ' + '=' + SolParam + ',')
   f.write('\n')
   f.write('DM ' + '=' + DipoleMoment + ',')
   f.write('\n')
   f.write('SH ' + '=' + SH + ',')
   f.write('\n')
   f.write('IGHF ' + '=' + IGHF + ',')
   f.write('\n')
   f.write('GEF ' + '=' + GEF + ',')
   f.write('\n')
   f.write('AS ' + '=' + AbsEntropy + ',')
   f.write('\n')
   f.write('HFMP ' + '=' + HeatFusionMeltPnt + ',')
   f.write('\n')
   f.write('HOC ' + '=' + HOC + ',')
   f.write('\n')
   f.write('LiqDen = {'+LiqDenEqn+","+A+","+B+","+C+","+D+","+E+'},')
   f.write('\n')   
   f.write('VP = {'+VapPresEqn+","+VA+","+VB+","+VC+","+VD+","+VE+'},')
   f.write('\n')
   f.write('LiqCp = {'+LiqCpEqn+","+LCpA+","+LCpB+","+LCpC+","+LCpD+","+LCpE+'},')
   f.write('\n')   
   f.write('HOV = {'+HOVEqn+","+HOVA+","+HOVB+","+HOVC+","+HOVD+","+HOVE+'},')    
   f.write('\n')  
   f.write('VapCp = {'+VapCpEqn+","+VCpA+","+VCpB+","+VCpC+","+VCpD+","+VCpE+'});')    
   f.write('\n')
   f.write('end '+CompName+';')
   f.write('\n')
   f.write('\n')
#   f.write('function Psat')
#   f.write('\n')
#   f.write('input Real T;')
#   f.write('\n')	
#   f.write('output Real Vp;')
#   f.write('\n')
#   f.write('algorithm')
#   f.write('\n')
#   f.write('Vp := exp(VP[2] + VP[3] / T + VP[4] * log(T) + VP[5] * T ^ VP[6]);')
#   f.write('\n')
#   f.write('end Psat;')
#   f.write('\n')
#   f.write('\n')
# 
#   f.write('function LCp')
#   f.write('\n')
#   f.write('input Real T;')
#   f.write('\n')
#   f.write('output Real Cp;')
#   f.write('\n')
#   f.write('algorithm')
#   f.write('\n')
#   f.write('Cp := (LiqCp[2] + exp(LiqCp[3] / T + LiqCp[4] + LiqCp[5] * T + LiqCp[6] * T ^ 2)) / 1000;')
#   f.write('\n')
#   f.write('end LCp;')
#   f.write('\n')
#   f.write('\n')
#
#   f.write('function HV')
#   f.write('\n')
#   f.write('input Real T;')
#   f.write('\n')
#   f.write('output Real Hv;')
#   f.write('\n')
#   f.write('protected')
#   f.write('\n')
#   f.write('Real Tr = T / Tc;')
#   f.write('\n')
#   f.write('algorithm')
#   f.write('\n')
#   f.write('Hv := HOV[2] * (1 - Tr) ^ (HOV[3] + HOV[4] * Tr + HOV[5] * Tr ^ 2 + HOV[6] * Tr ^ 3) / 1000;')
#   f.write('\n')
#   f.write('end HV;')
#   f.write('\n')
#   f.write('\n')
#
#   f.write('function HLiq')
#   f.write('\n')
#   f.write('input Real T;')
#   f.write('\n')
#   f.write('output Real Ent;')
#   f.write('\n')
#   f.write('protected')
#   f.write('\n')
#   f.write('Real Temp = 298.15;')
#   f.write('\n')
#   f.write('algorithm')
#   f.write('\n')
#   f.write('Ent := 0;')
#   f.write('\n')
#   f.write('while Temp < T loop')
#   f.write('\n')
#   f.write('Ent := Ent + LCp(Temp) * 1;')
#   f.write('\n')
#   f.write('Temp := Temp + 1;')
#   f.write('\n')
#   f.write('end while;')
#   f.write('\n')
#   f.write('Ent := SH / 1000 + Ent;')
#   f.write('\n')
#   f.write('end HLiq;')
#   f.write('\n')
#   f.write('\n') 
#
#   f.write('function HVap')
#   f.write('\n')
#   f.write('input Real T;')
#   f.write('\n')
#   f.write('output Real Ent;')
#   f.write('\n')
#   f.write('algorithm')
#   f.write('\n')
#   f.write('Ent := HLiq(T) + HV(T);')
#   f.write('\n')
#   f.write('end HVap;')
#   f.write('\n')

   i = i + 1
f.close()