#version 3.6;

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"

#macro Cuboctahedron(S)
mesh2 {
  vertex_vectors {
    12, 
    < 1, 1, 0>, < 1, 0, 1>, < 0, 1, 1>, // 0, 1, 2
    < 1,-1, 0>, < 1, 0,-1>, < 0, 1,-1>, // 3, 4, 5
    <-1, 1, 0>, <-1, 0, 1>, < 0,-1, 1>, // 6, 7, 8
    <-1,-1, 0>, <-1, 0,-1>, < 0,-1,-1>  // 9,10,11
  }
  face_indices {
    20,
    // Square faces                              
    < 1, 4, 0>, < 1, 4, 3>,                                    
    < 0, 6, 2>, < 0, 6, 5>,
    < 3, 9, 8>, < 3, 9,11>,
    < 6, 9, 7>, < 6, 9,10>,
    < 1, 7, 2>, < 1, 7, 8>,
    < 4,10, 5>, < 4,10,11>,
  
  
    // Triangular faces
    < 0, 1, 2>, < 0, 4, 5>,
    < 2, 6, 7>, < 1, 3, 8>,
    < 3, 4,11>, < 5, 6,10>,
    < 7, 8, 9>, < 9,10,11>,
  }
  inside_vector z
  scale S
}
#end

#macro CO_Interconnectors(S,Anchor_T)
union {
  #local rh = S*sqrt(2)-Wall_Thickness;
  #local rr = sqrt(rh*rh+0.625*0.625);
  #local spoint = <rh, 0.625, 0>;
  #local epoint = (spoint + vaxis_rotate(<rh, -0.625, 0>, z, 60))/2;
    
  #local arrow = (epoint - spoint)/S;
  #local flange = box {
    <0, Flange_Length/2, Flange_Width/2>,
    <-0.2, -Flange_Length/2, -Flange_Width/2>
    rotate 30*z
    translate spoint
  }
  #local bar = union {
    cylinder { spoint, epoint, Anchor_Radius }
    #for (i,1,S)                                                                      
      object { flange translate i*arrow }
    #end
  }
  
  #for (i,0,3)
    object { bar rotate (90+Edge_Angles[i])*x }
  #end
  texture { Anchor_T } 
}
#end
  
#macro CO_Cell(S, Hull_T, Anchor_T)
difference {
  union {
    object { Cuboctahedron(S+2*Wall_Thickness) texture { Hull_T } }
    Connection_Set(S,Hull_T,Anchor_T)   
    Place_At_Vertices(CO_Interconnectors(S,Anchor_T))
  }
  union {
    object{ Cell_Negative(S) }
    object { Cuboctahedron(S+Wall_Thickness) }
    texture { Hull_T }
  }       
}
#end 

#macro Conoctahedron(S)
union {
  intersection {
    #for(i,0,11)
      cone { S*Vertex_Vectors[i], 0, -S*Vertex_Vectors[i], 5*S }
    #end
  }       
}
#end

#macro Cone_Cell(S, Hull_T, Anchor_T)
difference {
  union {
    object { Conoctahedron(S+2*Wall_Thickness) texture { Hull_T } }
    Connection_Set(S,Hull_T,Anchor_T)
    Place_At_Vertices(CO_Interconnectors(S,Anchor_T))
  }
  union {
    Cell_Negative(S)
    object { Conoctahedron(S+Wall_Thickness) }
    texture { Hull_T }
  }       
}
#end