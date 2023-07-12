#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."
#include "components.inc"
#include "tankage.inc"
#include "engines.inc"

background{Black}

  /*global_settings {
  ambient_light White*2
  }*/
  
#declare enghue=Grey/2;
#declare strut=Silver;
#declare crewcolor=Silver;

camera {
   //orthographic
   //location <60,10,0>
   location <-20, 90, -122>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <70,-10,0>		// simple command for camera direction
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
   color rgb <.3, .3, .3>	// color of light

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
    

#declare bodyset=
union{
object {wirerad translate <0,4,0>}
object {wirerad translate <0,4,0> rotate 180*x}

object {wirerad translate <0,4,0> rotate 60*x}
object {wirerad translate <0,4,0> rotate -60*x}

object {wirerad translate <0,4,0> rotate 120*x}
object {wirerad translate <0,4,0> rotate -120*x}
cylinder{<0,0,0>,<4,0,0>,2.5
        texture {pigment{strut}}
	finish{ambient .45}
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

#declare engine=
union{
cylinder{<.25,0,0>,<-.25,0,0>,6
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
torus{6,.3
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
torus{5.5,.3
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

#declare bodytube=
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
object{bodyset translate <100,0,0>}
}



#declare crewsect=
union{
cone{<0,0,0>,2.5
     <.5,0,0>,4.5
     pigment {crewcolor}
     finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<.5,0,0>,<2,0,0>,5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
object {wirerad translate <2,5,0>}
object {wirerad translate <2,5,0> rotate 180*x}
object {wirerad translate <2,5,0> rotate 60*x}
object {wirerad translate <2,5,0> rotate -60*x}
object {wirerad translate <2,5,0> rotate 120*x}
object {wirerad translate <2,5,0> rotate -120*x}
cylinder{<2,0,0>,<7,0,0>,2.5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<7,0,0>,<8.5,0,0>,5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<8.5,0,0>,<9.5,0,0>,4
        pigment {Grey}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}      
cylinder{<9.5,0,0>,<20,0,0>,4.5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<20,0,0>,<21,0,0>,4
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}}

#declare powerplant=
union{
sphere {<6.5,0,0>, 8
        clipped_by{box{<0,-8,-8>,<14.5,8,8>}}
        pigment {Silver}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        }
difference{
 sphere{<6.5,0,0>, 9
        clipped_by{box{<6.5,-9,-9>,<15.5,9,9>}}
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        }
 sphere{<6.5,0,0>, 8.5}
 }

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
   rotate <0,0,-70>
 }
cylinder{<-1,.9,-.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

/*cylinder{<-1,.9,-.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}*/
}

#declare fin=
union{
box{<-5.5,10,-.05>,<-2.5,30,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-1.5,10,-.05>,<1.5,30,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<2.5,10,-.05>,<5.5,30,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}

box{<-5.5,30.1,-.1>,<5.5,29.9,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-4.1,10.2,-.1>,<-3.9,8,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-.1,10.2,-.1>,<.1,0,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<3.9,10.2,-.1>,<4.1,8,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-4.1,7.9,-.1>,<4.1,8.1,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-5.5,10.1,-.1>,<5.5,9.9,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
}

object{engine}
object{bodytube}
object{crewsect translate <158,0,0>}
object{powerplant translate <179,0,0>}
object{fin translate <100,0,0> rotate 30*x}
object{fin translate <100,0,0> rotate 210*x}
object{tankset(White, White, strut) translate 106*x}
object{tankset(White, White, strut) translate 112*x}
object{hytank(Grey*1.1, White, White) translate 114*x}
object{exhaust1(12) translate <-.5,0,0> scale <2,.6,.6>}
object{satdish translate <159,30,0> rotate 180*x}
cylinder{<159,0,0>,<159,-30,0>,.2
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}


/*object { sphere { <0, 0, 0>,10000 }
       hollow
       texture {
               pigment{image_map{gif "starfield.gif"}}
               //scale <80000, 50000, 30000>
               finish { crand .05 ambient .7}
       }
}*/