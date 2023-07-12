                                                           #version 3.6;
global_settings{ assumed_gamma 1.3 max_trace_level 5}

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "glass.inc"
#include "shapes.inc"
#include "./cell_basics.inc"

camera {  
  //orthographic
  location <3,2,1>*1.05
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   0.15*y
}

light_source { <-140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }

#declare Face = prism {
  linear_sweep
  linear_spline
  -0.05, // sweep the following shape from here ...
  0.05, // ... up through here
  4, // the number of points making up the shape ...
  <0,1>, <sqrt(2),0>, <0,-1>, <-sqrt(2),0>
}

#declare HalfShell = union {
  object { Face }
  object {
    Face
    translate sqrt(2)*x
    rotate (180+70.5287794)*y
    Axis_Rotate_Trans(<-sqrt(2),0,1>, 60)
    translate sqrt(2)*x
  }
  object {
    Face
    translate -sqrt(2)*x
    rotate (180+70.5287794)*y
    Axis_Rotate_Trans(<sqrt(2),0,-1>, 60)
    translate -sqrt(2)*x              
  }
  object {
    Face
    translate sqrt(2)*x
    rotate 90*z
    translate sqrt(2)*x
  }
  object {
    Face                        
    translate sqrt(2)*x
    rotate (180-70.5287794)*y
    Axis_Rotate_Trans(<sqrt(2),0,1>, 60)
    translate sqrt(2)*x
  }
  object {
    Face                       
    translate -sqrt(2)*x
    rotate (180-70.5287794)*y
    Axis_Rotate_Trans(<-sqrt(2),0,-1>, 60)
    translate -sqrt(2)*x
  }
}

#declare Rhombic_Dodecahedron = union {
  // Faces
  object { HalfShell translate -sqrt(2)*y rotate 45*z}
  object { HalfShell translate -sqrt(2)*y rotate 225*z }

  // Octahedral Vertices
  sphere { <1,1,1>, 0.05 }
  sphere { <-1,1,1>, 0.05 }
  sphere { <1,-1,1>, 0.05 }
  sphere { <1,1,-1>, 0.05 }
  sphere { <-1,-1,1>, 0.05 }
  sphere { <-1,1,-1>, 0.05 }
  sphere { <1,-1,-1>, 0.05 }
  sphere { <-1,-1,-1>, 0.05 }
               
  // Cubical Vertices                                                             
  sphere { <2,0,0>, 0.05 }                                                                            
  sphere { <-2,0,0>, 0.05 }                                                                            
  sphere { <0,2,0>, 0.05 }                                                                            
  sphere { <0,-2,0>, 0.05 }                                                                            
  sphere { <0,0,2>, 0.05 }                                                                            
  sphere { <0,0,-2>, 0.05 }            
  
  //Edges
  cylinder { <1,1,1>, <2,0,0>, 0.05 }
  cylinder { <1,1,1>, <0,2,0>, 0.05 }
  cylinder { <1,1,1>, <0,0,2>, 0.05 }

  cylinder { <-1,-1,-1>, <-2,0,0>, 0.05 }
  cylinder { <-1,-1,-1>, <0,-2,0>, 0.05 }
  cylinder { <-1,-1,-1>, <0,0,-2>, 0.05 }
 
  cylinder { <-1,1,1>, <-2,0,0>, 0.05 }
  cylinder { <-1,1,1>, <0,2,0>, 0.05 }
  cylinder { <-1,1,1>, <0,0,2>, 0.05 }

  cylinder { <1,-1,-1>, <2,0,0>, 0.05 }
  cylinder { <1,-1,-1>, <0,-2,0>, 0.05 }
  cylinder { <1,-1,-1>, <0,0,-2>, 0.05 }
            
  cylinder { <1,-1,1>, <2,0,0>, 0.05 }
  cylinder { <1,-1,1>, <0,-2,0>, 0.05 }
  cylinder { <1,-1,1>, <0,0,2>, 0.05 }

  cylinder { <-1,1,-1>, <-2,0,0>, 0.05 }
  cylinder { <-1,1,-1>, <0,2,0>, 0.05 }
  cylinder { <-1,1,-1>, <0,0,-2>, 0.05 }
                        
  cylinder { <1,1,-1>, <2,0,0>, 0.05 }
  cylinder { <1,1,-1>, <0,2,0>, 0.05 }
  cylinder { <1,1,-1>, <0,0,-2>, 0.05 }

  cylinder { <-1,-1,1>, <-2,0,0>, 0.05 }
  cylinder { <-1,-1,1>, <0,-2,0>, 0.05 }
  cylinder { <-1,-1,1>, <0,0,2>, 0.05 }
}

#declare RD_Interconnectors = union {
  #declare W = 0.28;
  #declare H = 0.075;
  #for (i, 0, 5)
    union {                                                                  
      cylinder { -W/2*x, H*z, 0.005 }
      sphere { H*z, 0.005 }
      cylinder { H*z, W/2*x, 0.005 }
      box { <-0.01,-0.001,0>, <0.01,0.001,H> }
      translate 1.4935*z rotate (15+i*60)*y 
    }
  #end
}

#declare RD_Cell = difference {
  union {
    object { Rhombic_Dodecahedron scale 0.9 }
    object { Connection_Set }
            
    #for (i, 0, 1)                                       
     object { RD_Interconnectors Axis_Rotate_Trans(<1,0,1>, 55+i*70) }  
     object { RD_Interconnectors rotate 30*y Axis_Rotate_Trans(<1,0,-1>, 55.4+i*70) }      
    #end
  }
  sphere { <0,0,0>, sqrt(2)-0.01 }
  object { Cell_Negative }
  texture { pigment { color Grey } }       
}

object { RD_Cell }           

              
                 