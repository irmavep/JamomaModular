max v2;
#N vpatcher 80 56 462 368;
#P origin -31 12;
#P window setfont "Sans Serif" 9.;
#N vpatcher 116 172 576 640;
#P origin 0 -17;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P comment 227 181 108 196617 Removing zero values;
#P newex 187 179 35 196617 sel 0.;
#P window linecount 0;
#P newex 133 177 35 196617 sel 0.;
#P window linecount 1;
#P newex 201 243 52 196617 change 0.;
#P newex 140 244 52 196617 change 0.;
#P newex 83 244 52 196617 change 0.;
#P window linecount 0;
#P newex 105 283 81 196617 scale 0. 1. 1. 0.;
#P newex 118 42 86 196617 jcom.rgb2luma%;
#P window linecount 1;
#P newex 214 127 80 196617 s $0_jcom.sum;
#P flonum 50 182 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P window linecount 0;
#P newex 201 211 55 196617 slide 3. 3.;
#P newex 140 211 55 196617 slide 3. 3.;
#P newex 83 211 55 196617 slide 3. 3.;
#P window linecount 3;
#P newex 105 305 302 196617 jcom.return motion/y @range 0. 1. @type msg_float @description "The center of gravity for the y-axis of the motion in the frame in a range of 0. to 1. (zero is bottom - one is top).";
#P window linecount 1;
#P newex 133 153 64 196617 unpack 0. 0.;
#P window linecount 3;
#P newex 93 354 302 196617 jcom.return motion/x @range 0. 1. @type msg_float @description "The center of gravity for the x-axis of the motion in the frame in a range of 0. to 1. (zero is left - one is right).";
#P window linecount 2;
#P newex 83 402 330 196617 jcom.return motion/quantity @type msg_float @range 0. 1. @description "The amount of motion in the frame in a range of 0. to 1.";
#P window linecount 1;
#P newex 83 124 110 196617 route quantity location;
#P newex 83 64 45 196617 gate 1 1;
#P newex 83 86 62 196617 jcom.sum%;
#P inlet 118 21 15 0;
#P inlet 50 21 15 0;
#P window linecount 0;
#P comment 209 146 166 196617 Send to centroid-drawing subpatch;
#P connect 1 0 13 0;
#P connect 4 0 3 0;
#P connect 3 0 5 0;
#P connect 5 0 10 0;
#P connect 10 0 17 0;
#P connect 17 0 6 0;
#P fasten 18 0 7 0 145 269 98 269;
#P fasten 13 0 10 1 55 203 110 203;
#P fasten 19 0 16 0 206 276 110 276;
#P connect 16 0 9 0;
#P connect 2 0 15 0;
#P connect 15 0 4 1;
#P fasten 13 0 10 2 55 203 132 203;
#P connect 5 1 8 0;
#P connect 8 0 20 0;
#P connect 20 1 11 0;
#P connect 11 0 18 0;
#P fasten 13 0 11 1 55 203 167 203;
#P fasten 13 0 11 2 55 203 189 203;
#P connect 8 1 21 0;
#P connect 21 1 12 0;
#P connect 12 0 19 0;
#P fasten 3 0 14 0 88 115 219 115;
#P fasten 13 0 12 1 55 203 228 203;
#P fasten 13 0 12 2 55 203 250 203;
#P pop;
#P newobj 83 151 71 196617 p return-data;
#N vpatcher 266 324 464 539;
#P window setfont "Sans Serif" 9.;
#P newex 50 69 27 196617 + 1;
#P toggle 50 50 15 0;
#P newex 50 113 86 196617 jcom.rgb2luma%;
#P newex 50 90 47 196617 gate 2 1;
#P inlet 50 30 15 0;
#P inlet 87 31 15 0;
#P outlet 50 152 15 0;
#P connect 2 0 5 0;
#P connect 5 0 6 0;
#P connect 6 0 3 0;
#P connect 3 0 4 0;
#P connect 4 0 0 0;
#P connect 3 1 0 0;
#P connect 1 0 3 1;
#P pop;
#P newobj 144 82 46 196617 p colour;
#N vpatcher 335 228 664 541;
#P window setfont "Sans Serif" 9.;
#P newex 50 55 138 196617 jcom.oscroute /trails /slide;
#P window linecount 1;
#P message 177 143 73 196617 slide_down \$1;
#P flonum 114 121 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P message 114 143 60 196617 slide_up \$1;
#P newex 87 177 45 196617 jit.slide;
#P newex 50 100 27 196617 + 1;
#P toggle 50 81 15 0;
#P newex 50 121 47 196617 gate 2 1;
#P newex 71 205 64 196617 jit.op @op +;
#P inlet 4 26 15 0;
#P inlet 50 26 15 0;
#P outlet 50 261 15 0;
#P window linecount 0;
#P comment 157 239 100 196617 Creating some nice ghost-like effects.;
#P connect 2 0 12 0;
#P connect 12 0 6 0;
#P connect 6 0 7 0;
#P connect 7 0 5 0;
#P connect 5 0 1 0;
#P fasten 4 0 1 0 76 241 55 241;
#P fasten 5 1 4 0 92 168 76 168;
#P connect 3 0 5 1;
#P connect 9 0 8 0;
#P connect 11 0 8 0;
#P connect 5 1 8 0;
#P connect 12 1 10 0;
#P connect 10 0 9 0;
#P fasten 8 0 4 1 92 199 130 199;
#P fasten 10 0 11 0 119 139 182 139;
#P pop;
#P newobj 188 175 77 196617 p create-trails;
#N vpatcher 498 44 876 389;
#P window setfont "Sans Serif" 9.;
#P window linecount 0;
#P newex 50 69 27 196617 + 1;
#P toggle 50 50 15 0;
#P newex 50 90 47 196617 gate 2 2;
#P inlet 21 30 15 0;
#P inlet 50 30 15 0;
#P outlet 50 298 15 0;
#P number 106 131 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P message 106 149 48 196617 range \$1;
#P flonum 159 131 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P flonum 217 131 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P message 217 149 41 196617 ring \$1;
#P message 159 149 52 196617 center \$1;
#P flonum 265 131 47 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P message 265 149 49 196617 ripple \$1;
#P window linecount 1;
#P comment 272 205 52 196617 Threshold;
#P number 230 203 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 87 202 105 196617 jit.op @op > @val 125;
#P newex 87 179 145 196617 jit.fastblur @range 3 @mode 4;
#P connect 13 0 16 0;
#P connect 16 0 17 0;
#P connect 17 0 15 0;
#P connect 15 0 12 0;
#P connect 1 0 12 0;
#P connect 14 0 15 1;
#P fasten 4 0 0 0 270 171 92 171;
#P fasten 10 0 0 0 111 171 92 171;
#P fasten 7 0 0 0 222 171 92 171;
#P fasten 6 0 0 0 164 171 92 171;
#P connect 15 1 0 0;
#P connect 0 0 1 0;
#P connect 11 0 10 0;
#P connect 9 0 6 0;
#P connect 2 0 1 1;
#P lcolor 1;
#P connect 8 0 7 0;
#P connect 5 0 4 0;
#P pop;
#P newobj 188 151 88 196617 p noise-reduction;
#N vpatcher 47 44 697 510;
#P origin -6 34;
#P toggle 358 260 15 0;
#P window setfont "Sans Serif" 9.;
#P window linecount 0;
#P newex 358 280 47 196617 gate 1 0;
#P newex 358 299 142 196617 pv draw-window-contraction;
#N vpatcher 616 155 1114 529;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#N vpatcher 412 123 669 433;
#P outlet 64 253 15 0;
#P outlet 36 253 15 0;
#P inlet 174 25 15 0;
#P window setfont "Sans Serif" 9.;
#P newex 36 163 27 196617 t b l;
#P message 174 168 50 196617 dim \$1 1;
#P newex 36 63 29 196617 t b f;
#P newex 36 118 51 196617 pack 0 0.;
#P number 174 46 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#N counter 0 0 200;
#X flags 0 0;
#P newobj 36 88 83 196617 counter 0 0 200;
#P message 36 142 87 196617 setcell \$1 val \$2;
#P window linecount 1;
#P newex 36 220 53 196617 jit.3m;
#P window linecount 0;
#P newex 36 195 121 196617 jit.matrix 1 float32 100;
#P inlet 36 25 15 0;
#P connect 0 0 7 0;
#P connect 7 0 4 0;
#P connect 4 0 6 0;
#P connect 6 0 3 0;
#P connect 3 0 9 0;
#P fasten 8 0 1 0 179 189 41 189;
#P connect 9 0 1 0;
#P fasten 9 1 1 0 58 185 41 185;
#P connect 1 0 2 0;
#P connect 2 0 11 0;
#P connect 2 2 12 0;
#P connect 7 1 6 1;
#P fasten 5 0 4 4 179 74 113 74;
#P connect 10 0 5 0;
#P connect 5 0 8 0;
#P pop;
#P newobj 133 259 92 196617 p running_minmax;
#N vpatcher 412 123 669 433;
#P outlet 64 253 15 0;
#P outlet 36 253 15 0;
#P inlet 174 25 15 0;
#P window setfont "Sans Serif" 9.;
#P newex 36 163 27 196617 t b l;
#P message 174 168 50 196617 dim \$1 1;
#P newex 36 63 29 196617 t b f;
#P newex 36 118 51 196617 pack 0 0.;
#P number 174 46 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#N counter 0 0 200;
#X flags 0 0;
#P newobj 36 88 83 196617 counter 0 0 200;
#P message 36 142 87 196617 setcell \$1 val \$2;
#P window linecount 1;
#P newex 36 220 53 196617 jit.3m;
#P window linecount 0;
#P newex 36 195 121 196617 jit.matrix 1 float32 100;
#P inlet 36 25 15 0;
#P connect 0 0 7 0;
#P connect 7 0 4 0;
#P connect 4 0 6 0;
#P connect 6 0 3 0;
#P connect 3 0 9 0;
#P fasten 9 1 1 0 58 185 41 185;
#P connect 9 0 1 0;
#P fasten 8 0 1 0 179 189 41 189;
#P connect 1 0 2 0;
#P connect 2 0 11 0;
#P connect 2 2 12 0;
#P connect 7 1 6 1;
#P fasten 5 0 4 4 179 74 113 74;
#P connect 10 0 5 0;
#P connect 5 0 8 0;
#P pop;
#P newobj 103 236 92 196617 p running_minmax;
#N vpatcher 412 123 669 433;
#P outlet 64 253 15 0;
#P outlet 36 253 15 0;
#P inlet 174 25 15 0;
#P window setfont "Sans Serif" 9.;
#P newex 36 163 27 196617 t b l;
#P message 174 168 50 196617 dim \$1 1;
#P newex 36 63 29 196617 t b f;
#P newex 36 118 51 196617 pack 0 0.;
#P number 174 46 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#N counter 0 0 200;
#X flags 0 0;
#P newobj 36 88 83 196617 counter 0 0 200;
#P message 36 142 87 196617 setcell \$1 val \$2;
#P window linecount 1;
#P newex 36 220 53 196617 jit.3m;
#P window linecount 0;
#P newex 36 195 121 196617 jit.matrix 1 float32 100;
#P inlet 36 25 15 0;
#P connect 0 0 7 0;
#P connect 7 0 4 0;
#P connect 4 0 6 0;
#P connect 6 0 3 0;
#P connect 3 0 9 0;
#P fasten 8 0 1 0 179 189 41 189;
#P connect 9 0 1 0;
#P fasten 9 1 1 0 58 185 41 185;
#P connect 1 0 2 0;
#P connect 2 0 11 0;
#P connect 2 2 12 0;
#P connect 7 1 6 1;
#P fasten 5 0 4 4 179 74 113 74;
#P connect 10 0 5 0;
#P connect 5 0 8 0;
#P pop;
#P newobj 85 215 92 196617 p running_minmax;
#N vpatcher 412 123 669 433;
#P outlet 64 253 15 0;
#P outlet 36 253 15 0;
#P inlet 174 25 15 0;
#P window setfont "Sans Serif" 9.;
#P newex 36 163 27 196617 t b l;
#P message 174 168 50 196617 dim \$1 1;
#P newex 36 63 29 196617 t b f;
#P newex 36 118 51 196617 pack 0 0.;
#P number 174 46 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#N counter 0 0 200;
#X flags 0 0;
#P newobj 36 88 83 196617 counter 0 0 200;
#P message 36 142 87 196617 setcell \$1 val \$2;
#P window linecount 1;
#P newex 36 220 53 196617 jit.3m;
#P window linecount 0;
#P newex 36 195 121 196617 jit.matrix 1 float32 100;
#P inlet 36 25 15 0;
#P connect 0 0 7 0;
#P connect 7 0 4 0;
#P connect 4 0 6 0;
#P connect 6 0 3 0;
#P connect 3 0 9 0;
#P fasten 9 1 1 0 58 185 41 185;
#P connect 9 0 1 0;
#P fasten 8 0 1 0 179 189 41 189;
#P connect 1 0 2 0;
#P connect 2 0 11 0;
#P connect 2 2 12 0;
#P connect 7 1 6 1;
#P fasten 5 0 4 4 179 74 113 74;
#P connect 10 0 5 0;
#P connect 5 0 8 0;
#P pop;
#P newobj 67 191 92 196617 p running_minmax;
#P inlet 136 30 15 0;
#P user swatch 307 172 83 38;
#P window linecount 0;
#P newex 136 53 333 196617 jcom.oscroute /contraction/window/reset /contraction/window/color;
#P newex 49 162 84 196617 unpack s 0 0 0 0;
#P comment 87 141 122 196617 Find the max-contraction;
#P number 365 245 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P number 331 245 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P number 297 245 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 297 216 79 196617 unpack 0 0 0;
#P newex 13 285 388 196617 pak framerect 0 0 0 0 100 255 100;
#P inlet 49 30 15 0;
#P outlet 13 331 15 0;
#P connect 2 0 0 0;
#P connect 1 0 8 0;
#P connect 8 1 12 0;
#P connect 12 0 2 1;
#P connect 8 2 13 0;
#P connect 8 3 14 0;
#P fasten 13 0 2 2 90 270 126 270;
#P connect 8 4 15 0;
#P connect 11 0 9 0;
#P connect 14 1 2 3;
#P connect 15 1 2 4;
#P connect 4 0 2 5;
#P connect 10 0 3 0;
#P connect 9 1 3 0;
#P connect 3 0 4 0;
#P connect 3 1 5 0;
#P connect 5 0 2 6;
#P connect 3 2 6 0;
#P connect 6 0 2 7;
#P pop;
#P newobj 346 106 108 196617 p window-contraction;
#P window linecount 3;
#P comment 346 162 124 196617 The values that draw the windowed contraction rectangle;
#P window linecount 1;
#P newex 346 131 142 196617 pv draw-window-contraction;
#P window linecount 0;
#P newex 71 341 112 196617 jcom.passmatrixinfo%;
#P newex 164 227 462 196617 jcom.oscroute /contraction/on /contraction/max/on /contraction/window/on /centroid/on;
#P comment 77 40 68 196617 Video input;
#P comment 472 41 118 196617 Attribute message input;
#P inlet 454 41 15 0;
#N vpatcher 714 196 1243 571;
#P inlet 168 34 15 0;
#P user swatch 324 176 83 38;
#P window setfont "Sans Serif" 9.;
#P newex 168 57 303 196617 jcom.oscroute /contraction/max/reset /contraction/max/color;
#P newex 66 220 84 196617 unpack s 0 0 0 0;
#P comment 104 145 122 196617 Find the max-contraction;
#P number 382 249 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P number 348 249 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P number 314 249 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 314 220 79 196617 unpack 0 0 0;
#P newex 30 289 388 196617 pak framerect 0 0 0 0 100 255 100;
#P button 168 98 15 0;
#P newex 168 118 64 196617 t 65500 0;
#P newex 246 262 40 196617 peak;
#P newex 192 262 40 196617 peak;
#P newex 138 262 40 196617 trough;
#P newex 84 262 40 196617 trough;
#P inlet 66 34 15 0;
#P outlet 30 335 15 0;
#P connect 8 0 0 0;
#P connect 1 0 14 0;
#P connect 14 1 2 0;
#P connect 2 0 8 1;
#P connect 6 0 2 1;
#P connect 14 2 3 0;
#P connect 3 0 8 2;
#P connect 17 0 15 0;
#P connect 15 0 7 0;
#P connect 7 0 6 0;
#P connect 6 0 3 1;
#P connect 14 3 4 0;
#P connect 4 0 8 3;
#P connect 6 1 4 1;
#P connect 14 4 5 0;
#P connect 5 0 8 4;
#P connect 6 1 5 1;
#P connect 10 0 8 5;
#P connect 16 0 9 0;
#P connect 15 1 9 0;
#P connect 9 0 10 0;
#P connect 9 1 11 0;
#P connect 11 0 8 6;
#P connect 9 2 12 0;
#P connect 12 0 8 7;
#P pop;
#P newobj 213 105 93 196617 p max-contraction;
#P newex 21 112 27 196617 + 1;
#P toggle 21 87 15 0;
#P newex 21 154 47 196617 gate 2 2;
#P inlet 58 40 15 0;
#N vpatcher 182 44 859 622;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P newex 231 422 52 196617 change 0.;
#P newex 98 422 52 196617 change 0.;
#P window linecount 2;
#P newex 113 460 290 196617 jcom.return contraction/height @range 0. 1. @type msg_float @description "Contraction_height in a range of 0. to 1.";
#P newex 98 500 288 196617 jcom.return contraction/width @range 0. 1. @type msg_float @description "Contraction width in a range of 0. to 1.";
#P user swatch 414 195 128 32;
#P window linecount 0;
#P newex 324 55 250 196617 jcom.oscroute /contraction/slide /contraction/color;
#P flonum 324 117 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 231 389 77 196617 jcom.autoscale;
#P newex 98 389 77 196617 jcom.autoscale;
#P newex 231 365 66 196617 jcom.absdiff;
#P newex 98 365 66 196617 jcom.absdiff;
#P outlet 16 464 15 0;
#P inlet 324 25 15 0;
#P inlet 26 25 15 0;
#N vpatcher 740 320 1033 621;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P newex 40 100 65 196617 jcom.change;
#P newex 174 237 53 196617 s $0_dim;
#P outlet 93 237 15 0;
#P outlet 40 237 15 0;
#P inlet 14 30 15 0;
#P window linecount 0;
#P newex 93 206 39 196617 / 240.;
#P newex 40 206 39 196617 / 320.;
#P newex 40 160 39 196617 unpack;
#P newex 40 124 53 196617 route dim;
#P newex 40 78 71 196617 jit.matrixinfo;
#P comment 43 31 204 196617 To compensate if incoming video is different than the drawing window of 320x240;
#P fasten 6 0 1 0 19 67 45 67;
#P connect 1 0 10 0;
#P connect 10 0 2 0;
#P connect 2 0 3 0;
#P connect 3 0 4 0;
#P connect 4 0 7 0;
#P connect 3 1 5 0;
#P connect 5 0 8 0;
#P fasten 2 0 9 0 45 146 179 146;
#P pop;
#P newobj 26 199 65 196617 p adjust-dim;
#P number 449 266 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P number 415 266 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P number 381 266 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 381 245 65 196617 unpack 0 0 0;
#P newex 75 317 411 196617 pak framerect 0 0 0 0 255 255 84;
#P newex 170 283 27 196617 / 1.;
#P newex 98 283 27 196617 / 1.;
#P newex 316 283 27 196617 / 1.;
#P newex 243 283 27 196617 / 1.;
#P comment 200 117 50 196617 boundmax;
#P comment 91 119 50 196617 boundmin;
#P newex 235 97 35 196617 sel -1;
#P newex 199 97 35 196617 sel -1;
#P newex 127 97 35 196617 sel -1;
#P newex 91 97 35 196617 sel -1;
#P newex 199 75 46 196617 unpack;
#P window linecount 1;
#P newex 316 149 55 196617 slide 3. 3.;
#P newex 243 149 55 196617 slide 3. 3.;
#P newex 170 149 55 196617 slide 3. 3.;
#P newex 98 149 55 196617 slide 3. 3.;
#P window linecount 0;
#P newex 91 75 46 196617 unpack;
#P newex 91 55 226 196617 jit.findbounds @min 1 @max 1;
#P comment 323 392 298 196617 It might be better to use the frame size to normalize the values.;
#P connect 18 0 26 0;
#P connect 24 0 23 0;
#P fasten 24 0 1 0 31 48 96 48;
#P connect 1 0 2 0;
#P connect 2 0 8 0;
#P connect 8 1 3 0;
#P connect 3 0 16 0;
#P connect 16 0 27 0;
#P connect 27 0 29 0;
#P connect 29 0 36 0;
#P connect 36 0 34 0;
#P fasten 37 0 35 0 236 449 118 449;
#P connect 23 0 16 1;
#P fasten 31 0 3 1 329 138 131 138;
#P connect 2 1 9 0;
#P connect 16 0 18 1;
#P fasten 31 0 3 2 329 138 159 138;
#P connect 14 0 27 1;
#P connect 9 1 4 0;
#P connect 4 0 17 0;
#P connect 23 1 17 1;
#P connect 17 0 18 2;
#P fasten 31 0 4 1 329 138 203 138;
#P connect 1 1 7 0;
#P connect 7 0 10 0;
#P fasten 31 0 4 2 329 138 231 138;
#P connect 17 0 28 0;
#P connect 28 0 30 0;
#P connect 30 0 37 0;
#P connect 7 1 11 0;
#P connect 10 1 5 0;
#P connect 5 0 14 0;
#P connect 14 0 18 3;
#P connect 23 0 14 1;
#P fasten 31 0 5 1 329 138 276 138;
#P fasten 31 0 5 2 329 138 304 138;
#P connect 15 0 28 1;
#P connect 15 0 18 4;
#P connect 11 1 6 0;
#P connect 6 0 15 0;
#P connect 25 0 32 0;
#P connect 32 0 31 0;
#P connect 23 1 15 1;
#P fasten 31 0 6 1 329 138 349 138;
#P fasten 31 0 6 2 329 138 377 138;
#P connect 20 0 18 5;
#P connect 32 1 19 0;
#P connect 33 0 19 0;
#P connect 19 0 20 0;
#P connect 19 1 21 0;
#P connect 21 0 18 6;
#P connect 19 2 22 0;
#P connect 22 1 18 7;
#P pop;
#P newobj 103 72 69 196617 p contraction;
#P toggle 100 259 15 0;
#P newex 100 279 47 196617 gate 1 0;
#P toggle 513 267 15 0;
#P newex 513 287 47 196617 gate 1 0;
#P newex 513 306 88 196617 pv draw-centroid;
#P toggle 208 259 15 0;
#P newex 208 279 47 196617 gate 1 0;
#P newex 208 298 125 196617 pv draw-max-contraction;
#P outlet 58 425 15 0;
#P newex 58 379 110 196617 jit.lcd 4 char 320 240;
#P newex 100 298 102 196617 pv draw-contraction;
#P newex 58 199 40 196617 t b b l;
#N vpatcher 430 85 1191 697;
#P origin 0 -5;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P newex 214 139 35 196617 sel 0.;
#P newex 160 139 35 196617 sel 0.;
#P toggle 330 109 15 0;
#P window linecount 0;
#P newex 330 129 47 196617 gate 1 1;
#P newex 245 169 67 196617 slide 10. 10.;
#P newex 160 169 67 196617 slide 10. 10.;
#P newex 330 150 67 196617 slide 10. 10.;
#P newex 160 114 64 196617 unpack 0. 0.;
#P newex 160 76 112 196617 route location quantity;
#P newex 160 45 80 196617 r $0_jcom.sum;
#P comment 75 213 109 196617 correct for video size;
#P newex 245 238 29 196617 * 1.;
#P newex 11 183 64 196617 unpack 0. 0.;
#P newex 200 238 29 196617 * 1.;
#P window linecount 1;
#P newex 11 149 53 196617 r $0_dim;
#P window linecount 0;
#P newex 416 72 305 196617 jcom.oscroute /centroid/size/on /centroid/size /centroid/color;
#P user swatch 540 260 144 43;
#N comlet Colour RGB list;
#P inlet 416 45 15 0;
#P newex 155 553 88 196617 pv draw-centroid;
#P comment 43 359 148 196617 Find centre of circle by subtracting half the size from the upper left coordinates.;
#P newex 245 372 27 196617 -;
#P newex 200 372 27 196617 -;
#P newex 330 252 27 196617 / 2;
#P newex 330 227 27 196617 + 5;
#P number 385 180 35 9 1 0 1 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 330 205 34 196617 * 20.;
#P newex 514 313 27 196617 t b l;
#P comment 82 116 72 196617 Position (x \, y);
#P comment 423 182 26 196617 Size;
#P newex 293 252 27 196617 t b i;
#P newex 335 479 30 196617 + 10;
#P newex 290 479 30 196617 + 10;
#P newex 155 520 325 196617 pak paintoval 0 0 0 0 255 255 255;
#P connect 18 0 20 0;
#P connect 0 0 14 0;
#P connect 23 0 24 0;
#P connect 24 0 25 0;
#P connect 25 0 31 0;
#P fasten 31 1 27 0 190 162 165 162;
#P connect 27 0 19 0;
#P connect 6 0 11 0;
#P connect 19 0 11 0;
#P connect 3 0 11 0;
#P connect 11 0 0 1;
#P connect 25 1 32 0;
#P connect 10 0 11 1;
#P fasten 20 0 19 1 16 235 224 235;
#P connect 32 1 28 0;
#P connect 28 0 21 0;
#P connect 3 0 12 0;
#P connect 6 0 12 0;
#P connect 21 0 12 0;
#P connect 12 0 0 2;
#P connect 10 0 12 1;
#P fasten 20 1 21 1 70 230 269 230;
#P connect 11 0 1 0;
#P connect 1 0 0 3;
#P fasten 9 0 3 0 335 248 298 248;
#P connect 3 1 1 1;
#P fasten 17 0 30 0 421 97 335 97;
#P connect 30 0 29 0;
#P connect 29 0 26 0;
#P connect 26 0 7 0;
#P connect 7 0 9 0;
#P connect 9 0 10 0;
#P connect 12 0 2 0;
#P connect 2 0 0 4;
#P fasten 8 0 7 1 390 200 359 200;
#P connect 3 1 2 1;
#P connect 24 1 29 1;
#P fasten 6 1 0 5 536 507 385 507;
#P fasten 17 1 8 0 519 170 390 170;
#P connect 15 0 17 0;
#P connect 17 2 6 0;
#P connect 16 0 6 0;
#P pop;
#P newobj 537 104 81 196617 p centroid-stuff;
#P window linecount 3;
#P comment 213 161 124 196617 The values that draw the maximum contraction rectangle;
#P window linecount 1;
#P newex 213 130 125 196617 pv draw-max-contraction;
#P window linecount 3;
#P comment 103 133 105 196617 The values that draw the local contraction rectangle;
#P window linecount 1;
#P newex 103 105 102 196617 pv draw-contraction;
#P comment 230 40 175 196617 Here I used to use the motion image;
#P connect 21 0 22 0;
#P connect 22 0 20 0;
#P connect 19 0 20 1;
#P connect 20 1 6 0;
#P fasten 32 0 8 0 363 330 63 330;
#P fasten 10 0 8 0 213 331 63 331;
#P fasten 13 0 8 0 518 331 63 331;
#P fasten 7 0 8 0 105 331 63 331;
#P connect 6 0 8 0;
#P connect 28 0 8 0;
#P connect 8 0 9 0;
#P fasten 20 0 9 0 26 411 63 411;
#P connect 6 2 28 0;
#P fasten 27 0 17 0 169 249 105 249;
#P connect 17 0 16 0;
#P connect 16 0 7 0;
#P fasten 19 0 18 0 63 65 108 65;
#P connect 18 0 1 0;
#P connect 6 1 16 1;
#P lcolor 6;
#P fasten 24 0 18 1 459 66 167 66;
#P fasten 24 0 27 0 459 76 502 76 502 219 169 219;
#P fasten 27 1 12 0 282 249 213 249;
#P connect 12 0 11 0;
#P connect 11 0 10 0;
#P fasten 18 0 23 0 108 95 218 95;
#P connect 23 0 3 0;
#P connect 6 1 11 1;
#P lcolor 6;
#P connect 24 0 23 1;
#P fasten 18 0 31 0 108 92 351 92;
#P connect 31 0 29 0;
#P connect 27 2 34 0;
#P connect 34 0 33 0;
#P connect 33 0 32 0;
#P connect 6 1 33 1;
#P lcolor 6;
#P connect 24 0 31 1;
#P connect 27 3 15 0;
#P connect 15 0 14 0;
#P connect 14 0 13 0;
#P fasten 24 0 5 0 459 76 542 76;
#P connect 6 1 14 1;
#P lcolor 6;
#P pop;
#P newobj 22 232 67 196617 p draw-lines;
#P comment 39 258 75 196617 VIDEO OUTPUT;
#N vpatcher 248 46 834 585;
#P origin 0 3;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P newex 372 60 103 196617 jcom.oscroute /edge;
#P comment 390 27 63 196617 Parameters;
#P window linecount 2;
#P comment 247 27 80 196617 Video to use for edge detection;
#P window linecount 1;
#P comment 80 31 84 196617 Video to overlay;
#P window linecount 0;
#P newex 251 219 97 196617 jcom.checkplanes%;
#P inlet 63 28 15 0;
#P message 104 251 14 196617 2;
#P message 87 251 14 196617 1;
#P outlet 177 495 15 0;
#P newex 26 379 47 196617 gate 2 1;
#P inlet 372 26 15 0;
#P number 178 184 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#N coll ;
#T flags 1 0;
#T 0 0;
#T 1 2;
#T 2 2;
#T 3 1;
#T 4 3;
#P newobj 167 154 53 196617 coll;
#P message 387 190 14 196617 1;
#P message 372 190 14 196617 0;
#P newex 167 219 73 196617 gate 3 0;
#B color 3;
#P message 372 215 45 196617 mode \$1;
#P newex 372 168 41 196617 sel 1 2;
#P newex 231 302 45 196617 jit.sobel;
#P message 455 182 54 196617 thresh \$1;
#P newex 167 302 62 196617 jit.robcross;
#P newex 372 92 177 196617 jcom.oscroute /algorithm /threshold;
#P comment 115 402 119 196617 To avoid "hanging" edge.;
#P newex 115 219 31 196617 sel 0;
#P button 115 359 15 0;
#P newex 115 379 104 196617 jit.matrix 4 char 1 1;
#P inlet 230 28 15 0;
#P newex 177 461 64 196617 jit.op @op +;
#P comment 388 323 94 196617 cv.jit.binedge also used to be here...;
#P connect 21 0 19 0;
#P connect 22 0 19 0;
#P connect 23 0 19 1;
#P connect 5 0 21 0;
#P connect 5 1 22 0;
#P fasten 16 0 5 0 172 179 120 179;
#P connect 5 0 4 0;
#P connect 4 0 3 0;
#P connect 7 0 16 0;
#P connect 16 0 13 0;
#P fasten 9 0 8 0 460 257 172 257;
#P connect 13 0 8 0;
#P connect 24 0 8 0;
#P fasten 19 1 1 0 68 451 182 451;
#P connect 1 0 20 0;
#P fasten 19 0 20 0 31 486 182 486;
#P connect 16 0 17 0;
#P connect 2 0 13 1;
#P connect 13 1 10 0;
#P connect 24 0 10 0;
#P fasten 9 0 10 0 460 257 236 257;
#P connect 12 0 10 0;
#P connect 3 0 1 1;
#P connect 8 0 1 1;
#P connect 10 0 1 1;
#P connect 2 0 24 0;
#P connect 18 0 28 0;
#P connect 28 0 7 0;
#P connect 7 0 11 0;
#P connect 11 0 14 0;
#P fasten 15 0 12 0 392 210 377 210;
#P connect 14 0 12 0;
#P connect 11 1 15 0;
#P connect 7 1 9 0;
#P pop;
#P newobj 22 206 84 196617 p edge-detection;
#P newex 144 104 74 196617 jcom.motion%;
#P newex 144 125 105 196617 jit.op @op > @val 0.1;
#N comlet Zoom-rotation output;
#P outlet 22 258 15 0;
#P newex 22 55 319 196617 jcom.oscroute /genframe /data_smoothing /color /threshold /noise;
#P comment 39 31 75 196617 INSTRUCTIONS;
#P inlet 22 31 15 0;
#P comment 199 31 75 196617 VIDEO INPUT;
#N comlet Video in;
#P inlet 180 31 15 0;
#P connect 2 0 4 0;
#P fasten 12 0 8 0 193 196 27 196;
#P connect 8 0 10 0;
#P connect 10 0 5 0;
#P connect 13 0 8 1;
#P fasten 4 5 10 1 332 227 84 227;
#P connect 4 1 14 0;
#P fasten 4 5 8 2 332 201 101 201;
#P connect 4 2 13 0;
#P connect 13 0 7 0;
#P connect 4 0 7 0;
#P connect 7 0 6 0;
#P connect 6 0 14 1;
#P connect 0 0 13 1;
#P fasten 6 0 11 0 149 145 193 145;
#P connect 11 0 12 0;
#P connect 4 3 6 1;
#P fasten 4 5 12 1 332 171 260 171;
#P connect 4 4 11 1;
#P pop;
