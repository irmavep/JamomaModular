max v2;#N vpatcher 10 59 481 505;#P window setfont "Sans Serif" 9.;#P window linecount 1;#P newex 126 150 64 196617 sel notfound;#P newex 126 176 62 196617 prepend set;#P newex 199 90 27 196617 t l l;#P newex 115 287 27 196617 t l l;#P outlet 199 387 15 0;#P newex 199 366 73 196617 prepend write;#P message 115 198 57 196617 bang;#P newex 115 219 67 196617 sel bang;#P newex 126 130 66 196617 absolutepath;#P inlet 300 28 15 0;#P window linecount 2;#P comment 316 28 140 196617 set the path for future file writing;#P window linecount 1;#P newex 199 345 51 196617 tosymbol;#P message 25 150 40 196617 set $1;#P newex 25 130 58 196617 r jmod.init;#P message 115 242 57 196617 bang;#P window linecount 4;#P comment 24 32 60 196617 $1 argument is the type of file to save;#P window linecount 1;#P newex 115 264 57 196617 savedialog;#P newex 115 65 94 196617 sel bang;#P inlet 115 28 15 0;#P window linecount 2;#P comment 131 28 140 196617 bang means to use dialog \, any other input is a filepath;#P connect 6 0 7 0;#P connect 1 0 2 0;#P connect 2 0 13 0;#P connect 18 0 13 0;#P connect 13 0 12 0;#P connect 12 0 5 0;#P connect 7 0 5 0;#P connect 5 0 3 0;#P connect 3 0 16 0;#P fasten 17 1 11 0 221 120 131 120;#P lcolor 15;#P fasten 16 1 11 0 137 309 101 309 101 115 131 115;#P lcolor 15;#P fasten 10 0 11 0 305 122 131 122;#P lcolor 15;#P connect 11 0 19 0;#P fasten 19 1 18 0 185 171 131 171;#P connect 2 1 17 0;#P connect 12 1 8 0;#P connect 16 0 8 0;#P connect 17 0 8 0;#P connect 8 0 14 0;#P connect 14 0 15 0;#P pop;