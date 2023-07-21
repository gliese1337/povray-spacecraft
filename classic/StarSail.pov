#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC"

  global_settings {
  ambient_light White*2
  }
  //background{White}

camera {
   //orthographic
   location <-400,30,-90>
   //location <-200,0,-700>	// Camera location
   //location <-50,0,0>
   look_at <200,0,0>		// simple command for camera direction
}
    
light_source {			// point light source
   <500,  800,  -1000>	// location vector
   color rgb White*2	// color of light

}
light_source { 
  <-100,0,0> 
  color White //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at 0
  radius 200
  falloff 1
  tightness .5
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
}
light_source{
        //<10, 0, -100>
	//<-150, 150, -150>
	<-50,0,0>
	color rgb <.5, .7, 1>
	spotlight
        point_at 0
}

#declare petal = union{
union{
torus{100,.5
        rotate 90*x
        translate 100*y
        scale 2*y
	clipped_by{box{<-100,0,-.5>,<100,200,.5>}}
}
torus{100,.5
        rotate 90*x
        translate -100*y
        scale 2*y
	clipped_by{box{<-100,0,-.5>,<100,-200,.5>}}
}
cylinder{<-100,200,0>,<100,200,0>,.5}
translate -(400/(2/0.61803398875 + 1))/(2*tan(pi/5))*z
rotate 18*x
}
cylinder{0,200*y,.25}
cylinder{0,<100,200,0>,.25}
cylinder{0,<-100,200,0>,.25}
texture {pigment{Grey}}
finish{phong 1}
}

//object{petal}

#declare i = 0;
#while(i<5)
        object{petal rotate i*72*x}
        #declare i = i + 1;
#end

difference{
sphere{0,20}
cylinder{20*x,-20*x,2}
texture {pigment{Grey}}
finish{phong 1}
}

#declare i = 0;
#while(i<5)
        cylinder{0,<500,450,0>,.25
                rotate (72*i+36)*x
                texture {pigment{Silver}}
                finish{ambient .6 phong 1}
        }
        #declare i = i + 1;
#end

torus{450,.5
        rotate 90*z
        translate 500*x
        texture {pigment{Grey}}
	finish{phong 1}
}
