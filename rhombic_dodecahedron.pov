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
  location <3,2,1>*2.5
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
  #local Pos_Angle = 180+70.5287794;
  #local Neg_Angle = 180-70.5287794;
  object {
    Face
    translate sqrt(2)*x
    rotate Pos_Angle*y
    Axis_Rotate_Trans(<-sqrt(2),0,1>, 60)
    translate sqrt(2)*x
  }
  object {
    Face
    translate -sqrt(2)*x
    rotate Pos_Angle*y
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
    rotate Neg_Angle*y
    Axis_Rotate_Trans(<sqrt(2),0,1>, 60)
    translate sqrt(2)*x
  }
  object {
    Face                       
    translate -sqrt(2)*x
    rotate Neg_Angle*y
    Axis_Rotate_Trans(<-sqrt(2),0,-1>, 60)
    translate -sqrt(2)*x
  }
}
                                                                                                                    
#local Oct_Verts = array [8] { <1,1,1>, <-1,1,1>, <1,-1,1>, <1,1,-1>, <-1,-1,1>, <-1,1,-1>, <1,-1,-1>, <-1,-1,-1> }

#declare Rhombic_Dodecahedron = union {
  // Faces
  object { HalfShell translate -sqrt(2)*y rotate 45*z}
  object { HalfShell translate -sqrt(2)*y rotate 225*z }
               
  // Cubical Vertices                                                             
  sphere { <2,0,0>, 0.05 }                                                                            
  sphere { <-2,0,0>, 0.05 }                                                                            
  sphere { <0,2,0>, 0.05 }                                                                            
  sphere { <0,-2,0>, 0.05 }                                                                            
  sphere { <0,0,2>, 0.05 }                                                                            
  sphere { <0,0,-2>, 0.05 }            
  
  #for (i,0,7)
    // Octahedral Vertices
    sphere { Oct_Verts[i], 0.05 }
    
    //Edges                
    cylinder { Oct_Verts[i], sgn(Oct_Verts[i].x) * <2,0,0>, 0.05 }
    cylinder { Oct_Verts[i], sgn(Oct_Verts[i].y) * <0,2,0>, 0.05 }
    cylinder { Oct_Verts[i], sgn(Oct_Verts[i].z) * <0,0,2>, 0.05 }
  #end
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

//object { RD_Cell } 

#macro SuperCell(C) union {
  object { C }
  #for (i,0,11)                   
   object { C translate 2*Vertex_Vectors[i] }
  #end
  /*difference {
    sphere { 0, 3*sqrt(2) }
    sphere { 0, 3*sqrt(2)-0.05 }
    #for (i,0,11)
      cylinder { 0, 6*Vertex_Vectors[i], 0.45 }
    #end
    material {
      texture {
        pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
        finish { F_Glass4 }
      }
      interior { I_Glass caustics 1 }
    }
  }*/
}                                                                       
#end

object { SuperCell(RD_Cell) }          

              
                 