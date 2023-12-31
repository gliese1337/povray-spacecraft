#version 3.6;

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"      
#include "./cell_basics.inc"

camera {  
  orthographic
  location <2,0,0>
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at 0
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }


#declare Hull_T = texture { pigment { Grey } }
#declare Anchor_T = texture { pigment { Copper } }

//object { Intersection_Plate texture { Anchor_T } scale 10 rotate 45*y }


object { Anchor_Ring(0, Anchor_T) }