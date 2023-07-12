#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."
#include "modules.inc"
#include "hatches.inc"
#include "structs.inc"
#include "engines.inc"

  background{Grey}
  global_settings{ambient_light White*2}
  
#declare enghue=Grey/2;
#declare strut=Silver;
#declare crewcolor=Silver;

camera {
   //orthographic
   //location <60,10,0>
   location <5, 0, -1>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <0,0,0>		// simple command for camera direction
}
    

light_source {			// point light source
   <500,  800,  -1000>	// location vector
   color rgb <1.0, 0.95, 0.90>/2	// color of light

}

light_source{
        //<10, 0, -100>
	//<-150, 150, -150>
	<-30,0,0>
	color rgb <.5, .5, .5>
	spotlight
        point_at <10,0,0>
}
    

#declare coil=
union{
cylinder{<-1,1.6,-1>,<1,1.6,-1>,.2}
cylinder{<-1,1.6,1>,<1,1.6,1>,.2}
box{<-1,1.55,-1>,<1,1.65,1>}

cylinder{<-1,0,-1>,<1,0,-1>,.2}
cylinder{<-1,0,1>,<1,0,1>,.2}
box{<-1,-.05,-1>,<1,.05,1>}

cylinder{<0,1.6,0>,<0,0,0>,.4}

torus{.9,.03
        translate <0,.2,0>}
torus{.9,.03
        translate <0,.4,0>}
torus{.9,.03
        translate <0,.6,0>}
torus{.9,.03
        translate <0,.8,0>}
torus{.9,.03
        translate <0,1,0>}
torus{.9,.03
        translate <0,1.2,0>}
torus{.9,.03
        translate <0,1.4,0>}
texture{
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        }
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

#declare solarpanel=
union{
  union{
    box{<-5.5,10,-.05>,<-2.5,40,.05>}
    box{<-1.5,10,-.05>,<1.5,40,.05>}
    box{<2.5,10,-.05>,<5.5,40,.05>}
    texture{
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 1 specular 0.1 roughness 1}
    }
  }
  union{
    box{<-4.1,10.2,-.1>,<-3.9,8,.1>}
    box{<-.1,10.2,-.1>,<.1,0,.1>}
    box{<3.9,10.2,-.1>,<4.1,8,.1>}
    box{<-4.1,7.9,-.1>,<4.1,8.1,.1>}
    box{<-5.5,39.9,-.1>,<5.5,40.1,.1>}
    texture{
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.3 roughness 1}
    }
  }
}

#declare M_Glass =
  material {
    texture {
      pigment { color rgbf <0.7, 0.6, 0.4, 1.2> }
      finish {
        ambient 0.0
        diffuse 0.05
        specular 0.6
        roughness 0.001
        reflection {
          0.1, 0.9
          fresnel on
        }
        conserve_energy
      }
    }
    interior {
      ior 1.5
      fade_power 1001
      fade_distance 0.9
      fade_color <0.5,0.8,0.6>
    }
  }
#declare M_Win =
  material {
    texture {
      pigment { Turquoise filter .7 }
      finish {
        ambient 0.0
        diffuse 0.05
        specular 0.6
        roughness 0.001
        /*reflection {
          0.1, 0.9
          fresnel on
        }
        conserve_energy*/
      }
    }
    interior {
      ior 1.5
      fade_power 1001
      fade_distance 0.9
      fade_color <0.5,0.8,0.6>
    }
  }
  
#declare M_Hull =
  material {
    texture {
      pigment { Silver }
      finish {ambient 0.0 diffuse 1.5 specular 0.3 roughness 1 phong .1}
    }
  }

#declare M_Rail =
  material {
    texture {
      pigment { Yellow }
      finish {ambient 0.0 diffuse 1.5 specular 0.1 roughness 2 phong 0}
    }
  }
/*
object{H_S6Hub(M_Glass,M_Hull,Copper)}
object{adapter(M_Hull,Copper) translate 1.5*x}
object{airlock() translate 2.5*x}

union{
  difference{
    object{H_CylModS(M_Hull,M_Rail,8)}
    cylinder{4*x,<4,0,-2.1>,.95}
  }
  difference{
    cylinder{4*x,<4,0,-2.25>,1.1}
    cylinder{4*x,<4,0,-2.26>,.95}
    cylinder{0,8*x,2}
    material{M_Hull}
  }
  translate 1.5*x
  rotate <90,90,0>
}
object{H_elbow(M_Hull,M_Hull,Copper,2,90) rotate 90*x translate <2,2.25,-5.5>}
//object{H_elbow(M_Glass,M_Hull,Copper,2,90) translate <2,0,-1.5> rotate 45*z}
object{H_tunnel(M_Hull,M_Hull,Copper,6) translate 1.5*x rotate -90*y}
object{endcap(M_Hull,Copper) rotate 90*z translate 9.5*y}
object{CylModC(M_Hull,M_Hull) translate 1.5*x rotate <45,0,90>}
object{CylModC(M_Hull,M_Hull) translate 1.5*x rotate <45,0,180>}
object{CylModC(M_Hull,M_Hull) translate 1.5*x rotate <45,0,-90>}
object{body2(Grey,5,.3) rotate -90*y}
//object{Scaf3(Copper,3,.5) translate <2,2,0>}*/

//object{mag_nozzle1(M_Hull)}
//object{HexTruss(M_Rail,3,1) translate -10*x}
//object{WindowSphere3(M_Hull,M_Win,4,4) translate -4.5*x}
//object{WindowSphere3(M_Hull,M_Win,4,2) translate 4.5*x}   

object{dock(M_Hull,M_Hull,2)}