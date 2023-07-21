#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."

  global_settings {
  ambient_light White
  }
  //background{White}

#declare enghue=Grey/2;
#declare strut=Silver;
#declare crewcolor=Silver;
#declare sr=3;
#declare ang=90*clock;

camera {
   orthographic
   //location <60,10,0>
   location <60,0,-180>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <55,0,0>		// simple command for camera direction
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
    
#declare runlight=
sphere{0,.5
texture {pigment {rgbft <.1, .15, .2, 0.7, .5>}}
    finish {diffuse 1 ambient rgb <.2, 0.6, 0.7>}
    hollow
    interior{media {emission 1.5}}
	
}

#declare hab=
union{
cylinder{<-57,0,0>,<20,0,0>,4
	texture {pigment{Grey}}
	finish{ambient .45}
	scale 2*z
}
sphere{<-57,0,0>,4
	texture {pigment{Grey}}
	finish{ambient .45}
	scale 2*z
}
object{runlight translate <-59,0,7>}
object{runlight translate <-59,0,-7>}
sphere{<20,0,0>,4
	texture {pigment{Grey}}
	finish{ambient .45}
	scale 2*z
}
object{runlight translate <22,0,7>}
object{runlight translate <22,0,-7>}
cylinder{<0,0,8.25>,<0,0,-8.25>,1.3
texture {pigment{Grey}}
	finish{ambient .45}}
cylinder{<0,0,8.5>,<0,0,-8.5>,1.25
texture {pigment{Grey}}
	finish{ambient .45}}
cylinder{<-61,0,0>,<-61.25,0,0>,1.3
texture {pigment{Grey}}
	finish{ambient 1}}
cylinder{<-61,0,0>,<-61.25,0,0>,1.25
texture {pigment{Grey}}
	finish{ambient 1}}
}

#declare habring=
union{
torus{70,1.25
rotate 90*z
texture {pigment{Grey}}
	finish{ambient .45}}
object{hab rotate ang*z translate 70*y}
object{hab rotate ang*z translate 70*y rotate 120*x}
object{hab rotate ang*z translate 70*y rotate -120*x}
cylinder{0,<0,70,0>,1.25
rotate 60*x
texture {pigment{Grey}}
	finish{ambient .45}}
cylinder{0,<0,70,0>,1.25
rotate -60*x
texture {pigment{Grey}}
	finish{ambient .45}}
cylinder{0,<0,70,0>,1.25
rotate 180*x
texture {pigment{Grey}}
	finish{ambient .45}}
}

#declare anchor=
union{
torus{4.5,.5
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	rotate 90*z
	}
cylinder{0,<0,4.5,0>,.5
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	rotate 60*x
	}
cylinder{0,<0,4.5,0>,.5
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	rotate 120*x
	}
cylinder{0,<0,4.5,0>,.5
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	rotate -60*x
	}
cylinder{0,<0,4.5,0>,.5
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	rotate -120*x
	}
}

#declare cable=
union{
cylinder{<0,71.15,1>,<60,4.9,0>,.1
        texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	rotate -120*x
	}
cylinder{<0,68.85,-1>,<60,4.1,0>,.1
        texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	rotate -120*x
	}
}

#declare hablink=
union{
cone{<-4,0,0>,sr,<-2,0,0>,8.5
        pigment {Silver}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2,0,0>,<2,0,0>,8.5
        pigment {Silver}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1 phong 1}}

cylinder{<0,8,0>,<0,8.75,0>,1.3
texture {pigment{Grey}}
	finish{ambient 1}}
cylinder{<0,8,0>,<0,9,0>,1.25
texture {pigment{Grey}}
	finish{ambient 1}}
cylinder{<0,8,0>,<0,8.75,0>,1.3
texture {pigment{Grey}}
	finish{ambient 1}
	rotate 120*x}
cylinder{<0,8,0>,<0,9,0>,1.25
texture {pigment{Grey}}
	finish{ambient 1}
	rotate 120*x}
cylinder{<0,8,0>,<0,8.75,0>,1.3
texture {pigment{Grey}}
	finish{ambient 1}
	rotate -120*x}
cylinder{<0,8,0>,<0,9,0>,1.25
texture {pigment{Grey}}
	finish{ambient 1}
	rotate -120*x}

cone{<2,0,0>,8.5,<3,0,0>,sr
        pigment {Silver}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
}

#declare winchb=
union{
box{<0,0,-3>,<5,4,-2.75>
	texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	}
box{<0,0,3>,<5,4,2.75>
	texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	}
cylinder{<2.5,2,-2.8>,<2.5,2,2.8>,.5
	texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	}
#declare wrap=
torus{1.2,.25
        rotate 90*x
        translate <2.5,2,0>
	texture {pigment{Grey}}
	finish{ambient .45}
	}
object{wrap translate -2.5*z}
object{wrap translate -2*z}
object{wrap translate -1.5*z}
object{wrap translate -1*z}
object{wrap translate -.5*z}
object{wrap}
object{wrap translate .5*z}
object{wrap translate 1*z}
object{wrap translate 1.5*z}
object{wrap translate 2*z}
object{wrap translate 2.5*z}
}

#declare winchs=
union{
box{<0,0,-3>,<5,4,-2.75>
	texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	}
box{<0,0,3>,<5,4,2.75>
	texture {pigment{Grey}}
	finish{ambient .45 phong 1}
	}
cylinder{<2.5,2,-2.8>,<2.5,2,2.8>,.5
	texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	}
#declare wrap=
torus{.8,.25
        rotate 90*x
        translate <2.5,2,0>
	texture {pigment{Grey}}
	finish{ambient .45}
	}
object{wrap translate -2.5*z}
object{wrap translate -2*z}
object{wrap translate -1.5*z}
object{wrap translate -1*z}
object{wrap translate -.5*z}
object{wrap}
object{wrap translate .5*z}
object{wrap translate 1*z}
object{wrap translate 1.5*z}
object{wrap translate 2*z}
object{wrap translate 2.5*z}
}

#declare winchset=
union{
cone{<1,0,0>,1,<2,0,0>,sr
	texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	}
difference {
cylinder{<2,0,0>,<14,0,0>,sr
	texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 5*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 8*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 11*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 14*x}
}
cylinder{<14.2,0,0>,<23,0,0>,sr
        clipped_by{box{<14.2,-sr,sr>,<20,.5,-sr>}}
	texture {pigment{Grey}}
	finish{ambient .45}
	}
object{winchb translate <14.2,0,0>}
object{winchs translate <18.2,0,0>}
cone{<22,0,0>,.5,<23,0,0>,sr
	texture {pigment{Grey}}
	finish{ambient .45}
	}
cylinder{<23,0,0>,<26,0,0>,sr
	texture {pigment{Grey}}
	finish{ambient .45}
	}
cone{<26,0,0>,sr,<27,0,0>,1
	texture {pigment{Grey}}
	finish{ambient .45}
	}
cylinder{<27,0,0>,<30,0,0>,1
	texture {pigment{Grey}}
	finish{ambient .45}
	}
}

#declare winchcable=
union{
cylinder{<17.7,2,-2.25>,<((-57)*cos(radians(ang))-(66-70)*sin(radians(ang))),((66-70)*cos(radians(ang))+(-57)*sin(radians(ang)))+70,-2.6>,.15
texture {pigment{Grey}}
	finish{ambient .6}}
cylinder{<17.7,2,2.25>,<((-57)*cos(radians(ang))-(66-70)*sin(radians(ang))),((66-70)*cos(radians(ang))+(-57)*sin(radians(ang)))+70,2.6>,.15
texture {pigment{Grey}}
	finish{ambient .6}}
cylinder{<21.7,2,-2.25>,<((18)*cos(radians(ang))-(66-70)*sin(radians(ang))),((66-70)*cos(radians(ang))+(18)*sin(radians(ang)))+70,-2.6>,.15
texture {pigment{Grey}}
	finish{ambient .6}}
cylinder{<21.7,2,2.25>,<((18)*cos(radians(ang))-(66-70)*sin(radians(ang))),((66-70)*cos(radians(ang))+(18)*sin(radians(ang)))+70,2.6>,.15
texture {pigment{Grey}}
	finish{ambient .6}}
}

#declare habsect=
union{
object{hablink}
object{habring}
object{winchset translate (2*sr)*y}
object{winchcable translate (2*sr)*y}
object{winchset translate (2*sr)*y rotate 120*x}
object{winchcable translate (2*sr)*y rotate 120*x}
object{winchset translate (2*sr)*y rotate -120*x}
object{winchcable translate (2*sr)*y rotate -120*x}
object{anchor translate 60*x}
object{cable rotate 30*x}
object{cable rotate 60*x}
object{cable rotate 90*x}
object{cable rotate 150*x}
object{cable rotate 180*x}
object{cable rotate -30*x}
object{cable rotate -60*x}
object{cable rotate -90*x}
object{cable rotate -150*x}
}

#declare spine=
union{
cylinder{<-10,0,0>,<110,0,0>,sr
texture {pigment{Grey}}
	finish{ambient .45}}
}

#declare tankset=
union {
sphere {<0,2*sr+.2,0>, sr
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<0,-2*sr+.2,0>, sr
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<0,2*sr+.2,0>, sr
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 60*x}
sphere {<0,-2*sr+.2,0>, sr
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 60*x}
sphere {<0,2*sr+.2,0>, sr
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 120*x}
sphere {<0,-2*sr+.2,0>, sr
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 120*x}

torus {2*sr,.7
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z}
cylinder{<0,5,0>,<0,6,0>, .6
	texture {pigment{White}}
	finish{ambient .45}
	}
cylinder{<0,-5,0>,<0,6,0>, .6
	texture {pigment{White}}
	finish{ambient .45}
	}
cylinder{<0,5,0>,<0,6,0>, .6
	texture {pigment{White}}
	finish{ambient .45}
	rotate 60*x}
cylinder{<0,-5,0>,<0,6,0>, .6
	texture {pigment{White}}
	finish{ambient .45}
	rotate 60*x}
cylinder{<0,5,0>,<0,6,0>, .6
	texture {pigment{White}}
	finish{ambient .45}
	rotate 120*x}
cylinder{<0,-5,0>,<0,6,0>, .6
	texture {pigment{White}}
	finish{ambient .45}
	rotate 120*x}
}

#declare bay=
union{
cone{0,1<2,0,0>,sr
	texture {pigment{Grey*1.1}}
	finish{ambient .45}
	}
difference {
cylinder{<2,0,0>,<18,0,0>,sr
	texture {pigment{Grey*1.1}}
	finish{ambient .45}
	}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 6*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 10*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 14*x}
}
cone{<18,0,0>,sr<20,0,0>,1
	texture {pigment{Grey*1.1}}
	finish{ambient .45}
	}
}

#declare dock=
union{
object{bay translate (2*sr)*y}
torus{1,1
        clipped_by{box{<-2,-2,0>,<0,2,2>}}
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate -90*x
        translate (2*sr-1)*y}
cylinder{<-1,2*sr-1,0>,<-1,0,0>,1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
torus{1,1
        clipped_by{box{<-2,-2,0>,<0,2,2>}}
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate <-90,180,0>
        translate <20,2*sr-1,0>}
cylinder{<21,2*sr-1,0>,<21,0,0>,1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
object{bay translate -(2*sr)*y}
torus{1,1
        clipped_by{box{<-2,-2,0>,<0,2,2>}}
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*x
        translate -(2*sr-1)*y}
cylinder{<-1,-(2*sr-1),0>,<-1,0,0>,1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
torus{1,1
        clipped_by{box{<-2,-2,0>,<0,2,2>}}
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate <90,180,0>
        translate <20,-(2*sr-1),0>}
cylinder{<21,-(2*sr-1),0>,<21,0,0>,1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }

cylinder{<2,2*sr,sr-.1>,<2,-(2*sr),sr-.1>,.1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
cylinder{<10,2*sr,sr-.1>,<10,-(2*sr),sr-.1>,.1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
cylinder{<18,2*sr,sr-.1>,<18,-(2*sr),sr-.1>,.1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
cylinder{<2,2*sr,-(sr-.1)>,<2,-(2*sr),-(sr-.1)>,.1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
cylinder{<10,2*sr,-(sr-.1)>,<10,-(2*sr),-(sr-.1)>,.1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
cylinder{<18,2*sr,-(sr-.1)>,<18,-(2*sr),-(sr-.1)>,.1
        pigment {White}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        }
}

#declare cargo=
union{
cone{<1,0,0>,1,<2,0,0>,sr
	texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	}
difference {
cylinder{<2,0,0>,<14,0,0>,sr
	texture {pigment{Silver}}
	finish{ambient .45 phong 1}
	}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 5*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 8*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 11*x}
torus {sr,.2
        rotate 90*z
        pigment {Grey}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate 14*x}
}
cylinder{<14.2,0,0>,<26,0,0>,sr
	texture {pigment{Grey}}
	finish{ambient .45}
	}
cone{<26,0,0>,sr,<27,0,0>,1
	texture {pigment{Grey}}
	finish{ambient .45}
	}
cylinder{<27,0,0>,<30,0,0>,1
	texture {pigment{Grey}}
	finish{ambient .45}
	}
}

#declare carsect=
union{
//object{cargo translate (2*sr)*y}
object{cargo translate -(2*sr)*y}
//object{cargo translate (2*sr)*y rotate 60*x}
//object{cargo translate -(2*sr)*y rotate 60*x}
object{cargo translate (2*sr)*y rotate 120*x}
object{cargo translate -(2*sr)*y rotate 120*x}
}

#declare crewsect=
union{
cylinder{<1.5,0,0>,<5.5,0,0>,8
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	}
sphere{0,8
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	scale 3/16*x
	translate 1.5*x
	}
sphere{0,8
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	scale 3/16*x
	translate 5.5*x
	}
	
cylinder{<1.5,sr+1,0>,<15,sr+1,0>,1
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	}
sphere{<15,sr+1,0>,1
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	}
cylinder{<1.5,-sr-1,0>,<17,-sr-1,0>,1
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	}
sphere{<17,-sr-1,0>,1
	texture {pigment{White}}
	finish{ambient .45 phong 1}
	}
}

#declare mainnozzle=
union{

object{Paraboloid_X
        clipped_by {box{ <0,-7,-7>, <10,7,7> }}
        pigment {White}
        finish {ambient .5}
        rotate 180*y
        translate -8*x}
/*object{Paraboloid_X
    texture {pigment {rgbft <.1, .15, .2, 0.5, .5>}}
    finish {diffuse 1 ambient rgb <0, 0.5, 0.7>}
    hollow
    interior{media {emission .1}}
        rotate 180*y
        translate -8.1*x}*/
sphere{<-5,0,0>,2
        pigment {Grey}
        finish {ambient .5}
        }
cylinder{<-8,0,0>,<-9,0,0>,.75
        pigment {Grey}
        finish {ambient .5}
        }
}

#declare auxnozzle=
union{

object{Paraboloid_X
        clipped_by {box{ <0,-5,-5>, <8,5,5> }}
        pigment {White}
        finish {ambient .5}
        rotate 180*y
        translate -19*x}
cone{<-20,0,0>,1,<-16,0,0>,2
        pigment {Grey}
        finish {ambient .5}
        }
cylinder{<5,0,0>,<-16,0,0>,2
        pigment {Grey}
        finish {ambient .5}
        }
}

#declare engine=
union{
difference{
cone{<-16,0,0>,4,<-19,0,0>,3
	texture {pigment{Grey}}
	finish{ambient .45}
}
cylinder{<-20,0,0>,<-16,0,0>,2
	texture {pigment{Silver}}
	finish{ambient .45}
}
}
#declare ridge=
box{<-16,3,-.05>,<-19,4,.05>
	texture {pigment{Silver}}
	finish{ambient .45}
	}
object{ridge}
object{ridge rotate 20*x}
object{ridge rotate 40*x}
object{ridge rotate 80*x}
object{ridge rotate 100*x}
object{ridge rotate 120*x}
object{ridge rotate 140*x}
object{ridge rotate 160*x}
object{ridge rotate -20*x}
object{ridge rotate -40*x}
object{ridge rotate -80*x}
object{ridge rotate -100*x}
object{ridge rotate -120*x}
object{ridge rotate -140*x}
object{ridge rotate -160*x}
#declare ridge=
box{<-19,3,-.05>,<7,8,.05>
	texture {pigment{Copper}}
	finish{ambient .45 phong .5}
	}
object{ridge rotate 60*x}
object{ridge rotate 180*x}
object{ridge rotate -60*x}
	
cylinder{<-16,0,0>,0,4
	texture {pigment{Grey*1.25}}
	finish{ambient .45}
}
cone{<-3,0,0>,sr,<5,0,0>,9
	texture {pigment{Silver}}
	finish{ambient .45  phong .5}
}
cylinder{<5,0,0>,<20,0,0>,9
	texture {pigment{Silver}}
	finish{ambient .45 phong .5}
}
cone{<20,0,0>,9,<23,0,0>,sr
	texture {pigment{Silver}}
	finish{ambient .45  phong .5}
}
object{tankset translate 24*x rotate 30*x}
object{tankset translate 29.15*x}
object{tankset translate 34.3*x rotate 30*x}

object{mainnozzle translate -12*x}
object{auxnozzle translate 6*y}
object{auxnozzle translate 6*y rotate 120*x}
object{auxnozzle translate 6*y rotate -120*x}
}

 
object{engine translate -15*x}
object{spine}
object{dock translate 23*x}
object{carsect translate 50*x}
object{crewsect translate 77*x}
object{habsect translate 49*x}
