#include "colors.inc"
  //background{White}
  global_settings {
  ambient_light White
  }
  camera {
    location <0, 0, -30>
    look_at <0, 0, 0>
  }

#declare exhaust=
 lathe {
    bezier_spline
    4, <0,9>, <1,2.25>, <2,1.125>, <3,.36>
    texture { 
      pigment {rgbft <.1, .15, .2, 0.5, 0>}
    }
    finish {
      diffuse 1
      ambient rgb <0, 0.5, 0.7>
      //phong 1
      //phong_size 100
      reflection 0.25
    }
    hollow
    interior {
        media {emission 3.6} 
    }     
      
    rotate <0,0,90>
  }   

object{exhaust}