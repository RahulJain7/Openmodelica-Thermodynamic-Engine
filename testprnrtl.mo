model testprnrtl
model testpr
parameter Chemsep_Database.Methanol methanol;
parameter Chemsep_Database.Water water;
parameter Real z[2] = {0.5, 0.5};
extends NRTL(NOC = 2, Comp = {methanol, water});
  extends PR(NOC = 2, Comp = {methanol, water});
  Real beta(start = 0.5, min = 0, max = 1), K[2], Psat[2];
algorithm
for i in 1:NOC loop
Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
end for;
equation
P = 101325;
T = 353;
sum(x[:]) - sum(y[:]) = 0;
K[:] = gamma[:] .* Psat[:] ./ (fiv[:] .* P);
y[:] = K[:] .* x[:];
y[:] * beta + x[:] * (1 - beta) = z[:];
end testpr;

end testprnrtl;