max v2;#N vpatcher 429 95 1251 847;#P origin 12 -21;#P window setfont "Sans Serif" 9.;#P window linecount 1;#N vpatcher 20 74 917 470;#P origin 12 0;#P window setfont "Sans Serif" 9.;#P window linecount 0;#P hidden newex 604 220 278 196617 jcom.return aed/11 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 604 186 278 196617 jcom.return aed/10 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 604 156 276 196617 jcom.return aed/9 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 604 122 276 196617 jcom.return aed/8 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 604 87 276 196617 jcom.return aed/7 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 322 221 278 196617 jcom.return aed/10 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 322 187 276 196617 jcom.return aed/9 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 322 157 276 196617 jcom.return aed/8 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 322 123 276 196617 jcom.return aed/7 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 322 88 276 196617 jcom.return aed/6 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 38 219 276 196617 jcom.return aed/5 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 38 185 276 196617 jcom.return aed/4 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 38 155 276 196617 jcom.return aed/3 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P hidden newex 38 121 276 196617 jcom.return aed/2 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P window linecount 1;#P newex 133 50 627 196617 route 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;#P window linecount 2;#P hidden newex 38 86 276 196617 jcom.return aed/1 @type array @description "Position of Nth voice as list of polar coordinates (azi\\\, ele\\\, dist).";#P inlet 133 30 15 0;#P connect 2 0 1 0;#P connect 2 1 3 0;#P connect 2 2 4 0;#P connect 2 3 5 0;#P connect 2 4 6 0;#P connect 0 0 2 0;#P connect 2 5 7 0;#P connect 2 6 8 0;#P connect 2 7 9 0;#P connect 2 8 10 0;#P connect 2 9 11 0;#P connect 2 10 12 0;#P connect 2 11 13 0;#P connect 2 12 14 0;#P connect 2 13 15 0;#P connect 2 14 16 0;#P pop;#P newobj 126 495 74 196617 p jcom-routes;#P window linecount 2;#P hidden newex 447 584 274 196617 jcom.return xyz/3 @type array @description "Position of Nth voice as list of polar coordinates x\\\, y\\\, z).";#P hidden newex 445 553 274 196617 jcom.return xyz/2 @type array @description "Position of Nth voice as list of polar coordinates x\\\, y\\\, z).";#P window linecount 1;#P message 331 600 100 196617 -135. 0. 1.414214;#P newex 331 582 62 196617 prepend set;#P newex 444 491 222 196617 route 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;#P message 48 377 112 196617 1 -135. 0. 1.414214;#P newex 48 359 62 196617 prepend set;#P message 36 132 14 196617 2;#P message 335 185 33 196617 clear;#P message 44 91 112 196617 /1 -1 -1 0;#P newex 44 73 62 196617 prepend set;#P window linecount 2;#P hidden newex 551 456 164 196617 jcom.return delete @type integer @description "Delete Nth voice.";#P hidden newex 444 522 274 196617 jcom.return xyz/1 @type array @description "Position of Nth voice as list of polar coordinates x\\\, y\\\, z).";#P window linecount 1;#P newex 551 435 51 196617 zl slice 1;#P newex 579 379 27 196617 + 1;#P window linecount 2;#P comment 619 353 210 196617 Filtered to only pass the positions of active voices \, the rest are set to inactive;#P window linecount 1;#P newex 551 297 38 196617 t l l;#P newex 444 412 117 196617 gate 2;#P newex 579 355 27 196617 >;#P message 579 324 20 196617 \$1;#P comment 642 437 183 196617 The others are set to inactive;#P newex 575 173 38 196617 t l l;#N coll ;#P newobj 575 260 53 196617 coll;#P newex 575 214 38 196617 zl join;#P message 575 195 20 196617 \$1;#P window linecount 2;#P comment 604 234 210 196617 All positions are dumped if number of voices is changed \, in order to update active status.;#P window linecount 1;#P newex 551 143 51 196617 zl join;#P newex 592 121 94 196617 jcom.aed2xyz.mxt;#P newex 551 100 51 196617 zl slice 1;#P window linecount 2;#P hidden newex 233 458 164 196617 jcom.return delete @type integer @description "Delete Nth voice.";#P window linecount 1;#P newex 549 76 66 196617 regexp /;#P newex 571 32 115 196617 loadmess substitute " ";#P newex 233 66 66 196617 regexp /;#P newex 233 38 124 196617 jcom.oscroute /xyz /aed;#P newex 233 437 51 196617 zl slice 1;#P newex 261 381 27 196617 + 1;#P window linecount 2;#P comment 324 357 210 196617 Filtered to only pass the positions of active voices \, the rest are set to inactive;#P window linecount 1;#P newex 233 138 51 196617 zl join;#P newex 274 116 94 196617 jcom.xyz2aed.mxt;#P newex 233 95 51 196617 zl slice 1;#P newex 258 178 38 196617 t l l;#P newex 233 299 38 196617 t l l;#P newex 1 207 46 196617 t dump i;#N coll ;#P newobj 258 258 53 196617 coll;#P newex 258 219 38 196617 zl join;#P message 259 203 20 196617 \$1;#P newex 126 414 117 196617 gate 2;#P newex 261 357 27 196617 >;#P message 261 326 20 196617 \$1;#P inlet 233 20 15 0;#P newex 1 183 112 196617 jcom.oscroute /voices;#P inlet 1 70 15 0;#P comment 231 6 130 196617 List of index \, azi \, ele \, dist;#P window linecount 2;#P comment 324 255 210 196617 All positions are dumped if number of voices is changed \, in order to update active status.;#P window linecount 1;#P comment 324 439 183 196617 The others are set to inactive;#P connect 3 0 4 0;#P connect 4 0 12 0;#P connect 47 0 12 0;#P connect 5 0 44 0;#P connect 44 0 45 0;#P connect 13 0 48 0;#P connect 48 0 49 0;#P fasten 19 0 8 0 266 406 131 406;#P connect 8 0 55 0;#P connect 5 0 21 0;#P connect 23 0 22 0;#P lcolor 6;#P connect 21 0 22 0;#P connect 22 0 15 0;#P connect 15 0 17 0;#P connect 17 0 13 0;#P connect 11 0 13 0;#P connect 13 0 8 1;#P connect 8 1 20 0;#P connect 20 0 25 0;#P connect 17 0 14 0;#P connect 9 0 10 0;#P connect 46 0 11 0;#P fasten 12 0 11 0 6 252 263 252;#P connect 10 0 11 0;#P connect 14 0 9 0;#P connect 13 1 6 0;#P connect 6 0 7 0;#P connect 7 0 19 0;#P connect 15 1 16 0;#P connect 16 0 17 1;#P fasten 12 1 7 1 42 351 283 351;#P connect 14 1 10 1;#P connect 50 0 51 0;#P connect 51 0 52 0;#P fasten 40 0 37 0 584 404 449 404;#P connect 37 0 50 0;#P connect 50 0 42 0;#P connect 50 1 53 0;#P connect 50 2 54 0;#P fasten 21 1 24 0 295 60 554 60;#P connect 23 0 24 0;#P lcolor 3;#P connect 24 0 26 0;#P connect 26 0 28 0;#P connect 28 0 38 0;#P connect 32 0 38 0;#P connect 38 0 37 1;#P connect 37 1 41 0;#P connect 41 0 43 0;#P connect 28 0 33 0;#P connect 33 0 30 0;#P connect 30 0 31 0;#P connect 46 0 32 0;#P connect 31 0 32 0;#P fasten 12 0 32 0 6 252 580 252;#P connect 38 1 35 0;#P connect 35 0 36 0;#P connect 36 0 40 0;#P connect 26 1 27 0;#P connect 27 0 28 1;#P fasten 12 1 36 1 42 350 601 350;#P connect 33 1 31 1;#P pop;