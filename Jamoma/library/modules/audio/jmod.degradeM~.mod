max v2;
#N vpatcher 486 221 1032 805;
#P window setfont "Sans Serif" 9.;
#P hidden message 107 158 50 196617 /autodoc;
#P window setfont Verdana 9.;
#P window linecount 2;
#P hidden message 57 487 68 472055817 \; max refresh;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P hidden newex 19 377 71 196617 pvar BitDepth;
#P hidden newex 19 298 85 196617 pvar SampleRate;
#P window setfont Verdana 9.;
#P window linecount 2;
#P hidden message 134 487 86 472055817 \; jmod.init bang;
#P window setfont "Sans Serif" 9.;
#P window linecount 3;
#P hidden newex 291 180 79 196617 pattrstorage @autorestore 0 @savemode 0;
#X client_rect 14 59 654 299;
#X storage_rect 0 0 640 240;
#P objectname jmod.degradeM~;
#P flonum 104 23 40 9 0. 1. 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P objectname SampleRate;
#P window linecount 1;
#P hidden comment 210 111 101 196617 ---signal output---;
#P hidden comment 18 154 79 196617 command input;
#P window linecount 2;
#P hidden newex 19 320 405 196617 jmod.parameter.mxt $0_ /sr_ratio @type msg_float @range 0. 1. @clipmode both @ramp 1 @description "A ratio of the emulated sample-rate to the global sample-rate.";
#P objectname jmod.parameter.mxb[1];
#P window linecount 3;
#P hidden newex 19 401 344 196617 jmod.parameter.mxt $0_ /bitdepth @type msg_int @range 1 24 @clipmode both @ramp 1 @repetitions 0 @description "The number of bits that will be retained in each sample - use this for bit crunching effects.";
#P objectname jmod.parameter.mxb;
#P hidden newex 4 180 282 196617 jmod.hub $0_ jmod.degradeM~ @size 1U-half @module_type audio @num_inputs 1 @num_outputs 1 @description "Emulate the use of lower sample-rates and bit-resolution";
#P objectname jmod.hub;
#P hidden inlet 11 -24 15 0;
#P window linecount 1;
#P comment 54 42 53 196617 Bit depth;
#B frgb 172 172 172;
#P flonum 104 40 40 9 1. 24. 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P objectname BitDepth;
#P comment 16 25 85 196617 sample rate ratio;
#B frgb 172 172 172;
#P window linecount 2;
#P hidden newex 349 252 98 196617 poly~ jmod.degradeM~.alg;
#P window linecount 1;
#P hidden comment 33 -23 105 196617 ----signal input----;
#P hidden outlet 4 249 15 0;
#P hidden outlet 246 94 15 0;
#P hidden inlet 4 154 13 0;
#P bpatcher 0 0 256 60 0 0 jmod.gui.mxt 0 $0_;
#P objectname jmod.gui.1Uh.a.stereo.mxt;
#P hidden connect 9 0 0 0;
#P lcolor 6;
#P hidden connect 1 0 10 0;
#P hidden fasten 21 0 10 0 112 176 9 176;
#P hidden connect 10 0 3 0;
#P hidden fasten 12 0 18 0 24 353 11 353 11 293 24 293;
#P hidden connect 18 0 12 0;
#P hidden fasten 11 0 19 0 24 446 11 446 11 373 24 373;
#P hidden connect 19 0 11 0;
#P hidden fasten 5 0 0 1 354 287 453 287 453 -7 251 -7;
#P hidden connect 0 1 2 0;
#P hidden connect 16 0 10 1;
#P hidden connect 10 2 16 0;
#P hidden fasten 0 0 5 0 5 134 354 134;
#P lcolor 6;
#P hidden fasten 10 1 5 0 145 246 354 246;
#P pop;
