package Modelica_Solver
 model Pr_test
  parameter Chemsep_Database.Ethane ethane;
  parameter Chemsep_Database.Methane methane;
  Real Tem(start = 122, min = 115, max = 135);
  parameter Real F = 1;
  parameter Real z[2] = {0.5, 0.5};
  PR PenR(NOC = 2, Comp = {methane, ethane}, zz = z, P = 101325);
  Real B;
  Real X[2];
  Real Y[2];
equation
PenR.T = Tem;
 X [1] = 0.33;
X = PenR.x;
Y = PenR.y;
B = PenR.beta;
end Pr_test;

model PR
  constant Real R = 8.314;
  parameter Integer NOC;
  parameter Chemsep_Database.General_Properties Comp[NOC];
  parameter Real P;
  parameter Real fstart[NOC] = fill(1, NOC);
  parameter Real fmin[NOC] = fill(0.5, NOC);
  parameter Boolean fix[NOC] = fill(true, NOC);
  Real T;
  parameter Real zz[NOC];
  Real x[NOC](each start = 0.5, each min = 0,each max = 1);
  Real y[NOC](each start = 0.5, each min = 0,each max = 1);
  Real Tr[NOC],aa[NOC, NOC];
  Real fiv[NOC](start = fstart);
  Real fil[NOC](start = fstart);
  Real Zv[3, 2], Zl[3,2], ZL(start = 0.2), ZV, zl[3], zv[3], sv[NOC],sl[NOC];
  Real a[NOC], b[NOC], aml,amv,aaml,aamv,bml,bmv,K[NOC, NOC], Al, Bl(start = 0), Av, Bv, Polyl[4], Polyv[4], kk[NOC](each start = 1), beta(start = 0.3, min = 0,max = 1);
algorithm
  
  for i in 1:NOC loop
    Tr[i] := T / Comp[i].Tc;
    a[i] := (1 + (0.37464 + 1.54226 * Comp[i].AF + 0.26992 * Comp[i].AF ^ 2) * (1 - Tr[i] ^ 0.5)) ^ 2 * (0.45724 * R ^ 2 * Comp[i].Tc ^ 2) / Comp[i].Pc;
    b[i] := 0.07780 * (R * Comp[i].Tc) / Comp[i].Pc;
  end for;
  K := PPR(NOC, Comp.name );
      for j in 1:NOC loop
    aaml := 0;
    aamv := 0;
    for k in 1:NOC loop
      aa[j, k] := (a[j] * a[k]) ^ 0.5 * (1 - K[j, k]);
      aaml := aaml + x[j] * x[k] * aa[j,k];
      aamv := aamv + y[j] * y[k] * aa[j,k];
    end for;
    aml := aml + aaml;
    amv := amv + aamv;
  end for;
  
  for l in 1:NOC loop
    bml := bml + x[l] * b[l];
    bmv := bmv + y[l]*b[l];
  end for;
  
  Al := aml * P / (R ^ 2 * T ^ 2);
  Bl := bml * P / (R * T);
  Av := amv * P / (R ^ 2 * T ^ 2);
  Bv := bmv * P / (R * T);
  
  Polyv[1] := 1;
  Polyv[2] := -(1 - Bv);
  Polyv[3] := Av - 3 * Bv ^ 2 - 2 * Bv;
  Polyv[4] := -(Av * Bv - Bv ^ 2 - Bv^3);
  Zv := Modelica.Math.Vectors.Utilities.roots(Polyv);
  Polyl[1] := 1;
  Polyl[2] := -(1 - Bl);
  Polyl[3] := Al - 3 * Bl ^ 2 - 2 * Bl;
  Polyl[4] := -(Al * Bl - Bl ^ 2 - Bl^3);
  Zl := Modelica.Math.Vectors.Utilities.roots(Polyl);
  
  for i in 1:3 loop
    zv[i] := Zv[i, 1];
    zl[i] := Zl[i, 1];
  end for;
  
  ZL := zl[3];
  ZV := max(zv);
  
  for i in 1:NOC loop
    for j in 1:NOC loop
      sl[i] := sl[i] + x[j] * aa[i,j];
      sv[i] := sv[i] + y[j] * aa[i,j];
    end for;
  end for;

equation
  
  for i in 1:NOC loop
    log(fil[i]) = b[i] / bml * (ZL - 1) - log(ZL - Bl) - Al / (2 * 2 ^ 0.5 * Bl) * (2*sl[i] / aml - b[i] / bml) * log((ZL + 2.414 * Bl) / (ZL - 0.414 * Bl));
    log(fiv[i]) = b[i] / bmv * (ZV - 1) - log(ZV - Bv) - Av / (2 * 2 ^ 0.5 * Bv) * (2*sv[i] / amv - b[i] / bmv) * log((ZV + 2.414 * Bv) / (ZV - 0.414 * Bv));
  end for;
  
for i in 1:NOC loop
    kk[i] = fil[i] / fiv[i];
    x[i]*beta + y[i]*(1 - beta) = zz[i];
    y[i] = kk[i]*x[i];
 end for;
 x[1] + x[2] = 1;
end PR;
function PPR
  input Integer NOC;
  input String Comp[NOC];
  output Real value[NOC,NOC];
  constant String underscore = "_";
  String c[NOC,NOC];
  String d[NOC,NOC];
  constant String Comp1_Comp2[179] = {"Heliumfour_Carbonmonoxide", "Hydrogen_Nitrogen", "Hydrogen_Carbonmonoxide", "Hydrogen_Methane", "Hydrogen_Ethylene", "Hydrogen_Ethane", "Hydrogen_Carbondioxide", "Hydrogen_Propylene", "Hydrogen_Propane", "Hydrogen_Nbutane", "Hydrogen_Nhexane", "Hydrogen_Nheptane", "Hydrogen_Toluene", "Hydrogen_Quinoline", "Hydrogen_Bicyclohexyl", "Hydrogen_Onemethylnaphthalene", "Nitrogen_Carbonmonoxide", "Nitrogen_Argon", "Nitrogen_Oxygen", "Nitrogen_Methane", "Nitrogen_Ethylene", "Nitrogen_Ethane", "Nitrogen_Nitrousoxide", "Nitrogen_Carbondioxide", "Nitrogen_Hydrogensulfide", "Nitrogen_Propylene", "Nitrogen_Propane", "Nitrogen_Ammonia", "Nitrogen_Dichlorodiflouromethane", "Nitrogen_Isobutane", "Nitrogen_Sulfurdioxide", "Nitrogen_Nbutane", "Nitrogen_Isoc5", "Nitrogen_Npentane", "Nitrogen_Methanol", "Nitrogen_Nhexane", "Nitrogen_Benzene", "Nitrogen_Nheptane", "Nitrogen_Noctane", "Nitrogen_Ndecane", "Carbonmonoxide_Methane", "Carbonmonoxide_Ethane", "Carbonmonoxide_Hydrogensulfide", "Carbonmonoxide_Propane", "Argon_Oxygen", "Argon_Methane", "Argon_Ammonia", "Oxygen_Krypton", "Oxygen_Nitrousoxide", "Methane_Ethylene", "Methane_Ethane", "Methane_Nitrousoxide", "Methane_Carbondioxide", "Methane_Carbonylsulfide", "Methane_Propylene", "Methane_Propane", "Methane_Isobutane", "Methane_Sulfurdioxide", "Methane_Nbutane", "Methane_Isoc5", "Methane_Npentane", "Methane_Nhexane", "Methane_Benzene", "Methane_Cyclohexane", "Methane_Nheptane", "Methane_Toluene", "Methane_Noctane", "Methane_Mxylene", "Methane_Nnonane", "Methane_Ndecane", "Methane_Mcresol", "Methane_Tetralin", "Methane_Onemethylnaphthalene", "Methane_Diphenylmethane", "Ethylene_Ethane", "Ethylene_Acetylene", "Ethylene_Carbondioxide", "Ethylene_Nbutane", "Ethylene_Benzene", "Ethylene_Nheptane", "Ethylene_Ndecane", "Carbondioxide_Ethane", "Ethane_Hydrogensulfide", "Ethane_Propylene", "Ethane_Propane", "Ethane_Isobutane", "Ethane_Nbutane", "Ethane_Ethylether", "Ethane_Npentane", "Ethane_Acetone", "Ethane_Methylacetate", "Ethane_Methanol", "Ethane_Nhexane", "Ethane_Benzene", "Ethane_Cyclohexane", "Ethane_Nheptane", "Ethane_Noctane", "Ethane_Ndecane", "Carbondioxide_Nitrousoxidedioxide", "Acetylene_Propylene", "Trifluoromethane_Triflourochloromethane", "Trifluorochloromethane_Dichlorodifluoromethane", "Carbondioxide_Hydrogensulfide", "Carbondioxide_Difluoromethane", "Carbondioxide_Propylene", "Carbondioxide_Propane", "Carbondioxide_Isobutane", "Carbondioxide_Onebutene", "Carbondioxide_Nbutane", "Carbondioxide_Isoc5", "Carbondioxide_Ethylether", "Carbondioxide_Npentane", "Carbondioxide_Methylacetate", "Carbondioxide_Methanol", "Carbondioxide_Nhexane", "Carbondioxide_Benzene", "Carbondioxide_Cyclohexane", "Carbondioxide_Nheptane", "Carbondioxide_Water", "Carbondioxide_Toluene", "Carbondioxide_Ndecane", "Carbondioxide_Nbutylbenzene", "Hydrogensulfide_Propane", "Hydrogensulfide_Isobutane", "Hydrogensulfide_Npentane", "Hydrogensulfide_Water", "Hydrogensulfide_Ndecane", "Propylene_Propane", "Propylene_Isobutane", "Propylene_Onecfour", "Propane_Isobutane", "Propane_Nbutane", "Propane_Isopentane", "Propane_Npentane", "Propane_Nhexane", "Propane_Ethanol", "Propane_Benzene", "Propane_Nheptane", "Propane_Noctane", "Propane_Ndecane", "Pentaflourohloroethane_Difluorochloromethane", "Difluorochloromethane_Dichlorodifluoromethane", "Ammonia_Water", "Ammonia_Watert=two7three.one5k", "Isobutane_Nbutane", "Sulfurdioxide_Benzene", "Onebutene_One", "Onebutene_Nbutane", "One_Threebutadiene", "Nbutane_Npentane", "Nbutane_Nhexane", "Nbutane_Nheptane", "Nbutane_Noctane", "Nbutane_Ndecane", "Npentane_Benzene", "Npentane_Cyclohexane", "Npentane_Nheptane", "Npentane_Noctane", "Two_Twodimethylbutane", "Two_Threedimethylbutane", "Twomethylpentane_Onepentanol", "Onepentanol_Threemethylpentane", "Methanol_Water", "Nhexane_Benzene", "Nhexane_Cyclohexane", "Nhexane_Twopropanol", "Nhexane_Nheptane", "Nhexane_Isopentanol", "Nhexane_Onepentanol", "Cyclohexane_Benzene", "Benzene_Nheptane", "Benzene_Isooctane", "Benzene_Noctane", "Cyclohexene_Cyclohexane", "Cyclohexane_One", "Cyclohexane_Cyclohexanone", "One_Twodichloroethane", "Nheptane_Isooctane", "Nheptane_Twopentanone"};

constant Real BI_Values[179] = {1, 7.1100E-02, 9.1900E-02, 2.6300E-02, 6.3300E-02, -7.5600E-02, 0, 0, 0, 0, -3.00E-02, 0, -1, -1, -1, 0, 3.300E-02, -2.6000E-03, -1.5900E-02, 2.8900E-02, 8.5600E-02, 3.4400E-02, 4.4000E-03, -2.2200E-02, 0, 9.00E-02, 8.7800E-02, 0, 1.0700E-02, 0, 8.00E-02, 7.1100E-02, 9.2200E-02, 0, 0, 0, 0, 0, 0, 0, 3.00E-02, -2.2600E-02, 5.4400E-02, 2.5900E-02, 1.0700E-02, 2.300E-02, 0, 2.5600E-02, 4.7800E-02, 3.7800E-02, -3.3000E-03, 2.5600E-02, 7.9300E-02, 2.8900E-02, 3.300E-02, 1.1900E-02, 2.5600E-02, 0, 2.4400E-02, -5.6000E-03, 2.300E-02, 4.00E-02, 8.0700E-02, 3.8900E-02, 4.0100E-02, 9.700E-02, 4.9600E-02, 8.4400E-02, 4.7400E-02, 4.8900E-02, 0, 0, 0, 8.7400E-02, 1.1900E-02, 6.5200E-02, 5.7800E-02, 9.2200E-02, 3.1100E-02, 1.4400E-02, 2.5300E-02, 0, 8.2200E-02, 8.9000E-03, 1.1000E-03, -6.7000E-03, 8.9000E-03, 1.8100E-02, 7.8000E-03, 0, 0, 2.700E-02, -4.00E-02, 3.2200E-02, 1.7800E-02, 7.4000E-03, 1.8500E-02, 1.4400E-02, 4.8000E-03, 0, 0, 3.3700E-02, 9.7800E-02, 1.700E-02, 9.3300E-02, 0, 0, 5.9300E-02, 0, 0, 4.700E-02, -1.00E-02, -4.9300E-02, 2.200E-02, 0, 7.7400E-02, 0, 0, 6.3000E-03, 0, 0, 0, 6.00E-02, 4.7400E-02, 6.300E-02, 3.9400E-02, 3.3300E-02, 9.6000E-03, -1.4400E-02, 4.0000E-04, -7.8000E-03, 3.3000E-03, 1.1100E-02, 2.6700E-02, 7.0000E-04, 3.1500E-02, 2.3300E-02, 5.6000E-03, 0, 0, 8.7400E-02, 5.2200E-02, 0, 0, -4.0000E-04, 1.5000E-03, 2.2000E-03, 7.0000E-04, 1.4100E-02, 1.7400E-02, -5.6000E-03, 3.3000E-03, 7.4000E-03, 7.8000E-03, 1.8900E-02, 3.7000E-03, 7.4000E-03, 0, 4.5200E-02, 4.6700E-02, 4.6700E-02, 4.7800E-02, -7.7800E-02, 8.9000E-03, -3.000E-03, 8.4400E-02, -7.8000E-03, 4.8500E-02, 4.5600E-02, 1.2600E-02, 1.1000E-03, 4.0000E-04, 3.000E-03, 1.1000E-03, 7.300E-02, 6.5900E-02, 4.300E-02, 4.0000E-04, 6.9300E-02};

algorithm

for i in 1:NOC loop
  for j in 1:NOC loop
    value[i,j] := 0;
  end for;
end for;
    
for i in 1:NOC loop
  for j in 1:NOC loop
    c[i,j] := Comp[i]+underscore+Comp[j];
    d[i,j] := Comp[j]+underscore+Comp[i];
    for k in 1:180 loop
      if c[i,j] == Comp1_Comp2[k] or d[i,j] == Comp1_Comp2[k] then
        value[i,j] := BI_Values[k];
      end if;
    end for;
  end for;  
end for;
 
end PPR;
end Modelica_Solver;