max v2;#N vpatcher 34 89 430 588;#P outlet 271 402 15 0;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P newex 87 101 76 196617 route bang;#P inlet 87 58 15 0;#P newex 271 353 35 196617 zl reg;#P newex 271 320 65 196617 prepend read;#P newex 123 290 21 196617 t 1;#P newex 87 141 55 196617 opendialog;#P newex 215 319 51 196617 filewatch;#P connect 5 0 6 0;#P connect 6 0 1 0;#P connect 1 0 2 0;#P lcolor 14;#P connect 6 1 2 0;#P lcolor 13;#P connect 1 0 0 0;#P lcolor 14;#P connect 2 0 0 0;#P connect 6 1 0 0;#P lcolor 13;#P connect 1 0 3 0;#P lcolor 14;#P connect 6 1 3 0;#P lcolor 13;#P connect 3 0 4 0;#P connect 0 0 4 0;#P connect 4 0 7 0;#P pop;