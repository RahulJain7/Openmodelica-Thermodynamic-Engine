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

function PenRob
  input Integer a;
  input Integer b;
  output Real Result;

  
    external "C" Result = Peng(a, b);
  annotation(Include = "#include\"/Users/RAHULJAIN/Documents/OM_Ther_Engine/Mod_Ther_Engine/Mod_Ther_Engine/PRBIP.c\"");
end PenRob;
end Modelica_Solver;