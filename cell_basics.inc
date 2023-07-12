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

#declare Anchor_Ring = union {
  difference {
    torus { 0.6 0.005 }                               
    object { Wedge(5) rotate -2.5*y rotate 55*y }
    object { Wedge(5) rotate -2.5*y rotate 125*y }
    object { Wedge(5) rotate -2.5*y rotate -55*y }
    object { Wedge(5) rotate -2.5*y rotate -125*y }
         
    object { Wedge(5) rotate -2.5*y rotate 0*y }
    object { Wedge(5) rotate -2.5*y rotate 180*y } 
  }
                                                                        
  object { Intersection_Plate rotate -.4*y translate 0.5998*z rotate 55*y}
  cylinder { 0.49*z, 0.575*z, 0.005 rotate 55*y }
  object { Intersection_Plate rotate -.4*y translate 0.5998*z rotate 125*y}
  cylinder { 0.49*z, 0.575*z, 0.005 rotate 125*y }          
  object { Intersection_Plate rotate -.4*y translate 0.5998*z rotate -55*y}
  cylinder { 0.49*z, 0.575*z, 0.005 rotate -55*y }
  object { Intersection_Plate rotate -.4*y translate 0.5998*z rotate -125*y}
  cylinder { 0.49*z, 0.575*z, 0.005 rotate -125*y }
                                                          
  object { Cross_Plate }                                  
  object { Cross_Plate rotate 180*y }
}

//object { Anchor_Ring texture { pigment { color Grey } } }


#declare Connection_Ring = union {
  cylinder { 0, sqrt(2)*x, 0.5 }
  object { Anchor_Ring rotate 90*z translate (sqrt(2)-0.05)*x }
}

#declare Connection_Set = union {
  #for (i, 0, 3)
   object { Connection_Ring rotate (45+i*90)*y } 
   object { Connection_Ring rotate 90*x rotate (45+i*90)*z }
  #end
            
  #for (i, 0, 1) 
   object { Connection_Ring rotate 90*z rotate (45+i*180)*x }
   object { Connection_Ring rotate 90*x rotate 270*y rotate (45+i*180)*x }
  #end
}

#declare Cell_Negative = union {
  cylinder { <2,2,0>, <-2,-2,0>, 0.45 }
  cylinder { <2,0,2>, <-2,0,-2>, 0.45 }
  cylinder { <0,2,2>, <0,-2,-2>, 0.45 }
  cylinder { <-2,2,0>, <2,-2,0>, 0.45 }
  cylinder { <-2,0,2>, <2,0,-2>, 0.45 }
  cylinder { <0,-2,2>, <0,2,-2>, 0.45 }
}