#version 3.6;

#include "colors.inc"      
#include "./cell_basics.inc"
#include "./sphere_cell.inc"
#include "./co_cell.inc"
#include "./rd_cell.inc"

camera {  
  orthographic
  location <0,0,-15>
  //location <3,3,3>
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   <0, 0, 0>
  //look_at 0
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }


#declare Hull_T = texture { pigment { Grey } }
#declare Anchor_T = texture { pigment { Copper } }                                                             
                                                                                     
object { Sphere_Cell(1,Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <-4, 4, 0> }
object { CO_Cell(1,Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <4, 4, 0> }     
object { Cone_Cell(1,Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <-4, -4, 0> }
object { RD_Cell(1,Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <3.5, -3.5, 0> }