/*
	jmod.slider
	a slider UI widget for jamoma
	http://jamoma.org/
	by tim place

	Arguments:
		param_name, 	background r, g, b,		normal r, g, b,		hover r, g, b	
	OLD arguments: fgred fggreen fgblue bgred bggreen bgblue linered linegreen lineblue mode
*/

sketch.default2d();
var val = 0;
var brgb = [0.1, 0.1, 0.1];
var frgb = [0.2, 0.2, 0.2];
var rgb2 = [0.5, 0.5, 0.5];


function init()
{
	// process arguments
	if (jsarguments.length>1)
		frgb[0] = jsarguments[1]/255.;
	if (jsarguments.length>2)
		frgb[1] = jsarguments[2]/255.;
	if (jsarguments.length>3)
		frgb[2] = jsarguments[3]/255.;
	if (jsarguments.length>4)
		brgb[0] = jsarguments[4]/255.;
	if (jsarguments.length>5)
		brgb[1] = jsarguments[5]/255.;
	if (jsarguments.length>6)
		brgb[2] = jsarguments[6]/255.;
	if (jsarguments.length>7)
		rgb2[0] = jsarguments[7]/255.;
	if (jsarguments.length>8)
		rgb2[1] = jsarguments[8]/255.;
	if (jsarguments.length>9)
		rgb2[2] = jsarguments[9]/255.;

	draw();
}
init.local = 1;
init();


function bang()
{
	draw();
	refresh();
	outlet(0,val);
}

function msg_float(v)
{
	val = Math.min(Math.max(0, v), 1);
	notifyclients();
	bang();
}

function fsaa(v)
{
	sketch.fsaa = v;
	bang();
}


// DRAWING ***************************************************************
function draw()
{
	var width = box.rect[2] - box.rect[0];
	var height = box.rect[3] - box.rect[1];
	var aspect = width/height;

	var myround = 1;
	var mypadding = 0.15;
	
	with (sketch) {
		//scale everything to box size
//		glmatrixmode("modelview");
//		glpushmatrix();
//		glscale(aspect, 1, 1);
//		glenable("line_smooth");

		// erase background
		glclearcolor(brgb);
		glclear();
		
		// draw background outline
		moveto(0, 0);
		glcolor(0.8, 0.8, 0.8);
		roundedplane(1.0, aspect, 1.0);

		// draw background (two circles and a plane)
		moveto(-aspect + 1, 0);
		glcolor(0.6, 0.6, 0.6);
		circle(0.9, 0, 360);

		moveto(aspect - 1, 0);
		glcolor(0.2, 0.2, 0.2);
		circle(0.9, 0, 360);

		moveto(0, 0);
		glcolor(0.2, 0.2, 0.2);
		plane(aspect - 1, 0.9, aspect - 1, 0.9);
	
		// draw the active part of the slider
		moveto((-aspect + 0.5) + (val * (aspect-1)), 0.0);
		glcolor(0.6, 0.6, 0.6);
		plane(val * aspect, 0.9, val * aspect, 0.9);


		
/*
		//draw line
		glcolor(rgb2);
		shapeslice(1, 1);
		moveto(0, 0);
		plane(0.15, 0.8);
		
		// draw marker
		glcolor(frgb);
		shapeslice(1, 1);		
		moveto(0.0, 1.6 * val-0.8); //on screen in range -0.8 to 0.8	
		plane(0.8, 0.05); 
*/
		//reset transformation matrix
//		glmatrixmode("modelview");
//		glpopmatrix();
	}
}


// MOUSE SUPPORT ***************************************************************
function onclick(x,y,but,cmd,shift,capslock,option,ctrl)
{
	ondrag(x,y,but,cmd,shift,capslock,option,ctrl)
}
onclick.local = 1; //private. could be left public to permit "synthetic" events


function ondrag(x,y,but,cmd,shift,capslock,option,ctrl)
{
	var f,a;

	a = sketch.screentoworld(x,y);
	f = (a[0]+0.8) / 1.6; //on screen in range -0.8 to 0.8	
	msg_float(f); //set new value with clipping + refresh
}
ondrag.local = 1; //private. could be left public to permit "synthetic" events


function onresize(w,h)
{
	draw();
	refresh();
}
onresize.local = 1; //private


// PATTR SUPPORT ***************************************************************
function setvalueof(v)
{
	msg_float(v);
}

function getvalueof()
{
	return val;
}

