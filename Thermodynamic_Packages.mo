package Thermodynamic_Packages
function BIPNRTL
input Integer NOC;
input String Comp[NOC];
output Real value[NOC,NOC,2];
constant String underscore = "_";
String c[NOC,NOC];
String d[NOC,NOC];

constant String Comp1_Comp2[352] = 
{"Butane_Methanol","Pentane_Ethanol","Twomethylbutane_Ethanol","Hexane_Ethanol","Hexane_Onepropanol","Cyclohexane_Onepropanol","Methylcyclohexane_Phenol","Isobutylene_Methanol","Twomethyltwobutene_Methanol","Twomethyltwobutene_Ethanol","Onehexene_Methanol","Onehexene_Ethanol","Onethreebutadiene_Methanol","Onethreepentadiene_Methanol","Transonethreepentadiene_Methanol","Isoprene_Methanol","Isoprene_Ethanol","Cyclopentadiene_Methanol","Benzene_Onepropanol","Benzene_Chloroform","Benzene_Phenol","Benzene_Toluene","Benzene_Pxylene","Benzene_Tribromomethane","Benzene_Nitromethane","Benzene_Tetrachloroethylene","Benzene_Trichloroethylene","Benzene_Pentachloroethane","Benzene_Oneonetwotwotetrachloroethane","Benzene_Onetwodibromoethane","Benzene_Onetwodichloroethane","Benzene_Nmethylformamide","Benzene_Nitroethane","Benzene_Dimethylsulfoxide","Benzene_Ethylenediamine","Benzene_Nndimethylformamide","Benzene_Onenitropropane","Benzene_Twonitropropane","Benzene_Thiophene","Benzene_Pyridine","Benzene_Hexafluorobenzene","Benzene_Pdichlorobenzene","Benzene_Bromobenzene","Benzene_Chlorobenzene","Benzene_Fluorobenzene","Benzene_Nitrobenzene","Benzene_Aniline","Benzene_Cyclohexylamine","Benzene_Triethylamine","Benzene_Benzonitrile","Benzene_Toluene","Benzene_Nmethylcyclohexylamine","Benzene_Styrene","Benzene_Ethylbenzene","Benzene_Mxylene","Benzene_Pxylene","Benzene_Nndiethylaniline","Benzene_Isopropylbenzene","Benzene_Propylbenzene","Benzene_Mterphenyl","Toluene_Chloroform","Toluene_Pxylene","Toluene_nitroethane","Toluene_Dimethylsulfoxide","Toluene_Ethylenediamine","Toluene_Nndimethylformamide","Toluene_Sulfolane","Toluene_Pyridine","Toluene_Bromobenzene","Toluene_Chlorobenzene","Toluene_Nitrobenzene","Toluene_Twomethylpyridine","Toluene_Threemethylpyridien","Toluene_Benzonitrile","Toluene_Ethylbenzene","Toluene_Pxylene","Ethylbenzene_Styrene","Ethylbenzene_Nitrobenzene","Ethylbenzene_Aniline","Ethylbenzene_Isopropylbenzene","Ethylbenzene_Butylbenzene","Oxylene_Nndimethylformamide","Mxylene_Nndimethylformamide","Mxylene_Aniline","Pxylene_Mxylene","Pxylene_Nndimethylformamide","Pxylene_Aniline","Propylbenzene_Nitrobenzene","Onetwofourtrimethylbenzene_Onetwothreetrimethylbenzene","Butylbenzene_Nitrobenzene","Pcymene_Aniline","Styrene_Propylbenzene","Twomethylnaphthalene_Onemethylnaphthanlene","Propionicaldehyde_Methanol","Isobutyraldehyde_Water","Acetone_Methanol","Acetone_Ethanol","Acetone_Chloroform","Acetone_Benzene","Acetone_Phenol","Acetone_Cyclohexane","Acetone_Toluene","Twobutanone_Onepropanol","Twobutanone_Benzene","Twobutanone_Cyclohexane","Twobutanone_Toluene","Twobutanone_Nheptane","Twobutanone_Water","Methanol_Tetrachloromethane","Methanol_Tribromomethane","Methanol_Acetonitrile","Methanol_Onetwodichloroethane","Methanol_Aceticacid","Methanol_Ethanol","Methanol_Dimethylsulfoxide","Methanol_Propionicacid","Methanol_Nndimethylformamide","Methanol_Propanol","Methanol_Thiophene","Methanol_Methylacrylate","Methanol_Twobutanone","Methanol_Tetrahyrofuran","Methanol_Onefourdioxane","Methanol_Ethylacetate","Methanol_Sulfolane","Methanol_Onebutanol","Methanol_Twobutanol","Methanol_Onefourbutanediol","Methanol_Pyridine","Methanol_Methylmethacrylate","Methanol_Methylisopropylketone","Methanol_Piperidine","Methanol_Hexafluorobenzene","Methanol_Chlorobenzene","Methanol_Benzene","Methanol_Aniline","Methanol_Twomethylpyridine","Methanol_Threemethylpyridine","Methanol_Fourmethylpyridine","Methanol_Cyclohexene","Methanol_Cyclohexane","Methanol_Nbutylacetate","Methanol_Hexane","Methanol_Triethylamine","Methanol_Toluene","Methanol_Two6dimethylpyridine","Methanol_Oneheptane","Methanol_Methylcyclohexane","Methanol_Heptane","Methanol_Ethylbenzene","Methanol_Mxylene","Methanol_Pxylene","Methanol_Oneoctene","Methanol_Octane","Methanol_Twotwofourtrimethylpentane","Methanol_Water","Methanol_Chloroform","Methanol_Ethanol","Methanol_Acetone","Methanol_Benzene","Methanol_Cyclohexane","Methanol_Toluene","Methanol_Nheptane","Ethanol_Tetrachloroethylene","Ethanol_Acetonitrile","Ethanol_Onetwodichloroethane","Ethanol_Aceticacid","Ethanol_Onetwoethanediol","Ethanol_Twopropanol","Ethanol_Thiophene","Ethanol_Twobutanone","Ethanol_Onefourdioxane","Ethanol_Sulfolane","Ethanol_Twobutanol","Ethanol_Twomethylonepropanol","Ethanol_Pyridine","Ethanol_Methylmethacrylate","Ethanol_Methylisopropyl","Ethanol_Propylacetate","Ethanol_Threemethylonebutanol","Ethanol_Bromobenzene","Ethanol_Chlorobezene","Ethanol_Benzene","Ethanol_Aniline","Ethanol_Threemethylpyridine","Ethanol_Cyclohexane","Ethanol_Cyclohexanol","Ethanol_Butylacetate","Ethanol_Dipropylether","Ethanol_Triethylamine","Ethanol_Toluene","Ethanol_Anisole","Ethanol_Two6dimethylpyridine","Ethanol_Pentylacetate","Ethanol_Heptane","Ethanol_Ethylbezene","Ethanol_Pxylene","Ethanol_Octane","Ethanol_Twotwofourtrimethylpentane","Ethanol_Hexadecane","Ethanol_Oleicacid","Ethanol_Water","Ethanol_Chloroform","Ethanol_Acetone","Ethanol_Twobutanone","Ethanol_Benzene","Ethanol_Cyclohexane","Ethanol_Toluene","Ethanol_Nheptane","Ethanol_Pxylene","Onepropanol_Tetrachloroethylene","Onepropanol_Aceticacid","Onepropanol_Propionicacid","Onepropanol_Twomethoxyethanol","Propylamine_Onepropanol","Onepropanol_Methacrylicacid","Onepropanol_Twomethylonepropanol","Onepropanol_Pyridine","Onepropanol_Methylmethacrylate","Onepropnaol_Propylacetate","Onepropanol_Threemethylbutanol","Onepropnaol_Chlorobenzene","Onepropanol_Twomethylpyridine","Onepropanol_Threemethylpyridine","Onepropanol_Fourmethylpyridine","Onepropanol_Dipropylamine","Onepropanol_Hexamethyldisiloxane","Onepropanol_Toluene","Onepropnaol_Two6dimethylpyridine","Onepropanol_Heptane","Onepropanol_Pxylene","Onepropanol_Octane","Onepropanol_Decane","Onepropanol_Onedecanol","Twopropanol_Onepropanol","Isobutanol_Water","Tertbutanol_Water","Methylformate_Methanol","Methylacetate_Methanol","Methylacetate_Ethanol","Ethylacetate_Ethanol","Ethylacetate_Water","Vinylacetate_Ethanol","Diethylether_Methanol","Diethylether_Ethanol","Diethylether_Water","Diisopropylether_Water","Methyltertbutylether_Methanol","Dimethoxymethane_Methanol","Dimethoxymethane_Water","Propyleneoxide_Methanol","Tetrahydrofuran_Ethanol","Tetrahydrofuran_Onepropanol","Tetrahydrofuran_Water","Tetrachloromethane_Methanol","Tertachloromethane_Onepropanol","Tetrachloromethane_Benzene","Tetrachloromethane_Toluene","Tetrachloromethane_Ethylbenzene","Tetrachloromethane_Mxylene","Tetrachloromethane_Pxylene","Tetrachloromethane_Isopropylbenzene","Chloroform_Benzene","Vinylcloride_Methanol","Dichloromethane_Methanol","Dichloromethane_Ethanol","Chloroform_Methanol","Chloroform_Ethanol","Chloroform_Toluene","Onetwodichloroethane_Onepropanol","Onetwodichloroethane_Toluene","Onetwodichloroethane_Oxylene","Onetwodichloroethane_Pxylene","Oneoneonetrichloroethane_Benzene","Trichloroethylene_Onepropanol","Trichloroethylene_Toluene","Chlorobenzene_Ethylbenzene","Chlorobenzene_Pxylene","Butylchloride_Onepropanol","Methyliodide_Benzene","Ethyliodide_Benzene","Dimethylamine_Methanol","Dimethylamine_Ethanol","Dimethylamine_Onepropanol","Triethylamine_Onepropanol","Triethylamine_Water","Diethylamine_Water","Diethylamine_Benzene","Diethylamine_Toluene","Diethylamine_Ethylbenzene","Propylamine_Water","Butylamine_Ethanol","Butylamine_Onepropanol","Nbutylamine_Water","Butylamine_Benzene","Tertbutylamine_Benzene","Ethylenediamine_Oxylene","Acetonitrile_Toluene","Acetonitrile_Ethylbenzene","Acetonitrile_Pxylene","Propionitrile_Toluene","Acrylontrile_Styrene","Acrylonitrile_Ethylbenzene","Pyridine_Mxylene","Thiophene_Toluene","Fluorobenzene_Toluene","Hexafluorobenzene_Onepropnaol","Hexafluorobenzene_Toluene","Hexafluorobenzene_Pxylene","Water_Acetone","Water_Twobutanone","Water_Phenol","Water_Oneonetwotwotetrachloroethane","Water_Onefourdioxane","Water_Sulfolane","Water_Nndimethylacetamide","Water_Morpholine","Water_Nbutanol","Water_Onefourbutanediol","Water_Twothreebutanediol","Water_Diethylenegylcol","Water_Furfural","Water_Pyridine","Water_Nmethylpyrrolidone","Water_Threemethylbutanol","Water_Twomethyltwobutanol","Water_Phenol","Water_Aniline","Water_Twomethylpyridine","Water_Threemethylpyridine","Water_Fourmethylpyridine","Water_Phenylhydrazine","Water_Cyclohexanone","Water_Mesityloxide","Water_Cyclohexanol","Water_Nbutylacetate","Water_Diacetonealcohol","Water_Onehexanol","Water_Twohexanol","Water_Twobutoxyethanol","Water_Benzylalcohol","Water_Two6dimethylpyridinr","Water_Isopentylacetate","Water_Acetophenone","Water_Quinoline","Water_Isopropylbenzene","Carbondisulfide_Benzene","Carbondisulfide_Toluene","Halothane_Methanol","Oneonetwotrichloroonetwotwotrifluoroethane_Benzene","Methylisocyanate_Toluene","Methanol_Formamide"};
constant Real BI_Values[352,3] = 
{{1440.1498,1053.7716,0.4647},{1183.3812,412.7546,0.2886},{1610.2811,935.1426,0.496},{1218.1065,575.2985,0.2882},{1092.147,480.674,0.294},{1707.7883,353.2705,0.5914},{2587.873,-439.4469,0.2836},{1333.6,556.3608,0.3697},{1355.6853,660.9164,0.3381},{1412.7516,674.7726,0.4569},{1222.6032,1145.1085,0.4402},{1399.1806,949.7239,0.5011},{1353.0599,610.8292,0.467},{1545.3339,799.1289,0.4753},{1514.2761,782.1729,0.4657},{1445.6425,543.527,0.426},{1402.5377,653.4866,0.5056},{1541.9324,736.0352,0.4515},{874.2419,285.7774,0.2899},{-227.3671,-86.1025,0.3062},{373.4202,318.1885,0.2986},{60.198,-51.0865,0.3019},{-50.2635,14.218,0.3056},{893.4167,-566.9011,0.255},{273.5119,524.903,0.296},{-94.1122,288.6566,0.302},{140.5075,-127.4605,0.306},{-225.8274,197.746,0.303},{-73.7504,-250.7743,0.305},{-100.924,300.0048,0.304},{58.8289,-39.5526,0.303},{1512.9737,639.2332,0.523},{527.2886,-57.1531,0.3},{810.544,408.5646,0.669},{490.0693,560.0207,0.295},{736.7867,-251.4046,0.307},{-157.3069,595.6615,0.301},{1088.4773,-446.4137,0.306},{-347.2708,503.5971,0.304},{541.0855,-319.8327,0.279},{1085.4557,-715.7662,0.298},{1441.9721,-865.5699,0.283},{1538.3464,-819.5924,0.321},{700.4097,-450.6274,0.325},{277.6641,-292.2391,0.304},{1311.3264,-523.3212,0.311},{776.8671,-178.3464,0.299},{717.4228,-684.6315,0.29},{130.6061,-27.3294,0.303},{1390.488,-636.1853,0.285},{111.1157,-121.2437,0.303},{52.3967,94.0417,0.302},{-643.5999,970.4264,0.311},{-70.8372,57.0902,0.303},{-454.1872,615.2806,0.287},{-50.2635,14.218,0.305},{85.208,104.9548,0.301},{1915.7178,-810.5032,0.369},{-192.1433,141.5054,0.303},{64.1947,78.657,0.302},{-583.6169,629.2214,0.2974},{226.4602,-241.7457,0.2874},{537.4434,21.7626,0.301},{1063.2839,192.0041,0.289},{432.7908,592.5054,0.296},{-2260.2463,3666.1775,0.071},{5175.2573,224.8869,0.46},{264.6428,-60.3423,0.299},{-47.4722,15.063,0.304},{-40.5158,15.0972,0.303},{806.4313,-288.9774,0.296},{396.5492,-97.1224,0.302},{-490.8706,1036.9557,0.296},{-676.6725,1239.9195,0.3},{663.0837,-482.5109,0.3},{226.4602,-241.7457,0.287},{-539.7919,813.9959,0.346},{519.4154,-64.0219,0.3},{243.6463,384.003,0.298},{26.256,-27.6358,0.304},{-789.9294,957.1492,0.302},{559.7795,332.8093,0.294},{308.9034,548.667,0.296},{-259.4169,1034.4099,0.299},{282.0248,-254.9358,0.308},{153.1239,722.4999,0.294},{311.9792,408.2084,0.297},{329.7212,143.3943,0.3},{878.2759,-655.9008,0.326},{370.6529,140.0817,0.3},{-118.3505,885.1196,0.295},{649.8687,-453.4673,0.306},{-615.673,811.3338,0.335},{1046.6524,-865.266,0.3084},{1166.8333,1090.0262,0.2862},{184.2662,226.558,0.3009},{36.2965,434.8228,0.2987},{-651.1909,301.8389,0.3054},{-396.4935,886.5703,0.2971},{-754.9547,-280.383,0.3086},{429.8705,727.649,0.2925},{-247.9492,727.5102,0.295},{148.867,213.3829,0.3016},{-644.8573,898.3999,0.1563},{605.7381,235.4493,0.2963},{503.0737,-181.5533,0.2996},{681.5104,931.4616,0.9809},{674.4614,1809.8868,0.3536},{378.8254,1430.7379,0.2892},{879.0968,1063.6098,0.6381},{343.7042,314.5879,0.2981},{348.6035,1020.1431,0.2921},{16.6465,-217.1261,0.3051},{-327.9991,376.2667,0.3057},{-168.3182,-497.4171,0.3079},{-50.145,-78.0859,0.3056},{-124.0904,0.3428,9.1633},{24.9003,9.5349,0.3011},{-90.1051,1217.1035,0.2976},{676.836,169.9831,0.2958},{307.4271,217.9098,0.3003},{169.4153,383.1579,0.3002},{607.405,76.7683,0.2985},{345.5416,420.7355,0.2962},{1069.2756,906.5741,0.7182},{793.8173,-486.3299,0.2483},{-308.561,285.442,0.3036},{446.952,-450.5858,0.3152},{-45.0888,84.1956,0.3027},{590.279,380.8401,0.2963},{642.3761,-6.2901,0.2987},{590.882,-1169.7242,0.1387},{930.591,1244.1303,0.4701},{857.0852,1348.0903,0.4707},{721.6136,1158.5131,0.4694},{407.744,117.2473,0.3008},{226.082,-385.6823,0.3095},{-163.4505,-86.1482,0.3075},{304.2242,-452.3483,0.3053},{1178.5792,1618.9792,0.4568},{1315.1631,1497.2135,0.4222},{328.2162,453.0017,0.2961},{1619.3829,1622.2911,0.4365},{-476.8503,1126.1143,0.2874},{939.7275,1090.9297,0.4643},{-273.332,59.625,0.3051},{1313.5497,1143.9059,0.4163},{1444.585,1719.4586,0.4397},{1500.2043,1519.3346,0.4277},{1080.1231,1038.1572,0.4251},{991.1609,822.1357,0.291},{974.6545,851.107,0.2921},{1456.3583,1147.8132,0.4396},{1681.6918,1511.4353,0.4381},{1447.0909,1386.4703,0.4313},{-189.0469,792.802,0.2999},{-105.4657,1335.3416,0.2873},{67.2902,-70.5092,0.3009},{296.2432,118.0803,0.3003},{761.7553,1094.8556,0.4893},{1313.9316,1862.4639,0.441},{884.023,1008.0037,0.4064},{1566.439,1598.3126,0.4408},{685.8542,807.5935,0.29},{529.7267,338.1632,0.2964},{333.3502,939.387,0.2926},{-34.1971,-190.7763,0.305},{1644.0484,-203.7691,0.3704},{690.1392,-529.3472,0.3125},{222.3096,1057.7115,0.2918},{64.4957,463.1931,0.301},{505.5637,111.8389,0.2988},{1195.1601,705.0897,0.5676},{-559.8205,802.5411,0.2721},{53.1671,82.0442,0.3023},{163.6655,-169.9802,0.3017},{456.9676,386.5893,0.2963},{-54.0946,639.6806,0.3009},{760.4933,129.397,0.295},{51.1705,-42.8613,0.3009},{820.8023,1349.6853,0.4995},{645.7829,1383.711,0.5229},{516.141,1065.9086,0.4774},{1823.3542,-523.0474,0.3005},{315.6078,-339.0825,0.3056},{876.7933,1390.4162,0.4485},{1719.8644,-833.8389,0.292},{841.9935,-55.3231,0.2958},{442.6124,634.1687,0.2945},{-248.0407,697.9004,0.2996},{713.5653,1147.8607,0.5292},{3458.4788,-1438.8884,0.1704},{-48.2159,-19.6212,0.3016},{552.3897,266.1248,0.2964},{1137.265,1453.5947,0.4786},{801.7191,1006.8831,0.4962},{768.3633,760.08,0.2914},{1206.8097,1385.3721,0.4717},{1091.0432,1500.6711,0.4738},{2359.4082,1509.2033,0.4448},{975.6816,-343.5446,0.2988},{-57.9601,1241.7396,0.2937},{-285.3881,1289.2198,0.2909},{375.3497,45.3706,0.3006},{437.1923,33.6363,0.3022},{255.3591,1047.1959,0.297},{761.7739,1393.7993,0.4376},{542.4128,772.4394,0.2937},{1114.2947,1305.9242,0.4758},{1020.8405,889.3461,0.618},{608.3777,646.0412,0.2913},{256.8999,-327.5173,0.3044},{-189.7856,-32.4657,0.307},{-406.3767,830.8897,0.3013},{-602.9687,-45.3543,0.3061},{276.6356,-423.9162,0.3025},{-2.8139,-13.8657,0.3034},{374.8691,-412.2861,0.311},{504.09,125.6451,0.2993},{340.021,111.7437,0.3005},{12.2207,-31.8303,0.3033},{456.2867,538.5114,0.2946},{529.6444,-608.3163,0.3054},{479.7439,-540.4699,0.3045},{523.8291,-603.0924,0.3084},{617.3558,-459.5845,0.2892},{1615.0711,-498.3638,0.1028},{25.622,922.0009,0.0175},{472.9353,-545.1853,0.296},{1198.972,1377.2975,0.5193},{563.6173,475.5966,0.2921},{1109.304,334.2112,0.2907},{945.3159,520.2926,0.2895},{1068.0694,-588.3325,0.2958},{167.2501,-175.2928,0.3057},{639.8173,2491.0163,0.4385},{471.7718,2030.8877,0.5155},{584.572,298.5567,0.2962},{381.4559,346.536,0.2965},{188.3139,158.0118,0.3013},{305.6041,330.5105,0.2988},{1285.988,1606.082,0.4393},{505.1637,320.7403,0.2959},{705.9989,211.158,0.2953},{763.6707,71.1984,0.2946},{1544.0251,2086.4776,0.3792},{2665.1471,4202.0746,0.5409},{851.4954,465.836,0.8178},{608.9115,712.0226,0.7259},{1608.07,1818.2947,0.4898},{924.8499,-61.1796,0.2986},{661.3708,-200.6915,0.3015},{562.4611,-302.2498,0.3003},{915.745,1725.0977,0.4522},{1339.9,488.6648,0.4622},{1537.6384,537.2439,0.631},{-4.9421,84.0212,0.305},{-69.681,95.3839,0.304},{-172.3762,122.4657,0.303},{-232.4578,163.8924,0.304},{-192.9687,121.7193,0.304},{-106.8166,13.4903,0.303},{176.8791,-288.2136,0.306},{1789.7165,-34.9448,0.2912},{1560.0282,441.3372,0.6234},{1332.8036,-153.0761,0.3057},{1414.2712,-141.803,0.2949},{1438.3602,-327.5518,0.3023},{629.2214,-583.6169,0.297},{636.9927,364.0596,0.2956},{-217.7768,251.5704,0.309},{718.2538,-479.1971,0.287},{848.1184,-557.9036,0.273},{-73.4845,97.5682,0.303},{926.6139,196.0696,0.3007},{185.3799,-250.7688,0.306},{357.7079,-307.8057,0.307},{-395.6312,359.7555,0.305},{1201.9959,506.8982,0.5468},{294.4424,-185.2944,0.301},{394.5891,298.1172,0.3},{-1018.143,-54.3882,0.3134},{-1224.5739,370.7683,0.3105},{81.487,-703.3731,0.2697},{991.6157,-435.2018,0.3067},{-5096.528,28437.138,0.0381},{-169.1652,1372.3121,0.2932},{52.3512,-42.2029,0.281},{91.4853,-153.9388,5.101},{928.9662,-553.9006,0.345},{-455.9152,1301.6396,0.2981},{-612.3956,-5.7834,0.3062},{-698.951,34.7593,0.3001},{160.3429,2104.4002,0.6379},{65.9717,67.1231,0.302},{-344.6666,757.993,0.306},{1357.7269,-110.2727,0.196},{790.725,724.0955,0.935},{1102.5396,5.3234,0.298},{1413.0042,-210.0314,0.293},{-95.6685,717.0741,0.3},{598.0263,-130.4323,0.302},{1304.6073,-338.2481,0.299},{-78.8985,351.0029,0.3},{510.1471,-197.5696,0.301},{386.4643,-304.6112,0.308},{922.5224,528.5894,0.2937},{668.6525,-666.7128,0.241},{1004.5491,-949.1003,0.29},{1324.9767,814.1435,0.5663},{653.9718,1883.6007,0.3607},{2419.3354,1844.3794,0.6308},{2435.8879,102.7658,0.0972},{715.9592,548.8965,0.292},{1160.1372,467.9008,0.5573},{75.5965,328.8977,0.3009},{-803.1654,1732.7268,0.2954},{2633.6951,504.0381,0.4447},{1310.8994,1920.1402,0.5778},{2531.7402,-758.0034,0.302},{1186.7304,-99.9,0.2974},{2602.6374,436.9686,0.395},{1835.0881,419.8087,0.6802},{-239.6197,573.8298,0.3055},{3633.533,-494.8389,0.2816},{19947.2334,-15910.4563,0.0056},{2385.3714,282.697,0.4942},{11965.5274,-7391.5468,0.0235},{1979.5492,197.0009,0.6371},{2559.3708,418.7524,0.5361},{2325.9141,162.3029,0.5622},{1473.9606,-66.4169,0.0811},{2983.8991,-171.666,0.2673},{2121.4973,101.3068,0.1504},{2232.9727,641.3504,0.4399},{3805.0038,918.2419,0.2951},{1323.2731,845.9826,0.678},{2991.1845,-464.8054,0.1563},{1880.1699,489.1746,0.2938},{1914.0077,220.0262,0.4776},{4689.8409,301.3998,0.3168},{2222.596,831.9908,0.5706},{1874.8967,856.9565,0.3734},{725.1364,858.8268,0},{11675.1604,-3887.1802,0.0902},{2986.1161,-84.8485,0.086},{161.2943,431.5524,0.3},{-591.6879,1052.858,0.243},{9870.353,-6982.8569,0.0187},{-53.1528,551.963,0.301},{-167.8974,104.6027,0.302},{617.5847,-153.4695,0.3003}};

algorithm

for i in 1:NOC loop
  for j in 1:NOC loop
   for k in 1:2 loop
    value[i,j,k] := 0;
  end for;
end for;
end for;

for i in 1:NOC loop
  for j in 1:NOC loop
    c[i,j] := Comp[i]+underscore+Comp[j];
    d[i,j] := Comp[j]+underscore+Comp[i];
    for k in 1:353 loop
      if c[i,j] == Comp1_Comp2[k]then
        value[i,j,1] := BI_Values[k,1];
        value[j,i,1] := BI_Values[k,2];
        value[i,j,2] := BI_Values[k,3];
        value[j,i,2] := BI_Values[k,3]; 
      end if;  
     if d[i,j] == Comp1_Comp2[k]then
        value[j,i,1] := BI_Values[k,1];
        value[i,j,1] := BI_Values[k,2];
        value[i,j,2] := BI_Values[k,3];
        value[j,i,2] := BI_Values[k,3];   
     end if;
     end for;    
     
  end for;
end for;  
end BIPNRTL;

model NRTL
  
  constant Real R = 1.9872;
  parameter Integer NOC;
  parameter Chemsep_Database.General_Properties Comp[NOC];
  parameter Real BIPS[NOC,NOC,2] =  BIPNRTL(NOC,Comp.name);
  parameter Real A[NOC,NOC] = BIPS[:,:,1];
  parameter Real alpha[NOC,NOC] = BIPS[:,:,2];
  Real P, T(start = 350, min = 273);
  Real x[NOC](each start = 0.5, each min = 0.001, each max = 1);
  Real y[NOC](each start = 0.5, each min = 0, each max = 1);
  Real ta[NOC,NOC];
  Real G[NOC,  NOC], sum1[NOC], sum2[NOC];
  Real gamma[NOC](each start = 1) ;
  algorithm
    for i in 1:NOC loop
  for j in 1:NOC loop
    ta[i,j] := A[i,j]/ (R * T);
    G[i,j] := exp(-alpha[i,j]*ta[i,j]);
    end for;
  end for;
 for j in 1:NOC loop
 sum1[j] := sum(x[:] .* G[:, j]);
 sum2[j] := sum(x[:] .* ta[:, j] .* G[:, j]);
 end for;
 for i in 1:NOC loop
  gamma[i] := exp( sum(x[:] .* ta[:, i] .* G[:, i]) / sum(x[:] .* G[:, i]) + sum(x[:] .* G[i, :] ./ sum1[:] .* (ta[i, :] - sum2[:] ./ sum1[:])));
 end for;
 end NRTL;

 model PR
 constant Real R = 8.314;
 parameter Integer NOC;
 parameter Chemsep_Database.General_Properties Comp[NOC];
 parameter Real P;
 parameter Real T;
 Real y[NOC](each start = 0.5, each min = 0.001, each max = 1);
 Real Tr[NOC], aa[NOC, NOC];
 Real fiv[NOC](each start = 1);
 Real Zv[3, 2], ZV, zv[3], sv[NOC];
 Real a[NOC], b[NOC], amv, aamv, bmv, KPR[NOC, NOC], Av, Bv, Polyv[4];
 algorithm
 for i in 1:NOC loop
 Tr[i] := T / Comp[i].Tc;
 a[i] := (1 + (0.37464 + 1.54226 * Comp[i].AF + 0.26992 * Comp[i].AF ^ 2) * (1 - Tr[i] ^ 0.5)) ^ 2 * (0.45724 * R ^ 2 * Comp[i].Tc ^ 2) / Comp[i].Pc;
 b[i] := 0.07780 * (R * Comp[i].Tc) / Comp[i].Pc;
 end for;
 KPR := PPR(NOC, Comp.name);
  for j in 1:NOC loop
  aamv := 0;
  for k in 1:NOC loop
  aa[j, k] := (a[j] * a[k]) ^ 0.5 * (1 - KPR[j, k]);
  aamv := aamv + y[j] * y[k] * aa[j, k];
  end for;
  amv := amv + aamv;
  end for;
  for l in 1:NOC loop
  bmv := bmv + y[l] * b[l];
  end for;
  Av := amv * P / (R ^ 2 * T ^ 2);
  Bv := bmv * P / (R * T);
  Polyv[1] := 1;
  Polyv[2] := -(1 - Bv);
  Polyv[3] := Av - 3 * Bv ^ 2 - 2 * Bv;
  Polyv[4] := -(Av * Bv - Bv ^ 2 - Bv ^ 3);
  Zv := Modelica.Math.Vectors.Utilities.roots(Polyv);
  for i in 1:3 loop
  zv[i] := Zv[i, 1];
  end for;
  ZV := max(zv);
  for i in 1:NOC loop
  for j in 1:NOC loop
  sv[i] := sv[i] + y[j] * aa[i, j];
  end for;
  end for;
  for i in 1:NOC loop
  fiv[i] := exp(b[i] / bmv * (ZV - 1) - log(ZV - Bv) - Av / (2 * 2 ^ 0.5 * Bv) * (2 * sv[i] / amv - b[i] / bmv) * log((ZV + 2.414 * Bv) / (ZV - 0.414 * Bv)));
  end for;
  end PR;
  model NRTLtest
  parameter Chemsep_Database.Methanol methanol;
  parameter Chemsep_Database.Ethanol ethanol;
  parameter Chemsep_Database.Water water;
  parameter Real z[3] = {0.3, 0.3, 0.4};
  extends NRTL(NOC = 3, Comp = {methanol, ethanol, water}, P = 101325, T = 350);
  Real beta(start = 0.455, min = 0, max = 1), K[3](each start = 1, each min = 0), Psat[3];
  algorithm
  for i in 1:NOC loop
  Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
  end for;
  equation
  sum(x[:]) - sum(y[:]) = 0;
  K[:] = gamma[:] .* Psat[:] ./ P;
  y[:] = K[:] .* x[:];
  y[:] * beta + x[:] * (1 - beta) = z[:];
  end NRTLtest;
  function BIPPR
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
 end //  Real x[NOC] (each start = 0.5, each min = 0, each max = 1);
//  Real fil[NOC](each start = 1);
for;
    end //    aaml := 0;
    //     aaml := aaml + x[j] * x[k] * aa[j,k];
    //    aml := aml + aaml;
//    bml := bml + x[l] * b[l];
    //  Al := aml * P / (R ^ 2 * T ^ 2);
    //  Bl := bml * P / (R * T);
//  Polyl[1] := 1;
    //  Polyl[2] := -(1 - Bl);
    //  Polyl[3] := Al - 3 * Bl ^ 2 - 2 * Bl;
    //  Polyl[4] := -(Al * Bl - Bl ^ 2 - Bl^3);
    //  Zl := Modelica.Math.Vectors.Utilities.roots(Polyl);
//    zl[i] := Zl[i, 1];
    //  ZL := zl[3];
//      sl[i] := sl[i] + x[j] * aa[i,j];
//    log(fil[i]) = b[i] / bml * (ZL - 1) - log(ZL - Bl) - Al / (2 * 2 ^ 0.5 * Bl) * (2*sl[i] / aml - b[i] / bml) * log((ZL + 2.414 * Bl) / (ZL - 0.414 * Bl));
BIPPR;
end Thermodynamic_Packages;