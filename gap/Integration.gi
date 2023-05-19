## Integration with SmallGrps


# Get the next available "layer" id (the built-in library
# consists of 11 layers, but other packages may already have
# added further layers).
layer := Length(SMALL_AVAILABLE_FUNCS) + 1;

# Determine where to add our new lookup functions
pos := Maximum(List([
        SMALL_GROUP_FUNCS,
        SMALL_GROUPS_INFORMATION,
        NUMBER_SMALL_GROUPS_FUNCS,
        ID_GROUP_FUNCS,
        SELECT_SMALL_GROUPS_FUNCS,
    ], Length)) + 1;

#
# hook us up on the layer level
#

# meta data on small groups data we provide
SMALL_AVAILABLE_FUNCS[layer] := function( size )
    if size = 3^8 then
        return rec (
            lib := layer,
            func := pos,
            number := 123456    # number of groups of this order
        );
    fi;
end;

# meta data on IdGroup functionality we provide
ID_AVAILABLE_FUNCS[layer] := function( size )
    # Three possible implementations:

    # 1. No IdGroup functionality at all:

    # 2. IdGroup provided for all groups:
    return SMALL_AVAILABLE_FUNCS[layer];

    # 3. IdGroup provided for a subset of order
    #if size in [ 12345, 67890 ] then
    #  return SMALL_AVAILABLE_FUNCS[layer];
    #fi;

end;

# Method for SmallGroup(size, i):
SMALL_GROUP_FUNCS[ pos ] := function( size, i, inforec )
    local g;

    # Now create the actual group
    Error("TODO");

    return g;
end;

# Method which selects a subset of all those groups with
# a certain combination of properties.
# A default method can be used; but more user friendly would be
# to install something custom which e.g. takes care of filtering
# the abelian groups, and which also knows that all groups
# of order p^n are nilpotent.
SELECT_SMALL_GROUPS_FUNCS[ pos ] := SELECT_SMALL_GROUPS_FUNCS[ 11 ];
#SELECT_SMALL_GROUPS_FUNCS[ pos ] := function( funcs, vals, inforec, all, id )
#    Error("TODO");
#end;

# Optional: Method for IdGroup(size, i).
ID_GROUP_FUNCS[ pos ] := function( G, inforec )
    Error("TODO");
end;

# Method for SmallGroupsInformation(size):
SMALL_GROUPS_INFORMATION[ pos ] := function( size, inforec, num )
    Print( " \n");
    Print( "      This database was created by BLA, see paper BLUB.\n");
    # TODO: add more
end;
```


# p2qr or p2q2 orders up to 50 000 that need to change
ordstodo := [ 36, 60, 84, 90, 100, 126, 132, 140, 150, 156, 196, 198, 204, 220, 225, 228, 234, 260, 276, 294, 306, 308, 315, 340, 342, 348, 350, 364, 372, 380, 414, 441, 444, 460,
  476, 484, 490, 492, 495, 516, 522, 525, 532, 550, 558, 564, 572, 580, 585, 620, 636, 644, 650, 666, 676, 693, 708, 726, 732, 735, 738, 740, 748, 774, 804, 812, 819, 820, 825,
  836, 846, 850, 852, 855, 860, 868, 876, 884, 940, 948, 950, 954, 975, 988, 996, 1012, 1014, 1036, 1060, 1062, 1068, 1071, 1078, 1089, 1098, 1148, 1150, 1156, 1164, 1180, 1196,
  1197, 1204, 1206, 1210, 1212, 1220, 1225, 1236, 1274, 1275, 1276, 1278, 1284, 1287, 1292, 1308, 1314, 1316, 1340, 1356, 1364, 1395, 1420, 1422, 1425, 1444, 1449, 1450, 1460,
  1484, 1494, 1508, 1521, 1524, 1550, 1564, 1572, 1580, 1602, 1612, 1617, 1628, 1644, 1652, 1660, 1665, 1666, 1668, 1690, 1694, 1708, 1725, 1734, 1746, 1748, 1780, 1788, 1804,
  1812, 1815, 1818, 1827, 1845, 1850, 1854, 1862, 1876, 1881, 1884, 1892, 1911, 1924, 1925, 1926, 1935, 1940, 1953, 1956, 1962, 1972, 1988, 1989, 2004, 2020, 2034, 2044, 2050,
  2060, 2068, 2076, 2108, 2116, 2132, 2140, 2148, 2150, 2166, 2172, 2180, 2204, 2212, 2223, 2236, 2254, 2260, 2277, 2286, 2292, 2316, 2324, 2325, 2331, 2332, 2350, 2356, 2358,
  2364, 2366, 2388, 2444, 2466, 2492, 2499, 2502, 2516, 2532, 2535, 2540, 2541, 2583, 2596, 2601, 2620, 2650, 2668, 2676, 2682, 2684, 2691, 2695, 2709, 2716, 2718, 2724, 2740,
  2745, 2748, 2756, 2775, 2780, 2788, 2793, 2796, 2812, 2826, 2828, 2842, 2852, 2868, 2884, 2890, 2892, 2907, 2924, 2934, 2948, 2950, 2961, 2980, 2996, 3006, 3012, 3015, 3020,
  3025, 3038, 3050, 3052, 3068, 3069, 3075, 3084, 3114, 3116, 3124, 3140, 3146, 3156, 3164, 3172, 3174, 3195, 3196, 3212, 3222, 3225, 3228, 3249, 3252, 3258, 3260, 3268, 3285,
  3324, 3339, 3340, 3350, 3364, 3372, 3381, 3393, 3396, 3404, 3438, 3460, 3474, 3476, 3484, 3516, 3546, 3549, 3550, 3555, 3556, 3572, 3575, 3580, 3582, 3596, 3604, 3610, 3620,
  3626, 3627, 3650, 3652, 3663, 3668, 3684, 3692, 3717, 3718, 3732, 3756, 3772, 3796, 3798, 3804, 3820, 3836, 3843, 3844, 3860, 3892, 3916, 3933, 3940, 3950, 3956, 3972, 3980,
  4012, 4014, 4018, 4028, 4044, 4046, 4086, 4108, 4114, 4122, 4148, 4150, 4164, 4172, 4188, 4194, 4214, 4220, 4221, 4225, 4228, 4235, 4236, 4257, 4263, 4268, 4292, 4302, 4308,
  4316, 4324, 4329, 4338, 4365, 4396, 4404, 4444, 4450, 4460, 4473, 4476, 4484, 4518, 4532, 4540, 4545, 4548, 4556, 4557, 4564, 4575, 4580, 4588, 4596, 4598, 4599, 4606, 4626,
  4628, 4635, 4636, 4660, 4668, 4675, 4676, 4708, 4719, 4734, 4743, 4756, 4761, 4764, 4780, 4796, 4797, 4812, 4820, 4828, 4842, 4844, 4850, 4876, 4878, 4905, 4908, 4959, 4964,
  4972, 4977, 4986, 4988, 5012, 5020, 5025, 5028, 5031, 5044, 5046, 5050, 5052, 5054, 5058, 5068, 5075, 5084, 5092, 5094, 5140, 5150, 5172, 5194, 5196, 5225, 5229, 5252, 5260,
  5268, 5274, 5290, 5301, 5316, 5325, 5332, 5348, 5350, 5356, 5372, 5380, 5388, 5396, 5404, 5415, 5420, 5425, 5428, 5439, 5450, 5452, 5475, 5476, 5484, 5499, 5516, 5526, 5532,
  5540, 5548, 5556, 5564, 5566, 5572, 5577, 5588, 5598, 5604, 5607, 5612, 5620, 5634, 5644, 5650, 5660, 5661, 5668, 5706, 5715, 5746, 5748, 5764, 5766, 5782, 5828, 5844, 5860,
  5876, 5892, 5895, 5908, 5925, 5929, 5958, 5978, 5988, 6004, 6027, 6028, 6036, 6039, 6052, 6066, 6068, 6069, 6108, 6111, 6116, 6140, 6148, 6164, 6201, 6220, 6244, 6246, 6252,
  6255, 6260, 6276, 6282, 6308, 6321, 6325, 6327, 6340, 6350, 6354, 6356, 6358, 6363, 6364, 6412, 6417, 6422, 6462, 6489, 6492, 6524, 6532, 6550, 6556, 6564, 6566, 6572, 6579,
  6596, 6604, 6606, 6620, 6633, 6644, 6684, 6692, 6714, 6716, 6724, 6740, 6741, 6748, 6756, 6764, 6795, 6812, 6822, 6828, 6844, 6850, 6852, 6867, 6868, 6894, 6897, 6903, 6908,
  6909, 6924, 6940, 6950, 6956, 6958, 6980, 7002, 7004, 7011, 7018, 7028, 7044, 7052, 7060, 7065, 7076, 7105, 7116, 7119, 7124, 7137, 7146, 7154, 7172, 7175, 7180, 7188, 7196,
  7212, 7218, 7225, 7227, 7228, 7268, 7275, 7276, 7284, 7316, 7335, 7340, 7348, 7353, 7356, 7362, 7364, 7372, 7396, 7404, 7406, 7412, 7428, 7450, 7460, 7502, 7514, 7525, 7532,
  7542, 7550, 7564, 7569, 7572, 7575, 7578, 7580, 7581, 7588, 7595, 7612, 7636, 7659, 7660, 7676, 7684, 7692, 7708, 7716, 7725, 7742, 7748, 7756, 7758, 7764, 7772, 7774, 7780,
  7791, 7794, 7821, 7828, 7836, 7839, 7844, 7850, 7852, 7865, 7868, 7876, 7902, 7908, 7924, 7932, 7940, 7942, 7964, 7974, 7975, 8001, 8020, 8037, 8076, 8082, 8084, 8091, 8124,
  8132, 8134, 8145, 8150, 8164, 8175, 8180, 8188, 8196, 8204, 8214, 8226, 8236, 8253, 8281, 8284, 8292, 8298, 8307, 8308, 8334, 8349, 8350, 8380, 8404, 8406, 8410, 8412, 8420,
  8468, 8476, 8492, 8508, 8525, 8541, 8588, 8595, 8596, 8619, 8620, 8622, 8628, 8631, 8636, 8649, 8650, 8660, 8668, 8673, 8684, 8685, 8692, 8708, 8722, 8724, 8732, 8756, 8757,
  8764, 8766, 8780, 8796, 8804, 8811, 8836, 8838, 8860, 8868, 8876, 8901, 8908, 8916, 8924, 8950, 8954, 8955, 8967, 8980, 8982, 8996, 9012, 9025, 9028, 9050, 9052, 9054, 9063,
  9084, 9116, 9132, 9140, 9162, 9164, 9220, 9228, 9243, 9260, 9268, 9276, 9284, 9292, 9295, 9308, 9316, 9333, 9340, 9378, 9386, 9387, 9412, 9414, 9436, 9444, 9452, 9476, 9495,
  9506, 9513, 9525, 9550, 9564, 9580, 9603, 9610, 9628, 9633, 9650, 9652, 9657, 9676, 9708, 9711, 9716, 9729, 9732, 9738, 9740, 9772, 9796, 9802, 9812, 9820, 9825, 9844, 9846,
  9849, 9850, 9852, 9876, 9884, 9891, 9898, 9916, 9922, 9924, 9932, 9948, 9950, 9956, 9964, 9980, 9988, 10004, 10026, 10028, 10035, 10036, 10045, 10052, 10060, 10068, 10075,
  10076, 10086, 10089, 10094, 10132, 10134, 10148, 10175, 10180, 10197, 10236, 10242, 10244, 10251, 10252, 10268, 10269, 10276, 10278, 10284, 10285, 10292, 10305, 10308, 10323,
  10324, 10348, 10356, 10386, 10396, 10406, 10412, 10413, 10420, 10425, 10431, 10437, 10444, 10460, 10478, 10486, 10492, 10508, 10516, 10521, 10524, 10535, 10550, 10564, 10566,
  10572, 10596, 10604, 10612, 10644, 10674, 10675, 10676, 10682, 10724, 10731, 10782, 10791, 10804, 10818, 10820, 10845, 10884, 10892, 10899, 10926, 10932, 10940, 10972, 10982,
  10988, 11028, 11034, 11036, 11044, 11074, 11084, 11092, 11094, 11106, 11109, 11116, 11140, 11142, 11148, 11150, 11169, 11223, 11228, 11236, 11244, 11252, 11253, 11260, 11271,
  11275, 11277, 11292, 11295, 11308, 11324, 11325, 11349, 11350, 11356, 11358, 11364, 11374, 11380, 11403, 11420, 11436, 11439, 11450, 11452, 11457, 11468, 11476, 11495, 11524,
  11538, 11540, 11572, 11574, 11596, 11604, 11613, 11638, 11644, 11646, 11650, 11652, 11661, 11684, 11692, 11716, 11724, 11732, 11740, 11754, 11764, 11774, 11775, 11788, 11796,
  11804, 11817, 11825, 11836, 11860, 11862, 11892, 11898, 11908, 11913, 11924, 11932, 11948, 11950, 11964, 11972, 11980, 11997, 12020, 12028, 12033, 12050, 12051, 12052, 12068,
  12087, 12108, 12114, 12116, 12124, 12140, 12141, 12156, 12159, 12172, 12186, 12188, 12195, 12201, 12212, 12225, 12228, 12252, 12260, 12274, 12284, 12292, 12294, 12308, 12321,
  12340, 12364, 12372, 12380, 12388, 12396, 12397, 12404, 12411, 12412, 12425, 12428, 12438, 12446, 12452, 12465, 12468, 12483, 12506, 12508, 12519, 12524, 12532, 12537, 12550,
  12556, 12572, 12573, 12588, 12596, 12604, 12612, 12615, 12618, 12620, 12627, 12644, 12645, 12692, 12732, 12735, 12753, 12756, 12762, 12772, 12788, 12796, 12820, 12826, 12828,
  12838, 12850, 12860, 12892, 12908, 12925, 12932, 12940, 12942, 12956, 12964, 12988, 13044, 13052, 13060, 13076, 13083, 13086, 13092, 13108, 13113, 13116, 13124, 13148, 13150,
  13164, 13172, 13175, 13180, 13194, 13220, 13221, 13225, 13236, 13254, 13268, 13293, 13294, 13302, 13308, 13325, 13348, 13364, 13374, 13396, 13404, 13412, 13426, 13431, 13450,
  13454, 13460, 13476, 13508, 13509, 13516, 13518, 13532, 13540, 13548, 13550, 13575, 13588, 13604, 13612, 13622, 13626, 13636, 13653, 13660, 13676, 13684, 13690, 13698, 13708,
  13724, 13748, 13754, 13756, 13761, 13772, 13812, 13815, 13820, 13836, 13842, 13850, 13858, 13869, 13892, 13914, 13915, 13924, 13948, 13956, 13972, 13988, 13995, 14012, 14020,
  14049, 14050, 14052, 14079, 14084, 14085, 14092, 14150, 14161, 14166, 14172, 14180, 14193, 14204, 14244, 14252, 14259, 14276, 14278, 14301, 14316, 14319, 14325, 14346, 14348,
  14356, 14380, 14396, 14404, 14412, 14415, 14427, 14444, 14475, 14516, 14534, 14540, 14556, 14562, 14564, 14575, 14588, 14596, 14598, 14602, 14604, 14612, 14644, 14650, 14660,
  14668, 14676, 14679, 14703, 14716, 14725, 14732, 14748, 14762, 14772, 14778, 14780, 14787, 14798, 14814, 14828, 14841, 14844, 14847, 14852, 14859, 14860, 14884, 14886, 14895,
  14922, 14925, 14945, 14948, 14949, 14972, 14988, 14996, 15020, 15052, 15057, 15102, 15108, 15111, 15124, 15129, 15140, 15141, 15148, 15164, 15165, 15183, 15196, 15219, 15220,
  15236, 15244, 15268, 15308, 15316, 15324, 15327, 15348, 15350, 15354, 15356, 15364, 15380, 15386, 15396, 15399, 15426, 15436, 15460, 15462, 15468, 15476, 15492, 15532, 15534,
  15543, 15550, 15564, 15572, 15596, 15604, 15609, 15612, 15631, 15636, 15650, 15651, 15684, 15705, 15717, 15729, 15740, 15748, 15759, 15764, 15786, 15796, 15812, 15813, 15825,
  15828, 15836, 15844, 15850, 15852, 15858, 15867, 15886, 15892, 15894, 15895, 15908, 15916, 15921, 15924, 15932, 15940, 15964, 15966, 15974, 15988, 16023, 16029, 16036, 16124,
  16132, 16137, 16148, 16156, 16172, 16180, 16191, 16214, 16220, 16225, 16244, 16252, 16263, 16276, 16326, 16332, 16348, 16353, 16366, 16388, 16398, 16404, 16412, 16420, 16436,
  16460, 16461, 16468, 16473, 16476, 16484, 16515, 16540, 16542, 16550, 16564, 16569, 16572, 16580, 16587, 16604, 16606, 16611, 16641, 16652, 16676, 16677, 16684, 16722, 16724,
  16725, 16732, 16748, 16756, 16762, 16772, 16775, 16780, 16785, 16788, 16810, 16828, 16850, 16852, 16854, 16866, 16892, 16908, 16938, 16947, 16948, 16954, 16988, 16996, 17019,
  17046, 17055, 17060, 17068, 17073, 17076, 17116, 17124, 17140, 17148, 17154, 17164, 17175, 17180, 17182, 17196, 17212, 17225, 17228, 17236, 17252, 17260, 17268, 17271, 17276,
  17284, 17324, 17332, 17350, 17364, 17372, 17395, 17404, 17406, 17412, 17425, 17433, 17436, 17450, 17451, 17457, 17468, 17476, 17478, 17487, 17508, 17516, 17524, 17540, 17542,
  17545, 17548, 17572, 17586, 17596, 17613, 17620, 17644, 17649, 17650, 17652, 17660, 17661, 17666, 17667, 17668, 17675, 17689, 17694, 17703, 17708, 17716, 17738, 17740, 17756,
  17772, 17796, 17812, 17825, 17829, 17838, 17844, 17865, 17868, 17876, 17884, 17914, 17916, 17918, 17919, 17946, 17948, 17950, 17956, 17986, 17988, 17996, 18004, 18044, 18045,
  18075, 18116, 18124, 18132, 18140, 18148, 18162, 18164, 18189, 18212, 18220, 18234, 18236, 18276, 18284, 18292, 18297, 18308, 18316, 18342, 18350, 18356, 18369, 18372, 18378,
  18380, 18404, 18405, 18411, 18425, 18428, 18436, 18452, 18459, 18473, 18476, 18490, 18502, 18508, 18516, 18524, 18532, 18558, 18580, 18588, 18594, 18636, 18639, 18644, 18650,
  18668, 18669, 18693, 18702, 18708, 18718, 18724, 18740, 18748, 18755, 18759, 18796, 18804, 18820, 18825, 18836, 18844, 18852, 18868, 18882, 18908, 18914, 18918, 18940, 18945,
  18948, 18950, 18956, 18964, 18988, 18996, 19028, 19052, 19053, 19060, 19071, 19076, 19084, 19098, 19107, 19108, 19118, 19124, 19134, 19150, 19164, 19166, 19212, 19242, 19244,
  19257, 19276, 19284, 19306, 19308, 19316, 19323, 19340, 19341, 19348, 19356, 19364, 19372, 19388, 19395, 19396, 19412, 19420, 19428, 19431, 19436, 19450, 19452, 19468, 19475,
  19481, 19485, 19492, 19502, 19524, 19525, 19532, 19539, 19540, 19564, 19566, 19588, 19593, 19628, 19638, 19644, 19647, 19660, 19674, 19701, 19708, 19719, 19746, 19755, 19756,
  19775, 19809, 19820, 19825, 19850, 19852, 19854, 19855, 19881, 19884, 19916, 19924, 19940, 19942, 19956, 19962, 19971, 19988, 20004, 20028, 20050, 20068, 20075, 20079, 20086,
  20102, 20106, 20108, 20116, 20132, 20139, 20164, 20180, 20181, 20212, 20214, 20228, 20241, 20252, 20260, 20276, 20284, 20313, 20316, 20322, 20325, 20356, 20364, 20367, 20372,
  20380, 20388, 20420, 20433, 20444, 20449, 20450, 20492, 20508, 20511, 20516, 20524, 20535, 20548, 20564, 20565, 20572, 20596, 20618, 20619, 20620, 20631, 20644, 20652, 20660,
  20676, 20678, 20692, 20708, 20718, 20732, 20745, 20754, 20764, 20775, 20780, 20787, 20796, 20804, 20828, 20835, 20852, 20853, 20876, 20884, 20886, 20889, 20892, 20934, 20938,
  20943, 20950, 20961, 20964, 20980, 20996, 21004, 21020, 21025, 21028, 21036, 21050, 21052, 21068, 21075, 21076, 21078, 21108, 21142, 21148, 21172, 21177, 21196, 21220, 21225,
  21231, 21244, 21258, 21260, 21267, 21268, 21284, 21308, 21316, 21321, 21324, 21356, 21366, 21380, 21386, 21396, 21412, 21428, 21436, 21444, 21452, 21468, 21474, 21484, 21508,
  21532, 21538, 21550, 21556, 21604, 21612, 21618, 21644, 21650, 21716, 21717, 21725, 21732, 21740, 21788, 21801, 21820, 21834, 21836, 21844, 21854, 21860, 21861, 21866, 21876,
  21892, 21903, 21906, 21915, 21940, 21950, 21956, 21972, 21987, 21988, 22014, 22036, 22041, 22052, 22060, 22077, 22090, 22095, 22122, 22132, 22143, 22150, 22156, 22158, 22164,
  22172, 22180, 22196, 22197, 22225, 22239, 22244, 22246, 22266, 22268, 22311, 22316, 22326, 22332, 22340, 22347, 22348, 22382, 22385, 22388, 22396, 22401, 22404, 22412, 22436,
  22442, 22444, 22450, 22452, 22455, 22460, 22468, 22475, 22476, 22482, 22508, 22509, 22516, 22524, 22532, 22548, 22563, 22580, 22581, 22617, 22646, 22652, 22662, 22668, 22671,
  22684, 22708, 22796, 22812, 22825, 22828, 22833, 22834, 22850, 22852, 22884, 22892, 22916, 22924, 22925, 22956, 22986, 22988, 23012, 23020, 23022, 23025, 23036, 23044, 23049,
  23050, 23060, 23068, 23075, 23079, 23084, 23092, 23094, 23103, 23108, 23121, 23150, 23156, 23157, 23172, 23177, 23196, 23202, 23212, 23236, 23238, 23260, 23283, 23325, 23332,
  23346, 23348, 23350, 23388, 23412, 23418, 23420, 23422, 23427, 23445, 23454, 23474, 23475, 23492, 23499, 23526, 23534, 23535, 23564, 23572, 23575, 23596, 23607, 23618, 23620,
  23636, 23643, 23644, 23668, 23676, 23684, 23698, 23732, 23740, 23742, 23748, 23764, 23769, 23778, 23788, 23804, 23829, 23836, 23844, 23852, 23859, 23860, 23876, 23877, 23884,
  23886, 23908, 23916, 23932, 23950, 23956, 23961, 23964, 23972, 23988, 23996, 23998, 24004, 24020, 24021, 24025, 24036, 24052, 24068, 24076, 24092, 24124, 24129, 24132, 24157,
  24164, 24196, 24204, 24236, 24260, 24284, 24308, 24309, 24321, 24324, 24340, 24345, 24348, 24350, 24412, 24428, 24436, 24442, 24460, 24468, 24475, 24476, 24498, 24507, 24508,
  24549, 24550, 24556, 24563, 24580, 24598, 24606, 24615, 24620, 24628, 24636, 24644, 24668, 24674, 24676, 24687, 24714, 24716, 24723, 24724, 24740, 24745, 24748, 24756, 24764,
  24772, 24805, 24825, 24828, 24831, 24836, 24854, 24858, 24908, 24909, 24926, 24932, 24939, 24950, 24956, 24964, 24972, 24980, 24986, 24996, 25011, 25036, 25044, 25068, 25124,
  25132, 25150, 25156, 25180, 25182, 25186, 25188, 25215, 25252, 25263, 25275, 25276, 25281, 25317, 25324, 25332, 25356, 25362, 25364, 25388, 25396, 25431, 25450, 25479, 25484,
  25508, 25532, 25540, 25548, 25572, 25580, 25604, 25612, 25614, 25628, 25644, 25660, 25675, 25686, 25692, 25695, 25716, 25722, 25724, 25732, 25748, 25756, 25767, 25772, 25774,
  25780, 25794, 25803, 25820, 25821, 25828, 25836, 25852, 25868, 25886, 25894, 25902, 25921, 25925, 25929, 25932, 25940, 25948, 25965, 25972, 25988, 25996, 26012, 26015, 26020,
  26036, 26044, 26046, 26050, 26060, 26091, 26092, 26108, 26118, 26132, 26140, 26148, 26150, 26154, 26156, 26164, 26175, 26195, 26228, 26236, 26262, 26289, 26307, 26313, 26332,
  26348, 26356, 26362, 26372, 26378, 26380, 26397, 26420, 26425, 26436, 26444, 26452, 26468, 26478, 26484, 26492, 26499, 26516, 26523, 26524, 26540, 26556, 26558, 26559, 26564,
  26596, 26607, 26652, 26658, 26668, 26675, 26684, 26694, 26702, 26708, 26714, 26732, 26766, 26788, 26793, 26802, 26828, 26829, 26844, 26847, 26868, 26871, 26874, 26877, 26883,
  26916, 26924, 26934, 26937, 26956, 26972, 26982, 26996, 26999, 27004, 27012, 27025, 27028, 27045, 27050, 27063, 27068, 27076, 27092, 27146, 27148, 27153, 27166, 27188, 27196,
  27198, 27204, 27220, 27228, 27236, 27261, 27268, 27276, 27279, 27284, 27315, 27340, 27346, 27350, 27356, 27372, 27388, 27391, 27414, 27423, 27444, 27460, 27477, 27516, 27524,
  27525, 27538, 27548, 27556, 27558, 27564, 27572, 27585, 27604, 27620, 27639, 27652, 27657, 27685, 27693, 27708, 27724, 27732, 27734, 27735, 27748, 27764, 27772, 27774, 27775,
  27812, 27850, 27855, 27873, 27882, 27892, 27909, 27916, 27954, 27956, 27963, 27975, 27980, 27996, 28012, 28017, 28036, 28054, 28062, 28068, 28077, 28090, 28092, 28124, 28132,
  28148, 28150, 28164, 28179, 28180, 28197, 28204, 28206, 28212, 28244, 28251, 28252, 28268, 28278, 28284, 28287, 28292, 28324, 28325, 28341, 28348, 28364, 28371, 28372, 28388,
  28395, 28396, 28422, 28425, 28435, 28444, 28449, 28450, 28452, 28460, 28468, 28492, 28494, 28524, 28532, 28540, 28550, 28557, 28564, 28572, 28580, 28588, 28594, 28596, 28612,
  28628, 28660, 28668, 28675, 28676, 28677, 28684, 28714, 28716, 28724, 28732, 28737, 28746, 28749, 28773, 28780, 28788, 28791, 28796, 28804, 28818, 28845, 28850, 28868, 28892,
  28924, 28926, 28932, 28935, 28940, 28959, 28962, 28964, 28975, 28996, 29004, 29020, 29034, 29043, 29044, 29060, 29076, 29084, 29092, 29095, 29097, 29108, 29116, 29142, 29151,
  29156, 29164, 29169, 29178, 29180, 29212, 29244, 29252, 29253, 29276, 29286, 29292, 29308, 29350, 29356, 29364, 29367, 29372, 29420, 29421, 29425, 29428, 29435, 29444, 29452,
  29466, 29468, 29492, 29508, 29516, 29529, 29548, 29564, 29583, 29588, 29602, 29604, 29612, 29620, 29636, 29637, 29650, 29660, 29676, 29684, 29692, 29708, 29724, 29725, 29740,
  29745, 29756, 29764, 29775, 29780, 29788, 29812, 29826, 29852, 29853, 29860, 29884, 29913, 29932, 29934, 29950, 29972, 29975, 29980, 30004, 30006, 30036, 30042, 30050, 30052,
  30069, 30075, 30076, 30082, 30086, 30118, 30124, 30153, 30172, 30175, 30177, 30220, 30246, 30252, 30284, 30285, 30350, 30372, 30388, 30393, 30404, 30411, 30436, 30447, 30452,
  30460, 30468, 30474, 30476, 30478, 30508, 30516, 30524, 30532, 30546, 30548, 30573, 30582, 30588, 30604, 30609, 30612, 30620, 30627, 30634, 30644, 30650, 30652, 30674, 30675,
  30681, 30682, 30684, 30716, 30734, 30762, 30771, 30788, 30836, 30844, 30850, 30860, 30879, 30884, 30916, 30926, 30927, 30933, 30948, 30950, 30951, 30956, 30978, 30980, 30987,
  30988, 31004, 31014, 31017, 31046, 31052, 31060, 31066, 31075, 31076, 31084, 31092, 31095, 31115, 31116, 31124, 31132, 31148, 31180, 31194, 31196, 31204, 31228, 31244, 31252,
  31257, 31276, 31308, 31324, 31329, 31338, 31340, 31348, 31396, 31404, 31407, 31420, 31436, 31437, 31444, 31446, 31452, 31473, 31484, 31527, 31545, 31550, 31554, 31564, 31575,
  31580, 31588, 31596, 31612, 31636, 31652, 31660, 31662, 31675, 31684, 31689, 31702, 31707, 31713, 31756, 31764, 31775, 31828, 31844, 31868, 31876, 31884, 31905, 31908, 31916,
  31924, 31940, 31956, 31958, 31959, 31964, 31974, 31986, 31988, 31996, 32012, 32020, 32050, 32052, 32065, 32067, 32079, 32084, 32092, 32094, 32095, 32108, 32121, 32124, 32132,
  32140, 32150, 32166, 32180, 32188, 32196, 32202, 32204, 32228, 32244, 32252, 32260, 32268, 32283, 32284, 32301, 32307, 32308, 32316, 32325, 32332, 32350, 32380, 32388, 32391,
  32409, 32418, 32420, 32438, 32475, 32476, 32484, 32499, 32516, 32524, 32532, 32540, 32548, 32556, 32564, 32572, 32596, 32598, 32612, 32628, 32636, 32650, 32661, 32674, 32683,
  32692, 32715, 32740, 32748, 32756, 32769, 32772, 32781, 32786, 32788, 32798, 32799, 32804, 32812, 32814, 32823, 32825, 32828, 32852, 32877, 32892, 32908, 32925, 32949, 32950,
  32958, 32985, 32988, 32996, 33003, 33004, 33026, 33028, 33036, 33044, 33050, 33068, 33111, 33116, 33140, 33147, 33154, 33196, 33204, 33236, 33246, 33255, 33260, 33284, 33308,
  33324, 33325, 33332, 33340, 33356, 33363, 33364, 33369, 33380, 33388, 33404, 33417, 33425, 33428, 33436, 33468, 33484, 33489, 33492, 33498, 33532, 33564, 33573, 33596, 33604,
  33606, 33612, 33628, 33633, 33635, 33636, 33638, 33644, 33650, 33652, 33663, 33668, 33678, 33687, 33714, 33725, 33741, 33761, 33764, 33786, 33795, 33812, 33822, 33828, 33836,
  33850, 33860, 33884, 33892, 33916, 33932, 33934, 33940, 33956, 33964, 33969, 33980, 33988, 33996, 34002, 34006, 34012, 34028, 34029, 34036, 34044, 34065, 34076, 34083, 34102,
  34116, 34119, 34124, 34138, 34150, 34180, 34196, 34202, 34204, 34212, 34218, 34225, 34228, 34244, 34245, 34251, 34268, 34275, 34281, 34284, 34299, 34307, 34316, 34326, 34332,
  34348, 34372, 34412, 34420, 34434, 34443, 34444, 34460, 34461, 34468, 34475, 34484, 34532, 34548, 34550, 34551, 34556, 34575, 34594, 34604, 34605, 34612, 34628, 34636, 34644,
  34645, 34660, 34725, 34732, 34758, 34764, 34794, 34810, 34814, 34820, 34821, 34836, 34844, 34868, 34908, 34925, 34940, 34947, 34969, 34972, 34996, 35004, 35036, 35037, 35050,
  35060, 35068, 35075, 35082, 35091, 35092, 35108, 35118, 35124, 35133, 35164, 35180, 35182, 35188, 35204, 35211, 35236, 35252, 35258, 35268, 35301, 35372, 35404, 35415, 35427,
  35428, 35433, 35436, 35450, 35469, 35484, 35492, 35514, 35516, 35524, 35540, 35556, 35564, 35577, 35594, 35596, 35612, 35622, 35628, 35631, 35636, 35652, 35660, 35668, 35684,
  35695, 35708, 35740, 35756, 35766, 35780, 35788, 35793, 35812, 35819, 35847, 35874, 35908, 35919, 35924, 35932, 35946, 35950, 35956, 35966, 35973, 35982, 35988, 35997, 36012,
  36020, 36025, 36054, 36058, 36068, 36076, 36081, 36092, 36113, 36124, 36132, 36148, 36166, 36179, 36188, 36198, 36212, 36220, 36228, 36276, 36279, 36284, 36292, 36297, 36306,
  36308, 36316, 36332, 36333, 36350, 36351, 36356, 36387, 36388, 36404, 36421, 36425, 36428, 36444, 36452, 36460, 36476, 36484, 36486, 36492, 36495, 36518, 36522, 36524, 36525,
  36542, 36549, 36554, 36567, 36572, 36588, 36596, 36620, 36621, 36650, 36668, 36676, 36702, 36716, 36732, 36772, 36783, 36788, 36804, 36825, 36842, 36844, 36868, 36873, 36892,
  36897, 36905, 36916, 36925, 36927, 36932, 36940, 36945, 36948, 36950, 36954, 36981, 36982, 36988, 36995, 36996, 37011, 37012, 37035, 37036, 37052, 37068, 37084, 37089, 37134,
  37142, 37148, 37150, 37156, 37196, 37204, 37210, 37220, 37228, 37242, 37252, 37281, 37305, 37308, 37316, 37340, 37359, 37388, 37389, 37412, 37420, 37425, 37428, 37446, 37452,
  37458, 37460, 37467, 37479, 37494, 37516, 37521, 37532, 37534, 37539, 37540, 37550, 37556, 37566, 37580, 37602, 37628, 37629, 37636, 37644, 37675, 37683, 37708, 37737, 37779,
  37780, 37782, 37796, 37804, 37850, 37863, 37876, 37924, 37925, 37948, 37956, 37972, 37994, 37998, 38004, 38007, 38020, 38028, 38034, 38036, 38050, 38068, 38092, 38108, 38116,
  38122, 38133, 38140, 38172, 38194, 38212, 38223, 38225, 38228, 38241, 38244, 38252, 38260, 38266, 38269, 38276, 38284, 38292, 38308, 38322, 38356, 38358, 38372, 38385, 38396,
  38428, 38436, 38444, 38450, 38466, 38468, 38508, 38538, 38548, 38564, 38574, 38588, 38604, 38619, 38620, 38636, 38650, 38652, 38655, 38660, 38661, 38668, 38684, 38686, 38692,
  38726, 38727, 38732, 38748, 38754, 38763, 38764, 38781, 38804, 38812, 38817, 38828, 38829, 38852, 38871, 38898, 38906, 38908, 38924, 38979, 38980, 38997, 39012, 39020, 39028,
  39036, 39044, 39052, 39075, 39084, 39087, 39092, 39108, 39146, 39159, 39172, 39188, 39196, 39222, 39225, 39236, 39252, 39298, 39303, 39308, 39326, 39350, 39364, 39388, 39411,
  39412, 39429, 39446, 39452, 39460, 39465, 39476, 39524, 39543, 39567, 39572, 39580, 39588, 39596, 39612, 39645, 39652, 39654, 39668, 39684, 39726, 39735, 39740, 39748, 39753,
  39756, 39772, 39812, 39828, 39834, 39836, 39837, 39843, 39844, 39850, 39860, 39861, 39876, 39908, 39916, 39932, 39940, 39948, 39951, 39956, 39964, 39972, 39978, 39980, 39988,
  40004, 40012, 40033, 40053, 40060, 40071, 40076, 40077, 40082, 40084, 40108, 40116, 40124, 40132, 40164, 40196, 40220, 40221, 40228, 40252, 40266, 40292, 40302, 40308, 40324,
  40332, 40340, 40374, 40383, 40388, 40401, 40414, 40436, 40450, 40452, 40468, 40476, 40484, 40491, 40492, 40509, 40516, 40518, 40535, 40540, 40550, 40575, 40580, 40588, 40599,
  40628, 40668, 40678, 40684, 40692, 40719, 40732, 40733, 40748, 40756, 40761, 40780, 40804, 40806, 40815, 40825, 40828, 40833, 40842, 40852, 40868, 40869, 40876, 40884, 40914,
  40916, 40924, 40948, 40956, 40975, 40977, 40995, 40996, 41025, 41031, 41038, 41044, 41050, 41058, 41060, 41062, 41075, 41108, 41116, 41139, 41150, 41164, 41166, 41188, 41193,
  41196, 41209, 41211, 41228, 41258, 41260, 41274, 41276, 41301, 41307, 41308, 41334, 41346, 41350, 41355, 41380, 41388, 41396, 41404, 41409, 41444, 41450, 41452, 41463, 41468,
  41481, 41484, 41516, 41517, 41524, 41525, 41532, 41556, 41562, 41571, 41572, 41588, 41598, 41601, 41604, 41612, 41620, 41628, 41636, 41643, 41644, 41660, 41668, 41679, 41684,
  41692, 41740, 41764, 41780, 41788, 41804, 41825, 41866, 41884, 41892, 41924, 41932, 41949, 41950, 41956, 41972, 41980, 41988, 41994, 42003, 42025, 42044, 42068, 42076, 42081,
  42092, 42102, 42129, 42132, 42138, 42148, 42164, 42165, 42172, 42175, 42183, 42188, 42194, 42204, 42212, 42220, 42238, 42244, 42246, 42260, 42291, 42292, 42308, 42316, 42318,
  42324, 42332, 42345, 42348, 42381, 42396, 42399, 42412, 42426, 42434, 42436, 42468, 42492, 42543, 42548, 42564, 42572, 42575, 42580, 42596, 42598, 42620, 42644, 42650, 42651,
  42676, 42678, 42684, 42692, 42708, 42716, 42724, 42740, 42757, 42775, 42786, 42788, 42796, 42813, 42820, 42825, 42850, 42852, 42858, 42860, 42867, 42868, 42884, 42894, 42908,
  42921, 42925, 42926, 42939, 42950, 42955, 42964, 42972, 42988, 42996, 43002, 43004, 43022, 43028, 43029, 43052, 43060, 43071, 43074, 43108, 43116, 43132, 43150, 43172, 43175,
  43182, 43204, 43220, 43228, 43244, 43252, 43268, 43275, 43276, 43284, 43292, 43299, 43318, 43356, 43364, 43371, 43372, 43378, 43396, 43398, 43404, 43414, 43461, 43476, 43484,
  43492, 43506, 43508, 43515, 43533, 43569, 43572, 43580, 43588, 43604, 43614, 43623, 43628, 43641, 43644, 43652, 43676, 43677, 43681, 43684, 43695, 43706, 43716, 43724, 43731,
  43772, 43775, 43802, 43803, 43804, 43844, 43850, 43852, 43866, 43868, 43876, 43908, 43924, 43925, 43938, 43947, 43964, 43988, 43996, 44002, 44019, 44036, 44042, 44046, 44050,
  44051, 44052, 44060, 44068, 44075, 44076, 44084, 44092, 44116, 44124, 44140, 44150, 44163, 44164, 44165, 44204, 44206, 44212, 44225, 44260, 44262, 44278, 44292, 44324, 44343,
  44345, 44350, 44356, 44364, 44396, 44403, 44404, 44406, 44412, 44420, 44428, 44444, 44508, 44514, 44516, 44564, 44572, 44586, 44588, 44595, 44612, 44628, 44667, 44668, 44716,
  44724, 44732, 44740, 44756, 44780, 44785, 44786, 44795, 44796, 44804, 44811, 44812, 44825, 44828, 44836, 44860, 44865, 44868, 44876, 44890, 44908, 44924, 44932, 44948, 44973,
  44996, 45020, 45052, 45054, 45068, 45075, 45076, 45123, 45124, 45129, 45132, 45164, 45172, 45177, 45178, 45204, 45212, 45227, 45228, 45236, 45243, 45297, 45308, 45332, 45340,
  45348, 45350, 45364, 45369, 45374, 45378, 45380, 45388, 45405, 45428, 45436, 45452, 45460, 45477, 45484, 45494, 45508, 45513, 45516, 45524, 45525, 45548, 45550, 45556, 45558,
  45564, 45567, 45604, 45620, 45621, 45636, 45652, 45662, 45676, 45702, 45716, 45717, 45725, 45740, 45764, 45766, 45774, 45796, 45801, 45812, 45836, 45837, 45844, 45852, 45860,
  45876, 45882, 45908, 45916, 45918, 45925, 45940, 45945, 45950, 45975, 45996, 45999, 46011, 46026, 46028, 46036, 46052, 46084, 46101, 46107, 46124, 46132, 46148, 46156, 46161,
  46164, 46179, 46180, 46212, 46220, 46222, 46225, 46236, 46244, 46252, 46255, 46268, 46269, 46276, 46287, 46292, 46306, 46324, 46341, 46356, 46364, 46389, 46395, 46396, 46412,
  46422, 46425, 46444, 46449, 46450, 46485, 46492, 46516, 46524, 46546, 46556, 46557, 46564, 46569, 46572, 46588, 46593, 46599, 46604, 46612, 46636, 46638, 46647, 46652, 46660,
  46668, 46674, 46676, 46684, 46706, 46732, 46755, 46772, 46780, 46795, 46809, 46820, 46828, 46850, 46863, 46884, 46892, 46916, 46917, 46932, 46940, 46942, 46962, 46964, 46971,
  46982, 46988, 46996, 47004, 47020, 47028, 47036, 47044, 47050, 47076, 47084, 47089, 47092, 47106, 47140, 47148, 47164, 47172, 47178, 47188, 47241, 47275, 47276, 47295, 47311,
  47313, 47316, 47325, 47350, 47364, 47367, 47372, 47394, 47403, 47404, 47420, 47425, 47428, 47444, 47492, 47516, 47524, 47526, 47540, 47572, 47575, 47596, 47604, 47620, 47637,
  47644, 47646, 47650, 47660, 47668, 47674, 47691, 47716, 47726, 47745, 47780, 47788, 47795, 47826, 47828, 47835, 47852, 47853, 47860, 47862, 47868, 47889, 47932, 47934, 47937,
  47943, 47956, 47961, 47971, 47972, 47974, 47975, 47980, 48004, 48012, 48036, 48051, 48052, 48068, 48074, 48075, 48078, 48084, 48092, 48105, 48116, 48118, 48124, 48156, 48158,
  48175, 48186, 48188, 48212, 48213, 48220, 48225, 48228, 48236, 48244, 48252, 48265, 48267, 48268, 48294, 48308, 48316, 48324, 48332, 48340, 48350, 48364, 48366, 48374, 48393,
  48402, 48447, 48460, 48461, 48474, 48508, 48524, 48532, 48548, 48550, 48556, 48582, 48588, 48598, 48604, 48612, 48657, 48676, 48684, 48699, 48716, 48724, 48726, 48734, 48740,
  48748, 48764, 48772, 48796, 48798, 48820, 48834, 48836, 48841, 48850, 48861, 48868, 48876, 48892, 48902, 48915, 48916, 48932, 48940, 48942, 48948, 48988, 49011, 49023, 49075,
  49084, 49092, 49095, 49116, 49122, 49131, 49132, 49148, 49149, 49150, 49158, 49172, 49175, 49179, 49180, 49185, 49188, 49197, 49225, 49228, 49244, 49252, 49257, 49268, 49276,
  49294, 49332, 49338, 49340, 49396, 49401, 49412, 49436, 49444, 49460, 49468, 49482, 49484, 49524, 49539, 49540, 49548, 49550, 49554, 49556, 49575, 49581, 49596, 49612, 49617,
  49628, 49668, 49676, 49724, 49726, 49756, 49772, 49775, 49796, 49806, 49836, 49844, 49850, 49876, 49882, 49884, 49887, 49908, 49924, 49941, 49986, 49996 ];;

idstodo := [ [ 5, 1, 9, 6, 3, 7, 8, 2, 10, 13, 14, 11, 12, 4 ], [ 5, 1, 6, 7, 3, 8, 9, 2, 10, 13, 11, 12, 16, 14, 15, 4 ], [ 5, 1, 6, 3, 7, 8, 2, 9, 12, 10, 11, 4 ],
  [ 1, 3, 5, 2, 6, 4 ], [ 5, 1, 6, 3, 7, 8, 9, 2, 13, 10, 11, 12, 4 ], [ 5, 1, 6, 3, 7, 8, 2, 9, 12, 10, 11, 4 ], [ 5, 1, 6, 7, 3, 8, 9, 2, 10, 11, 12, 13, 16, 14, 15, 4 ],
  [ 1, 3, 5, 2, 6, 4 ], [ 5, 1, 6, 7, 3, 8, 9, 2, 10, 11, 12, 13, 16, 14, 15, 4 ], [ 1, 3, 2, 4 ], [ 5, 1, 6, 3, 7, 8, 2, 9, 12, 11, 10, 4 ],
  [ 5, 1, 6, 3, 7, 8, 9, 2, 13, 10, 11, 12, 4 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 12, 9, 11, 10 ], [ 1, 3, 2, 5, 4, 6, 7 ], [ 1, 5, 3, 6, 2, 7, 8, 9, 10, 4, 15, 12, 11, 13, 14 ],
  [ 1, 5, 3, 6, 7, 2, 8, 9, 10, 4, 11, 12, 14, 13, 15, 16, 17, 21, 18, 19, 20 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 11, 12, 13, 16, 15, 14 ],
  [ 1, 5, 3, 6, 2, 7, 8, 4, 12, 9, 11, 10 ], [ 1, 3, 2, 4 ], [ 1, 3, 2, 5, 4, 6 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 11, 12, 13, 16, 15, 14 ], [ 1, 3, 2, 4 ],
  [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 11, 12, 14, 15 ], [ 1, 3, 2, 4 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 5, 4, 6 ],
  [ 1, 3, 2, 5, 4, 6 ], [ 1, 5, 3, 6, 2, 7, 8, 9, 4, 13, 10, 12, 11 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 5, 4, 6 ],
  [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 11, 12, 14, 15 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 10, 4, 11, 16, 17, 21, 12, 14, 13, 15, 18, 19, 20 ],
  [ 1, 3, 2, 4 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 4 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 12, 11, 14, 15 ], [ 1, 3, 2, 5, 4, 6 ],
  [ 1, 5, 3, 6, 2, 7, 8, 9, 4, 13, 10, 11, 12 ], [ 1, 3, 2, 4 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 5, 4, 6 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ],
  [ 1, 3, 2, 4 ], [ 1, 3, 2, 5, 4, 6 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 11, 12, 14, 15 ], [ 1, 5, 3, 6, 2, 7, 8, 9, 10, 4, 15, 11, 12, 13, 14 ],
  [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 5, 4, 6, 7 ], [ 1, 3, 2, 4 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 5, 4, 6 ],
  [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 12, 11, 14, 15 ], [ 1, 5, 3, 6, 2, 7, 8, 9, 4, 13, 10, 12, 11 ], [ 1, 3, 2, 4 ], [ 1, 3, 2, 4 ],
  [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 12, 11, 14, 15 ], [ 1, 5, 3, 6, 2, 7, 8, 9, 4, 13, 10, 12, 11 ],
  [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 11, 12, 14, 15 ], [ 1, 5, 3, 6, 2, 7, 8, 10, 9, 11, 4, 17, 12, 13, 15, 14, 16 ], [ 1, 5, 3, 6, 2, 7, 8, 9, 10, 4, 15, 11, 12, 13, 14 ],
  [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ], [ 1, 3, 2, 4 ], [ 1, 3, 2, 5, 4, 6, 7 ], [ 1, 5, 3, 6, 2, 7, 8, 4, 9, 12, 10, 11 ],
  [ 1, 3, 2, 4 ], [ 1, 3, 2, 4 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 4, 10, 13, 16, 12, 11, 14, 15 ], [ 1, 5, 3, 6, 7, 2, 8, 9, 10, 4, 11, 16, 17, 21, 12, 14, 13, 15, 18, 19, 20 ],
  [ 1, 3, 2, 4 ] ];;

  # functions to convert AllSOTGroups output into SGL ordering
  SOTRec.SGLordered := function(arg)
    local n, i, group, groups, pos;
      if Length(arg) = 1 then
        n := arg[1];
        if n in ordstodo then
          pos := Position(ordstodo, n);;
          groups := List(ids[pos], x->AllSOTGroups(n)[x]);;
        fi;
        return groups;
      elif Length(arg) = 2 then
        n := arg[1];
        if n in ordstodo then
          pos := Position(ordstodo, n);;
          i := idstodo[pos][arg[2]];
          group := SOTGroup(n, i);;
          return group;
        else return false;
        fi;
      else return false;
      fi;
    end;

testtranslation:=function()
  local groups, sglids, n;
    groups := List([1..69], i->List(idstodo[i], x->AllSOTGroups(ordstodo[i])[x]));;
    sglids := List([1..69], i->List(groups[i], x->IdGroup(x)[2]));;
    return sglids = List([1..69], i->[1..NumberOfSOTGroups(ordstodo[i])]);
  end;
