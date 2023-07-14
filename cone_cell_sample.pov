#version 3.6;

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"      
#include "./cell_basics.inc"
#include "./co_cell.inc"

camera {  
  orthographic
  location <2,0,-15>
  //location <4,4,4>
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   <2, 0, 0>
  //look_at 0
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }

#declare Hull_T = texture { pigment { Silver } }
#declare Anchor_T = texture { pigment { Copper } }                                                        

//object { Cone_Cell }
//object { Cone_Cell2 }                     
object { Cone_Cell(Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <-6, 0, 0> } 
object { Raspberry(Cone_Cell(Hull_T,Anchor_T),1) rotate 15*x rotate 15*y }
object { Cone_Cell2(Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <8, 0, 0>  }