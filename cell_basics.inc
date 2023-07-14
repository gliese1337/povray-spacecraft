#declare Plate_Block = intersection {
  cylinder { -0.005*y, 0.005*y, 0.025 }
  cylinder { <0, -1, 0>, <0, 1, 0>, 0.008 scale 1.5*x translate 0.02*x}
}

#declare Intersection_Plate = union {
  cylinder { -0.0015*y, 0.0015*y, 0.025 }
  cylinder { -0.005*y, 0.005*y, 0.004 }
  #for (i, 0, 3)
    object { Plate_Block rotate (45+i*90)*y }
    sphere { .025*x, 0.005 rotate i*90*y } 
  #end
}

#declare Cross_Plate = union {                                                            
  object { Intersection_Plate rotate 90*x translate 0.6*z }
  cylinder { <0, 0.5, 0.6>, <0, 0.025, 0.6>, .005 }
  cylinder { <0, -0.05, 0.6>, <0, -0.025, 0.6>, .005 }
}

#declare Connector_Angle = 54.7356103;
#declare Connector_Height = 0.083;

#declare Edge_Angles = array[4] { Connector_Angle, 180 - Connector_Angle, -Connector_Angle,  Connector_Angle - 180 }

#declare Anchor_Ring = union {
  difference {
    torus { 0.6 0.005 }
    #for (i,0,3)                               
     object { Wedge(5) rotate (Edge_Angles[i]-2.5)*y }
    #end
         
    object { Wedge(5) rotate -2.5*y rotate 0*y }
    object { Wedge(5) rotate -2.5*y rotate 180*y } 
  }
  
  #for (i,0,3)                                                                      
    object { Intersection_Plate rotate -.4*y translate 0.5998*z rotate Edge_Angles[i]*y}
    cylinder { 0.49*z, 0.575*z, 0.005 rotate Edge_Angles[i]*y }
  #end
                                                          
  object { Cross_Plate }                                  
  object { Cross_Plate rotate 180*y }
}

#macro Connection_Ring(S,Hull_T,Anchor_T)
union {
  cylinder { 0, S*sqrt(2)*x, 0.5 texture { Hull_T } }                                                       
  object { Anchor_Ring rotate 90*z translate (S*sqrt(2)-0.05)*x texture { Anchor_T } }  
}
#end

#macro Place_At_Vertices(S,M)
union {
  #for (i, 0, 3)
    #declare theta = (45+i*90);
    object { M rotate theta*y } 
    object { M rotate 90*x rotate theta*z }
  #end
            
  #for (i, 0, 1)                                
    #declare theta = (45+i*180);
    object { M rotate 90*z rotate theta*x }
    object { M rotate 90*x rotate 270*y rotate theta*x }
  #end
}
#end

#macro Connection_Set(S,Hull_T,Anchor_T)
Place_At_Vertices(S, Connection_Ring(S,Hull_T,Anchor_T))
#end

#declare Vertex_Vectors = array[12] { <1,1,0>, <1,-1,0>, <-1,1,0>, <-1,-1,0>,
                                      <1,0,1>, <1,0,-1>, <-1,0,1>, <-1,0,-1>,
                                      <0,1,1>, <0,1,-1>, <0,-1,1>, <0,-1,-1> }

#macro Cell_Negative(S)
union {
  #for (i,0,11)
    cylinder { 0, Vertex_Vectors[i]*2*S, 0.45 }
  #end
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