max v2;#N vpatcher 48 44 1068 767;#P origin -238 -260;#P toggle 895 56 15 0;#P window setfont "Sans Serif" 9.;#P message 895 76 102 196617 /file/framedump \$1;#P bpatcher 608 22 255 60 0 0 jmod.input%.mxt 0 /input%;#P objectname /input%[2];#P bpatcher 608 82 255 60 0 0 jmod.orsize%.mxt 0 /orsize%;#P objectname /orsize%[2];#P bpatcher 608 142 255 60 0 0 jmod.brcosa%.mxt 0 /brcosa%;#P objectname /brcosa%[2];#P bpatcher 608 208 255 60 0 0 jmod.motion%.mxt 0 /motion%;#P objectname /motion%[2];#P bpatcher 322 22 255 60 0 0 jmod.input%.mxt 0 /input%;#P objectname /input%[1];#P bpatcher 322 82 255 60 0 0 jmod.orsize%.mxt 0 /orsize%;#P objectname /orsize%[1];#P bpatcher 322 142 255 60 0 0 jmod.brcosa%.mxt 0 /brcosa%;#P objectname /brcosa%[1];#P bpatcher 322 208 255 60 0 0 jmod.motion%.mxt 0 /motion%;#P objectname /motion%[1];#P bpatcher 31 22 255 60 0 0 jmod.input%.mxt 0 /input%;#P objectname /input%;#P bpatcher 31 82 255 60 0 0 jmod.orsize%.mxt 0 /orsize%;#P objectname /orsize%;#P bpatcher 31 142 255 60 0 0 jmod.brcosa%.mxt 0 /brcosa%;#P objectname /brcosa%;#P bpatcher 31 208 255 60 0 0 jmod.motion%.mxt 0 /motion%;#P objectname /motion%;#P user jit.fpsgui 293 303 60 196617 3;#P objectname jit.fpsgui;#P toggle 479 302 15 0;#P objectname toggle[1];#P button 388 302 15 0;#P hidden newex 370 324 70 196617 mgt.save-file;#P window linecount 2;#P user com 403 304 73 196617 8;#K set 0 21345 30309 8307 28257 28787 26735 29728 3328;#K end;#P window linecount 1;#P comment 494 303 61 196617 Save movie;#P user jit.pwindow 30 344 962 482 0 1 0 0 1 0;#P objectname jit.pwindow;#P newex 31 308 140 196617 jit.glue @rows 2 @columns 3;#P objectname jit.glue;#P hidden connect 20 0 11 0;#P hidden connect 9 1 0 0;#P hidden connect 0 0 1 0;#P hidden connect 13 1 0 1;#P hidden connect 17 1 0 2;#P hidden connect 8 1 0 3;#P hidden connect 12 1 0 4;#P hidden connect 16 1 0 5;#P hidden connect 11 1 10 1;#P hidden connect 10 1 9 1;#P connect 9 1 8 1;#P hidden connect 0 0 7 0;#P hidden connect 20 0 15 0;#P hidden connect 0 0 4 0;#P hidden connect 5 0 4 1;#P hidden connect 6 0 4 2;#P hidden connect 4 0 6 0;#P hidden connect 15 1 14 1;#P hidden connect 14 1 13 1;#P connect 13 1 12 1;#P hidden connect 20 0 19 0;#P hidden connect 19 1 18 1;#P hidden connect 18 1 17 1;#P connect 17 1 16 1;#P connect 21 0 20 0;#P pop;