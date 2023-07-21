#version 3.6;

#include "colors.inc"      
#include "./cell_basics.inc"
#include "./sphere_cell.inc"

camera {  
  orthographic
  location <2.75*Module_Radius,0,-38>
  angle 0
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   <2.75*Module_Radius, 0, 0>
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { <140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }


#declare Hull_T = texture { pigment { Grey } }
#declare Anchor_T = texture { pigment { Copper } }                                                             
                    
object { Sphere_Cell(1,Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <-4.5*Module_Radius, 0, 0> } 
object { Raspberry(Sphere_Cell(1,Hull_T,Anchor_T),1) rotate 15*x rotate 15*y }
object { Sphere_Cell(3,Hull_T,Anchor_T) rotate 15*x rotate 15*y translate <7*Module_Radius, 0, 0>  }