#version 3.6;
global_settings{ assumed_gamma 1.3 max_trace_level 5}

#include "colors.inc"
#include "functions.inc"
#include "transforms.inc"
#include "glass.inc"
#include "shapes.inc"
#include "./cell_basics.inc"

camera {  
  //orthographic
  location <-2,2,1>*3
  angle 0 // direction 2*z 
  right     x*image_width/image_height // keep proportions with any aspect ratio
  look_at   0
}

light_source { <-140,200, 300> rgb <1.0, 1.0, 0.95>*1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless }


#declare Interconnectors = intersection {
  torus { sqrt(2)+0.083, 0.005 }
  union {
    #for (i, 0, 5)                                     
      object { Wedge(11) rotate (9.5 + i*60)*y }
    #end
  }
}  
                      
#declare Cell = difference {
  union {
    sphere { <0,0,0>, sqrt(2) }
    object { Connection_Set }
            
    #for (i, 0, 1)                                       
     object { Interconnectors Axis_Rotate_Trans(<1,0,1>, 55.4+i*70) }  
     object { Interconnectors rotate 30*y Axis_Rotate_Trans(<1,0,-1>, 54.6+i*70) }      
    #end
  }
  sphere { <0,0,0>, sqrt(2)-0.05 }
 object { Cell_Negative }
  texture { pigment { color Grey } }       
}           


//object { Cell }                                   

#macro SuperCell(C) union {
  object { C }
  #for (i,0,11)                   
   object { C translate 2*Vertex_Vectors[i] }
  #end
  /*difference {
    sphere { 0, 3*sqrt(2) }
    sphere { 0, 3*sqrt(2)-0.05 }
    #for (i,0,11)
      cylinder { 0, 6*Vertex_Vectors[i], 0.45 }
    #end
    material {
      texture {
        pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
        finish { F_Glass4 }
      }
      interior { I_Glass caustics 1 }
    }
  }*/
}                                                                       
#end

object { SuperCell(Cell) }
/*#for (i,0,11)                      
  object { SuperCell translate 6*Vertex_Vectors[i] }
#end*/
