model TestNRTL
parameter Chemsep_Database.Methanol methanol;
parameter Chemsep_Database.Water water;
//parameter Real T = 323;
//parameter Real F = 1;
parameter Real zz[2] = {0.5, 0.5};
NRTL Test(NOC = 2, Comp = {methanol, water}, z = zz, P = 101325, T = 350);
Real X[2],Y[2];
equation
X = Test.x;
Y = Test.y;
end TestNRTL;