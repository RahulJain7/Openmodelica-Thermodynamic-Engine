package Thermodynamic_Functions
  function Psat
    input Real VC[6];
    input Real T;
    output Real Vp;
  algorithm
    Vp := exp(VC[2] + VC[3] / T + VC[4] * log(T) + VC[5] * T ^ VC[6]);
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
end Thermodynamic_Functions;