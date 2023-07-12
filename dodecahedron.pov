#version 3.6;
global_settings{ assumed_gamma 1.3 max_trace_level 5}

#include "colors.inc"
#include "functions.inc"

camera{  
        //orthographic
        //location  <15,15,15>
        location <20,-20,20>
        angle 0 // direction 2*z 
        right     x*image_width/image_height // keep propotions with any aspect ratio
        look_at   <0,0,0>
      }

light_source {<-140,200, 300> rgb <1.0, 1.0, 0.95>*1.5}
light_source {< 140,200,-300> rgb <0.9, 0.9, 1.00>*0.9 shadowless}

#declare phi = (1+sqrt(5))/2;
      
#declare p1 = 5*<0, 1, phi>;
#declare p2 = 5*<1, phi, 0>;
#declare p3 = 5*<phi, 0, 1>;
                         
#declare p4 = 5*<0, -1, phi>;
#declare p5 = 5*<-1, phi, 0>;
#declare p6 = 5*<phi, 0, -1>;
                        
#declare p7 = 5*<0, 1, -phi>;
#declare p8 = 5*<1, -phi, 0>;
#declare p9 = 5*<-phi, 0, 1>;
                          
#declare p10 = 5*<0, -1, -phi>;
#declare p11 = 5*<-1, -phi, 0>;
#declare p12 = 5*<-phi, 0, -1>;

sphere { p1, 1 texture { pigment {color Grey} } }
sphere { p2, 1 texture { pigment {color Grey} } }
sphere { p3, 1 texture { pigment {color Grey} } }
                         
sphere { p4, 1 texture { pigment {color Blue} } }
sphere { p5, 1 texture { pigment {color Blue} } }
sphere { p6, 1 texture { pigment {color Blue} } }
                        
sphere { p7, 1 texture { pigment {color Red} } }
sphere { p8, 1 texture { pigment {color Red} } }
sphere { p9, 1 texture { pigment {color Red} } }
                          
sphere { p10, 1 texture { pigment {color Green} } }
sphere { p11, 1 texture { pigment {color Green} } }
sphere { p12, 1 texture { pigment {color Green} } }
                                                         
                                                            
cylinder { p1, p2, 0.5 texture { pigment {color Grey} } }
cylinder { p1, p3, 0.5 texture { pigment {color Grey} } }
cylinder { p3, p2, 0.5 texture { pigment {color Grey} } }
                                                           
cylinder { p1, p4, 0.25 texture { pigment {color Blue} } }
cylinder { p3, p4, 0.25 texture { pigment {color Blue} } }
cylinder { p1, p5, 0.25 texture { pigment {color Blue} } }
cylinder { p2, p5, 0.25 texture { pigment {color Blue} } }
cylinder { p2, p6, 0.25 texture { pigment {color Blue} } }
cylinder { p3, p6, 0.25 texture { pigment {color Blue} } }

cylinder { p1, p9, 0.25 texture { pigment {color Red} } }
cylinder { p2, p7, 0.25 texture { pigment {color Red} } }
cylinder { p3, p8, 0.25 texture { pigment {color Red} } }
                                                                      
cylinder { p4, p8, 0.25 texture { pigment {color rgb <.71, 0, .71>} } } 
cylinder { p8, p6, 0.25 texture { pigment {color rgb <.71, 0, .71>} } }
cylinder { p6, p7, 0.25 texture { pigment {color rgb <.71, 0, .71>} } }
cylinder { p7, p5, 0.25 texture { pigment {color rgb <.71, 0, .71>} } }
cylinder { p5, p9, 0.25 texture { pigment {color rgb <.71, 0, .71>} } } 
cylinder { p9, p4, 0.25 texture { pigment {color rgb <.71, 0, .71>} } }
                                                                                   
cylinder { p10, p6, 0.25 texture { pigment {color Blue} } }                         
cylinder { p11, p4, 0.25 texture { pigment {color Blue} } }                         
cylinder { p12, p5, 0.25 texture { pigment {color Blue} } }
                                                          
cylinder { p10, p8, 0.25 texture { pigment {color Red} } }
cylinder { p11, p8, 0.25 texture { pigment {color Red} } } 
cylinder { p10, p7, 0.25 texture { pigment {color Red} } }
cylinder { p12, p7, 0.25 texture { pigment {color Red} } }
cylinder { p11, p9, 0.25 texture { pigment {color Red} } }
cylinder { p12, p9, 0.25 texture { pigment {color Red} } }


cylinder { p10, p11, 0.5 texture { pigment {color Green} } }
cylinder { p10, p12, 0.5 texture { pigment {color Green} } }
cylinder { p11, p12, 0.5 texture { pigment {color Green} } }

                                                        
cylinder {p1, p8, 0.5 texture { pigment {color Yellow} } } 
cylinder {p2, p9, 0.5 texture { pigment {color Yellow} } }
cylinder {p3, p7, 0.5 texture { pigment {color Yellow} } }

cylinder {p10, p5, 0.5 texture { pigment {color Yellow} } } 
cylinder {p11, p6, 0.5 texture { pigment {color Yellow} } }
cylinder {p12, p4, 0.5 texture { pigment {color Yellow} } }

//#declare norm = pow(phi,2) - phi + 1;
//cylinder {0, 10*<norm,norm,norm>, 0.5 texture { pigment {color Grey} } }