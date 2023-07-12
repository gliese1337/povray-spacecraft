#declare bigness = 7.5;
#declare enghue=Gold;
#declare strut=Silver;
#declare crewcolor=Silver;

declare body=
union{
cylinder{<0, 0, 2.5>, <5, 0, 2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, -2.5>, <5, 0, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, 2.5>, <5, 0, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, -2.5>, <5, 0, 2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
}

#declare bodyset=
union{
object {body translate <0,4.3,0>
             rotate <30,0,0>}
object {body translate <0,-4.3,0>
             rotate <30,0,0>}

object {body translate <0,4.3,0>
             rotate <150,0,0>}
object {body translate <0,-4.3,0>
             rotate <150,0,0>}

object {body translate <0,4.3,0>
             rotate <270,0,0>}
object {body translate <0,-4.3,0>
             rotate <270,0,0>}
}

#declare ionsection=
union{
box{    <0, 2.85, 1.7>, <5, 2.9, -1.7>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
	
box{	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	rotate <120,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	rotate <120,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
	
box{	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	rotate <240,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	rotate <240,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
}

#declare iontube=
union{
object{ionsection}

disc{	<0, 0, 0>, <1, 0, 0>, 2.9
	texture {pigment{enghue}
	finish {ambient .45}}}
disc{	<5, 0, 0>, <1, 0, 0>, 2.9
	texture {pigment{enghue}
	finish {ambient .45}}}
cylinder{
	<-.5, 0, -3>, <.5, 0, -3>, .1
	texture { 
		pigment{ Red }
		finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
	
}
cylinder{
	<-.5, 0, 3>, <.5, 0, 3>, .1
	texture { 
		pigment{ Red }
		finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
	
}
}

#declare exhaust=
union {
 lathe {
    bezier_spline
    4, <0,12>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {rgbft <.1, .15, .2, 0.5, 0>}}
    finish {diffuse 1 ambient rgb <0, 0.5, 0.7>}
    hollow
    interior {media {emission 3} } 
    rotate <0,0,90>
  }
  
  lathe {
    bezier_spline
    4, <0,9>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {rgbft <.2, .3, .32, .9, .7>}}
    finish {diffuse .45}
    hollow
    rotate <0,0,90>
    scale <.5,.3,.3>
    translate <-5,0,0>
  }
 
  cone {
    <0, 0, 0>, 3    // Center and radius of one end
    <-15, 0, 0>, 4.0    // Center and radius of other end
    open              // Removes end caps
    texture {pigment {rgbft <.2, .3, .32, .5, .25>*2}}
    finish {diffuse 1} 
  }
  
  cylinder{<.5,0,0>,<-.5,0,0>,3
          texture {pigment {Grey}}
          finish {ambient .45 diffuse .45}
          }
}

#declare engine=
union{
object{iontube scale 2}
}

#declare bodytube=
union{
object{bodyset}
object{bodyset translate <5,0,0>}
object{bodyset translate <10,0,0>}
object{bodyset translate <15,0,0>}
object{bodyset translate <20,0,0>}
object{bodyset translate <25,0,0>}
object{bodyset translate <30,0,0>}
object{bodyset translate <35,0,0>}
object{bodyset translate <40,0,0>}
object{bodyset translate <45,0,0>}
object{bodyset translate <50,0,0>}
}


#declare fin=
union{
polygon{5, <0,0,5>, <10,0,5>, <9,0,45>, <.5,0,45>, <0,0,5>
      pigment {rgb <.3,.3,.4>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
cylinder{<2,0,0>,<2,0,25>,.1
      pigment {rgb <.3,.3,.4>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
}

#declare tankset=
union {
sphere {<0,7,0>, 2.5
        pigment {Grey}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<0,7,0>,<20,7,0>, 2.5
        pigment {Grey}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<20,7,0>, 2.5
        pigment {Grey}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.3,7,0>,<-2.3,2,0>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<22.3,7,0>,<22.3,2,0>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}

sphere {<0,-7,0>, 2.5
        pigment {Grey}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<0,-7,0>,<20,-7,0>, 2.5
        pigment {Grey}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<20,-7,0>, 2.5
        pigment {Grey}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.3,-7,0>,<-2.3,-2,0>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<22.3,-7,0>,<22.3,-2,0>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}       
}
  
#declare powerplant=
union{
  box{<2,-2,-2>,<6,2,2>
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
  box{<63,-3,-3>,<69,3,3>
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
  sphere{<14,0,0>,2.5
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
  sphere{<19,0,0>,2.5
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
object {fin}
object {fin rotate <180,0,0>}
object {fin scale .8 translate <11,0,0>}
object {fin scale .8 translate <11,0,0> rotate <180,0,0>}
object {fin scale .64 translate <20,0,0>}
object {fin scale .64 translate <20,0,0> rotate <180,0,0>}
object {fin scale .572 translate <27,0,0>}
object {fin scale .572 translate <27,0,0> rotate <180,0,0>}
}      

#declare crewsect=
union{
cone{<0, 0, 0>, 1    // Center and radius of one end
    <2, 0, 0>, 5    // Center and radius of other end
    texture {pigment {Orange}
    finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
    }
cylinder{<2, 0, 0>, <14, 0, 0>, 5
	texture {pigment{Orange}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
cone{<14, 0, 0>, 5    // Center and radius of one end
    <16, 0, 0>, 1    // Center and radius of other end
    texture {pigment {Orange}
    finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
    }
}

#declare arm=
union{
cylinder{<0,2.8,0>,<3,7.5,0>,.25
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
cylinder{<3,7.5,0>,<10,9,0>,.25
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
}

#declare tug=
union{
object{engine scale <1.3,1.3,1.3>}
object{bodytube}
object{bodytube translate <50,0,0>}
object{crewsect translate <20,0,0>}

cylinder{<10,0,0>,<100,0,0>,.5
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
object{tankset scale .6 translate <45,0,0>}
object{powerplant translate <35,0,0>}

object{arm translate <104,0,0>}
object{arm translate <104,0,0> rotate 60*x}
object{arm translate <104,0,0> rotate 120*x}
object{arm translate <104,0,0> rotate 180*x}
object{arm translate <104,0,0> rotate -60*x}
object{arm translate <104,0,0> rotate -120*x}

object{exhaust}
object{exhaust translate <0,0,11> scale .5}
object{exhaust translate <0,0,-11> scale .5}
object{exhaust translate <0,0,11> scale .5 rotate 120*x}
object{exhaust translate <0,0,-11> scale .5 rotate 120*x}
object{exhaust translate <0,0,11> scale .5 rotate 240*x}
object{exhaust translate <0,0,-11> scale .5 rotate 240*x}
}