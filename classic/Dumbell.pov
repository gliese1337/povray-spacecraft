#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."

  /*global_settings {
  ambient_light White*2
  }
  background{Grey}*/

#declare enghue=Grey/2;
#declare strut=Silver;
#declare crewcolor=Gold*1.25;

camera {
   orthographic
   //location <60,10,0>
   location <-15,0,-165>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <-15,0,0>		// simple command for camera direction
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
   <200,  800,  -900>	// location vector
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
	<-30,20,0>
	color rgb <.5, .5, .5>
	spotlight
        point_at <10,0,0>
}
    

#declare rad=
union{
torus{3,.1
      rotate 90*z
      rotate 40*y
      translate <0,3,0>
      clipped_by{box{<-2.5,-.2,-2.5>,<2.5,.7,2.5>}}
      texture {pigment{strut}}
      finish{ambient .45}
      scale <1.4,1,1.4>
      }
torus{3,.1
      rotate 90*z
      rotate -40*y
      translate <0,3,0>
      clipped_by{box{<-2.5,-.2,-2.5>,<2.5,.7,2.5>}}
      texture {pigment{strut}}
      finish{ambient .45}
      scale <1.4,1,1.4>
      }

sphere{0,.2
	texture {pigment{strut}}
	finish{ambient .45}
	}
	
cylinder{<0,0,0>,<0,-1.5,0>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0,-.75,0>,<0,-.85,0>, 1.25
	texture {pigment{strut}}
	finish{ambient .45}
	}

cylinder{<-1.85,.7,-2.15>,<1.85,.7,-2.15>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.85,.7,2.15>,<1.85,.7,2.15>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
	
cylinder{<-1.8,.7,0>,<1.8,.7,0>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
	
cylinder{<-1.8,.7,1.6>,<1.8,.7,1.6>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.8,.7,-1.6>,<1.8,.7,-1.6>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}

cylinder{<-1.8,.7,1.05>,<1.8,.7,1.05>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.8,.7,-1.05>,<1.8,.7,-1.05>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}

cylinder{<-1.8,.7,.5>,<1.8,.7,.5>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<-1.8,.7,-.5>,<1.8,.7,-.5>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}	
	
cylinder{<-1.8,.7,-2.2>,<-1.8,.7,2.2>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<1.8,.7,-2.2>,<1.8,.7,2.2>, .1
	texture {pigment{strut}}
	finish{ambient .45}
	}
translate <2.5,0,0>
}

#declare crewsect=
union{
cone{<0,0,0>,2.5
     <.5,0,0>,4.5
     pigment {crewcolor}
     finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<.5,0,0>,<2,0,0>,5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
object {rad translate <2,5,0>}
object {rad translate <2,5,0> rotate 180*x}
object {rad translate <2,5,0> rotate 60*x}
object {rad translate <2,5,0> rotate -60*x}
object {rad translate <2,5,0> rotate 120*x}
object {rad translate <2,5,0> rotate -120*x}
cylinder{<2,0,0>,<7,0,0>,2.5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<7,0,0>,<8.5,0,0>,5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<8.5,0,0>,<9.5,0,0>,4
        pigment {Grey}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}      
sphere{<14,0,0>,6.5
        clipped_by{cylinder{<9.45,0,0>,<21,0,0>,7}}
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
disc{<9.5,0,0>,<9.4,0,0>,4.5
      pigment {crewcolor}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}

}

#declare powerplant=
union{
sphere {<5,0,0>, 6
        clipped_by{box{<0,-6,-6>,<11,6,6>}}
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        }
}

#declare satdish=
union{
 union{
  object{ Paraboloid_Y
        clipped_by {box{ <-2,-1,-2>, <2,.8,2> }}
        pigment {White}
        finish {ambient .5}
        scale <3,1.8,3> 
        }
  object{ Paraboloid_Y
        clipped_by {box{ <-2,-1,-2>, <2,.8,2> }}
        pigment {White}
        finish {ambient .5}
        scale <3,1.7,3>
        translate <0,.1,0> 
        }
   cylinder{<2.48, .8*1.8, 0>, <0, 3.251, 0>, .07
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
   cylinder{<0, 3, 0>, <0, 3.5, 0>, .1
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
   rotate -70*z
 }
cylinder{<-1,.9,-.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
}

#declare scaffold=
union{
cylinder{<0, 0, 2.5>, <5, 0, 2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, -2.5>, <5, 0, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, 0>, <5, 0, 0>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, 2.5>, <5, 0, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{<0, 0, -2.5>, <5, 0, 2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
}

#declare strutset=
union{
object {scaffold translate <0,4.3,0>
             rotate <30,0,0>}
object {scaffold translate <0,-4.3,0>
             rotate <30,0,0>}
object {scaffold translate <0,4.3,0>
             rotate <150,0,0>}
object {scaffold translate <0,-4.3,0>
             rotate <150,0,0>}
object {scaffold translate <0,4.3,0>
             rotate <270,0,0>}
object {scaffold translate <0,-4.3,0>
             rotate <270,0,0>}
}

#declare fin=
union{
box{<-5.5,10,-.05>,<-2.5,30,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1 phong 3 phong_size 10}}
box{<-1.5,10,-.05>,<1.5,30,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1 phong 3 phong_size 10}}
box{<2.5,10,-.05>,<5.5,30,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1 phong 3 phong_size 10}}

box{<-5.5,30.1,-.1>,<5.5,29.9,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-4.1,10.2,-.1>,<-3.9,8,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-.1,10.2,-.1>,<.1,0,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<3.9,10.2,-.1>,<4.1,8,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-4.1,7.9,-.1>,<4.1,8.1,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-5.5,10.1,-.1>,<5.5,9.9,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
}

#declare core=
union{
sphere{<0,0,0>,2
      clipped_by{cylinder{<0,0,2>,<0,0,-1.5>,2}}
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,0,-1.5>,<0,0,0>,1.25
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
cylinder{<0,0,-1.5>,<0,0,-4.5>,1
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-1,-1,0>,<1,1,2>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
object{fin}
object{fin rotate 180*z}
}


#declare bodytube=
union{
object{strutset}
object{strutset translate <5,0,0>}
object{strutset translate <10,0,0>}
object{strutset translate <15,0,0>}
object{strutset translate <20,0,0>}
object{strutset translate <25,0,0>}
object{strutset translate <30,0,0>}
object{strutset translate <35,0,0>}
object{strutset translate <40,0,0>}
object{strutset translate <45,0,0>}
}


cylinder{<-101.1,0,0>, <0,0,0>, 1.25
	texture {pigment{strut}}
	finish{ambient .45}
	}
object{crewsect rotate 180*z translate <-101,0,0>}
object{powerplant translate <82,0,0>}
object{bodytube translate <-102.5,0,0> scale <1,.75,.75>}
object{bodytube translate <-67.5,0,0> scale <1,.75,.75>}
object{core}
object{bodytube translate <-17.5,0,0> scale <1,.75,.75>}
object{bodytube translate <32.5,0,0> scale <1,.75,.75>}
