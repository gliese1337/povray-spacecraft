#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."
  
  global_settings{ambient_light White*2}
  
camera {
   orthographic
   //location <60,10,0>
   location <0, 0, -250>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <0,0,0>		// simple command for camera direction
}
    
light_source {			// point light source
   <500,  800,  -1000>	// location vector
   color rgb <.5, .5, .5>	// color of light
   }
light_source {			// point light source
   <-500,  -800,  -1000>	// location vector
   color rgb <.5, .5, .5>	// color of light
   }
/*
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
}*/


#declare N = 4;
#declare Half = 1;
#declare Method = 1;
#declare Thickness=.0002;
#include "GeoDome.inc"


#declare w=96;
#declare s=-2.25;
#declare h=w/2-s;

object {Frame pigment { color Silver } scale <w,h,w> translate 3.5*y}
object {Facets pigment { Turquoise filter .100 } scale <w,h,w> translate 3.5*y}
/*sphere{0,1
        clipped_by{box{<-1,1,-1>,<1,0,1>}}
        texture{
                pigment{Turquoise filter .100}
                finish{
                       specular 1
                       roughness .00005
                       ambient .3
                       diffuse .7
                       crand .005
                       reflection .15
                }
        }
        scale <w,h,w>
        translate 3.5*y
}*/
light_source { 
  <0,10,0> 
  color White*1.5
}

cylinder{0,<0,-2,0>,100
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
difference{
cylinder{0,<0,3,0>,96
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
cylinder{0,<0,3.1,0>,95
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
}

union{
box{<-97,-6,.55>,<97,1.5,-.75>
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
box{<-97,-6,.55>,<97,1.5,-.75>
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        rotate 60*y
        }
box{<-97,-6,.55>,<97,1.5,-.75>
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        rotate -60*y
        }
}

#declare notch1=
union{
box{<97,0,.5>,<100,1.5,1>
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
box{<97,0,-.5>,<100,1.5,-1>
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
}
object{notch1}
object{notch1 rotate 10*y}
object{notch1 rotate 20*y}
object{notch1 rotate 30*y}
object{notch1 rotate 40*y}
object{notch1 rotate 50*y}
object{notch1 rotate 60*y}
object{notch1 rotate 70*y}
object{notch1 rotate 80*y}
object{notch1 rotate 100*y}
object{notch1 rotate 110*y}
object{notch1 rotate 120*y}
object{notch1 rotate 130*y}
object{notch1 rotate 140*y}
object{notch1 rotate 150*y}
object{notch1 rotate 160*y}
object{notch1 rotate 170*y}
object{notch1 rotate 180*y}
object{notch1 rotate 190*y}
object{notch1 rotate 200*y}
object{notch1 rotate 210*y}
object{notch1 rotate 220*y}
object{notch1 rotate 230*y}
object{notch1 rotate 240*y}
object{notch1 rotate 250*y}
object{notch1 rotate 260*y}
object{notch1 rotate 270*y}
object{notch1 rotate 280*y}
object{notch1 rotate 290*y}
object{notch1 rotate 300*y}
object{notch1 rotate 310*y}
object{notch1 rotate 320*y}
object{notch1 rotate 330*y}
object{notch1 rotate 340*y}
object{notch1 rotate 350*y}

cone{<0,-2,0>,100,<0,-3.5,0>,90
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
cone{<0,-3.5,0>,90,<0,-5,0>,15
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }
cylinder{0,<0,-24,0>,15
        pigment {Grey}
        finish {ambient 0 diffuse 2 specular 0.1 roughness 1}
        }