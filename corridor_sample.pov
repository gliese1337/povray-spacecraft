#version 3.6;

#include "colors.inc"   
#include "./sphere_cell.inc"      
#include "./corridor.inc"

camera {  
  orthographic
  location <0,0,4>
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at 0
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }


#declare Hull_T = texture { pigment { Grey } }
#declare Anchor_T = texture { pigment { Copper } }                                                             
                    
object { Corridor(1,Hull_T,Anchor_T) translate Module_Radius*x }                    
object { Sphere_Cell(1,Hull_T,Anchor_T) rotate 45*y translate -Module_Radius*x }