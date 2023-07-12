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
  location <1,2,3>
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   0
}

light_source { <-140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }

#declare Square_Face = prism {
  linear_sweep
  linear_spline
  -0.05, // sweep the following shape from here ...
  0.05, // ... up through here
  4, // the number of points making up the shape ...
  <1,0>, <0,1>, <-1,0>, <0,-1>
}

#declare Square_Pair = union {
  object { Square_Face translate 1*y }
  object { Square_Face translate -1*y rotate 180*y}
}

#declare Triangle_Face = prism {
  linear_sweep
  linear_spline
  -0.05, // sweep the following shape from here ...
  0.05, // ... up through here
  3, // the number of points making up the shape ...
  <-1,-sqrt(3)/3>, <0,2*sqrt(3)/3>, <1,-sqrt(3)/3>
  scale <sqrt(2)/2,1,sqrt(2)/2>
}

#declare Tri_Pair = union {                              
  object { Triangle_Face translate 1.155*y }
  object { Triangle_Face translate -1.155*y rotate 180*y }
  rotate 165*y
}

#declare Cuboctahedron = union {
  // Faces                                                           
  object { Tri_Pair Axis_Rotate_Trans(<1,0,-1>, 54.76) }
  object { Tri_Pair rotate 180*y Axis_Rotate_Trans(<1,0,-1>, -54.76) }
  object { Tri_Pair Axis_Rotate_Trans(<1,0,-1>, 54.76) rotate 90*y }
  object { Tri_Pair rotate 180*y Axis_Rotate_Trans(<1,0,-1>, -54.76) rotate 90*y }                                    
  object { Square_Pair }                                   
  object { Square_Pair rotate 45*y rotate 90*x rotate 45*z }
  object { Square_Pair rotate 45*y rotate 90*z rotate 45*x }
  
  // Vertices
  // (±1,±1,0)
  // (±1,0,±1)
  // (0,±1,±1)           
  
  //Edges                              
  cylinder { <1,1,0>, <1,0,-1>, 0.05 }
  cylinder { <1,0,-1>, <1,-1,0>, 0.05 }
  cylinder { <1,-1,0>, <1,0,1>, 0.05 }
  cylinder { <1,0,1>, <1,1,0>, 0.05 }
                                      
  cylinder { <1,1,0>, <0,1,1>, 0.05 }
  cylinder { <0,1,1>, <-1,1,0>, 0.05 } 
  cylinder { <-1,1,0>, <0,1,-1>, 0.05 }
  cylinder { <0,1,-1>, <1,1,0>, 0.05 }    
                                        
  cylinder { <-1,-1,0>, <0,-1,-1>, 0.05 }
  cylinder { <0,-1,-1>, <1,-1,0>, 0.05 }
  cylinder { <1,-1,0>, <0,-1,1>, 0.05 }
  cylinder { <0,-1,1>, <-1,-1,0>, 0.05 }
                                        
  cylinder { <-1,-1,0>, <-1,0,-1>, 0.05 }
  cylinder { <-1,0,-1>, <-1,1,0>, 0.05 }
  cylinder { <-1,1,0>, <-1,0,1>, 0.05 }
  cylinder { <-1,0,1>, <-1,-1,0>, 0.05 }
                                                                             
  cylinder { <1,0,1>, <0,1,1>, 0.05 }
  cylinder { <0,1,1>, <-1,0,1>, 0.05 }
  cylinder { <-1,0,1>, <0,-1,1>, 0.05 }
  cylinder { <0,-1,1>, <1,0,1>, 0.05 }
                                                                               
  cylinder { <-1,0,-1>, <0,-1,-1>, 0.05 }                                    
  cylinder { <0,-1,-1>, <1,0,-1>, 0.05 }
  cylinder { <1,0,-1>, <0,1,-1>, 0.05 }                                    
  cylinder { <0,1,-1>, <-1,0,-1>, 0.05 }
}
  
//object { Cuboctahedron texture { pigment { color Grey } } }

#declare CO_Interconnectors = union {
  #declare W = 0.28;
  #for (i, 0, 5)                                     
    cylinder { <-W/2,0,0>, <W/2,0,0>, 0.005 translate 1.4935*z rotate (15+i*60)*y }
  #end
}
  
#declare CO_Cell = difference {
  union {
    object { Cuboctahedron scale 1.125 }
    //difference {
      object { Connection_Set }   
      //sphere { <0,0,0>, 1.225 }
    //}                                                       
        
    #for (i, 0, 1)                                       
     object { CO_Interconnectors Axis_Rotate_Trans(<1,0,1>, 55+i*70) }  
     object { CO_Interconnectors rotate 30*y Axis_Rotate_Trans(<1,0,-1>, 55.4+i*70) }      
    #end
  }
  object { Cell_Negative }
  texture { pigment { color Grey } }       
}

object { CO_Cell }