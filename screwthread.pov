                                                      #include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."

  background{Black}
  global_settings{ambient_light White*2}
  
#declare enghue=Grey/2;
#declare strut=Silver;
#declare crewcolor=Silver;

camera {
   orthographic
   //location <60,10,0>
   location <0, 0, -6>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <0,0,0>		// simple command for camera direction
}
    
/*light_source {			// point light source
   <5,0,0>
   color rgb <.1, .2, .22>	// color of light
}
light_source {			// point light source
   <0,0,0>
   color rgb <.2, .3, .32>*20	// color of light
}*/
light_source {			// point light source
   <500,  800,  -1000>	// location vector
   color rgb <.5, .5, .5>	// color of light

}
light_source { 
  <10,0,0> 
  color White/3 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at <12,0,0>
  radius 50
  falloff 5
  tightness .5
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
}
light_source{
        //<10, 0, -100>
	//<-150, 150, -150>
	<-30,-10,0>
	color rgb <.5, .5, .5>
	spotlight
        point_at <0,0,0>
}


#declare sr=1;
#declare tr=.1;
#declare res=100;
//for low res, rotate 5.4; for high res, rotate 10

#declare screwthread=
torus{sr,tr
                clipped_by{Wedge(360/res)}
                rotate -90*y
                rotate 10*z
        }

#declare screwgroove=
difference{
        cylinder{-2*tr*y,2*tr*y,sr}
        torus{sr,tr}
        clipped_by{Wedge(360/res)}
        rotate -90*y
        rotate 10*z
}


#declare screw=
union{
#declare i=0;
#while(i<100)
        object{screwthread rotate i*360/res*y translate i*4*tr/res*y}
        object{screwgroove translate .2*y rotate i*360/res*y translate i*4*tr/res*y}
        #declare i=i+1;
#end  
}

object{screw
                pigment{Grey}
                finish{ambient .5}}
