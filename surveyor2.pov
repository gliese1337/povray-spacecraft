#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."

  /*global_settings {
  ambient_light White*2
  }
  background{Grey}*/

#declare enghue=Grey/2;
#declare strut=Silver;
#declare crewcolor=Silver;

camera {
   //orthographic
   //location <60,10,0>
   //location <0,0,-70>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   location <-10,0,-10>		// simple command for camera direction
}
    
/*light_source {			// point light source
   <5,0,0>
   color rgb <.1, .2, .22>	// color of light
}
light_source {			// point light source
   <0,0,0>
   color rgb <.2, .3, .32>*20	// color of light
}*/
light_source {			// point light source
   <500,  800,  -1000>	// location vector
   color rgb <.5, .5, .5>	// color of light

}
light_source { 
  <10,0,0> 
  color White/3 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at <12,0,0>
  radius 50
  falloff 5
  tightness .5
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
}
light_source{
        //<10, 0, -100>
	//<-150, 150, -150>
	<-30,0,0>
	color rgb <.5, .5, .5>
	spotlight
        point_at <10,0,0>
}
    

#declare rad=
union{
torus{3,.1
      rotate 90*z
      rotate 40*y
      translate <0,3,0>
      clipped_by{box{<-2.5,-.2,-2.5>,<2.5,.7,2.5>}}
      texture {pigment{strut}}
      finish{ambient .45}
      scale <1.4,1,1.4>
      }
torus{3,.1
      rotate 90*z
      rotate -40*y
      translate <0,3,0>
      clipped_by{box{<-2.5,-.2,-2.5>,<2.5,.7,2.5>}}
      texture {pigment{strut}}
      finish{ambient .45}
      scale <1.4,1,1.4>
      }

sphere{0,.2
	texture {pigment{strut}}
	finish{ambient .45}
	}
	
cylinder{<0,0,0>,<0,-1.5,0>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0,-.75,0>,<0,-.85,0>, 1.25
	texture {pigment{strut}}
	finish{ambient .45}
	}

cylinder{<-1.85,.7,-2.15>,<1.85,.7,-2.15>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.85,.7,2.15>,<1.85,.7,2.15>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
	

cylinder{<-1.8,.7,0>,<1.8,.7,0>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
	
cylinder{<-1.8,.7,1.6>,<1.8,.7,1.6>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.8,.7,-1.6>,<1.8,.7,-1.6>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}

cylinder{<-1.8,.7,1.05>,<1.8,.7,1.05>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.8,.7,-1.05>,<1.8,.7,-1.05>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}

cylinder{<-1.8,.7,.5>,<1.8,.7,.5>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.8,.7,-.5>,<1.8,.7,-.5>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}	

	
cylinder{<-1.8,.7,-2.2>,<-1.8,.7,2.2>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<1.8,.7,-2.2>,<1.8,.7,2.2>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
translate <2.5,0,0>
}

#declare bodyset=
union{
object {rad translate <0,4,0>}
object {rad translate <0,4,0> rotate 60*x}
object {rad translate <0,4,0> rotate -60*x}
cylinder{<-2,0,0>,<6,0,0>,2.5
        texture {pigment{strut}}
	finish{ambient .45}
	}
}

#declare exhaust=
union {
  lathe {
    bezier_spline
    4, <0,9>, <1,2.25>, <2,1.125>, <3,0>
    texture {pigment {rgbft <.1, .15, .2, 0.5, .025>}}
    finish {diffuse .45}
    hollow
    interior{media {emission 12}}
    rotate <0,0,90>
    scale <1,.6,.6>
  }
}

#declare coil=
union{
cylinder{<-2.5,2,-1.5>,<2.5,2,-1.5>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.5,2,1.5>,<2.5,2,1.5>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
box{<-1.5,1.95,-1.5>,<1.5,2.05,1.5>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}

cylinder{<-2.5,0,-1.5>,<2.5,0,-1.5>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.5,0,1.5>,<2.5,0,1.5>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
box{<-1.5,-.05,-1.5>,<1.5,.05,1.5>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}

cylinder{<0,2,0>,<0,-1.5,0>,.4
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.2,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.4,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.6,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.8,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1.2,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1.4,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1.6,0>}
torus{1.4,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1.8,0>}
}

#declare nozzle=
union{
cylinder{<.25,0,0>,<-.25,0,0>,6.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
torus{6.2,.3
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z}
cylinder{<0,0,0>,<-1.5,0,0>,2.5
        texture {pigment{strut}}
	finish{ambient .45}}
cylinder{<-1,0,0>,<-4,0,0>,2
        open
        texture {pigment{strut}}
	finish{ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
torus{5.9,.3
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z
        translate <-10,0,0>}
torus{4,.25
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z
        translate <-10,0,0>}

cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 45*x}
cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*x}
cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 135*x}

cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 45*x}
cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*x}
cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 135*x}

object{coil translate <-2.5,3.8,0>}
object{coil translate <-7.5,3.8,0>}
object{coil translate <-2.5,3.8,0> rotate 180*x}
object{coil translate <-7.5,3.8,0> rotate 180*x}
                            
object{coil translate <-2.5,3.8,0> rotate 60*x}
object{coil translate <-7.5,3.8,0> rotate 60*x}
object{coil translate <-2.5,3.8,0> rotate -60*x}
object{coil translate <-7.5,3.8,0> rotate -60*x}

object{coil translate <-2.5,3.8,0> rotate 120*x}
object{coil translate <-7.5,3.8,0> rotate 120*x}
object{coil translate <-2.5,3.8,0> rotate -120*x}
object{coil translate <-7.5,3.8,0> rotate -120*x}
}

#declare enginetube=
union{
object{bodyset}
object{bodyset translate <4,0,0>}
object{bodyset translate <8,0,0>}
object{bodyset translate <12,0,0>}
object{bodyset translate <16,0,0>}
object{bodyset translate <20,0,0>}
object{bodyset translate <24,0,0>}
object{bodyset translate <28,0,0>}
object{bodyset translate <32,0,0>}
object{bodyset translate <36,0,0>}
object{bodyset translate <40,0,0>}
object{bodyset translate <44,0,0>}
object{bodyset translate <48,0,0>}
object{bodyset translate <52,0,0>}
object{bodyset translate <56,0,0>}
object{bodyset translate <60,0,0>}
object{bodyset translate <64,0,0>}
object{bodyset translate <68,0,0>}
object{bodyset translate <72,0,0>}
object{bodyset translate <76,0,0>}
object{bodyset translate <80,0,0>}
object{bodyset translate <84,0,0>}
object{bodyset translate <88,0,0>}
object{bodyset translate <92,0,0>}
object{bodyset translate <96,0,0>}
}

#declare engine=
union{
object{nozzle}
object{exhaust scale 2 translate <3,0,0>}
}

#declare satdish=
union{
 union{
  object{ Paraboloid_Y
        clipped_by {box{ <-2,-1,-2>, <2,.8,2> }}
        pigment {White}
        finish {ambient .5}
        scale <3,1.8,3> 
        }
  object{ Paraboloid_Y
        clipped_by {box{ <-2,-1,-2>, <2,.8,2> }}
        pigment {White}
        finish {ambient .5}
        scale <3,1.7,3>
        translate <0,.1,0> 
        }
   cylinder{<2.48, .8*1.8, 0>, <0, 3.251, 0>, .07
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
   cylinder{<0, 3, 0>, <0, 3.5, 0>, .1
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
   rotate -70*z
 }
}

#declare cargotank=
union{
sphere{<0,0,0>,10
      pigment {Silver}
      finish {ambient .2 diffuse 2 specular 0.1 roughness 1}}
}

#declare fueltank=
union{
sphere{<0,6.5,0>,1.61
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,7.99,0>,<5,7.99,0>,.02
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
}

#declare tankset=
union{
object{fueltank}
object{fueltank rotate 30*x}
object{fueltank rotate -30*x}
object{fueltank rotate 60*x}
object{fueltank rotate -60*x}
object{fueltank rotate 90*x}
object{fueltank rotate -90*x}
object{fueltank rotate 120*x}
object{fueltank rotate -120*x}
object{fueltank rotate 150*x}
object{fueltank rotate -150*x}
object{fueltank rotate 180*x}
torus{8.09,.02
      rotate 90*z
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
}

#declare dishstruts=
union{
cylinder{<0,-1,-1>,<2,-1,-1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,-1>,<2,1,-1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,-1,-1>,<2,1,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,-1>,<2,-1,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<0,-1,1>,<2,-1,1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,1>,<2,1,1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,-1,1>,<2,1,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,1>,<2,-1,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<0,1,-1>,<2,1,-1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,1>,<2,1,1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,-1>,<2,1,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,1,1>,<2,1,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<0,-1,-1>,<2,-1,-1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,-1,1>,<2,-1,1>,.01
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,-1,1>,<2,-1,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,-1,-1>,<2,-1,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
}

#declare dishtower=
union{
object{dishstruts translate <2,0,0>}
object{dishstruts translate <4,0,0>}
object{dishstruts translate <6,0,0>}
object{dishstruts translate <8,0,0>}
object{dishstruts translate <10,0,0>}
object{dishstruts translate <12,0,0>}
object{dishstruts translate <14,0,0>}
object{dishstruts translate <16,0,0>}
object{dishstruts translate <18,0,0>}
object{dishstruts translate <20,0,0>}
object{dishstruts translate <22,0,0>}
object{dishstruts translate <24,0,0>}
object{dishstruts translate <26,0,0>}
object{dishstruts translate <28,0,0>}
object{dishstruts translate <30,0,0>}
}

#declare scaffold=
union{
cylinder{<0, 0, 2.5>, <5, 0, 2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, -2.5>, <5, 0, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, 0>, <5, 0, 0>, .08
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

#declare strutset=
union{
object {scaffold translate <0,4.3,0>
             rotate <30,0,0>}
object {scaffold translate <0,-4.3,0>
             rotate <30,0,0>}
object {scaffold translate <0,4.3,0>
             rotate <150,0,0>}
object {scaffold translate <0,-4.3,0>
             rotate <150,0,0>}
object {scaffold translate <0,4.3,0>
             rotate <270,0,0>}
object {scaffold translate <0,-4.3,0>
             rotate <270,0,0>}
cylinder{<-.1,0,0>, <5.1,0,0>, 1
	texture {pigment{strut}}
	finish{ambient .45}
	}
}


#declare boardingtube=
union{
object{strutset}
object{strutset translate <5,0,0>}
object{strutset translate <10,0,0>}
object{strutset translate <15,0,0>}
object{strutset translate <20,0,0>}
object{strutset translate <25,0,0>}
object{strutset translate <30,0,0>}
object{strutset translate <35,0,0>}
object{strutset translate <40,0,0>}
object{strutset translate <45,0,0>}
object{strutset translate <50,0,0>}
cylinder{<-.1,0,0>, <55,0,0>, 4.25
	texture {pigment{strut}}
	finish{ambient .45}
	}
}

#declare dishset=
union{
object{dishtower translate <7,0,0> scale .5}
object{dishtower translate <33,0,0> scale .5}
box{<-.8,-.8,-.8>,<.8,.8,.8>
    translate <33,0,0>
    pigment {Gold}
    finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
object{satdish rotate <0,180,-70> translate <33,.78,0>}
}

#declare powerplant=
union{
object{dishtower translate <7,0,0> scale .5}
object{dishtower translate <33,0,0> scale .5}
cylinder{<7,0,-.1>, <33,0,-.1>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<7,0,.1>, <33,0,.1>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<32,0,0>,<35,0,0>,1.5
        pigment {Silver}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        }
}

#declare instruments=
union{
object{dishtower translate <7,0,0> scale .5}
object{dishtower translate <33,0,0> scale .5}
box{<-1.5,-1.5,-1.5>,<1.5,1.5,1.5>
    translate <34.5,0,0>
    pigment {Copper}
    finish {ambient .1 diffuse 2 specular 0.1 roughness 0  phong 3 phong_size 10}}
 lathe{
    linear_spline
    5, <0,0>, <1.6,0>, <2.2,.4>, <1.6,.8>, <0,.8>
    pigment {Grey}
    finish {ambient .2 diffuse 2 specular 0.1 roughness 1}
    rotate 180*x
    scale .5
    translate <33,0,0>}

cylinder{<36,1,0>, <34.5,0,-5>, .05
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<33,1,0>, <34.5,0,-5>, .05
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<34.5,-1,0>, <34.5,0,-5>, .05
	texture {pigment{strut}}
	finish{ambient .45}
	}
sphere{<34.5,0,-5>, .025
	texture {pigment{strut}}
	finish{ambient .45}
	}
object{satdish scale .5 rotate <0,180,90> translate <34.5,-1,-5>}
cylinder{<35.5,0,-1>, <34.5,-2,-1>, .1
	texture {pigment{Black}}
	finish{ambient .45}
	}
cylinder{<35.5,0,1>, <34.5,-2,1>, .1
	texture {pigment{Black}}
	finish{ambient .45}
	}
cylinder{<35,0,0>, <34.5,-2,1>, .15
	texture {pigment{Silver}}
	finish{ambient .45}
	}
}

object{cargotank}
object{engine scale .5 translate <-9.5,0,0> rotate 90*z}
object{tankset translate <-9.25,0,0> rotate 90*z}
object{powerplant rotate 120*y}
object{instruments rotate -120*y}
object{dishset}
cylinder{<5,5,-5>, <15,0,-20>, .02
	texture {pigment{strut}}
	finish{ambient .45}
	}
sphere{<15,0,-20>, .025
	texture {pigment{strut}}
	finish{ambient .45}
	}
/*object{boardingtube scale .125 rotate -90*z translate <320,-4,0>}
object{boardingtube scale .125 rotate -90*z translate <320,-10.25,0>}
object{boardingtube scale .25 rotate -90*y translate <205,0,-100>}
object{boardingtube scale .25 rotate -90*y translate <205,0,-112.5>}
object{boardingtube scale .25 rotate 90*y translate <0,0,100>}
object{boardingtube scale .25 rotate 90*y translate <0,0,112.5>}
object{boardingtube scale .25 rotate -90*y translate <-205,0,-100>}
object{boardingtube scale .25 rotate -90*y translate <-205,0,-112.5>}*/
