#version 3.6;  

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"  
                      
#macro Sphere_Square_Cap(Hull_T,Anchor_T)
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
    object { Sphere_Cap(1,2,Hull_T) rotate 270*y }
    Square_Cap_Connection_Set(1,Hull_T,Anchor_T)
    Square_Cap_Vertices(object { Interconnectors texture { Anchor_T } })
  }
  union {
    Square_Cap_Negative(1)
    object { Sphere_Cap_Negative(1,2) rotate 270*y }
    texture { Hull_T }
  }       
}
#end

                      
#macro Sphere_Square_Cap2(Hull_T,Anchor_T)
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
    object { Sphere_Cap(3,2,Hull_T) rotate 270*y }
    Square_Cap_Connection_Set(3,Hull_T,Anchor_T)
    intersection {
      Square_Cap_Vertices(object { Interconnectors texture { Anchor_T } })
      cylinder { 0, 3*sqrt(2)*z, 3*sqrt(2) }
    }
  }
  union {
    Square_Cap_Negative(3)
    object { Sphere_Cap_Negative(3,2) rotate 270*y }
    texture { Hull_T }
  }       
}
#end

#macro Sphere_Cap_Square_Cylinder(S, L, Hull_T, Anchor_T)
union {
  #switch (S)
    #case (1)                                                         
      object { Sphere_Square_Cap(Hull_T,Anchor_T) translate (L+1)*2*z }
      object { Sphere_Square_Cap(Hull_T,Anchor_T) rotate 180*y translate -(L+1)*2*z }
    #break
    #case (3)
      object { Sphere_Square_Cap2(Hull_T,Anchor_T) translate (L+1)*2*z }
      object { Sphere_Square_Cap2(Hull_T,Anchor_T) rotate 180*y translate -(L+1)*2*z }
    #break
  #end
  #if (mod(L,2))
    object { Square_Ring(S,Hull_T,Anchor_T) }
    #for (i,1,floor(L/2))                                      
      object { Square_Ring(S,Hull_T,Anchor_T) translate 4*i*z }
      object { Square_Ring(S,Hull_T,Anchor_T) translate -4*i*z }
    #end
  #else
    #for (i,0,L/2-1)                                                
      object { Square_Ring(S,Hull_T,Anchor_T) translate (4*i+2)*z }
      object { Square_Ring(S,Hull_T,Anchor_T) translate -(4*i+2)*z }
    #end
  #end
}
#end