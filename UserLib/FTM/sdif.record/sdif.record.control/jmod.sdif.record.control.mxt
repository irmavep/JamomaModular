max v2;
#N vpatcher 125 43 1010 464;
#P origin -12 -67;
#P hidden outlet 40 348 13 0;
#P window setfont "Sans Serif" 9.;
#P window linecount 1;
#P hidden newex 643 296 99 9109513 prepend /streamcount;
#P hidden newex 378 270 82 9109513 pvar streamcount;
#P objectname stream_type[4];
#P window linecount 2;
#P hidden newex 378 294 248 9109513 jcom.message streamcount @type msg_int @description "total number of streams to record";
#P objectname streamcount_p;
#P number 180 20 30 9 1 8 8227 139 149 149 149 221 221 221 222 222 222 0 0 0;
#P objectname streamcount;
#P window linecount 1;
#P comment 4 20 178 9109513 Total number of streams to be recorded:;
#B frgb 181 181 181;
#P hidden newex 378 204 83 9109513 pvar stream_type;
#P objectname stream_type[2];
#P hidden newex 378 151 59 9109513 pvar stream;
#P objectname stream_type[1];
#P window linecount 2;
#P hidden newex 378 226 254 9109513 jcom.message stream_type @type msg_int @range 0 20 @clipmode low @description "Stream type";
#P objectname stream_type[3];
#P window linecount 1;
#P hidden newex 378 173 350 9109513 jcom.message stream_nbr @type msg_int @description "Which stream to define";
#P objectname stream[1];
#P user ubumenu 65 39 177 9109513 0 1 1 0;
#X add 1MID - MIDI - 3DOF;
#X add XAC2 - Acceleration - 2DOF;
#X add XAC3 - Acceleration - 3DOF;
#X add XORI - Orientation - 3DOF;
#X add XPOS - Position - 3DOF;
#X add XPOR - Position-Orientation - 6DOF;
#X add XTSS - Soprano T-stick - 10DOF;
#X add XTSA - Alto T-stick - 10DOF;
#X add XTST - Tenor T-stick - 10DOF;
#X add XTSB - Bass T-stick - 10DOF;
#X prefix_set 0 0 <none> 0;
#P objectname stream_type;
#P user ubumenu 5 39 53 9109513 0 1 1 0;
#X add stream0;
#X add stream1;
#X add stream2;
#X add stream3;
#X add stream4;
#X add stream5;
#X add stream6;
#X add stream7;
#X prefix_set 0 0 <none> 0;
#P objectname stream;
#P hidden message 31 90 191 9109513 /preset/store 1 default \, /preset/write;
#B color 3;
#P window linecount 2;
#P hidden message 257 225 66 9109513 \; jcom.init bang;
#P window linecount 1;
#P hidden message 123 290 243 9109513 /ui/freeze 0;
#P hidden newex 123 262 62 9109513 prepend set;
#P hidden message 58 108 125 9109513 /documentation/generate;
#P hidden newex 40 211 43 9109513 jcom.in;
#P hidden newex 40 259 45 9109513 pcontrol;
#P hidden newex 40 235 78 9109513 jcom.pass open;
#P window linecount 2;
#P hidden message 187 225 65 9109513 \; max refresh;
#P window linecount 1;
#P hidden message 184 108 31 9109513 /init;
#P hidden newex 40 312 101 9109513 jalg.sdif.record.control;
#P objectname jalg.sdif.player;
#P window linecount 2;
#P hidden newex 7 133 341 9109513 jcom.hub jmod.sdif.record.control @size 1U-half @module_type control @description "Send predefined stream definitions to the SDIF record module";
#P objectname jcom.hub;
#P hidden inlet 7 82 13 0;
#P hidden outlet 7 348 13 0;
#P bpatcher 0 0 256 61 0 0 jcom.gui.mxt 0 $0_;
#P objectname jcom.gui.audio-component.mxt;
#P hidden fasten 14 0 3 0 36 129 12 129;
#P hidden fasten 10 0 3 0 63 129 12 129;
#P hidden fasten 5 0 3 0 189 129 12 129;
#P hidden connect 2 0 3 0;
#P hidden connect 3 0 1 0;
#P hidden connect 9 0 7 0;
#P hidden connect 7 0 8 0;
#P hidden fasten 7 1 4 0 113 298 45 298;
#P hidden connect 8 0 4 0;
#P hidden fasten 25 0 26 0 648 339 45 339;
#P hidden connect 4 0 26 0;
#P hidden fasten 7 1 11 0 113 259 128 259;
#P hidden connect 11 0 12 0;
#P hidden fasten 17 0 19 0 383 194 376 194 376 147 383 147;
#P hidden connect 19 0 17 0;
#P hidden fasten 18 0 20 0 383 264 376 264 376 198 383 198;
#P hidden connect 20 0 18 0;
#P hidden fasten 23 0 24 0 383 329 376 329 376 267 383 267;
#P hidden connect 24 0 23 0;
#P hidden fasten 24 0 25 0 383 291 648 291;
#P pop;
