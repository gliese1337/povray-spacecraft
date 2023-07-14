#version 3.6;

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"

#local Interconnectors = union {
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
  
#declare Cone_Cell = difference {
  union {
    intersection {
      #for(i,0,11)
        cone { 1.15 * Vertex_Vectors[i], 0, -Vertex_Vectors[i], 3.7*sqrt(2) }
      #end       
    }
    Connection_Set(1)
    Place_At_Vertices(1, object { Interconnectors })
  }
  union {
    Cell_Negative(1)
    sphere { 0, 1.4 }
  }
  texture { pigment { color Grey } }       
}

#local Interconnectors2 = union {
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

#declare Cone_Cell2 = difference {
  union {
    intersection {
      #for(i,0,11)
        cone { 3.15 * Vertex_Vectors[i], 0, -3*Vertex_Vectors[i], 10.5*sqrt(2) }
      #end       
    }
    difference {
      Connection_Set(3)
      sphere { 0, 4.2 }
    }
    Place_At_Vertices(1, object { Interconnectors2 })
  }
  union {
    Cell_Negative(3)
    sphere { 0, 3.8 }
  }
  texture { pigment { color Grey } }         
}