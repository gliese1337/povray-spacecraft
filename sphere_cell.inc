#version 3.6;  

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"  
                      
#macro Sphere_Cell(Hull_T,Anchor_T)
#local Interconnectors = union {
  #local rh = sqrt(2)-0.05;
  #local rr = sqrt(rh*rh+0.625*0.625);
  #for (i,0,3)
    #local spoint = <rh, 0.625, 0>;                                                                      
    #local epoint = vaxis_rotate(rr*x, z, 30);
    union {                                                                      
      cylinder { spoint, epoint, 0.005 }
      box { <rr, 0, 0.0005>, <rr-0.1, -.0125, -0.0005> rotate 30*z }
      rotate (90+Edge_Angles[i])*x
    }
  #end 
}
difference {
  union {
    sphere { 0, sqrt(2) texture { Hull_T } }
    Connection_Set(1,Hull_T,Anchor_T)
    Place_At_Vertices(1, object { Interconnectors texture { Anchor_T } })
  }
  sphere { 0, sqrt(2)-0.05 }
  Cell_Negative(1)       
}
#end
  
  
#macro Sphere_Cell2(Hull_T,Anchor_T)
#local Interconnectors = union {
  #local rh = 3*sqrt(2)-0.05;
  #local rr = sqrt(rh*rh+0.625*0.625);
  #for (i,0,3)
    #local spoint = <rh, 0.625, 0>;                                                                      
    #local mpoint = vaxis_rotate(rr*x, z, 17.5);                                                             
    #local epoint = vaxis_rotate(rr*x, z, 30);
    union {                                                                      
      cylinder { spoint, mpoint, 0.005 }
      sphere { mpoint, 0.005 }                                                                      
      cylinder { mpoint, epoint, 0.005 }
      sphere { epoint, 0.005 }                             
      box { <rr, 0.0125, 0.0005>, <rr-0.1, -0.0125, -0.0005> rotate 17.5*z }
      box { <rr, 0, 0.0005>, <rr-0.1, -0.0125, -0.0005> rotate 30*z }
      rotate (90+Edge_Angles[i])*x
    }
  #end 
}
difference {
  union {
    sphere { 0, 3*sqrt(2)-0.1 texture { Hull_T } }
    Connection_Set(3,Hull_T,Anchor_T)
    Place_At_Vertices(3, object { Interconnectors texture { Anchor_T } })
  }
  sphere { 0, 3*sqrt(2)-0.15 }
  Cell_Negative(3)       
}
#end           
