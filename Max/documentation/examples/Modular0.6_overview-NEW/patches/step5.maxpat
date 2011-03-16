{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 309.0, 44.0, 1116.0, 784.0 ],
		"bglocked" : 0,
		"defrect" : [ 309.0, 44.0, 1116.0, 784.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-80",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 921.0, 192.0, 187.0, 18.0 ],
					"text" : "/fps 31.102629"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 921.0, 166.0, 188.0, 20.0 ],
					"text" : "jcom.receive /player.B:activity/out"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-74",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 921.0, 69.0, 156.0, 48.0 ],
					"text" : "Use jcom.receive to listen the incoming and outputing activity of a model"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 921.0, 144.0, 180.0, 18.0 ],
					"text" : "/play 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 921.0, 116.0, 181.0, 20.0 ],
					"text" : "jcom.receive /player.B:activity/in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 349.0, 610.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 349.0, 632.0, 83.0, 18.0 ],
					"text" : "/fps:freeze $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-56",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 179.0, 230.0, 72.0, 20.0 ],
					"text" : "views"
				}

			}
, 			{
				"box" : 				{
					"arrowbgcolor" : [ 0.258824, 0.235294, 0.466667, 0.0 ],
					"arrowcolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"bgcolor" : [ 0.207843, 0.207843, 0.207843, 0.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"framecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"id" : "obj-59",
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/interface/ui/panel", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/player.7/preset/store/previous", ",", "/cuelist/read", ",", "/player.1/out/mute", ",", "/interface/ui/freeze", ",", "/player.B/preset/store/next", ",", "/interface/file/path", ",", "/player.15/preset/store/previous", ",", "/rate.1", ",", "/player.7/preset/remove/previous", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/interface/ui/color/toolbarBackground", ",", "/player.A/model/internals", ",", "/player.8/model/class", ",", "/player.7/preset/remove/current", ",", "/player.8", ",", "/cuelist/remove/previous", ",", "/player.1/out/preview", ",", "/player.15/preset/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/interface/rate", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/player.7/preset/store/current", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/interface/ui/color/toolbarText", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.16/model/address", ",", "/player.15/preset/store/current", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/player.16", ",", "/player.15/preset/write/again", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/player.8/model/reference", ",", "/track/channel.A/preset/remove/previous", ",", "/player.12/fps", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/player.7/preset/remove", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.15/preset/write", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.15/preset/recall", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/player.15/preset/read", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/player.11/play", ",", "/interface", ",", "/track/channel.B/model/class", ",", "/player.15/preset/names", ",", "/player.15/preset/recall/current", ",", "/player.B/play", ",", "/interface/view/mute", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/player.15/preset/store/next", ",", "/track/channel.A/file/path", ",", "/player.1/out/freeze", ",", "/player.B/preset/read/again", ",", "/player.5/file/load", ",", "/track/channel.A/fps", ",", "/interface/ui/out/preview", ",", "/interface/model/address", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/interface/ui/color/border", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/player.7/preset/recall/next", ",", "/player.6/file/path", ",", "/interface/view/reference", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/player.9/out/mute", ",", "/player.9/out/freeze", ",", "/player.7/preset", ",", "/track/channel.B/preset/write/again", ",", "/interface/file/load", ",", "/player.B/file/load", ",", "/player.7/preset/recall/previous", ",", "/interface/ui/out/mute", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/interface/ui/out/freeze", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/interface/view/help", ",", "/player.15/preset/recall/next", ",", "/player.14/file/path", ",", "/track/channel.A/preset/recall/next", ",", "/player.7/preset/write/again", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/player.16/model/reference", ",", "/track/channel.A/out/preview", ",", "/player.16/model/documentation/generate", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.15/preset/recall/previous", ",", "/player.7/preset/names", ",", "/player.13/file/load", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/player.7/preset/recall/current", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.8/model/documentation/generate", ",", "/player.B/model/class", ",", "/interface/fps", ",", "/track/model/mute", ",", "/player.8/model/help", ",", "/player.A/preset/store/next", ",", "/interface/ui/size", ",", "/track/channel.A/preset/remove/next", ",", "/player.15/preset/read/again", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/player.9/out", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/player.3/play", ",", "/track/channel.A/model/internals", ",", "/player.10/rate", ",", "/track/channel.B/preset/store/previous", ",", "/player.15/preset", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.7/preset/read/again", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.4/fps", ",", "/player.7/preset/recall", ",", "/player.B/out/freeze", ",", "/player.8/model/mute", ",", "/track/channel.A", ",", "/player.2/rate", ",", "/player.9/out/preview", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.7/preset/write", ",", "/player.B/preset", ",", "/file/path", ",", "/player.16/model/mute", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.1/out", ",", "/player.B/preset/store/current", ",", "/interface/view/class", ",", "/interface/view/internals", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/interface/view/documentation/generate", ",", "/interface/play", ",", "/player.15/preset/remove/next", ",", "/player.16/model/help", ",", "/player.A/preset/write", ",", "/player.16/model/internals", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/player.8/model/address", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/player.15/preset/remove", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/player.8/model/internals", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/player.7/preset/remove/next", ",", "/player.15/preset/store", ",", "/player.15/preset/remove/current", ",", "/player.16/model/class", ",", "/interface/ui/refresh", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/player.7/preset/read", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/interface/ui/color/contentBackground", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/player.7/preset/store/next", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help", ",", "/player.7/preset/store" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 4.0, 230.0, 176.0, 20.0 ],
					"prefix" : "/interface",
					"textcolor2" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 13.0, 270.0, 218.0, 27.0 ],
					"text" : "Open basicView.maxpat"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"id" : "obj-28",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 4.0, 263.0, 40.0, 40.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4.0, 345.0, 53.0, 20.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4.0, 315.0, 132.0, 18.0 ],
					"text" : "load basicView.maxpat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-25",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 340.0, 237.0, 276.0, 48.0 ],
					"text" : "The basic view patch  show how to use jcom.view in none model or view patch. In this case the jcom.view is not registered into the namespace."
				}

			}
, 			{
				"box" : 				{
					"args" : [  ],
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "basicView.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 340.0, 284.0, 104.0, 57.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-2",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 631.0, 283.0, 87.0 ],
					"text" : "No more step ! The overview is finished.\n\nIf you have any feedback to give please get in touch with us on the mailing list and we'll set up an account for you."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-52",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 340.0, 362.0, 247.0, 34.0 ],
					"text" : "Here is an intantiation of a movie view (/interface)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-78",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 655.0, 106.0, 34.0 ],
					"text" : "Set attribute of a  jcom.view object."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 348.0, 563.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 348.0, 585.0, 86.0, 18.0 ],
					"text" : "/fps:enable $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-13",
					"linecount" : 11,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 479.0, 606.0, 303.0, 158.0 ],
					"text" : "With no argument in the bpatcher, a view bpatcher registers his namespace below a /movie(view) node in order to do not create a new /movie instance.\nThe first argument can be used to set the /model/address directly. By default /model/address will be /movie if this instance exists (because it is a movie.view patch). Here the /model/address is /player.A.\nThen a second argument can register the view under another name than /movie(view) (here /interface address)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-70",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 501.0, 138.0, 62.0 ],
					"text" : "It is possible to talk to a parameter/message if a jcom.view binds on it in a view bpatcher."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-15",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.0, 647.0, 265.0, 103.0 ],
					"text" : "If you press the shift key when you are on a jcom.ui this would show the selection state of each ui object. If you click on the selection label this would change his selection state.\n\nFor instant this information is not used by any client but this will be done soon !"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 345.0, 474.0, 55.0, 18.0 ],
					"text" : "/file/load"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 345.0, 419.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 345.0, 441.0, 53.0, 18.0 ],
					"text" : "/play $1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.811765, 0.372549, 0.372549, 0.0 ],
					"border" : 2,
					"bordercolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"id" : "obj-27",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.0, 647.0, 264.0, 103.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-49",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.0, 521.0, 266.0, 62.0 ],
					"text" : "Here the movie.model have a jcom.out so it provides internals /out/mute, /out/freeze and /out/preview parameter and a /model/panel message exists in the patch."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-48",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.0, 474.0, 265.0, 48.0 ],
					"text" : "The jcom.ui widgets are now automatically added if the standard internal parameters exist in the binded model."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-46",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 479.0, 408.0, 335.0, 34.0 ],
					"text" : "It's possible to set the /model/address parameter of a view bpatcher to make it binds on a particular instance of a model."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 479.0, 585.0, 153.0, 18.0 ],
					"text" : "/fps 31.102665"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 896.0, 441.0, 56.0, 18.0 ],
					"text" : "/ui/panel"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 629.0, 441.0, 143.0, 18.0 ],
					"text" : "/model/address /player.B",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 479.0, 441.0, 143.0, 18.0 ],
					"text" : "/model/address /player.A",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/player.A", "/interface" ],
					"id" : "obj-51",
					"maxclass" : "bpatcher",
					"name" : "movie.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 479.0, 474.0, 300.0, 105.0 ],
					"presentation_rect" : [ 15.0, 15.0, 300.0, 105.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 812.0, 143.0, 80.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 625.0, 143.0, 96.0, 32.0 ],
					"text" : "/model/address /player.8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 757.0, 85.0, 51.0, 18.0 ],
					"text" : "/rate $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 757.0, 60.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.0, 85.0, 55.0, 18.0 ],
					"text" : "/file/load"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 702.0, 60.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 702.0, 85.0, 53.0, 18.0 ],
					"text" : "/play $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 702.0, 118.0, 129.0, 20.0 ],
					"text" : "movie.model /player.B"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 177.0, 95.0, 59.0, 20.0 ],
					"text" : "/interface"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 157.0, 95.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 8.0,
					"hidden" : 1,
					"id" : "obj-45",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 157.0, 116.0, 43.0, 14.0 ],
					"text" : "/interface"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-73",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 180.0, 205.0, 72.0, 20.0 ],
					"text" : "returns"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 180.0, 180.0, 72.0, 20.0 ],
					"text" : "messages"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-71",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 180.0, 155.0, 72.0, 20.0 ],
					"text" : "parameters"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-69",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2.0, 73.0, 152.0, 20.0 ],
					"text" : "Explore each namespace"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 99.0, 95.0, 55.0, 20.0 ],
					"text" : "/player.B"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 95.0, 55.0, 20.0 ],
					"text" : "/player.A"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 79.0, 95.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 8.0,
					"hidden" : 1,
					"id" : "obj-63",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 79.0, 116.0, 42.0, 14.0 ],
					"text" : "/player.B"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 8.0,
					"hidden" : 1,
					"id" : "obj-62",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4.0, 116.0, 42.0, 14.0 ],
					"text" : "/player.A"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 4.0, 95.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 8.0,
					"hidden" : 1,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 48.0, 230.0, 662.0, 226.0 ],
						"bglocked" : 0,
						"defrect" : [ 48.0, 230.0, 662.0, 226.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 525.0, 117.0, 116.0, 48.0 ],
									"text" : "jcom.namespace @lookfor jcom.view @format umenu"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 525.0, 179.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 257.0, 41.0, 91.0, 20.0 ],
									"text" : "loadmess clear"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 354.0, 117.0, 123.0, 48.0 ],
									"text" : "jcom.namespace @lookfor jcom.return @format umenu"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 182.0, 117.0, 141.0, 48.0 ],
									"text" : "jcom.namespace @lookfor jcom.message @format umenu"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 10.0, 117.0, 147.0, 48.0 ],
									"text" : "jcom.namespace @lookfor jcom.parameter @format umenu"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-53",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 10.0, 21.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-54",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 179.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-55",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.0, 179.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-56",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 354.0, 179.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [ 19.5, 81.0, 363.5, 81.0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 19.5, 81.0, 534.5, 81.0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 19.5, 81.0, 191.5, 81.0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 4.0, 136.0, 46.0, 16.0 ],
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0
					}
,
					"text" : "p explorer"
				}

			}
, 			{
				"box" : 				{
					"arrowbgcolor" : [ 0.258824, 0.235294, 0.466667, 0.0 ],
					"arrowcolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"bgcolor" : [ 0.207843, 0.207843, 0.207843, 0.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"framecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"id" : "obj-47",
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/interface/ui/panel", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/player.7/preset/store/previous", ",", "/cuelist/read", ",", "/player.1/out/mute", ",", "/interface/ui/freeze", ",", "/player.B/preset/store/next", ",", "/interface/file/path", ",", "/player.15/preset/store/previous", ",", "/rate.1", ",", "/player.7/preset/remove/previous", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/interface/ui/color/toolbarBackground", ",", "/player.A/model/internals", ",", "/player.8/model/class", ",", "/player.7/preset/remove/current", ",", "/player.8", ",", "/cuelist/remove/previous", ",", "/player.1/out/preview", ",", "/player.15/preset/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/interface/rate", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/player.7/preset/store/current", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/interface/ui/color/toolbarText", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.16/model/address", ",", "/player.15/preset/store/current", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/player.16", ",", "/player.15/preset/write/again", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/player.8/model/reference", ",", "/track/channel.A/preset/remove/previous", ",", "/player.12/fps", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/player.7/preset/remove", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.15/preset/write", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.15/preset/recall", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/player.15/preset/read", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/player.11/play", ",", "/interface", ",", "/track/channel.B/model/class", ",", "/player.15/preset/names", ",", "/player.15/preset/recall/current", ",", "/player.B/play", ",", "/interface/view/mute", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/player.15/preset/store/next", ",", "/track/channel.A/file/path", ",", "/player.1/out/freeze", ",", "/player.B/preset/read/again", ",", "/player.5/file/load", ",", "/track/channel.A/fps", ",", "/interface/ui/out/preview", ",", "/interface/model/address", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/interface/ui/color/border", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/player.7/preset/recall/next", ",", "/player.6/file/path", ",", "/interface/view/reference", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/player.9/out/mute", ",", "/player.9/out/freeze", ",", "/player.7/preset", ",", "/track/channel.B/preset/write/again", ",", "/interface/file/load", ",", "/player.B/file/load", ",", "/player.7/preset/recall/previous", ",", "/interface/ui/out/mute", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/interface/ui/out/freeze", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/interface/view/help", ",", "/player.15/preset/recall/next", ",", "/player.14/file/path", ",", "/track/channel.A/preset/recall/next", ",", "/player.7/preset/write/again", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/player.16/model/reference", ",", "/track/channel.A/out/preview", ",", "/player.16/model/documentation/generate", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.15/preset/recall/previous", ",", "/player.7/preset/names", ",", "/player.13/file/load", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/player.7/preset/recall/current", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.8/model/documentation/generate", ",", "/player.B/model/class", ",", "/interface/fps", ",", "/track/model/mute", ",", "/player.8/model/help", ",", "/player.A/preset/store/next", ",", "/interface/ui/size", ",", "/track/channel.A/preset/remove/next", ",", "/player.15/preset/read/again", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/player.9/out", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/player.3/play", ",", "/track/channel.A/model/internals", ",", "/player.10/rate", ",", "/track/channel.B/preset/store/previous", ",", "/player.15/preset", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.7/preset/read/again", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.4/fps", ",", "/player.7/preset/recall", ",", "/player.B/out/freeze", ",", "/player.8/model/mute", ",", "/track/channel.A", ",", "/player.2/rate", ",", "/player.9/out/preview", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.7/preset/write", ",", "/player.B/preset", ",", "/file/path", ",", "/player.16/model/mute", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.1/out", ",", "/player.B/preset/store/current", ",", "/interface/view/class", ",", "/interface/view/internals", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/interface/view/documentation/generate", ",", "/interface/play", ",", "/player.15/preset/remove/next", ",", "/player.16/model/help", ",", "/player.A/preset/write", ",", "/player.16/model/internals", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/player.8/model/address", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/player.15/preset/remove", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/player.8/model/internals", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/player.7/preset/remove/next", ",", "/player.15/preset/store", ",", "/player.15/preset/remove/current", ",", "/player.16/model/class", ",", "/interface/ui/refresh", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/player.7/preset/read", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/interface/ui/color/contentBackground", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/player.7/preset/store/next", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help", ",", "/player.7/preset/store" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 4.0, 205.0, 176.0, 20.0 ],
					"prefix" : "/interface",
					"textcolor2" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"arrowbgcolor" : [ 0.258824, 0.235294, 0.466667, 0.0 ],
					"arrowcolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"bgcolor" : [ 0.207843, 0.207843, 0.207843, 0.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"framecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"id" : "obj-19",
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/interface/ui/panel", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/player.7/preset/store/previous", ",", "/cuelist/read", ",", "/player.1/out/mute", ",", "/interface/ui/freeze", ",", "/player.B/preset/store/next", ",", "/interface/file/path", ",", "/player.15/preset/store/previous", ",", "/rate.1", ",", "/player.7/preset/remove/previous", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/interface/ui/color/toolbarBackground", ",", "/player.A/model/internals", ",", "/player.8/model/class", ",", "/player.7/preset/remove/current", ",", "/player.8", ",", "/cuelist/remove/previous", ",", "/player.1/out/preview", ",", "/player.15/preset/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/interface/rate", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/player.7/preset/store/current", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/interface/ui/color/toolbarText", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.16/model/address", ",", "/player.15/preset/store/current", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/player.16", ",", "/player.15/preset/write/again", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/player.8/model/reference", ",", "/track/channel.A/preset/remove/previous", ",", "/player.12/fps", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/player.7/preset/remove", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.15/preset/write", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.15/preset/recall", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/player.15/preset/read", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/player.11/play", ",", "/interface", ",", "/track/channel.B/model/class", ",", "/player.15/preset/names", ",", "/player.15/preset/recall/current", ",", "/player.B/play", ",", "/interface/view/mute", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/player.15/preset/store/next", ",", "/track/channel.A/file/path", ",", "/player.1/out/freeze", ",", "/player.B/preset/read/again", ",", "/player.5/file/load", ",", "/track/channel.A/fps", ",", "/interface/ui/out/preview", ",", "/interface/model/address", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/interface/ui/color/border", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/player.7/preset/recall/next", ",", "/player.6/file/path", ",", "/interface/view/reference", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/player.9/out/mute", ",", "/player.9/out/freeze", ",", "/player.7/preset", ",", "/track/channel.B/preset/write/again", ",", "/interface/file/load", ",", "/player.B/file/load", ",", "/player.7/preset/recall/previous", ",", "/interface/ui/out/mute", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/interface/ui/out/freeze", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/interface/view/help", ",", "/player.15/preset/recall/next", ",", "/player.14/file/path", ",", "/track/channel.A/preset/recall/next", ",", "/player.7/preset/write/again", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/player.16/model/reference", ",", "/track/channel.A/out/preview", ",", "/player.16/model/documentation/generate", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.15/preset/recall/previous", ",", "/player.7/preset/names", ",", "/player.13/file/load", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/player.7/preset/recall/current", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.8/model/documentation/generate", ",", "/player.B/model/class", ",", "/interface/fps", ",", "/track/model/mute", ",", "/player.8/model/help", ",", "/player.A/preset/store/next", ",", "/interface/ui/size", ",", "/track/channel.A/preset/remove/next", ",", "/player.15/preset/read/again", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/player.9/out", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/player.3/play", ",", "/track/channel.A/model/internals", ",", "/player.10/rate", ",", "/track/channel.B/preset/store/previous", ",", "/player.15/preset", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.7/preset/read/again", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.4/fps", ",", "/player.7/preset/recall", ",", "/player.B/out/freeze", ",", "/player.8/model/mute", ",", "/track/channel.A", ",", "/player.2/rate", ",", "/player.9/out/preview", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.7/preset/write", ",", "/player.B/preset", ",", "/file/path", ",", "/player.16/model/mute", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.1/out", ",", "/player.B/preset/store/current", ",", "/interface/view/class", ",", "/interface/view/internals", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/interface/view/documentation/generate", ",", "/interface/play", ",", "/player.15/preset/remove/next", ",", "/player.16/model/help", ",", "/player.A/preset/write", ",", "/player.16/model/internals", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/player.8/model/address", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/player.15/preset/remove", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/player.8/model/internals", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/player.7/preset/remove/next", ",", "/player.15/preset/store", ",", "/player.15/preset/remove/current", ",", "/player.16/model/class", ",", "/interface/ui/refresh", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/player.7/preset/read", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/interface/ui/color/contentBackground", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/player.7/preset/store/next", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help", ",", "/player.7/preset/store" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 4.0, 180.0, 176.0, 20.0 ],
					"prefix" : "/interface",
					"textcolor2" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"arrowbgcolor" : [ 0.258824, 0.235294, 0.466667, 0.0 ],
					"arrowcolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"bgcolor" : [ 0.207843, 0.207843, 0.207843, 0.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"framecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"id" : "obj-14",
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/interface/ui/panel", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/player.7/preset/store/previous", ",", "/cuelist/read", ",", "/player.1/out/mute", ",", "/interface/ui/freeze", ",", "/player.B/preset/store/next", ",", "/interface/file/path", ",", "/player.15/preset/store/previous", ",", "/rate.1", ",", "/player.7/preset/remove/previous", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/interface/ui/color/toolbarBackground", ",", "/player.A/model/internals", ",", "/player.8/model/class", ",", "/player.7/preset/remove/current", ",", "/player.8", ",", "/cuelist/remove/previous", ",", "/player.1/out/preview", ",", "/player.15/preset/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/interface/rate", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/player.7/preset/store/current", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/interface/ui/color/toolbarText", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.16/model/address", ",", "/player.15/preset/store/current", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/player.16", ",", "/player.15/preset/write/again", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/player.8/model/reference", ",", "/track/channel.A/preset/remove/previous", ",", "/player.12/fps", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/player.7/preset/remove", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.15/preset/write", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.15/preset/recall", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/player.15/preset/read", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/player.11/play", ",", "/interface", ",", "/track/channel.B/model/class", ",", "/player.15/preset/names", ",", "/player.15/preset/recall/current", ",", "/player.B/play", ",", "/interface/view/mute", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/player.15/preset/store/next", ",", "/track/channel.A/file/path", ",", "/player.1/out/freeze", ",", "/player.B/preset/read/again", ",", "/player.5/file/load", ",", "/track/channel.A/fps", ",", "/interface/ui/out/preview", ",", "/interface/model/address", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/interface/ui/color/border", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/player.7/preset/recall/next", ",", "/player.6/file/path", ",", "/interface/view/reference", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/player.9/out/mute", ",", "/player.9/out/freeze", ",", "/player.7/preset", ",", "/track/channel.B/preset/write/again", ",", "/interface/file/load", ",", "/player.B/file/load", ",", "/player.7/preset/recall/previous", ",", "/interface/ui/out/mute", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/interface/ui/out/freeze", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/interface/view/help", ",", "/player.15/preset/recall/next", ",", "/player.14/file/path", ",", "/track/channel.A/preset/recall/next", ",", "/player.7/preset/write/again", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/player.16/model/reference", ",", "/track/channel.A/out/preview", ",", "/player.16/model/documentation/generate", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.15/preset/recall/previous", ",", "/player.7/preset/names", ",", "/player.13/file/load", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/player.7/preset/recall/current", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.8/model/documentation/generate", ",", "/player.B/model/class", ",", "/interface/fps", ",", "/track/model/mute", ",", "/player.8/model/help", ",", "/player.A/preset/store/next", ",", "/interface/ui/size", ",", "/track/channel.A/preset/remove/next", ",", "/player.15/preset/read/again", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/player.9/out", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/player.3/play", ",", "/track/channel.A/model/internals", ",", "/player.10/rate", ",", "/track/channel.B/preset/store/previous", ",", "/player.15/preset", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.7/preset/read/again", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.4/fps", ",", "/player.7/preset/recall", ",", "/player.B/out/freeze", ",", "/player.8/model/mute", ",", "/track/channel.A", ",", "/player.2/rate", ",", "/player.9/out/preview", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.7/preset/write", ",", "/player.B/preset", ",", "/file/path", ",", "/player.16/model/mute", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.1/out", ",", "/player.B/preset/store/current", ",", "/interface/view/class", ",", "/interface/view/internals", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/interface/view/documentation/generate", ",", "/interface/play", ",", "/player.15/preset/remove/next", ",", "/player.16/model/help", ",", "/player.A/preset/write", ",", "/player.16/model/internals", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/player.8/model/address", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/player.15/preset/remove", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/player.8/model/internals", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/player.7/preset/remove/next", ",", "/player.15/preset/store", ",", "/player.15/preset/remove/current", ",", "/player.16/model/class", ",", "/interface/ui/refresh", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/player.7/preset/read", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/interface/ui/color/contentBackground", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/player.7/preset/store/next", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help", ",", "/player.7/preset/store" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 4.0, 155.0, 176.0, 20.0 ],
					"prefix" : "/interface",
					"textcolor2" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 527.0, 143.0, 80.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 340.0, 143.0, 96.0, 32.0 ],
					"text" : "/model/address /player.16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 472.0, 85.0, 51.0, 18.0 ],
					"text" : "/rate $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 472.0, 60.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 360.0, 85.0, 55.0, 18.0 ],
					"text" : "/file/load"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 417.0, 60.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-41",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 417.0, 85.0, 53.0, 18.0 ],
					"text" : "/play $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 417.0, 118.0, 129.0, 20.0 ],
					"text" : "movie.model /player.A"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-20",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 340.0, 17.0, 247.0, 34.0 ],
					"text" : "Here are two intantiations of movie models without view (/player.A and /player.B)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 14.0, 388.0, 218.0, 27.0 ],
					"text" : "Open movie.view.maxpat"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"id" : "obj-17",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 4.0, 381.0, 40.0, 40.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4.0, 463.0, 53.0, 20.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-57",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 4.0, 433.0, 138.0, 18.0 ],
					"text" : "load movie.view.maxpat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-18",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 227.0, 55.0 ],
					"text" : "This step shows how to program a jamoma view and how to intantiate it in a patch."
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 711.5, 113.0, 711.5, 113.0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 354.5, 497.0, 421.5, 497.0, 421.5, 466.0, 488.5, 466.0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 354.5, 466.0, 488.5, 466.0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-31", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 905.5, 466.0, 488.5, 466.0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 638.5, 466.0, 488.5, 466.0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 481.5, 110.0, 426.5, 110.0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 369.5, 110.0, 426.5, 110.0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 426.5, 110.0, 426.5, 110.0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"hidden" : 1,
					"midpoints" : [ 166.5, 133.0, 13.5, 133.0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 766.5, 113.0, 711.5, 113.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"hidden" : 0,
					"midpoints" : [ 488.5, 581.5, 622.5, 581.5 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 358.5, 652.0, 474.5, 652.0, 474.5, 466.0, 488.5, 466.0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-58", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-58", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-58", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"hidden" : 1,
					"midpoints" : [ 88.5, 133.0, 13.5, 133.0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"hidden" : 1,
					"midpoints" : [  ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"hidden" : 0,
					"midpoints" : [ 930.5, 139.5, 1091.5, 139.5 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 654.5, 113.0, 711.5, 113.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 357.5, 605.0, 474.0, 605.0, 474.0, 466.0, 488.5, 466.0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 1 ],
					"hidden" : 0,
					"midpoints" : [ 930.5, 188.5, 1098.5, 188.5 ],
					"source" : [ "obj-81", 0 ]
				}

			}
 ]
	}

}
