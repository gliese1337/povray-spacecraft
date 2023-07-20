#version 3.6;

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"      
#include "./cell_basics.inc"
#include "./sphere_cell.inc"

camera {  
  orthographic
  location 9*vnormalize(<1,2,3>)
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   0
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }

#declare Hull_T = texture { pigment { Copper } }
#declare Anchor_T = texture { pigment { Silver } }

Raspberry(Sphere_Cell(Hull_T, Anchor_T),1)