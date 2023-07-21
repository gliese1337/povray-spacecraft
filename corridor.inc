#version 3.6;

#include "./cell_basics.inc"


#macro Corridor(S, Hull_T, Anchor_T)

#local Interconnectors = union {
  #local rx = S*Module_Radius - Wall_Thickness - Intersection_Radius/sqrt(2);
  #local ry = Anchor_Ring_Radius + Intersection_Radius/sqrt(2);
  
  #local sx = S*Module_Radius - 0.5*Connector_Radius - 2*Wall_Thickness ;
  #local sy = Anchor_Ring_Radius + 0.5*Connector_Radius;
  
  #local flange = box {
    <Flange_Length/2, sy, Flange_Width/2>,
    <-Flange_Length/2, sy-3*Wall_Thickness, -Flange_Width/2>
  }
  
  #local bar = union {
    // Cap segments
    cylinder { <rx,ry,0>, <sx, sy, 0>, Anchor_Radius }
    cylinder { <-rx,ry,0>, <-sx, sy, 0>, Anchor_Radius }
    sphere { <sx, sy, 0>, Anchor_Radius }
    sphere { <-sx, sy, 0>, Anchor_Radius }
    object { flange translate (sx-Flange_Length/2)*x }
    object { flange translate -(sx-Flange_Length/2)*x }
    
    // Outside long segments
    cylinder { <sx, sy>, <(S-1)*Module_Radius+Intersection_Radius, sy>, Anchor_Radius }
    cylinder { <-sx, sy>, <-(S-1)*Module_Radius-Intersection_Radius, sy>, Anchor_Radius }
    
    object { flange translate (sx-Module_Radius/2)*x }
    object { flange translate -(sx-Module_Radius/2)*x }
    
    // Center intersection plate                                                  
    object { Intersection_Plate translate <0, sy, 0> }
    
    // Long segments
    #for (i,1,S-1)
      object { Intersection_Plate translate <i*Module_Radius, sy, 0> }
      object { Intersection_Plate translate <-i*Module_Radius, sy, 0> }
      cylinder {
        <i*Module_Radius+Intersection_Radius, sy, 0>,
        <(i-1)*Module_Radius-Intersection_Radius, sy, 0>,
        Anchor_Radius
      }
      object { flange translate (i*Module_Radius-Module_Radius/2)*x }
      cylinder {
        <-i*Module_Radius-Intersection_Radius, sy, 0>,
        <-(i-1)*Module_Radius+Intersection_Radius, sy, 0>,
        Anchor_Radius
      }
      object { flange translate -(i*Module_Radius-Module_Radius/2)*x }
    #end
  }
  
  #local isect_angle = 2*degrees(atan(Intersection_Radius/sy));
  #local ring = union {
    difference {
      torus { sy Anchor_Radius }
      #for (i,0,3)                               
       object { Wedge(isect_angle) rotate (Edge_Angles[i]-(isect_angle/2))*y }
      #end
      rotate 90*z 
    }
    
    #for (i,0,3)
      object { flange rotate 90*y rotate 90*i*x }
    #end
  }
  
  object { ring }
  #for (i,1,S-1)                                 
    object { ring translate i*Module_Radius*x }
    object { ring translate -i*Module_Radius*x }
  #end
  
  #for (i,0,3)
    object { bar rotate (90+Edge_Angles[i])*x }
  #end
  
  /* 
  #local spoint = <sx, sy, 0>;
  #local epoint = (spoint + vaxis_rotate(<rh, -ra, 0>, z, 60))/2;
    
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
  */
   
}

#local cone_top = S*Module_Radius-2*Wall_Thickness;
#local cone_base = cone_top - 0.5*Connector_Radius;

union {
  object { Anchor_Ring(S, Anchor_T) }
  object { Anchor_Ring(S, Anchor_T) rotate 180*y }
  object { Interconnectors texture { Anchor_T } }
  difference {
    union {
      cylinder { -S*Module_Radius*x, S*Module_Radius*x, Connector_Radius }                                                                               
      cone {
        -cone_top*x, Connector_Radius,
        -cone_base*x, 1.5*Connector_Radius
      }
      cone {
        cone_top*x, Connector_Radius,
        cone_base*x, 1.5*Connector_Radius
      }
      cylinder {
        -cone_base*x,
        cone_base*x,
        1.5*Connector_Radius
       } 
    }
    union {
      cylinder { -(S*Module_Radius+.01)*x, (S*Module_Radius+.01)*x, Connector_Radius-Wall_Thickness }
      cone {
        -cone_top*x, Connector_Radius-Wall_Thickness,
        -cone_base*x, 1.5*Connector_Radius-Wall_Thickness
      }
      cone {
        cone_top*x, Connector_Radius-Wall_Thickness,
        cone_base*x, 1.5*Connector_Radius-Wall_Thickness
      }
      cylinder {
        -cone_base*x,
        cone_base*x,
        1.5*Connector_Radius-Wall_Thickness
       }  
    }
    texture { Hull_T }
  }
}
#end