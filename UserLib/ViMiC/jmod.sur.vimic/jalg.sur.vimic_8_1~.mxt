max v2;#N vpatcher 45 44 1315 800;#P origin 88 -63;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 780 298 43 196617 \$1 500;#P newex 780 317 59 196617 line 10000;#P newex 674 164 27 196617 f;#P message 674 185 87 196617 /temperature \$1;#P newex 780 279 27 196617 i;#P message 780 338 68 196617 /airfilter \$1;#P newex 690 298 68 196617 jcom.miditoa;#P message 1019 164 101 196617 /Renderintervall \$1;#N vpatcher 20 74 620 474;#P outlet 233 233 15 0;#P inlet 229 76 15 0;#P connect 0 0 1 0;#P pop;#P newobj 658 514 67 196617 p VIPthrough;#P message 690 318 77 196617 /ReflGain 2 \$1;#P outlet 447 678 15 0;#P objectname out24;#P outlet 428 678 15 0;#P objectname out23;#P outlet 408 678 15 0;#P objectname out22;#P outlet 389 678 15 0;#P objectname out21;#P outlet 369 678 15 0;#P objectname out20;#P outlet 350 678 15 0;#P objectname out19;#P outlet 330 678 15 0;#P objectname out18;#P outlet 311 678 15 0;#P objectname out17;#P message 462 192 77 196617 /ReflGain 0 \$1;#P message 679 357 77 196617 /ReflGain 1 \$1;#N vpatcher 10 59 610 459;#P window setfont "Sans Serif" 9.;#P window linecount 1;#N vpatcher 572 182 1172 582;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 231 104 111 196617 /high_absorption 6 \$1;#P message 125 104 109 196617 /mid_absorption 6 \$1;#P window linecount 0;#P message 18 104 109 196617 /low_absorption 6 \$1;#P outlet 22 354 15 0;#P inlet 18 24 15 0;#P newex 18 44 349 196617 jcom.oscroute /low /mid /high /low_mid_frequency /mid_high_frequency;#P connect 1 0 0 0;#P connect 0 0 3 0;#P connect 3 0 2 0;#P connect 4 0 2 0;#P connect 5 0 2 0;#P connect 0 1 4 0;#P connect 0 2 5 0;#P pop;#P newobj 406 109 48 196617 p parser;#N vpatcher 536 180 1136 580;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 231 104 111 196617 /high_absorption 5 \$1;#P message 125 104 109 196617 /mid_absorption 5 \$1;#P window linecount 0;#P message 18 104 109 196617 /low_absorption 5 \$1;#P outlet 22 354 15 0;#P inlet 18 24 15 0;#P newex 18 44 349 196617 jcom.oscroute /low /mid /high /low_mid_frequency /mid_high_frequency;#P connect 1 0 0 0;#P connect 0 0 3 0;#P connect 5 0 2 0;#P connect 4 0 2 0;#P connect 3 0 2 0;#P connect 0 1 4 0;#P connect 0 2 5 0;#P pop;#P newobj 354 109 48 196617 p parser;#N vpatcher 536 180 1136 580;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 231 104 111 196617 /high_absorption 2 \$1;#P message 125 104 109 196617 /mid_absorption 2 \$1;#P window linecount 0;#P message 18 104 109 196617 /low_absorption 2 \$1;#P outlet 22 354 15 0;#P inlet 18 24 15 0;#P newex 18 44 349 196617 jcom.oscroute /low /mid /high /low_mid_frequency /mid_high_frequency;#P connect 1 0 0 0;#P connect 0 0 3 0;#P connect 3 0 2 0;#P connect 4 0 2 0;#P connect 5 0 2 0;#P connect 0 1 4 0;#P connect 0 2 5 0;#P pop;#P newobj 305 109 48 196617 p parser;#N vpatcher 536 180 1136 580;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 231 104 111 196617 /high_absorption 1 \$1;#P message 125 104 109 196617 /mid_absorption 1 \$1;#P window linecount 0;#P message 18 104 109 196617 /low_absorption 1 \$1;#P outlet 22 354 15 0;#P inlet 18 24 15 0;#P newex 18 44 349 196617 jcom.oscroute /low /mid /high /low_mid_frequency /mid_high_frequency;#P connect 1 0 0 0;#P connect 0 0 3 0;#P connect 5 0 2 0;#P connect 4 0 2 0;#P connect 3 0 2 0;#P connect 0 1 4 0;#P connect 0 2 5 0;#P pop;#P newobj 257 109 48 196617 p parser;#N vpatcher 536 180 1136 580;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 231 104 111 196617 /high_absorption 4 \$1;#P message 125 104 109 196617 /mid_absorption 4 \$1;#P window linecount 0;#P message 18 104 109 196617 /low_absorption 4 \$1;#P outlet 22 354 15 0;#P inlet 18 24 15 0;#P newex 18 44 349 196617 jcom.oscroute /low /mid /high /low_mid_frequency /mid_high_frequency;#P connect 1 0 0 0;#P connect 0 0 3 0;#P connect 3 0 2 0;#P connect 4 0 2 0;#P connect 5 0 2 0;#P connect 0 1 4 0;#P connect 0 2 5 0;#P pop;#P newobj 210 108 48 196617 p parser;#P outlet 469 242 15 0;#P newex 190 57 130 196617 jcom.oscroute /absorption;#P window linecount 0;#N vpatcher 620 130 1220 530;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 417 178 34 196617 3 \$1;#P message 378 179 34 196617 3 \$1;#P message 267 180 109 196617 /low_absorption 3 \$1;#P message 232 104 111 196617 /high_absorption 3 \$1;#P message 126 104 109 196617 /mid_absorption 3 \$1;#P window linecount 0;#P message 19 104 109 196617 /low_absorption 3 \$1;#P outlet 22 354 15 0;#P inlet 18 24 15 0;#P newex 18 44 349 196617 jcom.oscroute /low /mid /high /low_mid_frequency /mid_high_frequency;#P connect 1 0 0 0;#P connect 0 0 3 0;#P connect 5 0 2 0;#P connect 4 0 2 0;#P connect 3 0 2 0;#P connect 0 1 4 0;#P connect 0 2 5 0;#P pop;#P newobj 141 108 48 196617 p parser;#P newex 173 80 260 196617 jcom.oscroute /front /rear /left /right /floor /ceiling;#P outlet 210 241 15 0;#P inlet 188 31 15 0;#P connect 2 0 3 0;#P connect 4 0 2 0;#P connect 0 0 4 0;#P connect 2 1 6 0;#P connect 3 0 1 0;#P connect 6 0 1 0;#P connect 7 0 1 0;#P connect 8 0 1 0;#P connect 9 0 1 0;#P connect 10 0 1 0;#P connect 2 2 7 0;#P connect 2 3 8 0;#P connect 2 4 9 0;#P connect 2 5 10 0;#P fasten 4 1 5 0 315 77 474 77;#P pop;#P newobj 221 228 67 196617 p reflections;#N vpatcher 20 74 620 474;#P outlet 233 233 15 0;#P inlet 229 76 15 0;#P connect 0 0 1 0;#P pop;#P newobj 471 363 52 196617 p through;#N vpatcher 10 59 610 459;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P message 291 157 100 196617 /SourceEleAngle \$1;#P window linecount 0;#P message 187 157 102 196617 /SourceAziAngle \$1;#P newex 187 95 168 196617 jcom.oscroute /azimuth /elevation;#P outlet 187 272 15 0;#P inlet 187 73 15 0;#P connect 0 0 2 0;#P connect 2 0 3 0;#P connect 4 0 1 0;#P connect 3 0 1 0;#P connect 2 1 4 0;#P pop;#P newobj 601 283 67 196617 p orientation;#N vpatcher 241 89 1003 782;#P window setfont "Sans Serif" 9.;#P newex 253 140 73 196617 jcom.aed2xyz;#P message 426 192 147 196617 /SourcePosAbsolute \$1 \$2 \$3;#P message 158 200 121 196617 /SourceZposAbsolute \$1;#P message 157 181 122 196617 /SourceYposAbsolute \$1;#P message 157 164 122 196617 /SourceXposAbsolute \$1;#P newex 160 117 168 196617 jcom.oscroute /x /y /z /aed /xyz;#N vpatcher 20 74 620 474;#P outlet 233 233 15 0;#P inlet 229 76 15 0;#P connect 0 0 1 0;#P pop;#P newobj -3 221 52 196617 p through;#P message 200 85 108 196617 /SourcePos \$1 \$2 \$3;#P message 74 101 82 196617 /SourceZpos \$1;#P message 59 81 83 196617 /SourceYpos \$1;#P message 48 61 83 196617 /SourceXpos \$1;#P newex 48 41 164 196617 jcom.oscroute /x /y /z /absolute;#P inlet 426 19 15 0;#P inlet 48 21 15 0;#P outlet 106 361 15 0;#P fasten 13 0 8 0 431 224 2 224;#P connect 12 0 8 0;#P connect 11 0 8 0;#P connect 10 0 8 0;#P connect 7 0 8 0;#P connect 6 0 8 0;#P connect 5 0 8 0;#P connect 4 0 8 0;#P connect 1 0 3 0;#P connect 3 0 4 0;#P connect 3 1 5 0;#P connect 3 2 6 0;#P connect 8 0 0 0;#P connect 9 0 10 0;#P connect 9 1 11 0;#P connect 9 2 12 0;#P connect 3 3 9 0;#P connect 3 4 7 0;#P connect 9 3 14 0;#P connect 2 0 13 0;#P connect 14 0 13 0;#P connect 9 4 13 0;#P pop;#P newobj 473 289 53 196617 p position;#P message 943 164 72 196617 /Warnings \$1;#P newex 484 513 169 196617 jcom.oscroute /updaterate /update;#P newex 330 102 57 196617 s $0_reset;#B color 5;#P newex 612 59 61 196617 r $0_reset;#B color 5;#P newex 680 337 68 196617 jcom.miditoa;#P newex 464 172 68 196617 jcom.miditoa;#N vpatcher 29 44 1265 706;#P window setfont "Sans Serif" 9.;#P window linecount 0;#P message 845 257 78 196617 /RenderType 6;#P message 390 147 111 196617 /xfade/fadefunction 3;#P message 347 213 14 196617 3;#P message 328 261 117 196617 /xfade/fadefunction \$1;#P message 332 213 14 196617 2;#P message 314 213 14 196617 1;#P message 296 214 14 196617 0;#P newex 329 241 27 196617 i 0;#P newex 438 210 49 196617 delay 10;#P inlet 379 37 15 0;#P window linecount 1;#P message 1076 264 14 196617 5;#P message 764 256 78 196617 /RenderType 5;#P window linecount 0;#P message 273 147 111 196617 /xfade/fadefunction 2;#N vpatcher 10 59 610 459;#P inlet 222 83 15 0;#P outlet 217 238 15 0;#P connect 1 0 0 0;#P pop;#P newobj 593 358 37 196617 p thru;#N vpatcher 10 59 610 459;#P inlet 222 83 15 0;#P outlet 217 238 15 0;#P connect 1 0 0 0;#P pop;#P newobj 1 273 37 196617 p thru;#P window linecount 1;#P message 217 168 111 196617 /xfade/fadefunction 1;#P window linecount 0;#P newex 162 103 228 196617 sel cosine_squared cosine linear equal_power;#P window linecount 1;#P message 161 187 111 196617 /xfade/fadefunction 0;#P message 22 148 104 196617 /xfade/threshold \$1;#P window linecount 0;#P message 1 125 108 196617 /xfade/fadelength \$1;#P window linecount 1;#P newex 1 74 244 196617 jcom.oscroute /fadelength /threshold /fadefunction;#P newex 1 40 108 196617 jcom.oscroute /xfade;#P message 683 257 78 196617 /RenderType 4;#P message 1061 264 14 196617 4;#P window linecount 0;#P message 1046 265 14 196617 3;#P message 604 258 78 196617 /RenderType 3;#P newex 1001 219 43 196617 delay 5;#P message 1001 318 84 196617 /RenderType \$1;#P window linecount 1;#P message 1031 265 14 196617 2;#P window linecount 0;#P message 1016 265 14 196617 1;#P newex 1001 297 27 196617 i 1;#P window linecount 1;#P message 928 255 78 196617 /RenderType 0;#P message 526 260 78 196617 /RenderType 2;#P message 446 261 78 196617 /RenderType 1;#P newex 520 193 635 196617 sel ViMiC Panning X-fade X-fade-prime ViMiC_Filter Static mute unmute;#P inlet 1 18 15 0;#P outlet 1 557 15 0;#P connect 1 0 15 0;#P connect 15 0 16 0;#P connect 27 0 17 0;#P lcolor 6;#P connect 16 0 17 0;#P fasten 24 0 22 0 278 219 6 219;#P connect 17 0 22 0;#P connect 18 0 22 0;#P fasten 21 0 22 0 222 228 6 228;#P fasten 19 0 22 0 166 238 6 238;#P connect 35 0 22 0;#P connect 22 0 0 0;#P connect 23 0 0 0;#P connect 27 0 18 0;#P lcolor 6;#P connect 16 1 18 0;#P connect 20 0 19 0;#P connect 16 2 20 0;#P connect 20 1 21 0;#P connect 20 2 24 0;#P fasten 20 0 30 0 167 139 301 139;#P fasten 20 1 31 0 221 131 319 131;#P connect 29 0 33 0;#P connect 28 0 29 0;#P fasten 20 2 32 0 275 127 337 127;#P connect 32 0 29 1;#P connect 31 0 29 1;#P connect 30 0 29 1;#P connect 34 0 29 1;#P connect 20 3 34 0;#P connect 20 3 35 0;#P connect 27 0 28 0;#P lcolor 6;#P connect 2 0 3 0;#P fasten 15 1 2 0 104 62 525 62;#P connect 2 1 4 0;#P connect 36 0 23 0;#P connect 33 0 23 0;#P connect 3 0 23 0;#P connect 4 0 23 0;#P connect 11 0 23 0;#P connect 14 0 23 0;#P connect 5 0 23 0;#P fasten 9 0 23 0 1006 345 598 345;#P connect 25 0 23 0;#P connect 2 2 11 0;#P connect 2 3 14 0;#P connect 2 4 25 0;#P connect 2 5 36 0;#P connect 2 6 5 0;#P connect 2 7 10 0;#P connect 27 0 6 0;#P lcolor 6;#P connect 10 0 6 0;#P connect 6 0 9 0;#P connect 2 0 7 0;#P connect 13 0 6 1;#P connect 12 0 6 1;#P connect 7 0 6 1;#P connect 8 0 6 1;#P connect 26 0 6 1;#P connect 2 1 8 0;#P connect 2 2 12 0;#P connect 2 3 13 0;#P connect 2 4 26 0;#P pop;#P newobj 864 163 72 196617 p Rendermode;#N thispatcher;#Q end;#P newobj 389 102 57 196617 thispatcher;#B color 14;#N vpatcher 582 74 1220 574;#P origin -82 0;#P window setfont "Sans Serif" 9.;#P window linecount 0;#P message 54 202 23 196617 8 1;#P newex 67 438 55 196617 delay 500;#P button 67 416 15 0;#P outlet 67 468 15 0;#P newex 127 74 54 196617 onebang 1;#P message 283 187 14 196617 8;#P message 324 188 14 196617 1;#P newex 40 57 40 196617 t b b b;#P window linecount 2;#P newex -181 328 324 196617 sprintf ViMiC Module configured for %ld microphones. Order of Reflections is set to %ld . Please reset microphone settings manually.;#P window linecount 1;#P newex -181 361 54 196617 jcom.post;#P newex 157 308 400 196617 t i b i b;#N vpatcher 10 59 610 459;#P window setfont "Sans Serif" 9.;#P newex 192 161 27 196617 - 1;#P window linecount 1;#P newex 192 188 200 196617 sprintf script connect VIMIC %ld out%ld 0;#P window linecount 0;#P newex 197 128 40 196617 uzi;#P inlet 197 73 15 0;#P outlet 191 245 15 0;#P connect 3 0 0 0;#P connect 2 2 4 0;#P connect 4 0 3 0;#P connect 1 0 2 0;#P connect 2 2 3 1;#P pop;#P newobj 157 355 111 196617 p connect_from_vimic;#N vpatcher 595 437 1195 837;#P origin 0 -16;#P window setfont "Sans Serif" 9.;#P message 309 159 147 196617 script connect Vol0 0 VIMIC 0;#P newex 135 43 30 196617 t b b;#P message 98 158 185 196617 script connect main_through 0 VIMIC 0;#P outlet 94 296 15 0;#P inlet 133 21 15 0;#P connect 2 0 1 0;#P connect 4 0 1 0;#P connect 3 0 2 0;#P connect 0 0 3 0;#P connect 3 1 4 0;#P pop;#P newobj 287 355 98 196617 p connect_to_vimic;#N vpatcher 264 349 864 749;#P inlet 209 37 15 0;#P window setfont "Sans Serif" 9.;#P newex 226 109 27 196617 i 1;#P newex 57 67 27 196617 t i b;#P inlet 57 37 15 0;#P outlet 99 313 15 0;#P newex 88 198 346 196617 sprintf script new VIMIC newex 92 635 105 196617 VimicMax~ %ld %ld \;;#P connect 2 0 3 0;#P connect 3 0 0 0;#P connect 0 0 1 0;#P connect 3 1 4 0;#P connect 5 0 4 1;#P connect 4 0 0 1;#P pop;#P newobj 417 355 78 196617 p create_vimic;#N vpatcher 573 261 1173 661;#P window setfont "Sans Serif" 9.;#P message 108 136 96 196617 script delete VIMIC;#P outlet 108 266 15 0;#P inlet 108 69 15 0;#P connect 0 0 2 0;#P connect 2 0 1 0;#P pop;#P newobj 547 355 76 196617 p delete_vimic;#P newex 313 129 27 196617 t b i;#P newex 157 259 58 196617 unpack 8 1;#P newex 157 230 175 196617 if $i1 != $i3 || $i2 !=$i4 then $i1 $i2;#P window linecount 2;#P comment 252 47 134 196617 Changes can not take place while audio is running;#P window linecount 1;#P newex 98 120 31 196617 == 0;#P newex 157 204 47 196617 gate 1 0;#P newex 40 120 32 196617 sel 0;#P newex 40 87 54 196617 dspstate~;#P newex 185 172 27 196617 i 8;#P newex 185 90 266 196617 jcom.oscroute /microphones/amount /reflections/order;#P inlet 185 68 15 0;#P outlet 311 460 15 0;#P connect 10 0 18 0;#P connect 18 0 17 0;#P connect 22 0 19 0;#P connect 19 0 4 0;#P connect 4 0 5 0;#P connect 10 0 24 0;#P connect 24 0 25 0;#P connect 25 0 23 0;#P fasten 4 0 7 0 45 110 103 110;#P connect 2 0 22 0;#P connect 10 1 18 1;#P connect 7 0 6 0;#P connect 6 0 9 0;#P connect 26 0 10 0;#P connect 9 0 10 0;#P connect 10 0 16 0;#P connect 16 0 15 0;#P connect 1 0 2 0;#P connect 2 0 3 0;#P connect 5 0 3 0;#P connect 11 0 3 0;#P connect 3 0 6 1;#P connect 11 1 9 1;#P connect 21 0 9 2;#P fasten 10 0 9 2 162 281 354 281 354 220 272 220;#P connect 19 1 21 0;#P connect 16 1 14 0;#P connect 14 0 0 0;#P connect 13 0 0 0;#P connect 12 0 0 0;#P connect 15 0 0 0;#P connect 2 1 11 0;#P fasten 10 1 9 3 210 278 351 278 351 223 327 223;#P connect 20 0 9 3;#P connect 19 2 20 0;#P connect 16 2 13 0;#P connect 10 1 13 1;#P lcolor 9;#P connect 16 3 12 0;#P pop;#P newobj 330 80 58 196617 p scripting;#B color 14;#P outlet 292 678 15 0;#P objectname out16;#P outlet 273 678 15 0;#P objectname out15;#P outlet 253 678 15 0;#P objectname out14;#P outlet 234 678 15 0;#P objectname out13;#P outlet 214 678 15 0;#P objectname out12;#P outlet 195 678 15 0;#P objectname out11;#P outlet 175 678 15 0;#P objectname out10;#P outlet 156 678 15 0;#P objectname out9;#N vpatcher 177 44 1457 796;#P origin 0 32;#P window setfont "Sans Serif" 9.;#P window linecount 0;#P newex 819 186 51 196617 zl slice 1;#P newex 819 221 68 196617 jcom.miditoa;#P message 819 250 81 196617 /MicGain 99 \$1;#P message 392 108 123 196617 /3/directivity/ratio 0.4;#P inlet 195 16 15 0;#P outlet 254 487 15 0;#P window linecount 1;#P message 151 227 82 196617 /MicZpos 99 \$1;#P message 137 246 83 196617 /MicYpos 99 \$1;#P message 109 286 105 196617 /MicPos 99 \$1$2 \$3;#P message 431 203 102 196617 /MicAziAngle 99 \$1;#P newex 431 181 116 196617 route azimuth elevation;#P message 441 222 100 196617 /MicEleAngle 99 \$1;#P message 123 264 83 196617 /MicXpos 99 \$1;#P newex 51 261 59 196617 t b i;#P newex 227 348 187 196617 zl reg;#P message 261 429 31 196617 2 \$1;#P newex 227 451 44 196617 zl nth 2;#P message 625 207 96 196617 /Directivity 99 \$1;#P message 454 239 102 196617 /MicAngle 99 \$1 \$2;#P message 221 207 108 196617 /MicPos 99 \$1 \$2 \$3;#P newex 109 185 122 196617 route xyz x y z aed a e d;#P newex 207 98 115 196617 loadmess substitute " ";#P newex 625 183 56 196617 route ratio;#P newex 196 140 51 196617 zl slice 1;#P newex 237 161 789 196617 route position angle directivity gain;#P newex 196 119 66 196617 regexp /;#P fasten 2 0 12 0 201 162 56 162;#P fasten 1 0 5 0 242 181 114 181;#P connect 5 0 17 0;#P connect 5 1 13 0;#P connect 5 2 18 0;#P connect 5 3 19 0;#P connect 4 0 0 0;#P connect 21 0 0 0;#P connect 22 0 0 0;#P connect 0 0 2 0;#P connect 5 8 6 0;#P fasten 12 0 11 0 56 344 232 344;#P connect 11 0 9 0;#P connect 2 1 1 0;#P connect 9 1 20 0;#P connect 12 1 10 0;#P connect 10 0 9 1;#P fasten 17 0 11 1 114 338 409 338;#P fasten 13 0 11 1 128 338 409 338;#P fasten 18 0 11 1 142 339 409 339;#P fasten 19 0 11 1 156 338 409 338;#P fasten 16 0 11 1 436 260 409 260;#P fasten 14 0 11 1 446 262 409 262;#P fasten 7 0 11 1 459 261 409 261;#P fasten 6 0 11 1 226 224 409 224;#P fasten 8 0 11 1 630 262 409 262;#P fasten 23 0 11 1 824 277 409 277;#P connect 1 1 15 0;#P connect 15 0 16 0;#P connect 15 1 14 0;#P connect 15 2 7 0;#P connect 1 2 3 0;#P connect 3 0 8 0;#P connect 1 3 25 0;#P connect 25 1 24 0;#P connect 24 0 23 0;#P pop;#P newobj 1153 294 104 196617 p microphone-parser;#N vpatcher 20 74 620 474;#P inlet 212 39 15 0;#P outlet 207 215 15 0;#P connect 1 0 0 0;#P pop;#P newobj 803 195 52 196617 p through;#P outlet 135 678 15 0;#P objectname out8;#P outlet 116 678 15 0;#P objectname out7;#P outlet 96 678 15 0;#P objectname out6;#P outlet 77 678 15 0;#P objectname out5;#P outlet 57 678 15 0;#P objectname out4;#P outlet 38 678 15 0;#P objectname out3;#P outlet 18 678 15 0;#P objectname out2;#P outlet -1 678 15 0;#P objectname out1;#P message 738 164 61 196617 /Report \$1;#P newex 897 331 31 196617 float;#P newex 1031 325 56 196617 vexpr $f1;#P newex 986 277 31 196617 float;#P newex 857 273 31 196617 float;#P newex 403 269 31 196617 float;#P newex 238 355 56 196617 vexpr $f1;#P newex 238 334 31 196617 float;#P newex 237 311 31 196617 float;#P newex 238 282 31 196617 float;#N vpatcher 20 74 620 474;#P outlet 233 233 15 0;#P inlet 229 76 15 0;#P connect 0 0 1 0;#P pop;#P newobj 378 445 52 196617 p through;#P message 230 396 104 196617 /RoomSize \$1 \$2 \$3;#P message 280 337 83 196617 /RoomHeight \$1;#P message 280 318 80 196617 /RoomDepth \$1;#P message 280 298 80 196617 /RoomWidth \$1;#P newex 280 267 118 196617 jcom.oscroute /x /y /z;#N vpatcher 20 74 620 474;#P outlet 233 233 15 0;#P inlet 229 76 15 0;#P connect 0 0 1 0;#P pop;#P newobj 832 419 52 196617 p through;#P message 803 164 59 196617 /ReportAll;#P comment 689 233 67 196617 /reflections;#P window linecount 2;#P newex 680 248 159 196617 jcom.oscroute /1st/gain/midi /2nd/gain/midi /airfilter;#P window linecount 1;#P newex 473 247 203 196617 jcom.oscroute /position /gain /orientation;#P comment 482 232 45 196617 /source;#P message 1028 345 119 196617 /ArrayCenter \$1 \$2 \$3;#P message 897 352 115 196617 /MicCenterDistance \$1;#P newex 942 303 193 196617 jcom.oscroute /circle/diameter /center;#P message 1034 276 81 196617 /Directivity \$1;#P message 858 293 64 196617 /DirPow \$1;#P comment 864 233 80 196617 /microphones;#P newex 857 254 306 196617 jcom.oscroute /direct/power /array /directivity/ratio /amount;#P comment 290 232 49 196617 /room;#N vpatcher 20 74 620 474;#P window setfont "Sans Serif" 9.;#P newex 549 158 27 196617 t b l;#P inlet 549 30 15 0;#P window linecount 1;#N vpatcher 10 59 610 459;#P outlet 129 236 15 0;#P window setfont "Sans Serif" 9.;#P newex 129 93 27 196617 int;#P newex 129 73 84 196617 expr 1000.0/$f1;#P inlet 129 30 15 0;#P connect 0 0 1 0;#P connect 1 0 2 0;#P connect 2 0 3 0;#P pop;#P newobj 346 69 63 196617 p Hz_to_ms;#P inlet 445 30 15 0;#P inlet 346 30 15 0;#P window linecount 0;#P newex 273 117 70 196617 speedlim 100;#P newex 212 81 30 196617 t b l;#P inlet 212 30 15 0;#P outlet 232 213 15 0;#P comment 453 52 58 196617 bang from external source;#P comment 502 188 78 196617 Priority inlet;#P connect 3 0 4 0;#P connect 5 0 2 0;#P fasten 7 0 2 0 450 172 237 172;#P connect 10 1 2 0;#P connect 10 0 2 0;#P connect 4 1 2 0;#P connect 4 0 5 0;#P connect 8 0 5 1;#P connect 6 0 8 0;#P connect 9 0 10 0;#P pop;#P newobj 378 577 80 196617 p through&bang;#P objectname main_through;#P message 395 290 64 196617 /DisPow \$1;#P newex 280 247 181 196617 jcom.oscroute /size /distance/power;#P newex 302 143 756 196617 jcom.oscroute /room /microphones /source /direct/gain/midi /reflections /reverb /temperature /report /report_all /rendermode /warning /renderintervall;#P inlet 302 42 15 0;#P inlet -1 191 15 0;#P objectname Vol0;#P user panel 236 226 228 199;#X brgb 191 191 191;#X frgb 0 0 0;#X border 1;#X rounded 0;#X shadow 0;#X done;#P user panel 679 229 174 181;#X brgb 191 191 191;#X frgb 0 0 0;#X border 1;#X rounded 0;#X shadow 0;#X done;#P user panel 466 227 211 233;#X brgb 191 191 191;#X frgb 0 0 0;#X border 1;#X rounded 0;#X shadow 0;#X done;#P background;#P user panel 856 229 419 241;#X brgb 191 191 191;#X frgb 0 0 0;#X border 1;#X rounded 0;#X shadow 0;#X done;#P background;#P newex 24 634 105 196617 VimicMax~ 8 1;#P objectname VIMIC;#P connect 0 0 41 0;#P connect 0 1 42 0;#P connect 5 0 0 0;#P connect 10 0 0 0;#P connect 0 2 43 0;#P connect 0 3 44 0;#P connect 0 4 45 0;#P connect 0 5 46 0;#P connect 0 6 47 0;#P connect 0 7 48 0;#P connect 7 0 71 0;#P hidden connect 64 0 29 0;#P lcolor 6;#P connect 25 3 29 0;#P connect 34 0 29 0;#P connect 25 1 32 0;#P connect 25 0 31 0;#P connect 25 2 33 0;#P connect 25 3 34 0;#P connect 71 1 8 0;#P connect 8 0 25 0;#P connect 31 0 26 0;#P connect 32 0 27 0;#P connect 33 0 28 0;#P connect 6 0 7 0;#P connect 6 0 59 0;#P connect 59 0 65 0;#P connect 73 0 30 0;#P connect 9 0 30 0;#P connect 29 0 30 0;#P connect 28 0 30 0;#P connect 27 0 30 0;#P connect 26 0 30 0;#P connect 71 0 30 0;#P connect 30 0 10 0;#P fasten 24 0 10 0 837 554 383 554;#P connect 59 1 60 0;#P hidden connect 64 0 9 0;#P lcolor 6;#P connect 35 0 9 0;#P connect 66 0 10 1;#P connect 8 1 35 0;#P connect 66 1 10 2;#P connect 83 0 10 3;#P connect 70 0 10 3;#P lcolor 16;#P connect 62 0 73 0;#P connect 7 3 62 0;#P connect 68 0 70 0;#P connect 69 0 70 0;#P fasten 7 2 20 0 431 218 478 218;#P connect 20 0 68 0;#P connect 7 12 66 0;#P lcolor 5;#P hidden connect 64 0 68 1;#P lcolor 6;#P connect 20 2 69 0;#P connect 7 6 89 0;#P connect 89 0 88 0;#P connect 63 0 72 0;#P fasten 7 4 21 0 555 206 685 206;#P connect 21 0 63 0;#P connect 21 1 85 0;#P connect 85 0 82 0;#P connect 64 0 89 1;#P lcolor 6;#P hidden connect 64 0 40 0;#P lcolor 6;#P connect 7 7 40 0;#P connect 21 2 87 0;#P connect 87 0 91 0;#P connect 91 0 90 0;#P connect 90 0 86 0;#P connect 7 8 23 0;#P connect 88 0 49 0;#P connect 23 0 49 0;#P connect 40 0 49 0;#P connect 67 0 49 0;#P connect 61 0 49 0;#P connect 84 0 49 0;#P connect 86 0 24 0;#P connect 18 0 24 0;#P connect 17 0 24 0;#P connect 15 0 24 0;#P connect 14 0 24 0;#P connect 49 0 24 0;#P fasten 50 0 24 0 1158 392 837 392;#P connect 82 0 24 0;#P connect 72 0 24 0;#P fasten 7 1 12 0 369 222 862 222;#P connect 12 0 36 0;#P hidden connect 64 0 14 0;#P lcolor 6;#P connect 36 0 14 0;#P connect 7 9 61 0;#P connect 16 0 39 0;#P connect 39 0 17 0;#P hidden connect 64 0 61 1;#P lcolor 6;#P connect 12 1 16 0;#P hidden connect 64 0 67 0;#P lcolor 6;#P connect 7 10 67 0;#P connect 12 2 37 0;#P connect 64 0 84 0;#P lcolor 6;#P connect 7 11 84 0;#P connect 38 0 18 0;#P connect 16 1 38 0;#P connect 37 0 15 0;#P hidden connect 64 0 15 0;#P lcolor 6;#P connect 12 4 50 0;#P pop;