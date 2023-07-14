#version 3.6;

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"

#macro Rhombic_Dodecahedron(S)
#local Face = prism {
  linear_sweep
  linear_spline
  -0.05, // sweep the following shape from here ...
  0.05, // ... up through here
  5, // the number of points making up the shape ...
  <0,S>, <S*sqrt(2),0>, <0,-S>, <-S*sqrt(2),0>, <0,S>
}

#local HalfShell = union {
  object { Face }
  object {
    Face
    translate S*sqrt(2)*x
    rotate 90*z
    translate S*sqrt(2)*x
  }
                   
  #local theta = 70.5287794;
  #local data = array [4] { <1,-1>, <-1, 1>, <1, 1>, <-1,-1> } 
  #for (i,0,3)
    #local j = data[i].x;
    #local k = data[i].y; 
    object {
      Face
      translate j*S*sqrt(2)*x
      rotate (180-j*k*theta)*y
      Axis_Rotate_Trans(<k*sqrt(2),0,j>, 60)
      translate j*S*sqrt(2)*x
    }
  #end
}
                                                                                                                    
#local Oct_Verts = array [8] {
  <S,S,S>, <-S,S,S>, <S,-S,S>, <S,S,-S>, <-S,-S,S>, <-S,S,-S>, <S,-S,-S>, <-S,-S,-S>
}

union {
  // Faces
  object { HalfShell translate -S*sqrt(2)*y rotate 45*z }
  object { HalfShell translate -S*sqrt(2)*y rotate 225*z }
               
  // Cubical Vertices                                                             
  sphere { <S*2,0,0>, 0.05 }                                                                            
  sphere { <-S*2,0,0>, 0.05 }                                                                            
  sphere { <0,S*2,0>, 0.05 }                                                                            
  sphere { <0,-S*2,0>, 0.05 }                                                                            
  sphere { <0,0,S*2>, 0.05 }                                                                            
  sphere { <0,0,-S*2>, 0.05 }            
  
  #for (i,0,7)
    // Octahedral Vertices
    sphere { Oct_Verts[i], 0.05 }
    
    //Edges                
    cylinder { Oct_Verts[i], sgn(Oct_Verts[i].x) * <S*2,0,0>, 0.05 }
    cylinder { Oct_Verts[i], sgn(Oct_Verts[i].y) * <0,S*2,0>, 0.05 }
    cylinder { Oct_Verts[i], sgn(Oct_Verts[i].z) * <0,0,S*2>, 0.05 }
  #end
}              
#end  

#macro RD_Cell(Hull_T, Anchor_T)
#local Interconnectors = union {
  #local rh = sqrt(2)-0.05;
  #for (i,0,3)
    #local spoint = <rh, 0.625, 0>;                                                                      
    #local epoint = <rh, 0.77, 0>;
    union {
      // straight section                                                                     
      cylinder { spoint, epoint, 0.005 }
      sphere { epoint, 0.005 }
      
      // corner section
      union {
        cylinder { 0, 0.015*y, 0.005 }
        box { <0, 0.015, 0.0005>, <-0.1, 0, -0.0005> }
        rotate 30*z
        translate epoint
      }
      rotate (90+Edge_Angles[i])*x
    }
  #end 
}
difference {
  union {
    object { Rhombic_Dodecahedron(1) scale 0.9 texture { Hull_T } }
    Connection_Set(1,Hull_T,Anchor_T)
    Place_At_Vertices(1, object { Interconnectors texture { Anchor_T } })
  }
  sphere { 0, sqrt(2)-0.01 }
  Cell_Negative(1)       
}
#end          
              
#macro RD_Cell2(Hull_T, Anchor_T)
#local Interconnectors = union {
  #local rh = 3*sqrt(2)-0.05;
  #for (i,0,3)
    #local spoint = <rh, 0.625, 0>;                                                                      
    #local epoint = <rh, 2.35, 0>;
    union {
      // straight section                                                                     
      cylinder { spoint, epoint, 0.005 }
      box { <rh, 1.385, 0.0005>, <-0.1, 1.415, -0.0005> }
      sphere { epoint, 0.005 }
      
      // corner section
      union {
        cylinder { 0, 0.07*y, 0.005 }
        box { <0, 0.03, 0.0005>, <-0.1, 0, -0.0005> }
        rotate 30*z
        translate epoint
      }
      rotate (90+Edge_Angles[i])*x
    }
  #end 
}
difference {
  union {
    object { Rhombic_Dodecahedron(3) scale 0.96 texture { Hull_T } }
    Connection_Set(3,Hull_T,Anchor_T)
    Place_At_Vertices(3, object { Interconnectors texture { Anchor_T } })
  }
  //sphere { 0, 4.135 }
  Cell_Negative(3)       
}
#end         
               