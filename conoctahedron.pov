#version 3.6;

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "shapes.inc"

camera {  
  orthographic
  location <2,0,2>
  //location <2,2,2>
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   <0, 0, 0>
  //look_at 0
}

light_source { <140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }

#declare vertex_angle = 70.53;
#declare wedge_angle = 60;
#macro Vertex(S)
difference {
  intersection {
    object { Wedge(wedge_angle) rotate -wedge_angle/2*y }
    object { Wedge(wedge_angle) rotate -wedge_angle/2*y rotate vertex_angle*z }
    cone { S*z, 0, 0, 1.75*S }
  }
  cone { (S-0.05)*z, 0, -0.05*z, 1.75*S } 
  rotate (90-vertex_angle/2)*z
}
#end

#declare Vertex_Vectors = array[12] { <1,1,0>, <1,0,1>, <0,1,1>, // triangle
                                      <1,-1,0>, <-1,1,0>,
                                      <-1,0,1>, <1,0,-1>, // hexagon
                                      <0,1,-1>, <0,-1,1>,
                                      <-1,-1,0>, <-1,0,-1>, <0,-1,-1> } // second triangle
#declare Vertex_Orientations = array[12] { 90, 0, 45, 90, 90, 0, 0, 135, 135, 90, 0, 45 }

union {                                                 
  object { Vertex(1) rotate 135*z Reorient_Trans(z, Vertex_Vectors[0]) }
  //object { Vertex(1) Reorient_Trans(z, Vertex_Vectors[1]) }
  object { Vertex(1) rotate 90*z Reorient_Trans(z, Vertex_Vectors[2]) }
  //object { Vertex(1) rotate 45*z Reorient_Trans(z, Vertex_Vectors[3]) }
  object { Vertex(1) rotate 45*z Reorient_Trans(z, Vertex_Vectors[4]) }
  //object { Vertex(1) Reorient_Trans(z, Vertex_Vectors[5]) }
  object { Vertex(1) Reorient_Trans(z, Vertex_Vectors[6]) }
  //object { Vertex(1) rotate 90*z Reorient_Trans(z, Vertex_Vectors[7]) }
  object { Vertex(1) rotate 90*z Reorient_Trans(z, Vertex_Vectors[8]) }
  //object { Vertex(1) rotate 135*z Reorient_Trans(z, Vertex_Vectors[9]) }
  object { Vertex(1) Reorient_Trans(z, Vertex_Vectors[10]) }
  //object { Vertex(1) rotate 90*z Reorient_Trans(z, Vertex_Vectors[11]) }
  //sphere { 0, 1 }           
  //cylinder { -5*x, 5*x, 0.5 }
  //cylinder { -5*y, 5*y, 0.5 }
  //cylinder { -5*z, 5*z, 0.5 }
  texture { pigment { Grey } }
}