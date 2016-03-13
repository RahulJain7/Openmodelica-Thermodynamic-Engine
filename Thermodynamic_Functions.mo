package Thermodynamic_Functions
  model Psat
    Real Vp[NOC];
    algorithm
    Vp := exp(Comp[:].VP[2] + Comp[:].VP[3] / T + Comp[:].VP[4] * log(T) + Comp[:].VP[5] .* T .^ Comp[:].VP[6]);
  end Psat;

  function LCp
    input Real LCpC[6];
    input Real T;
    output Real Cp;
  algorithm
    Cp := (LCpC[2] + exp(LCpC[3] / T + LCpC[4] + LCpC[5] * T + LCpC[6] * T ^ 2)) / 1000;
  end LCp;

  function HV
    input Real HOV[6];
    input Real Tc;
    input Real T;
    output Real Hv;
  protected
    Real Tr = T / Tc;
  algorithm
    Hv := HOV[2] * (1 - Tr) ^ (HOV[3] + HOV[4] * Tr + HOV[5] * Tr ^ 2 + HOV[6] * Tr ^ 3) / 1000;
  end HV;

  function HLiq
    input Real SH;
    input Real LCpC[6];
    input Real T;
    output Real Ent;
  protected
    Real Temp = 298.15;
  algorithm
    Ent := 0;
    while Temp < T loop
      Ent := Ent + LCp(LCpC, Temp) * 1;
      Temp := Temp + 1;
    end while;
    Ent := SH / 1000 + Ent;
  end HLiq;

  function HVap
    input Real SH;
    input Real LCpC[6];
    input Real HOV[6];
    input Real Tc;
    input Real T;
    output Real Ent;
  algorithm
    Ent := HLiq(SH, LCpC, T) + HV(HOV, Tc, T);
  end HVap;

  model LDen
  Real LiqDen[NOC];
  Real row;
  Real Trd;
  algorithm
  for i in 1:NOC loop
      if Comp[i].LiqDen[1] == 105 then
      LiqDen[i] := Comp[i].LiqDen[2] / Comp[i].LiqDen[3] ^ (1 + (1 - T / Comp[i].LiqDen[4])  ^ Comp[i].LiqDen[5]) * Comp[i].MW;
      elseif Comp[i].LiqDen[1] == 106 then
      Trd := T / Comp[i].Tc;
        LiqDen[i] := Comp[i].LiqDen[2] * (1 - Trd) ^ (Comp[i].LiqDen[3] + Comp[i].LiqDen[4] * Trd + Comp[i].LiqDen[5] * Trd ^ 2 + Comp[i].LiqDen[6] * Trd ^ 3) * Comp[i].MW;
      end if;
      end for;
      row := sum(x[:] .* LiqDen[:]) ;
  end LDen;
  
  model DenTest
  constant Integer NOC = 2;
    extends LDen;
    parameter Chemsep_Database.Ethanol ethanol;
  parameter Chemsep_Database.Water water;
  parameter Real x[2] = {0.5, 0.5};
  parameter Chemsep_Database.General_Properties Comp[NOC] = {ethanol, water};
  parameter Real T = 313;
  end DenTest;
  
  model LiqDen
  constant Real r = 8.314;
  Real Zra[NOC], ZRA, DenTr, Tcij[NOC, NOC], Vss, Denfi[NOC], Vs, Tcm, w, MM, Density, Tcmsum[NOC], B, Pvp;
  algorithm
  Denfi := x[:] .* Comp[:].Vc ./ sum(x[:] .* Comp[:].Vc);
  for i in 1:NOC loop
  for j in 1:NOC loop
  Tcij[i, j] := 8 * (Comp[i].Tc * Comp[j].Tc) ^ 0.5 * (Comp[i].Vc * Comp[j].Vc / 1000000) ^ 0.5 / ((Comp[i].Vc / 1000) ^ (1 / 3) + (Comp[j].Vc  / 1000) ^ (1 / 3) ) ^ 3;
  end for;
  end for;
  for i in 1:NOC loop
  Tcmsum[i] := Denfi[i] * sum(Denfi[:] .* Tcij[i, :]);
  end for;
  Tcm := sum(Tcmsum[:]);
  DenTr := T / Tcm;
  Zra := Comp[:].Racketparam;
    for i in 1:NOC loop
 if Zra[i] == 0 then
 Zra[i] := 0.2956 - 0.08775 * Comp[i].AF;
 end if;
 end for;
    ZRA := sum(x[:] .* Zra[:]);
    Vs := r * sum(x[:] .* Comp[:].Tc ./ Comp[:].Pc) * ZRA ^ (1 + (1 - DenTr) ^ (2 / 7));
  w := sum(x[:] .* Comp[:].AF);
  B := P * ((-1) - 9.070217 * (1 - DenTr) ^ (1 / 3) + 62.45326 * (1 - DenTr) ^ (2 / 3) - 135.1102 * (1 - DenTr) + exp(4.7959 + 0.250047 * w + 1.14188 * w ^ 2) * (1 - DenTr) ^ (4 / 3));
  Pvp := sum(  gamma[:] .* x[:] .* Vp[:]);
  Vss  := Vs * (1 - (0.0861488 + 0.0344483 * w) * log((B + P) / (B + Pvp)));
    MM := sum(x[:] .* Comp[:].MW);
  Density := MM / (1000 * Vss);
  end LiqDen;
  
  model TestPsat
  constant Integer NOC = 2;
  extends Psat;
  parameter Chemsep_Database.Ethanol ethanol;
  parameter Chemsep_Database.Water water;
  parameter Chemsep_Database.General_Properties Comp[NOC] = {ethanol, water};
  parameter Real T = 373.15;
  end TestPsat;
  model LiqDenTest
  constant Integer NOC = 2;
  extends Psat;
  extends Thermodynamic_Packages.NRTL;
  extends LiqDen;
  parameter Real P = 101325, T = 293;
  parameter Chemsep_Database.Methanol methanol;
  parameter Chemsep_Database.Water water;
  parameter Real x[2] = {0.5, 0.5};
  parameter Chemsep_Database.General_Properties Comp[NOC] = {methanol, water};
  end LiqDenTest;
end Thermodynamic_Functions;