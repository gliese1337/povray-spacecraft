#version 3.6;  

#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"
#include "./cell_basics.inc"  
                      
#macro Sphere_Point_Cap(Hull_T,Anchor_T)
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
#local l = sqrt(2);
difference {
  union {
    object { Sphere_Cap(1,l,Hull_T) Reorient_Trans(x, <0,1,1>) }
    Point_Cap_Connection_Set(1,Hull_T,Anchor_T)
    intersection {
      Point_Cap_Vertices(object { Interconnectors })
      cylinder { 0, sqrt(2)*<0,1,1>, sqrt(2)+0.5 }
      texture { Anchor_T }
    }
  }
  union {
    Point_Cap_Negative(1)
    object { Sphere_Cap_Negative(1,l) Reorient_Trans(x, <0,1,1>) }
    texture { Hull_T }
  }       
}
#end

                      
#macro Sphere_Point_Cap2(Hull_T,Anchor_T)
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
#local l = sqrt(2);
difference {
  union {
    object { Sphere_Cap(3,l,Hull_T) Reorient_Trans(x, <0,1,1>) }
    Point_Cap_Connection_Set(3,Hull_T,Anchor_T)
    intersection {
      Point_Cap_Vertices(object { Interconnectors texture { Anchor_T } })
      cylinder { 0, 3*sqrt(2)*vnormalize(<0,1,1>), 3*sqrt(2) }
    }
  }
  union {
    Point_Cap_Negative(3)
    object { Sphere_Cap_Negative(3,l) Reorient_Trans(x, <0,1,1>) }
    texture { Hull_T }
  }       
}
#end

#macro Sphere_Cap_Point_Cylinder(S, L, Hull_T, Anchor_T)
#declare l = sqrt(2);
union {
  #switch (S)
    #case (1)                                                         
      object { Sphere_Point_Cap(Hull_T,Anchor_T) translate (L+1)*l*vnormalize(<0,1,1>) }
      object { Sphere_Point_Cap(Hull_T,Anchor_T) Reorient_Trans(<0,1,1>,<0,-1,-1>) translate -(L+1)*l*vnormalize(<0,1,1>) }
    #break
    #case (3)
      object { Sphere_Point_Cap2(Hull_T,Anchor_T) translate (L+1)*l*vnormalize(<0,1,1>) }
      object { Sphere_Point_Cap2(Hull_T,Anchor_T) Reorient_Trans(<0,1,1>,<0,-1,-1>) translate -(L+1)*l*vnormalize(<0,1,1>) }
    #break
  #end
  #if (mod(L,2))
    object { Point_Ring(S,Hull_T,Anchor_T) }
    #for (i,1,floor(L/2))                                      
      object { Point_Ring(S,Hull_T,Anchor_T) translate 2*l*i*vnormalize(<0,1,1>) }
      object { Point_Ring(S,Hull_T,Anchor_T) translate -2*l*i*vnormalize(<0,1,1>) }
    #end
  #else
    #for (i,0,L/2-1)                                                
      object { Point_Ring(S,Hull_T,Anchor_T) translate (2*l*i+l)*vnormalize(<0,1,1>) }
      object { Point_Ring(S,Hull_T,Anchor_T) translate -(2*l*i+l)*vnormalize(<0,1,1>) }
    #end
  #end
}
#end