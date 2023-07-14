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
   //orthographic
   //location <60,10,0>
   location <0, 12, -12>
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
  <10,-10,0> 
  color White/3 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at <0,0,0>
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

#declare flywheel=
union{
        cylinder{.5*y,-.5*y,4}
        cone{-.5*y,4,-1.1*y,1.5}      
        
        cone{.5*y,3.85,1*y,1.5}
        cylinder{1*y,1.2*y,1.5}
        cone{1.2*y,1.3,2.3*y,.35}
        cylinder{2.3*y,2.5*y,.3}
        #for (i,1,5)
                prism{-.01,.01,5
                        <.35,0>,<.35,2.3>,<1.5,1.2>,<4,.5>,<.35,0>
                        rotate -90*x
                        rotate 72*i*y}
        #end
        #for (i,1,15)
                cylinder{<1.4,1.1,0>,<1.4,1.21,0>.04
                        pigment{Black}
                        rotate (12+24*i)*y}
                #declare i = i+1;
        #end
        #for (i,1,30)
                cylinder{<3.91,.4,0>,<3.91,.51,0>.04
                        pigment{Black}
                        rotate (6+12*i)*y}
        #end
}

object{flywheel
                pigment {Grey/2+Silver/2}
                finish {ambient 0 diffuse 2 specular 0.1 roughness 0.1}}