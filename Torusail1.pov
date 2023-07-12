#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC"

#declare lnum = 10;

  global_settings {
  ambient_light White*2
  }
  //background{White}

camera {
   //orthographic
   //location <60,10,0>
   //location <-100,30,-90>
   location <-200,0,-850>	// Camera location
   //location <-50,0,0>
   look_at <100,0,0>		// simple command for camera direction
}
    
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
	<-30,0,0>
	color rgb <.5, .5, .5>
	spotlight
        point_at <10,0,0>
}

#declare petal = union{
torus{200,.5
        rotate 90*x
        translate 250*y
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
cylinder{0,-45*z,.5
        rotate -(180/lnum)*x
        translate 50*y
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
sphere{450*y,2
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}

cylinder{<0,50,-.7>,<500,20,-.7>,.25
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
cylinder{<0,50,0>,<500,20,0>,.25
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
cylinder{<0,50,.7>,<500,20,.7>,.25
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
}

#declare i = 0;
#while(i<lnum)
        object{petal rotate 360*i/lnum*x}
        #declare i = i + 1;
#end

/*#declare vanes = union{
box{<-200,250,-.1>,<200,450,.1>
}
box{<-200,250,-.1>,<200,450,.1>
        rotate 360/7*x
}
box{<-200,250,-.1>,<200,450,.1>
        rotate 2*360/7*x
}
box{<-200,250,-.1>,<200,450,.1>
        rotate 3*360/7*x
}
box{<-200,250,-.1>,<200,450,.1>
        rotate 4*360/7*x
}
box{<-200,250,-.1>,<200,450,.1>
        rotate 5*360/7*x
}
box{<-200,250,-.1>,<200,450,.1>
        rotate 6*360/7*x
}
}

difference{
object{vanes texture{pigment{White}}}
torus{250,200 rotate 90*z}
}*/

torus{450,.25
        rotate 90*z
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
torus{450,.25
        rotate 90*z
        translate -.7*x
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
torus{450,.25
        rotate 90*z
        translate .7*x
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}

difference{
cylinder{300*x,700*x,20
        texture {pigment{Silver/2+Gold/2}}
	finish{ambient .45 phong 1}
}
cylinder{300*x,700*x,3
        texture {pigment{Grey}}
	finish{ambient .45 phong 1}
}
}