max v2;
#N vpatcher 15 44 627 289;
#P window setfont "Sans Serif" 9.;
#P hidden comment 14 119 79 196617 command input;
#P hidden inlet 0 119 13 0;
#P hidden message 115 135 74 196617 store 1 \, write;
#P hidden message 418 164 72 196617 \; jmod.init bang;
#P hidden newex 115 152 65 196617 pattrstorage;
#X client_rect 10 59 650 299;
#X storage_rect 0 0 640 240;
#P objectname degrade;
#P hidden inlet 20 -22 13 0;
#P hidden outlet 164 65 13 0;
#P flonum 104 23 40 9 0. 1. 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P hidden newex 261 16 220 196617 jmod.parameter $0_ sr-ratio @ramp_enable 1;
#P objectname jmod.parameter;
#P hidden newex 261 37 294 196617 jmod.parameter $0_ bitdepth @ramp_enable 1 @filter_dupes 1;
#P objectname jmod.parameter[1];
#P hidden newex 0 138 112 196617 jmod.hub $0_ degrade @size 1U-half;
#P hidden inlet 82 -20 13 0;
#P comment 54 42 53 196617 Bit depth;
#B frgb 172 172 172;
#P number 104 40 35 9 1 24 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P comment 16 25 85 196617 sample rate ratio;
#B frgb 172 172 172;
#P hidden newex 263 185 88 196617 poly~ degrade.alg;
#P hidden comment 15 -32 105 196617 ----signal inputs----;
#P hidden outlet 0 174 13 0;
#P hidden outlet 246 65 13 0;
#P bpatcher 0 0 256 60 0 0 jmod.gui.1Uh.a.stereo.mxt 0 $0_;
#P objectname jmod.gui.1Uh.a.stereo.mxt;
#P hidden comment 164 77 101 196617 ---signal outputs---;
#P hidden connect 15 0 1 0;
#P lcolor 6;
#P hidden connect 19 0 10 0;
#P hidden connect 10 0 3 0;
#P hidden connect 9 0 1 1;
#P lcolor 6;
#P hidden connect 16 0 10 1;
#P hidden connect 12 0 13 0;
#P hidden connect 11 0 7 0;
#P hidden connect 18 0 16 0;
#P hidden connect 10 2 16 0;
#P hidden fasten 5 0 1 2 569 -19 169 -19;
#P hidden connect 1 2 14 0;
#P hidden fasten 5 1 1 3 307 207 561 207 561 -11 251 -11;
#P hidden connect 1 3 2 0;
#P hidden connect 13 0 12 0;
#P hidden connect 7 0 11 0;
#P hidden fasten 10 1 5 0 56 177 268 177;
#P hidden fasten 1 0 5 0 5 99 268 99;
#P lcolor 6;
#P hidden fasten 1 1 5 1 87 96 346 96;
#P lcolor 6;
#P pop;
