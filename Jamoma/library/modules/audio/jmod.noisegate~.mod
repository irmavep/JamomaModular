max v2;
#N vpatcher 62 77 980 472;
#P hidden inlet 82 -20 13 0;
#P hidden outlet 162 69 13 0;
#P window setfont "Sans Serif" 9.;
#P message 108 118 50 196617 /autodoc;
#P comment 206 43 22 196617 ms;
#B frgb 172 172 172;
#P comment 85 42 39 196617 dB;
#B frgb 172 172 172;
#P comment 85 26 39 196617 samps;
#B frgb 172 172 172;
#P number 53 41 35 9 -90 24 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P objectname THRESHOLD;
#P newex 532 114 86 196617 pvar THRESHOLD;
#P window linecount 3;
#P newex 532 137 312 196617 jmod.parameter.mxt $0_ /threshold @type msg_int @ramp 1 @repetitions 0 @range -90 24 @clipmode both @description "The threshold sets the level at which the Noise Gate opens and closes..";
#P objectname jmod.parameter[4];
#P window linecount 1;
#P comment 1 41 58 196617 Threshold;
#B frgb 172 172 172;
#P window linecount 3;
#P newex 532 301 340 196617 jmod.parameter.mxt $0_ /release @type msg_int @ramp 1 @repetitions 0 @range 0 1000 @clipmode both @description "When the gate closes\\\, this parameter sets how many milliseconds it will take to fade out.";
#P objectname jmod.parameter[3];
#P window linecount 1;
#P newex 532 278 73 196617 pvar RELEASE;
#P number 172 42 35 9 0 1000 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P objectname RELEASE;
#P comment 127 43 48 196617 Release;
#B frgb 172 172 172;
#P comment 206 27 22 196617 ms;
#B frgb 172 172 172;
#P window linecount 3;
#P newex 532 221 335 196617 jmod.parameter.mxt $0_ /attack @type msg_int @ramp 1 @repetitions 0 @range 0 1000 @clipmode low @description "When the gate opens\\\, this parameter sets how many milliseconds it will take to fade in.";
#P objectname jmod.parameter[2];
#P window linecount 1;
#P newex 532 198 72 196617 pvar ATTACK;
#N vpatcher 541 70 948 425;
#P window setfont "Sans Serif" 9.;
#P window linecount 0;
#P newex 50 77 31 196617 == 0;
#P newex 50 176 45 196617 jit.qball;
#P newex 50 153 40 196617 change;
#P message 225 195 93 196617 brgb 100 100 100;
#P newex 225 166 32 196617 sel 0;
#P newex 225 141 54 196617 dspstate~;
#P window linecount 1;
#P newex 50 104 149 196617 gate;
#P newex 50 54 110 196617 r $0__freeze_display;
#P newex 50 198 41 196617 sel 0 1;
#P message 65 253 69 196617 brgb 0 220 0;
#P message 50 231 81 196617 brgb 200 20 20;
#P newex 50 129 111 196617 jmod.oscroute /active;
#P inlet 189 34 15 0;
#P outlet 50 290 15 0;
#P connect 6 0 13 0;
#P connect 13 0 7 0;
#P connect 7 0 2 0;
#P connect 2 0 11 0;
#P connect 11 0 12 0;
#P connect 12 0 5 0;
#P connect 5 0 3 0;
#P connect 3 0 0 0;
#P connect 4 0 0 0;
#P connect 10 0 0 0;
#P connect 5 1 4 0;
#P connect 1 0 7 1;
#P connect 8 0 9 0;
#P connect 9 0 10 0;
#P pop;
#P newobj 381 283 58 196617 p visualize;
#P newex 381 305 67 196617 pvar ACTIVE;
#P user panel 234 32 16 16;
#X brgb 100 100 100;
#X frgb 0 0 0;
#X border 0;
#X rounded 50;
#X shadow 0;
#X done;
#P objectname ACTIVE;
#P number 172 25 35 9 0 1000 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P objectname ATTACK;
#P window linecount 2;
#P message 76 297 65 196617 \; max refresh;
#P window linecount 1;
#P newex 532 32 88 196617 pvar LOOKAHEAD;
#P window linecount 4;
#P newex 0 140 169 196617 jmod.hub $0_ jmod.noisegate~ $1 @size 1U-half @module_type audio @num_inputs 2 @num_outputs 2 @description "Mono noise gate.";
#P objectname jmod.hub;
#P window linecount 1;
#P comment 14 121 79 196617 command input;
#P inlet 0 121 13 0;
#P window linecount 2;
#P message 76 265 72 196617 \; jmod.init bang;
#P window linecount 3;
#P newex 173 140 79 196617 pattrstorage @autorestore 0 @savemode 0;
#X client_rect 34 59 730 530;
#X storage_rect 0 0 640 240;
#P objectname jmod.noisegate~;
#P hidden inlet 20 -20 13 0;
#P hidden outlet 243 69 13 0;
#P newex 532 54 299 196617 jmod.parameter.mxt $0_ /lookahead @type msg_int @ramp 1 @repetitions 0 @range 0 100 @clipmode low @description "How many samples to look ahead while monitoring incoming signal.";
#P objectname jmod.parameter[1];
#P window linecount 1;
#P comment 127 26 48 196617 Attack;
#B frgb 172 172 172;
#P number 53 24 35 9 0 1000 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;
#P objectname LOOKAHEAD;
#P comment 1 25 58 196617 Lookahead;
#B frgb 172 172 172;
#P newex 265 221 127 196617 poly~ jmod.noisegate~.alg;
#P hidden comment 15 -30 105 196617 ----signal inputs----;
#P outlet 0 282 13 0;
#P bpatcher 0 0 255 60 0 0 jmod.gui.mxt 0 $0_;
#P objectname jmod.gui.1Uh.a.stereo.mxt;
#P hidden comment 164 79 101 196617 ---signal output---;
#P hidden connect 10 0 1 0;
#P lcolor 6;
#P fasten 36 0 15 0 113 137 5 137;
#P connect 13 0 15 0;
#P fasten 4 2 2 0 386 261 5 261;
#P connect 15 0 2 0;
#P connect 38 0 1 1;
#P connect 11 0 15 1;
#P hidden fasten 4 0 1 2 270 250 424 250 424 -8 167 -8;
#P hidden connect 1 2 37 0;
#P connect 15 2 11 0;
#P hidden fasten 4 1 1 3 328 245 418 245 418 -4 248 -4;
#P hidden connect 1 3 9 0;
#P hidden fasten 1 0 4 0 5 103 270 103;
#P lcolor 6;
#P fasten 15 1 4 0 84 206 270 206;
#P connect 4 2 21 0;
#P connect 21 0 20 0;
#P hidden fasten 1 1 4 1 86 98 387 98;
#P fasten 8 0 16 0 537 98 527 98 527 28 537 28;
#P connect 16 0 8 0;
#P fasten 30 0 31 0 537 181 526 181 526 105 537 105;
#P connect 31 0 30 0;
#P fasten 23 0 22 0 537 266 525 266 525 195 537 195;
#P connect 22 0 23 0;
#P fasten 28 0 27 0 537 346 524 346 524 271 537 271;
#P connect 27 0 28 0;
#P pop;
