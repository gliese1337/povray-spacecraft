#version 3.6;  

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"  
                      
#macro Sphere_Cell(S,Hull_T,Anchor_T)

#local Interconnectors = union {
  #local rh = S*Module_Radius-Wall_Thickness;
  #local ra = Anchor_Ring_Radius + Intersection_Radius;
  #local rr = sqrt(rh*rh+ra*ra);
  #for (i,0,3)
    #local spoint = <rh, ra, 0>;
    #local flange = box { <rr, Flange_Length/2, Flange_Width/2>, <rr-0.2, -Flange_Length/2, -Flange_Width/2> }
    union {
      #for (j,1,S-1)                                                                      
        #local epoint = vaxis_rotate(rr*x, z, 30*(j/S));                                                                       
        cylinder { spoint, epoint, Anchor_Radius }
        object { flange rotate 30*(j/S)*z }
        #local spoint = epoint;
      #end
      #local epoint = vaxis_rotate(rr*x, z, 30);
      cylinder { spoint, epoint, Anchor_Radius }
      sphere { epoint, 0.005 }
      object { flange rotate 30*z }
      rotate (90+Edge_Angles[i])*x
    }
  #end 
}

difference {
  union {
    sphere { 0, S*Module_Radius-Wall_Thickness texture { Hull_T } }
    Connection_Set(S,Hull_T,Anchor_T)
    Place_At_Vertices(object { Interconnectors texture { Anchor_T } })
  }
  union {
    sphere { 0, S*Module_Radius-3*Wall_Thickness }
    object{ Cell_Negative(S) }
    texture { Hull_T }
  }       
}

#end       
