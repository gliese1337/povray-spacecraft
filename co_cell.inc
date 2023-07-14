#version 3.6;

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"

#macro Cuboctahedron(S)

#local Square_Face = prism {
  linear_sweep
  linear_spline
  -0.05, // sweep the following shape from here ...
  0.05, // ... up through here
  5, // the number of points making up the shape ...
  <1,0>, <0,1>, <-1,0>, <0,-1>, <1,0>
  scale <S,1,S>
}

#local Square_Pair = union {
  object { Square_Face translate S*y }
  object { Square_Face translate -S*y rotate 180*y }
}

#local Triangle_Face = prism {
  linear_sweep
  linear_spline
  -0.05, // sweep the following shape from here ...
  0.05, // ... up through here
  4, // the number of points making up the shape ...
  <-1,-sqrt(3)/3>, <0,2*sqrt(3)/3>, <1,-sqrt(3)/3>, <-1,-sqrt(3)/3>
  scale <S*sqrt(2)/2,1,S*sqrt(2)/2>
}

#local Tri_Pair = union {                              
  object { Triangle_Face translate S*1.155*y }
  object { Triangle_Face translate -S*1.155*y rotate 180*y }
  rotate 165*y
}

#local Squares = array[6][4] { { S*< 1, 1, 0>, S*< 1, 0,-1>, S*< 1,-1, 0>, S*< 1, 0, 1> } ,
                               { S*< 1, 1, 0>, S*< 0, 1, 1>, S*<-1, 1, 0>, S*< 0, 1,-1> } ,
                               { S*<-1,-1, 0>, S*< 0,-1,-1>, S*< 1,-1, 0>, S*< 0,-1, 1> } ,
                               { S*<-1,-1, 0>, S*<-1, 0,-1>, S*<-1, 1, 0>, S*<-1, 0, 1> } ,
                               { S*< 1, 0, 1>, S*< 0, 1, 1>, S*<-1, 0, 1>, S*< 0,-1, 1> } ,
                               { S*<-1, 0,-1>, S*< 0,-1,-1>, S*< 1, 0,-1>, S*< 0, 1,-1> } }

union {
  // Faces                                                           
  object { Tri_Pair Axis_Rotate_Trans(<1,0,-1>, 54.76) }
  object { Tri_Pair rotate 180*y Axis_Rotate_Trans(<1,0,-1>, -54.76) }
  object { Tri_Pair Axis_Rotate_Trans(<1,0,-1>, 54.76) rotate 90*y }
  object { Tri_Pair rotate 180*y Axis_Rotate_Trans(<1,0,-1>, -54.76) rotate 90*y }                                    
  object { Square_Pair }                                   
  object { Square_Pair rotate 45*y rotate 90*x rotate 45*z }
  object { Square_Pair rotate 45*y rotate 90*z rotate 45*x }
  
  // Vertices; we don't need to render these 'cause they'd just get cut off anyway.
  // (±1,±1,0)
  // (±1,0,±1)
  // (0,±1,±1)           
  
  //Edges
  #for (i,0,5)
    #for (j,0,3)                               
      cylinder { Squares[i][j], Squares[i][mod(j+1,4)], 0.05 }
    #end
  #end
}
#end

#declare CO_Interconnectors = union {
  #local rh = sqrt(2)-0.05;
  #for (i,0,3)
    cylinder {
      0, 0.15*y, 0.005
      rotate 30*z
      translate <rh, 0.625, 0>
      rotate (90+Edge_Angles[i])*x
    }
  #end 
} 
  
#macro CO_Cell(Hull_T, Anchor_T)
difference {
  union {
    object { Cuboctahedron(1) scale 1.125 texture { Hull_T } }
    difference {
      Connection_Set(1,Hull_T,Anchor_T)   
      sphere { 0, 1.225 }
    }
    
    Place_At_Vertices(1, object { CO_Interconnectors texture { Anchor_T } })
  }
  Cell_Negative(1)       
}
#end

#macro Cone_Cell(Hull_T, Anchor_T)
difference {
  union {
    intersection {
      #for(i,0,11)
        cone { 1.15 * Vertex_Vectors[i], 0, -Vertex_Vectors[i], 3.7*sqrt(2) }
      #end
      texture { Hull_T }       
    }
    Connection_Set(1,Hull_T,Anchor_T)
    Place_At_Vertices(1, object { CO_Interconnectors texture { Anchor_T } })
  }
  union {
    Cell_Negative(1)
    sphere { 0, 1.4 }
  }       
}
#end

#declare CO_Interconnectors2 = union {
  #local rh = 3*sqrt(2)-0.05;
  #for (i,0,3)
    union {
      cylinder { 0, 1.6*y, 0.005 }
      box { <0, 1.03, 0.0005>, <-0.1, 1, -0.0005> }                             
      rotate 30*z
      translate <rh, 0.625, 0>
      rotate (90+Edge_Angles[i])*x
    }
  #end 
} 

#macro CO_Cell2(Hull_T, Anchor_T)
difference {
  union {
    object { Cuboctahedron(3) scale 1.041 texture { Hull_T } }
    difference {
      Connection_Set(3,Hull_T,Anchor_T)   
      sphere { 0, 4.12 }
    }
    
    Place_At_Vertices(3, object { CO_Interconnectors2 texture { Anchor_T } })
  }
  Cell_Negative(3)       
}
#end

#macro Cone_Cell2(Hull_T, Anchor_T)
difference {
  union {
    intersection {
      #for(i,0,11)
        cone { 3.15 * Vertex_Vectors[i], 0, -3*Vertex_Vectors[i], 10.5*sqrt(2) }
      #end
      texture { Hull_T }       
    }
    difference {
      Connection_Set(3,Hull_T,Anchor_T)
      sphere { 0, 4.2 }
    }
    Place_At_Vertices(1, object { CO_Interconnectors2 texture { Anchor_T } })
  }
  union {
    Cell_Negative(3)
    sphere { 0, 3.8 }
  }         
}
#end