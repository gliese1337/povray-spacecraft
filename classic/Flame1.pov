// Persistence of Vision Ray Tracer Scene Description File
// File: ?.pov
// Vers: 3.5
// Desc: Basic Scene Example
// Date: mm/dd/yy
// Auth: ?
//

#version 3.5;

#include "colors.inc"

global_settings {
  assumed_gamma 1.0
}

// ----------------------------------------

camera {
  location  <0.0, 0.5, -20.0>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <2.0, 0.0,  0.0>
}

/*
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}
  
*/

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-30, 30, -30>
}

// ----------------------------------------
  
  /*
plane {
  y, -1
  pigment { color rgb <0.7,0.5,0.3> }
}   
*/
    

#declare rocketflame=
union {
/* Rocket Nozzle */
  #declare N=function {
    (sin(0.667*pow(x,4))-pow(1.04*pow(x,2),1.12)-pow(y,2)-pow(z,2)+0.4)-0.0333*x
  }

  #declare Nozzle=isosurface {
    function
    {
      abs(N(x,y,z))-0.03
    }
    contained_by {
      box {<-1.4,-0.75,-0.75>,<-0.125,0.75,0.75>}
    }
    max_gradient 2
    
    //all_intersections
    texture {
      pigment
      {
        gradient x
          color_map
          { // nozzle's heated colors
            [0 color rgb 0.5]
            [0.3 color rgb <5,0.5,0>]
            [1 color rgb <8,5,0.5>]
          }
        scale 1.1
      }
      normal
      {
        gradient x 0.6 scallop_wave scale 0.05
      }
      finish
      {
        ambient 0.05
        diffuse 0.3
        specular 0.5
        roughness 0.01
      }
    } // End Texture
    scale <1.5,1,1> //translate x
  } // End Nozzle

/* Exhaust Plume */

  #declare S=density
  {
    function {N(x,y,z)}//spherical
    density_map {
      [0 rgb 0]
      [0.0125 rgb <0.1,0.3,0.9>]
      [0.1 rgb <0.1,0.3,0.9>*0.02]
      [0.6 rgb <0.1,0.3,0.9>*0.06]
      [1 rgb <0.1,0.3,0.9>]
    }
    translate -x/6
  }

  #declare GS=density {
    gradient x
    density_map
    {
      [0 S]
      [0.5 rgb 0]
    }
  }

  #declare C=density {
    cylindrical
    density_map {
      [0.1 rgb 0]
      [0.25 rgb <0.9,0.3,0.6>*0.25]
      [0.5 rgb <0.9,0.3,0.6>*2]
      [0.75 rgb <0.9,0.3,0.6>*0.25]
      [0.9 rgb 0]
    }
    poly_wave 0.8
    warp {turbulence <0.2+0.1*clock,0,0.2+0.1*clock>}
    warp {repeat y/4 flip y}
    warp {turbulence <0.2,0,0.2>*clock}
    scale <1/3-0.15*clock,1/3,1/3-0.15*clock> //rotate 90*z
  }

  #declare G=density {
    gradient y
    density_map {
      [0.1 rgb 0]
      [0.2 rgb 0.05]
      [0.5 C]
      [0.6 C]
      [0.8 rgb 0.05]
      [0.9 rgb 0]
    }
    poly_wave 0.4 frequency 8
  }

  #declare GC=density {
    cylindrical
    density_map {
      [0.25 rgb 0]
      [0.75 G]
      [1 rgb 0]
    }
    rotate 90*z
  }

  #declare X=function(x) {x}


  #declare Exhaust=sphere {
    0,1
    scale <0.5,1,1> translate -0.5*x
    pigment {
      color rgbt 1
    }
    interior {
      media {
      samples 15
      emission 1.5
      density
      {
        function {abs(X(x))}
        density_map
        {
          [0 rgb 0]
          [0.5 GC]
          [0.75 GS]
        }
      }
    }
    media {
      samples 15
      absorption 0.5
      density {
        function {abs(X(x))}
        density_map {
          [0 rgb 0]
          [0.5 GC]
          [0.75 GS]
        }
      }
    }
   }
   scale <12,1.5+1.5*clock,1.5+1.5*clock> translate <11.2+0.4*clock,0,0>
   hollow
 } // End Exhaust

/* Finished Nozzle */
  union
  {
    object
    {
      Nozzle
    }
    object
    {
      Exhaust
    }
    translate -3*x
    rotate 75*clock*y
  } // End union
rotate <-90,0,0>
}

object
{
   rocketflame
}