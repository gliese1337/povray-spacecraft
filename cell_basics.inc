#declare Connector_Angle = 54.7356103;
//#declare Connector_Height = 0.083;
#declare Connector_Radius = 1;
#declare Module_Radius = 2*sqrt(2);
#declare Wall_Thickness = 0.05;
#declare Anchor_Radius = 0.005;
#declare Flange_Width = 0.002;
#declare Flange_Length = 0.03;
#declare Anchor_Offset = 0.1;
#declare Anchor_Ring_Radius = Connector_Radius + Anchor_Offset;
#declare Intersection_Radius = 0.025;

#undef ICX
#declare ICX = function (S) { S*Module_Radius - Wall_Thickness - Intersection_Radius/sqrt(2) }
#declare ICY = Anchor_Ring_Radius + Intersection_Radius/sqrt(2);

#declare Intersection_Plate = union {
  cylinder { -Flange_Width/2*y, Flange_Width/2*y, Intersection_Radius }
  /*#difference {
    cylinder { -Anchor_Radius*y, Anchor_Radius*y, Intersection_Radius }
    #for (i,0,3)
      difference {
        cylinder { -(Anchor_Radius+0.1)*y, (Anchor_Radius+0.1)*y, Intersection_Radius + 2*Anchor_Radius }
        cylinder { -(Anchor_Radius+0.2)*y, (Anchor_Radius+0.2)*y, Intersection_Radius + Anchor_Radius }
        translate (Intersection_Radius + 2*Anchor_Radius)*x
        rotate (45+90*i)*y
      }
    #end
  }*/
  box {
    <-Flange_Width, -3*Flange_Width, -Flange_Width>/2,
    <Flange_Width, 3*Flange_Width, Flange_Width>/2
    rotate 45*y
  }
  #for (i, 0, 3)
    sphere { Intersection_Radius*x, Anchor_Radius rotate i*90*y }
  #end
}

#declare Edge_Angles = array[4] { Connector_Angle, 180 - Connector_Angle, -Connector_Angle,  Connector_Angle - 180 }

#macro Anchor_Ring(S,Anchor_T)
#local isect_angle = 2*degrees(atan(Intersection_Radius/Anchor_Ring_Radius));
union {
  difference {
    torus { Anchor_Ring_Radius Anchor_Radius }
    #for (i,0,3)                               
     object { Wedge(isect_angle) rotate (Edge_Angles[i]-(isect_angle/2))*y }
    #end 
  }
  
  #local flange = box {
     <Connector_Radius-0.025, -Flange_Width/2, -Flange_Length/2>,
     <Anchor_Ring_Radius, Flange_Width/2, Flange_Length/2>
     rotate (i*90+22.5)*y
  }
  
  #for (i,0,3)                                                                      
    object {
      Intersection_Plate
      rotate -.4*y
      rotate -45*x
      translate (Anchor_Ring_Radius-0.0002)*z
      rotate Edge_Angles[i]*y
    }
    cylinder {
      <0,-Intersection_Radius/sqrt(2),(Anchor_Ring_Radius-Intersection_Radius/sqrt(2))>,
      <0,-Wall_Thickness,(Anchor_Ring_Radius-Intersection_Radius/sqrt(2))>,
      Anchor_Radius
      rotate Edge_Angles[i]*y
    }
    object { flange rotate (i*90+45)*y }
    object { flange rotate (i*90)*y }
  #end
  
  rotate 90*z
  translate (S*Module_Radius-Wall_Thickness)*x
  texture { Anchor_T }
}
#end

#macro Connector_Cylinder(S,Hull_T)
cylinder { 0, S*Module_Radius*x, Connector_Radius texture { Hull_T } }
#end

#declare Vertex_Vectors = array[12] { <1,1,0>, <1,0,1>, <0,1,1>, // triangle
                                      <1,-1,0>, <-1,1,0>,
                                      <-1,0,1>, <1,0,-1>, // hexagon
                                      <0,1,-1>, <0,-1,1>,
                                      <-1,-1,0>, <-1,0,-1>, <0,-1,-1> } // second triangle

#declare Vertex_Orientations = array[12] { 90, 0, 45, 90, 90, 0, 0, 135, 135, 90, 0, 45 }

#macro Place_At_Vertices(M)
union {
  #for (i,0,11)                                                         
    object { M rotate Vertex_Orientations[i]*x Reorient_Trans(x, Vertex_Vectors[i]) }
  #end
}
#end

#macro Cell_Negative(S)
union {
  #for (i,0,11)
    cylinder { 0, Vertex_Vectors[i]*S*Module_Radius, Connector_Radius - Wall_Thickness }
  #end
}
#end

#macro Connection_Set(S,Hull_T,Anchor_T)
Place_At_Vertices(Connector_Cylinder(S,Hull_T))
Place_At_Vertices(Anchor_Ring(S,Anchor_T))
#end

#macro Anchor_Extension(S,L,Anchor_T)
#local height = S*Module_Radius-Wall_Thickness;
union {                                            
  cylinder { <0, height, -0.025>, <0, height, -L>, Anchor_Radius }
  #for (i,1,2)
    #local o = -0.3335*L*i;
    box { <Flange_Width/2, height, o+Flange_Length/2>, <-Flange_Width/2, height-2*Wall_Thickness, o-Flange_Length/2> }
  #end
  box { <Flange_Width/2, height, -L+Flange_Length/2>, <-Flange_Width/2, height-2*Wall_Thickness, -L> }
  texture { Anchor_T } 
}
#end

#macro Anchor_Extensions(S,L,Anchor_T)
union {        
  object { Anchor_Extension(S,L,Anchor_T) translate Cross_Plate_Offset*x }
  object { Anchor_Extension(S,L,Anchor_T) translate -Cross_Plate_Offset*x }
}
#end

#macro Partial_Vertices(M,Indices)
union {
  #for (i,0,dimension_size(Indices,1)-1)                                                         
    object { M rotate Vertex_Orientations[i]*x Reorient_Trans(x, Vertex_Vectors[i]) }
  #end
}
#end

#macro Connector_Negative(S,Indices)
union {
  #for (i,0,dimension_size(Indices,1)-1)                                                         
    cylinder { 0, Vertex_Vectors[i]*S*Module_Radius Connector_Radius-Wall_Thickness }
  #end
}
#end

#macro Ring_Cylinder(S,L,Hull_T) {
cylinder { L*z, -L*z, S*Module_Radius-2*Wall_Thickness texture { Hull_T } }
#end

#macro Ring_Negative(S,L,Alignment)
cylinder { (L+0.1)*z, -(L+0.1)*z, S*Module_Radius-3*Wall_Thickness Reorient_Trans(z, Alignment) }
#end

/* TRIANGLE CAP MACROS */

#local Triangle_Cap_Vertex_Indices = array[9]{0,1,2,3,4,5,6,7,8};
#macro Triangle_Cap_Vertices(M)
Partial_Vertices(M, Triangle_Cap_Vertex_Indices)
#end

#macro Triangle_Cap_Negative(S)
Connector_Negatives(S,Triangle_Cap_Vertex_Indices)
#end

#macro Triangle_Cap_Connection_Set(S,Hull_T,Anchor_T)
Triangle_Cap_Vertices(Connector_Cylinder(S,Hull_T))
intersection {
  Triangle_Cap_Vertices(Anchor_Ring(S,Anchor_T))
  cylinder { (S*Module_Radius+1)*z, -0.025*z, S*Module_Radius+1 Reorient_Trans(z, <1,1,1>) }
}
union {
  #for (i,0,5)                            
    object { Anchor_Extensions(S,sqrt(12),Anchor_T) rotate (45+60*i)*z }
  #end
  Reorient_Trans(z, <1,1,1>)
}
#end

#local Triangle_Ring_Vertex_Indices = array[9]{0,1,2,3,4,5,6,7,8};
#macro Triangle_Ring_Vertices(M)
Partial_Vertices(S, Triangle_Ring_Vertex_Indices)
#end
         
#macro Triangle_Ring_Negative(S)
Connector_Negatives(S,Triangle_Ring_Vertex_Indices)
#end

#macro Triangle_Ring_Connection_Set(S,Hull_T,Anchor_T)
union {
  Triangle_Ring_Vertices(Connector_Cylinder(S,Hull_T))
  Triangle_Ring_Vertices(union {
    object { Cross_Plate }                                  
    object { Cross_Plate rotate 180*y }
    rotate 90*z
    translate (S*Module_Radius-Wall_Thickness)*x
    texture { Anchor_T }
  })
}
#end

#macro Triangle_Ring(S, Hull_T,Anchor_T)
#local halflen = sqrt(12);
difference {
  union {
    union {
      Ring_Cylinder(S,halflen,Hull_T)
    
      #for (i,0,5)                            
        object { Anchor_Extensions(S,l,Anchor_T) rotate (45+60*i)*z }                       
        object { Anchor_Extensions(S,l,Anchor_T) rotate 180*y rotate (45+60*i)*z }
      #end
      Reorient_Trans(z, <1,1,1>)
    }
    Triangle_Ring_Connection_Set(S,Hull_T,Anchor_T)
  }
  union {
    Cylinder_Negative(S,L,Alignment)
    Triangle_Ring_Negative(S)
    texture { Hull_T }
  }       
}
#end


/* POINT CAP MACROS */

#local Point_Cap_Vertex_Indices = array[7]{0,1,2,4,5,7,8};
#macro Point_Cap_Vertices(M)
Partial_Vertices(M,Point_Cap_Vertices)
#end

#macro Point_Cap_Negative(S)
Connector_Negatives(S,Point_Cap_Vertex_Indices)
#end

#macro Point_Cap_Connection_Set(S,Hull_T,Anchor_T)
#local height = S*Module_Radius-Wall_Thickness;
#local double = union {
  object { Anchor_Extensions(S,sqrt(2),Anchor_T) }                                                   
  cylinder { <Cross_Plate_Offset, height, -Intersection_Radius>, <0.599, height, 0>, Anchor_Radius texture { Anchor_T } }
  cylinder { <-Cross_Plate_Offset, height, -Intersection_Radius>, <-0.599, height, 0>, Anchor_Radius texture { Anchor_T } }
}
#local single = union {                            
  object { Anchor_Extension(S,sqrt(2),Anchor_T) }
  cylinder { <0, height, -Intersection_Radius>, <0, height, 0>, Anchor_Radius texture { Anchor_T } }
  //translate (0.136/S)*y
}
union {
  Point_Cap_Vertices(Connector_Cylinder(S,Hull_T))
  intersection {
    Point_Cap_Vertices(Anchor_Ring(S,Anchor_T))
    cylinder { 0, S*Module_Radius*<0,1,1>, S*Module_Radius+0.5 }
  }
  union {                                                         
    object { double }
    object { double rotate 180*z }
    object { single rotate 54.75*z }
    object { single rotate 125.25*z }
    object { single rotate -54.75*z }
    object { single rotate -125.25*z }                           
    Reorient_Trans(z, <0,1,1>)
  }
}
#end

#macro Point_Ring_Vertices(M)
union {
  object { M rotate Vertex_Orientations[7]*x Reorient_Trans(x, Vertex_Vectors[7]) }                                                                      
  object { M rotate Vertex_Orientations[8]*x Reorient_Trans(x, Vertex_Vectors[8]) }
}
#end
         
#macro Point_Ring_Negative(S)
union { 
  cylinder { 0, Vertex_Vectors[7]*S*Module_Radius Connector_Radius - Wall_Thickness }
  cylinder { 0, Vertex_Vectors[8]*S*Module_Radius  Connector_Radius - Wall_Thickness }
}
#end

#macro Point_Ring_Connection_Set(S,Hull_T,Anchor_T)
union {
  Point_Ring_Vertices(Connector_Cylinder(S,Hull_T))
  Point_Ring_Vertices(union {
    object { Cross_Plate }                                  
    object { Cross_Plate rotate 180*y }
    rotate 90*z
    translate (S*Module_Radius-Wall_Thickness)*x
    texture { Anchor_T }
  })
}
#end

#macro Point_Ring(S, Hull_T,Anchor_T)
#local height = S*Module_Radius-Wall_Thickness;
#local single = union {                            
  object { Anchor_Extension(S,sqrt(2),Anchor_T) }
  cylinder { <0, height, -.025>, <0, height, 0>, 0.005 texture { Anchor_T } }
  translate (0.136/S)*y
}
difference {
  union {
    union {
      cylinder { Module_Radius*z, -Module_Radius*z, S*Module_Radius-(S-1)*Wall_Thickness texture { Hull_T } }
      #for (i,0,1)                            
        object { Anchor_Extensions(S,sqrt(2),Anchor_T) rotate 180*i*z }                       
        object { Anchor_Extensions(S,sqrt(2),Anchor_T) rotate 180*y rotate 180*i*z }
      #end                               
      object { single rotate 54.75*z }
      object { single rotate 180*y rotate 54.75*z }
      object { single rotate 125.25*z }
      object { single rotate 180*y rotate 125.25*z }
      object { single rotate -54.75*z }
      object { single rotate 180*y rotate -54.75*z }
      object { single rotate -125.25*z }
      object { single rotate 180*y rotate -125.25*z }
      Reorient_Trans(z, <0,1,1>)
    }
    Point_Ring_Connection_Set(S,Hull_T,Anchor_T)
  }
  union {
    cylinder { 2.1*z, -2.1*z, S*Module_Radius-S*Wall_Thickness Reorient_Trans(z, <0,1,1>) }
    Point_Ring_Negative(S)
    texture { Hull_T }
  }       
}
#end



/* SQUARE CAP MACROS */

#macro Square_Ring_Vertices(M)
union {                                                                      
  object { M rotate Vertex_Orientations[0]*x  Reorient_Trans(x, Vertex_Vectors[0]) }
  object { M rotate Vertex_Orientations[3]*x  Reorient_Trans(x, Vertex_Vectors[3]) }
  object { M rotate Vertex_Orientations[4]*x  Reorient_Trans(x, Vertex_Vectors[4]) }
  object { M rotate Vertex_Orientations[10]*x Reorient_Trans(x, Vertex_Vectors[9]) }
}
#end
         
#macro Square_Ring_Negative(S)
#local negrad = Connector_Radius - Wall_Thickness;
union { 
  cylinder { 0, Vertex_Vectors[0]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[3]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[4]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[9]*S*Module_Radius negrad }
}
#end

#macro Square_Ring_Connection_Set(S,Hull_T,Anchor_T)
union {
  Square_Ring_Vertices(Connector_Cylinder(S,Hull_T))
  Square_Ring_Vertices(union {
    object { Cross_Plate }                                  
    object { Cross_Plate rotate 180*y }
    rotate 90*z
    translate (S*Module_Radius-Wall_Thickness)*x
    texture { Anchor_T }
  })
}
#end

#macro Square_Ring(S, Hull_T,Anchor_T)
difference {
  union {
    cylinder { 2*z, -2*z, S*Module_Radius-(S-1)*Wall_Thickness texture { Hull_T } }
    
    Square_Ring_Connection_Set(S,Hull_T,Anchor_T)
    #for (i,0,3)                            
      object { Anchor_Extensions(S,2,Anchor_T) rotate (45+90*i)*z }                       
      object { Anchor_Extensions(S,2,Anchor_T) rotate 180*y rotate (45+90*i)*z }
    #end
  }
  union {
    cylinder { 2.1*z, -2.1*z, S*Module_Radius-S*Wall_Thickness }
    Square_Ring_Negative(S)
    texture { Hull_T }
  }       
}
#end
           
#macro Square_Cap_Vertices(M)
union {
  #for (i,0,5)               
    object { M rotate Vertex_Orientations[i]*x Reorient_Trans(x, Vertex_Vectors[i]) }
  #end
  object { M rotate Vertex_Orientations[8]*x Reorient_Trans(x, Vertex_Vectors[8]) }
  object { M rotate Vertex_Orientations[9]*x Reorient_Trans(x, Vertex_Vectors[9]) }
}
#end
         
#macro Square_Cap_Negative(S)
#local negrad = Connector_Radius - Wall_Thickness;
union {
  #for (i,0,5)               
    cylinder { 0, Vertex_Vectors[i]*S*Module_Radius, negrad }
  #end
  cylinder { 0, Vertex_Vectors[8]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[9]*S*Module_Radius negrad }
}
#end

#macro Square_Cap_Connection_Set(S,Hull_T,Anchor_T)
union {
  Square_Cap_Vertices(Connector_Cylinder(S,Hull_T))
  intersection {
    Square_Cap_Vertices(object { Anchor_Ring rotate 90*z translate (S*Module_Radius-Wall_Thickness)*x texture { Anchor_T } })
    cylinder { (S*Module_Radius+1)*z, -0.025*z, S*Module_Radius+1 }
  }
  #for (i,0,3)                            
    object { Anchor_Extensions(S,2,Anchor_T) rotate (45+90*i)*z }
  #end
}
#end

#macro Square_Ring_Vertices(M)
union {                                                                      
  object { M rotate Vertex_Orientations[0]*x  Reorient_Trans(x, Vertex_Vectors[0]) }
  object { M rotate Vertex_Orientations[3]*x  Reorient_Trans(x, Vertex_Vectors[3]) }
  object { M rotate Vertex_Orientations[4]*x  Reorient_Trans(x, Vertex_Vectors[4]) }
  object { M rotate Vertex_Orientations[10]*x Reorient_Trans(x, Vertex_Vectors[9]) }
}
#end
         
#macro Square_Ring_Negative(S)
#local negrad = Connector_Radius - Wall_Thickness;
union { 
  cylinder { 0, Vertex_Vectors[0]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[3]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[4]*S*Module_Radius negrad }
  cylinder { 0, Vertex_Vectors[9]*S*Module_Radius negrad }
}
#end

#macro Square_Ring_Connection_Set(S,Hull_T,Anchor_T)
union {
  Square_Ring_Vertices(Connector_Cylinder(0,Hull_T))
  Square_Ring_Vertices(union {
    object { Cross_Plate }                                  
    object { Cross_Plate rotate 180*y }
    rotate 90*z
    translate (S*Module_Radius-0.05)*x
    texture { Anchor_T }
  })
}
#end

#macro Square_Ring(S, Hull_T,Anchor_T)
difference {
  union {
    cylinder { 2*z, -2*z, S*Module_Radius-(S-1)*Wall_Thickness texture { Hull_T } }
    
    Square_Ring_Connection_Set(S,Hull_T,Anchor_T)
    #for (i,0,3)                            
      object { Anchor_Extensions(S,2,Anchor_T) rotate (45+90*i)*z }                       
      object { Anchor_Extensions(S,2,Anchor_T) rotate 180*y rotate (45+90*i)*z }
    #end
  }
  union {
    cylinder { 2.1*z, -2.1*z, S*Module_Radius-S*Wall_Thickness }
    Square_Ring_Negative(S)
    texture { Hull_T }
  }       
}
#end

#macro Sphere_Cap(S,L,Hull_T)
#local r = S*Module_Radius-((S-1)*Wall_Thickness);
union {
  intersection {
    sphere { 0, r }
    cylinder { 0, r*x, r }
  }
  cylinder { 0, -L*x, r }
  texture { Hull_T }
}
#end

#macro Sphere_Cap_Negative(S,L)
#local r = S*Module_Radius-((S-1)*Wall_Thickness);
union {
  sphere { 0, r-Wall_Thickness }
  cylinder { 0, -(L+.Wall_Thickness)*x, r-Wall_Thickness }
}
#end

#macro Raspberry(C,S)
union {
  object { C }
  #for (i,0,11)                   
    object { C translate 2*S*Vertex_Vectors[i] }
  #end
}                                                                       
#end

#macro Triangle(C,S)
union {
  #for (i,0,2)                   
    object { C translate 2*S*Vertex_Vectors[i] }
  #end
  translate -sqrt(2)
}                                                                       
#end

// Flat tetrahedron
// Conical tetrahedron
// Spherical tetrahedron
#macro Tetrahedron(C,S)
union {
  object { C }
  #for (i,0,2)                   
    object { C translate 2*S*Vertex_Vectors[i] }
  #end
  translate -1
}                                                                       
#end

#macro Hexagon(C,S)
union {
  #for (i,3,8)                   
    object { C translate 2*S*Vertex_Vectors[i] }
  #end
}                                                                       
#end

#macro Square(C,S)
union {                             
  object { C translate 2*S*< 1, 0, 0> }
  object { C translate 2*S*<-1, 0, 0> }
  object { C translate 2*S*< 0, 0, 1> }
  object { C translate 2*S*< 0, 0,-1> }
}                                                                       
#end

// Flat cube
// Flat octahedron
// Conical octahedron
// Spherical octahedron
#macro Octahedron(C,S)
union {
  object { C translate 2*S*< 1, 0, 0> }
  object { C translate 2*S*<-1, 0, 0> }                             
  object { C translate 2*S*< 0, 1, 0> }
  object { C translate 2*S*< 0,-1, 0> }
  object { C translate 2*S*< 0, 0, 1> }
  object { C translate 2*S*< 0, 0,-1> }
}                                                                       
#end

#macro Cross(C,S)
union {
  object { C }                             
  object { C translate 2*S*< 1, 0, 1> }
  object { C translate 2*S*<-1, 0,-1> }
  object { C translate 2*S*< 1, 0,-1> }
  object { C translate 2*S*<-1, 0, 1> }
}                                                                       
#end