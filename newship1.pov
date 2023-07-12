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
   //orthographic
   //location <60,10,0>
   location <-10, 0, -10>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at 5*x		// simple command for camera direction
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
    
object{CylModS_0(2,M_Hull,M_Rail,6) translate 2.25*z}
object{CylModS_0(1,M_Hull,M_Rail,6) translate <-6,0,2.25>}
object{CylModS_0(2,M_Hull,M_Rail,6) translate -2.25*z}

object{CylModS_4(2,M_Hull,M_Rail,6) translate <6,0,2.25>}
object{CylModS_4(2,M_Hull,M_Rail,6) translate <6,0,-2.25>}
object{H_tunnel(M_Hull,M_Hull,Copper,4) rotate 90*y translate <9,0,-2.25>}

object{CylModS_1(2,M_Hull,M_Rail,6) translate <12,0,2.25>}
object{CylModS_1(2,M_Hull,M_Rail,6) rotate 180*x translate <12,0,-2.25>}
object{elbow(M_Hull,M_Hull,Copper,1.2,90) rotate 180*y translate <18,0,1.05>}
object{elbow(M_Hull,M_Hull,Copper,1.2,90) rotate -90*y translate <18,0,-1.05>}
object{Tjunc(M_Hull,M_Hull,Copper,1.1,1.1,1.8) translate 19.2*x}

object{CylModS_1(-1,M_Hull,M_Rail,4) rotate 90*z translate <9,2.25,2.25>}
object{CylModS_1(-1,M_Hull,M_Rail,4) rotate <180,0,90> translate <9,2.25,-2.25>}
object{CylModS_1(-1,M_Hull,M_Rail,4) rotate -90*z translate <9,-2.25,2.25>}
object{CylModS_1(-1,M_Hull,M_Rail,4) rotate <180,0,-90> translate <9,-2.25,-2.25>}

//object{H_tunnel(M_Hull,M_Hull,Copper,20) translate <-20,0,2.25>}

//object{airlock() rotate <180,0,180> translate <-2,0,2.25>}
object{adapter(M_Hull,Copper) rotate 180*z translate -2.25*z} 
object{airlock() rotate 180*z translate <-1,0,-2.25>}

object{Scaf1(Copper,6,1) rotate 180*y translate <29,1.5,0>}
object{Scaf1(Copper,6,1) rotate 180*y translate <29,1.5,0> rotate 180*x}

object{longtank(White,Silver,White) translate <-37,-1,-.2> rotate -35*x}
object{longtank(White,Silver,White) translate <-37,-1,-.2> rotate -145*x}
object{longtank(White,Silver,White) translate <-37,-1,.2> rotate 35*x}
object{longtank(White,Silver,White) translate <-37,-1,.2> rotate 145*x} 
