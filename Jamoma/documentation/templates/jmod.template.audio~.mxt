max v2;#N vpatcher 22 61 911 625;#P window setfont "Sans Serif" 9.;#P window linecount 3;#P comment 484 336 324 196617 If you need to return messages from your algorithm to the rest of the world. you can specify type \, range... etc as in jcom.parameter or jcom.message;#B color 12;#P window linecount 1;#P comment 462 316 300 196617 jcom.return:;#B color 12;#P newex 272 413 167 196617 jcom.return return_c @range 0. 1.;#P message 105 78 191 196617 /preset/store 1 default \, /preset/write;#B color 3;#P newex 132 381 150 196617 jcom.out~ 2;#P newex 132 305 58 196617 jcom.in~ 2;#P message 113 100 125 196617 /documentation/generate;#B color 3;#P window linecount 2;#P comment 479 281 324 196617 If you need to send messages to or within the patch \, but it's not required that they be stored or retrieveable \, use jcom.message.;#B color 12;#P window linecount 1;#P comment 460 266 300 196617 jcom.message:;#B color 12;#P window linecount 2;#P comment 479 212 317 196617 Use this for any parameters that you'd like to be able to store and retrieve.;#B color 12;#P window linecount 1;#P comment 460 197 235 196617 jcom.parameter:;#B color 12;#P comment 565 472 241 196617 for html autodoc of module;#B color 12;#P comment 565 427 241 196617 1 (default)/0;#B color 12;#P comment 565 412 241 196617 1/0 (default);#B color 12;#P comment 565 457 241 196617 none \, low \, high \, both (default);#B color 12;#P window linecount 0;#P comment 565 442 241 196617;#B color 12;#P window linecount 1;#P comment 565 397 241 196617 generic (default) \, msg_int \, msg_float \, menu \, toggle;#B color 12;#P comment 482 472 79 196617 @description;#B color 12;#P comment 482 427 79 196617 @repetitions;#B color 12;#P comment 482 412 79 196617 @ramp;#B color 12;#P comment 482 457 79 196617 @clipmode;#B color 12;#P comment 482 442 79 196617 @range;#B color 12;#P comment 482 397 79 196617 @type;#B color 12;#P comment 463 382 235 196617 Attributes for jcom.parameter and jcom.message:;#B color 12;#P window linecount 2;#P message 98 178 65 196617 \; max refresh;#P window linecount 1;#P newex 467 114 88 196617 pvar ParameterB;#P newex 467 49 89 196617 pvar ParameterA;#P window linecount 2;#P newex 15 134 280 196617 jcom.hub jmod.audiotemplate~ @size 1U-half @module_type audio @description "This module doesn't do much yet";#P objectname jcom.hub;#P window linecount 1;#P comment 29 101 79 196617 command input;#P inlet 15 101 13 0;#P message 244 100 31 196617 /init;#P inlet 132 276 13 0;#P outlet 132 407 13 0;#P flonum 89 25 40 9 0. 1. 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;#P objectname ParameterA;#P newex 467 74 187 196617 jcom.parameter param_a @ramp linear;#P objectname param_a;#P newex 467 136 256 196617 jcom.parameter param_b @ramp linear @repetitions 0;#P objectname param_b;#P inlet 180 276 13 0;#P comment 16 44 65 196617 Parameter B;#B frgb 172 172 172;#P number 89 42 35 9 1 24 8227 3 198 198 198 221 221 221 222 222 222 0 0 0;#P objectname ParameterB;#P comment 16 27 65 196617 Parameter A;#B frgb 172 172 172;#P newex 132 348 150 196617 poly~ jalg.template.audio~.mxt;#P comment 119 264 105 196617 ----signal inputs----;#P outlet 15 177 13 0;#P outlet 202 407 13 0;#P comment 132 424 101 196617 ---signal outputs---;#P bpatcher 0 0 256 60 0 0 jcom.gui.mxt 0 $0_;#P objectname jmod.gui.1Uh.a.stereo.mxt;#P fasten 42 0 18 0 110 121 20 121;#P connect 16 0 18 0;#P fasten 39 0 18 0 118 121 20 121;#P fasten 15 0 18 0 249 122 20 122;#P connect 18 0 3 0;#P connect 14 0 40 0;#P connect 40 2 5 0;#P connect 40 0 5 0;#P connect 5 0 41 0;#P connect 41 0 13 0;#P connect 9 0 40 1;#P connect 41 1 2 0;#P fasten 40 1 5 1 153 339 277 339;#P connect 5 1 41 1;#P fasten 11 0 19 0 472 96 462 96 462 42 472 42;#P connect 19 0 11 0;#P fasten 10 0 20 0 472 158 462 158 462 110 472 110;#P connect 20 0 10 0;#P pop;