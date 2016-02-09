model Test_NRTL
Real Value[3,3,2];
equation
Value = BIPNRTL(3,{"Ethanol","Water","Methanol"});
end Test_NRTL;