#version 3.6;

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"      
#include "./cell_basics.inc"
#include "./sphere_cell.inc"
#include "./co_cell.inc"
#include "./rd_Cell.inc"

camera {  
  orthographic
  location 8*z
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   0
}

light_source { <-140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }

                      
object { CO_Cell rotate 15*x rotate 15*y translate -3.5*x }
object { Sphere_Cell rotate 15*x rotate 15*y }
object { RD_Cell rotate 15*x rotate 15*y translate 3.5*x }