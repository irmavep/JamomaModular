{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 102.0, 104.0, 1130.0, 610.0 ],
		"bglocked" : 0,
		"defrect" : [ 102.0, 104.0, 1130.0, 610.0 ],
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-83",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 954.0, 397.0, 156.0, 20.0 ],
					"text" : "or several ones :"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 928.0, 395.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 928.0, 371.0, 173.0, 20.0 ],
					"text" : "jcom.receive /player.A/play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 973.0, 447.0, 83.0, 18.0 ],
					"text" : "/player.B/play"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 928.0, 445.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 928.0, 421.0, 173.0, 20.0 ],
					"text" : "jcom.receive /player.*/play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-59",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 929.0, 337.0, 156.0, 34.0 ],
					"text" : "Use jcom.receive to listen to one parameter :"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-96",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 956.0, 139.0, 145.0, 20.0 ],
					"text" : "parameter's address"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-95",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 951.0, 264.0, 148.0, 20.0 ],
					"text" : "wildcards also work"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-94",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1047.0, 237.0, 41.0, 20.0 ],
					"text" : "thru it"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-93",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 982.0, 215.0, 148.0, 20.0 ],
					"text" : "access the parameter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-92",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 957.0, 194.0, 148.0, 20.0 ],
					"text" : "as there is a hub, you can"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-91",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 958.0, 117.0, 145.0, 20.0 ],
					"text" : "direct access to the"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 929.0, 263.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 928.0, 287.0, 177.0, 20.0 ],
					"text" : "jcom.send /track/channel.*/play"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 930.0, 139.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 930.0, 160.0, 173.0, 20.0 ],
					"text" : "jcom.send /player.A/play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-80",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 925.0, 588.0, 187.0, 18.0 ],
					"text" : "/fps 29.979038"
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
					"patching_rect" : [ 925.0, 562.0, 188.0, 20.0 ],
					"text" : "jcom.receive /player.B:activity/out"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-74",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 925.0, 479.0, 174.0, 34.0 ],
					"text" : "or the incoming and outputing activity of a model"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-70",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 925.0, 540.0, 180.0, 18.0 ],
					"text" : "/play 0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 925.0, 512.0, 181.0, 20.0 ],
					"text" : "jcom.receive /player.B:activity/in"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-48",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 929.0, 68.0, 145.0, 34.0 ],
					"text" : "Use jcom.send to access remotely to a model"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 929.0, 193.0, 20.0, 20.0 ]
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
					"patching_rect" : [ 929.0, 215.0, 53.0, 18.0 ],
					"text" : "/play $1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 929.0, 235.0, 115.0, 20.0 ],
					"text" : "jcom.send /player.A"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-15",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 675.0, 393.0, 210.0, 48.0 ],
					"text" : "Set attributes and send messages to any parameters|messages|returns inside the model."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "flonum",
					"maximum" : 2.0,
					"minimum" : -2.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 551.0, 369.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 551.0, 394.0, 123.0, 18.0 ],
					"text" : "/rate:value/default $1"
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
					"patching_rect" : [ 609.0, 418.0, 65.0, 18.0 ],
					"text" : "/rate:reset"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-5",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 405.0, 284.0, 103.0 ],
					"text" : "The default view is a way to quickly expose a graphical interface of a model.\n\nBut sometimes a more specific view can be usefull to focus on a way to use a model :\nclick on \"Next step\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-56",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 301.0, 353.0, 216.0, 34.0 ],
					"text" : "Here is an instantiation of the movie model with his default view (/player.B)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 784.0, 154.0, 16.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 653.0, 154.0, 16.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-50",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 653.0, 319.0, 97.0, 18.0 ],
					"text" : "/fps 29.946814"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 547.0, 319.0, 97.0, 18.0 ],
					"text" : "/fps 29.946814"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 625.0, 295.0, 231.0, 20.0 ],
					"text" : "jcom.oscroute /channel.A /channel.B"
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
					"patching_rect" : [ 184.0, 202.0, 55.0, 20.0 ],
					"text" : "/track"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"id" : "obj-44",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 164.0, 202.0, 20.0, 20.0 ]
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
					"patching_rect" : [ 164.0, 223.0, 32.5, 14.0 ],
					"text" : "/track"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 769.0, 134.0, 129.0, 18.0 ],
					"text" : "/channel.B/file/load"
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
					"patching_rect" : [ 638.0, 134.0, 129.0, 18.0 ],
					"text" : "/channel.A/file/load"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 784.0, 172.0, 109.0, 18.0 ],
					"text" : "/channel.B/play $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 788.0, 226.0, 80.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 707.0, 226.0, 80.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 653.0, 172.0, 109.0, 18.0 ],
					"text" : "/channel.A/play $1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 625.0, 200.0, 182.0, 20.0 ],
					"text" : "track.model"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-1",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 616.0, 67.0, 272.0, 48.0 ],
					"text" : "It is also possible to make model containing models. Below here is a track model with two movie models inside (/channel.A and /channel.B)"
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
					"patching_rect" : [ 184.0, 312.0, 72.0, 20.0 ],
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
					"patching_rect" : [ 185.0, 287.0, 72.0, 20.0 ],
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
					"patching_rect" : [ 186.0, 262.0, 72.0, 20.0 ],
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
					"patching_rect" : [ 8.0, 180.0, 152.0, 20.0 ],
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
					"patching_rect" : [ 105.0, 202.0, 55.0, 20.0 ],
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
					"patching_rect" : [ 28.0, 202.0, 55.0, 20.0 ],
					"text" : "/player.A"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"id" : "obj-64",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 85.0, 202.0, 20.0, 20.0 ]
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
					"patching_rect" : [ 85.0, 223.0, 42.0, 14.0 ],
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
					"patching_rect" : [ 10.0, 223.0, 42.0, 14.0 ],
					"text" : "/player.A"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"id" : "obj-60",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"patching_rect" : [ 10.0, 202.0, 20.0, 20.0 ]
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
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 555.0, 255.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 555.0, 255.0 ],
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
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 224.0, 39.0, 91.0, 20.0 ],
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
									"patching_rect" : [ 10.0, 44.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-54",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 176.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-55",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.0, 176.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-56",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 354.0, 176.0, 25.0, 25.0 ]
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
									"midpoints" : [ 19.5, 92.5, 363.5, 92.5 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 19.5, 92.5, 191.5, 92.5 ],
									"source" : [ "obj-53", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 10.0, 243.0, 46.0, 16.0 ],
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
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/cuelist/read", ",", "/player.B/preset/store/next", ",", "/rate.1", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/player.A/model/internals", ",", "/cuelist/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/track/channel.A/preset/remove/previous", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/track/channel.B/model/class", ",", "/player.B/play", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/track/channel.A/file/path", ",", "/player.B/preset/read/again", ",", "/track/channel.A/fps", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/track/channel.B/preset/write/again", ",", "/player.B/file/load", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/track/channel.A/preset/recall/next", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/track/channel.A/out/preview", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.B/model/class", ",", "/track/model/mute", ",", "/player.A/preset/store/next", ",", "/track/channel.A/preset/remove/next", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/track/channel.A/model/internals", ",", "/track/channel.B/preset/store/previous", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.B/out/freeze", ",", "/track/channel.A", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.B/preset", ",", "/file/path", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.B/preset/store/current", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/player.A/preset/write", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 10.0, 312.0, 176.0, 20.0 ],
					"prefix" : "Mac:/",
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
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/cuelist/read", ",", "/player.B/preset/store/next", ",", "/rate.1", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/player.A/model/internals", ",", "/cuelist/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/track/channel.A/preset/remove/previous", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/track/channel.B/model/class", ",", "/player.B/play", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/track/channel.A/file/path", ",", "/player.B/preset/read/again", ",", "/track/channel.A/fps", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/track/channel.B/preset/write/again", ",", "/player.B/file/load", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/track/channel.A/preset/recall/next", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/track/channel.A/out/preview", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.B/model/class", ",", "/track/model/mute", ",", "/player.A/preset/store/next", ",", "/track/channel.A/preset/remove/next", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/track/channel.A/model/internals", ",", "/track/channel.B/preset/store/previous", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.B/out/freeze", ",", "/track/channel.A", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.B/preset", ",", "/file/path", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.B/preset/store/current", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/player.A/preset/write", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 10.0, 287.0, 176.0, 20.0 ],
					"prefix" : "Mac:/",
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
					"items" : [ "/player.B/preset/remove/next", ",", "/track/channel.B/preset/recall/previous", ",", "/track/channel.A/play", ",", "/track/channel.A/model/help", ",", "/player.B/preset/remove/previous", ",", "/cuelist/read", ",", "/player.B/preset/store/next", ",", "/rate.1", ",", "/track/channel.B/preset/store", ",", "/player.A/preset/recall/previous", ",", "/player.A/preset/names", ",", "/track/channel.B/out/freeze", ",", "/player.A/model/internals", ",", "/cuelist/remove/previous", ",", "/player.B/model/help", ",", "/play.1", ",", "/player.A/preset/recall", ",", "/track/model/class", ",", "/track/channel.B/model/help", ",", "/track/channel.A/rate", ",", "/cuelist/names", ",", "/player.A/preset/read", ",", "/track/channel.A/preset/recall/previous", ",", "/track/channel.A/preset/write", ",", "/track/channel.B/preset/read", ",", "/track/channel.A/file/load", ",", "/player.A/out", ",", "/track/channel.A/preset/names", ",", "/player.B/rate", ",", "/cuelist/remove/current", ",", "/track/channel.A/model/mute", ",", "/player.A/preset/store/previous", ",", "/track/channel.B", ",", "/track/channel.A/preset/store/current", ",", "/player.A/rate", ",", "/player.B/model/address", ",", "/fps", ",", "/track/channel.A/preset/remove/previous", ",", "/player.A/preset/remove/current", ",", "/player.B/model/mute", ",", "/track/channel.A/out/mute", ",", "/track/channel.B/out/preview", ",", "/player.B", ",", "/player.A/preset/read/again", ",", "/player.A/out/preview", ",", "/player.A/preset/store/current", ",", "/player.A/preset/write/again", ",", "/track/channel.A/preset/store/next", ",", "/player.B/out/mute", ",", "/track/channel.B/preset/write", ",", "/track/channel.B/preset/recall/current", ",", "/player.A/model/address", ",", "/track/channel.A/model/reference", ",", "/cuelist/recall/previous", ",", "/cuelist/store/previous", ",", "/track/channel.B/model/class", ",", "/player.B/play", ",", "/track/model/help", ",", "/player.A/play", ",", "/track/channel.A/preset/read/again", ",", "/cuelist/recall/current", ",", "/player.B/preset/read", ",", "/track/channel.A/file/path", ",", "/player.B/preset/read/again", ",", "/track/channel.A/fps", ",", "/player.B/fps", ",", "/player.B/preset/remove", ",", "/cuelist/remove/next", ",", "/cuelist", ",", "/player.B/file/path", ",", "/track/channel.A/preset/remove", ",", "/player.A/preset/recall/next", ",", "/track/channel.B/preset/remove/current", ",", "/player.A/preset", ",", "/track/channel.B/preset/recall", ",", "/track/channel.B/out", ",", "/track/channel.B/preset/recall/next", ",", "/track/channel.B/model/documentation/generate", ",", "/cuelist/store/next", ",", "/player.B/preset/recall/next", ",", "/cuelist/store/current", ",", "/player.B/preset/recall", ",", "/player.A/preset/remove/previous", ",", "/track/channel.B/preset/write/again", ",", "/player.B/file/load", ",", "/track/channel.B/file/load", ",", "/file/load", ",", "/player.B/preset/write", ",", "/track/model/internals", ",", "/track/channel.B/model/mute", ",", "/player.B/preset/write/again", ",", "/track/channel.B/preset/names", ",", "/player.B/preset/remove/current", ",", "/track/channel.A/preset/recall/next", ",", "/player.B/out/preview", ",", "/player.B/model/documentation/generate", ",", "/player.B/preset/names", ",", "/track/channel.A/preset", ",", "/track/channel.A/out/preview", ",", "/track/channel.A/model/class", ",", "/track/channel.A/preset/remove/current", ",", "/player.A/out/mute", ",", "/player.A/preset/remove", ",", "/file/path.1", ",", "/track/channel.B/model/address", ",", "/track/channel.B/preset/store/current", ",", "/fps.1", ",", "/player.B/model/class", ",", "/track/model/mute", ",", "/player.A/preset/store/next", ",", "/track/channel.A/preset/remove/next", ",", "/play", ",", "/cuelist/store", ",", "/track/channel.A/preset/store/previous", ",", "/track/channel.B/fps", ",", "/track/channel.A/preset/write/again", ",", "/track/channel.A/out", ",", "/player.A/model/class", ",", "/player.B/model/reference", ",", "/track/channel.A/model/internals", ",", "/track/channel.B/preset/store/previous", ",", "/player.A/model/reference", ",", "/player.A/preset/remove/next", ",", "/cuelist/remove", ",", "/player.A/preset/store", ",", "/track/channel.B/preset/remove/next", ",", "/file/load.1", ",", "/cuelist/recall", ",", "/player.A/file/path", ",", "/track/channel.B/file/path", ",", "/track/channel.B/preset/read/again", ",", "/player.B/out/freeze", ",", "/track/channel.A", ",", "/track/channel.B/preset/store/next", ",", "/player.A/preset/recall/current", ",", "/player.B/preset", ",", "/file/path", ",", "/track/channel.A/preset/store", ",", "/rate", ",", "/player.B/preset/store/current", ",", "/player.A/file/load", ",", "/track/channel.A/preset/read", ",", "/player.A/preset/write", ",", "/player.B/preset/recall/previous", ",", "/track/channel.A/preset/recall/current", ",", "/track/model/address", ",", "/player.B/preset/recall/current", ",", "/player.A", ",", "/track/channel.B/preset/remove/previous", ",", "/cuelist/recall/next", ",", "/track/channel.A/preset/recall", ",", "/track/channel.A/model/address", ",", "/track/channel.B/preset", ",", "/track/channel.B/model/reference", ",", "/track/channel.B/preset/remove", ",", "/player.A/out/freeze", ",", "/track/channel.B/play", ",", "/track/model/documentation/generate", ",", "/track/model/reference", ",", "/track/channel.B/model/internals", ",", "/player.B/preset/store", ",", "/player.B/model/internals", ",", "/player.A/model/documentation/generate", ",", "/cuelist/write", ",", "/player.A/model/mute", ",", "/player.B/out", ",", "/track/channel.A/out/freeze", ",", "/track", ",", "/track/channel.B/out/mute", ",", "/track/channel.B/rate", ",", "/player.B/preset/store/previous", ",", "/track/channel.A/model/documentation/generate", ",", "/player.A/fps", ",", "/player.A/model/help" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 10.0, 262.0, 176.0, 20.0 ],
					"prefix" : "Mac:/",
					"textcolor2" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 142.0, 101.0, 18.0 ],
					"text" : "/model/reference"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 167.0, 73.0, 18.0 ],
					"text" : "/model/help"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 493.0, 226.0, 80.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 306.0, 225.0, 96.0, 18.0 ],
					"text" : "/fps 29.946814"
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
					"patching_rect" : [ 438.0, 167.0, 51.0, 18.0 ],
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
					"patching_rect" : [ 438.0, 142.0, 50.0, 20.0 ]
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
					"patching_rect" : [ 326.0, 167.0, 55.0, 18.0 ],
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
					"patching_rect" : [ 383.0, 142.0, 20.0, 20.0 ]
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
					"patching_rect" : [ 383.0, 167.0, 53.0, 18.0 ],
					"text" : "/play $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 437.0, 418.0, 112.0, 18.0 ],
					"text" : "/rate $1 ramp 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 437.0, 393.0, 50.0, 20.0 ]
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
					"patching_rect" : [ 325.0, 418.0, 55.0, 18.0 ],
					"text" : "/file/load"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 383.0, 200.0, 129.0, 20.0 ],
					"text" : "movie.model /player.A"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 305.0, 535.0, 96.0, 18.0 ],
					"text" : "/fps 29.979038"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 382.0, 393.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 382.0, 418.0, 53.0, 18.0 ],
					"text" : "/play $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 533.0, 535.0, 80.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/player.B" ],
					"id" : "obj-21",
					"maxclass" : "bpatcher",
					"name" : "movie.model.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 382.0, 451.0, 169.0, 77.0 ]
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
					"patching_rect" : [ 301.0, 67.0, 216.0, 34.0 ],
					"text" : "Here is an instantiation of the movie model without view (/player.A)"
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
					"patching_rect" : [ 14.0, 66.0, 232.0, 27.0 ],
					"text" : "Open movie.model.maxpat"
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
					"patching_rect" : [ 4.0, 59.0, 40.0, 40.0 ]
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
					"patching_rect" : [ 4.0, 141.0, 53.0, 20.0 ],
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
					"patching_rect" : [ 4.0, 111.0, 147.0, 18.0 ],
					"text" : "load movie.model.maxpat"
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
					"patching_rect" : [ 0.0, 0.0, 244.0, 55.0 ],
					"text" : "This step shows how to program a jamoma model and how to instantiate it in a patch."
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 618.5, 443.0, 391.5, 443.0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 560.5, 443.0, 391.5, 443.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-13", 0 ]
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
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-21", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 793.5, 194.5, 634.5, 194.5 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 778.5, 194.0, 634.5, 194.0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-3", 2 ]
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
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 334.5, 443.0, 391.5, 443.0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 647.5, 194.0, 634.5, 194.0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 446.5, 443.0, 391.5, 443.0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 447.5, 192.0, 392.5, 192.0 ],
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
					"midpoints" : [ 335.5, 192.0, 392.5, 192.0 ],
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
					"midpoints" : [ 392.5, 192.0, 392.5, 192.0 ],
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
					"midpoints" : [ 173.5, 240.0, 19.5, 240.0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-46", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 509.5, 192.0, 392.5, 192.0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 509.5, 192.5, 392.5, 192.5 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-55", 0 ]
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
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 662.5, 194.5, 634.5, 194.5 ],
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
					"midpoints" : [ 94.5, 240.0, 19.5, 240.0 ],
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
					"destination" : [ "obj-70", 1 ],
					"hidden" : 0,
					"midpoints" : [ 934.5, 535.5, 1095.5, 535.5 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-77", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 1 ],
					"hidden" : 0,
					"midpoints" : [ 934.5, 584.5, 1102.5, 584.5 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-90", 0 ]
				}

			}
 ]
	}

}
