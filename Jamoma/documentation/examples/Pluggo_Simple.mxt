max v2;
#N vpatcher 128 122 786 426;
#P window setfont "Sans Serif" 9.;
#P newex 14 154 99 196617 s ---parameter_get;
#P newex 14 66 99 196617 r ---parameter_set;
#P objectname u776000027[1];
#P newex 363 200 125 196617 jmod.pp shape 9 shape 0 1;
#P flonum 323 201 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 179 121 196617 jmod.pp mute 8 mute 0 1;
#P flonum 323 180 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 158 139 196617 jmod.pp bypass 7 bypass 0 1;
#P flonum 323 159 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 137 169 196617 jmod.pp gain_midi 6 midigain 0 158;
#B color 7;
#P flonum 323 138 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 116 183 196617 jmod.pp release 5 release 1. 2000. ms;
#P flonum 323 117 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 95 214 196617 jmod.pp lookahead 4 lookahead 0 100 samples;
#P flonum 323 96 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 74 181 196617 jmod.pp threshold 3 threshold -48. 18;
#P flonum 323 75 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 53 171 196617 jmod.pp postamp 2 postamp -48. 18;
#P flonum 323 54 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#P newex 363 32 165 196617 jmod.pp preamp 1 preamp -48. 18.;
#P newex 205 32 45 196617 loadbang;
#P flonum 323 33 35 9 0 0 0 3 0 0 0 221 221 221 222 222 222 0 0 0;
#N plugconfig;
#C useviews 1 1 1 1;
#C numprograms 64;
#C preempt 1;
#C sigvschange 1;
#C sigvsdefault 32;
#C autosize;
#C defaultview Interface 0 0 0;
#C dragscroll 1;
#C noinfo;
#C uniqueid 114 6 196;
#C initialpgm 1;
#P newobj 207 187 54 196617 plugconfig;
#P newex 137 187 45 196617 dac~;
#P newex 137 163 45 196617 plugout~;
#P newex 137 32 41 196617 adc~;
#P newex 137 56 41 196617 plugin~;
#P bpatcher 14 87 256 61 0 0 jmod.limi~.mod 0;
#P objectname jmod.limi~.mod;
#P newex 205 56 55 196617 s jmod.init;
#P comment 305 231 326 196617 The arguments to jmod.pp are <module_parameter_name> <pp number> <plugin_parameter_name> <range_low> <range_high>;
#P connect 27 0 2 0;
#P connect 2 0 28 0;
#P connect 4 0 3 0;
#P connect 3 0 2 1;
#P connect 2 1 5 0;
#P connect 5 0 6 0;
#P connect 4 1 3 1;
#P connect 2 2 5 1;
#P connect 5 1 6 1;
#P connect 9 0 1 0;
#P connect 3 1 2 2;
#P connect 10 0 8 0;
#P connect 12 0 11 0;
#P connect 14 0 13 0;
#P connect 16 0 15 0;
#P connect 18 0 17 0;
#P connect 20 0 19 0;
#P connect 22 0 21 0;
#P connect 24 0 23 0;
#P connect 26 0 25 0;
#P connect 8 0 10 0;
#P connect 11 0 12 0;
#P connect 13 0 14 0;
#P connect 15 0 16 0;
#P connect 17 0 18 0;
#P connect 19 0 20 0;
#P connect 21 0 22 0;
#P connect 23 0 24 0;
#P connect 25 0 26 0;
#P pop;
