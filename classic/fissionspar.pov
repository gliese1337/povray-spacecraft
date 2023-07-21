#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."
#include "modules.inc"
#include "structs.inc"
#include "tankage.inc"
#include "hatches.inc"

background{Black}
global_settings{ambient_light White*3}

camera {
   location <5, 20, -20>*2
   look_at 0		// simple command for camera direction
}
    

light_source {			// point light source
   <200,  400,  -500>	// location vector
   color rgb <.3, .3, .3>	// color of light

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

#declare M_Foil =
  material {
    texture {
      pigment {Copper}
      normal  {wrinkles 1 scale 1 turbulence 0.8}
      finish {
        ambient .1
        diffuse .1
        specular 1
        roughness .001
        phong .7
        //metallic
        reflection {
          .9
          metallic
       }
      }
    }
  } 

object{HexTruss(M_Hull,6,1)}
box{<4,5.1,5.1>,<-4,-5.1,-5.1>
        bounded_by{box{<4,5.1,5.1>,<-4,-5.1,-5.1> rotate 45*x}}
        material{M_Foil}
        translate -3.9*x
        }

box{<0,-2,.2>,<.7,2,1.5>
        material{M_Hull}
        }
box{<0,-1.5,-.4>,<.5,1.5,-2>
        material{M_Hull}
        }
union{
  cylinder{<.3,0,-.3>,<.3,0,4.6>,.3}
  sphere{<.3,0,4.6>,.3}
  cylinder{<.3,0,4.6>,<10,0,4.6>,.3}
  material{M_Rail}
}