#version 3.6;

#include "./cell_basics.inc"

#macro Rhombic_Dodecahedron(S)
mesh2 {
  vertex_vectors {
    14,
    < 1, 1, 1>, < 1, 1,-1>, < 1,-1, 1>, < 1,-1,-1>, // 0, 1, 2, 3
    <-1, 1, 1>, <-1, 1,-1>, <-1,-1, 1>, <-1,-1,-1>, // 4, 5, 6, 7
    < 2, 0, 0>, < 0, 2, 0>, < 0, 0, 2>,             // 8, 9, 10
    <-2, 0, 0>, < 0,-2, 0>, < 0, 0,-2>              // 11, 12, 13
  }
  face_indices {
    24,
    <0,  8,  9>, <0,  9, 10>, <0, 10,  8>,
    <7, 11, 12>, <7, 12, 13>, <7, 13, 11>, 
    <4, 11,  9>, <4,  9, 10>, <4, 10, 11>,
    <3,  8, 12>, <3, 12, 13>, <3, 13,  8>,
    <2,  8, 12>, <2, 12, 10>, <2, 10,  8>,
    <5, 11,  9>, <5,  9, 13>, <5, 13, 11>,
    <1,  8,  9>, <1,  9, 13>, <1, 13,  8>,
    <6, 11, 12>, <6, 12, 10>, <6, 10, 11>
  }
  inside_vector z
  scale S
}              
#end  

#macro RD_Cell(S, Hull_T, Anchor_T)
#local Interconnectors = union {
  #local rh = S*Module_Radius-Wall_Thickness;
  #local rm = rh*2/sqrt(3);
  #local ra = Anchor_Ring_Radius + Intersection_Radius;
  
  #local spoint = <rh, ra, 0>;
  
  #local epoint = vaxis_rotate((rm-0.03)*x, z, 30);               
  #local mpoint = <rh, -2*(rh-epoint.x)+epoint.y, 0>;
  #local arrow = (mpoint - spoint)/S;
    
  #local flange = box {
    <0, Flange_Length/2, Flange_Width/2>,
    <-0.2, -Flange_Length/2, -Flange_Width/2>
  }
  #local bar = union {
    // straight section                                                                     
    cylinder { spoint, mpoint, Anchor_Radius }
    sphere { mpoint, Anchor_Radius }
    #for (i,1,S-1)                                                                      
      object { flange translate spoint + i*arrow }
    #end
    // corner section
    union {
      cylinder { mpoint, epoint, Anchor_Radius }
      object { flange rotate 30*z translate epoint }
    }  
  }
    
  union {
    #for (i,0,3)
      object { bar rotate (90+Edge_Angles[i])*x }
    #end
  }
  texture { Anchor_T } 
}

difference {
  union {
    object { Rhombic_Dodecahedron(S*Module_Radius*.7071 - 2*Wall_Thickness) texture { Hull_T } }
    Connection_Set(S,Hull_T,Anchor_T)
    Place_At_Vertices(Interconnectors)
  }
  union {   
    Cell_Negative(S)
    Rhombic_Dodecahedron(S*Module_Radius*.7071-3*Wall_Thickness)
    texture { Hull_T }
  }       
}
#end        
               