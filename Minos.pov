#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."
#include "engines.inc"

  /*global_settings {
  //ambient_light White*5
  }*/
  

#declare bigness = 7.5;
#declare enghue=Grey;
#declare strut=Silver;
#declare crewcolor=Silver;

camera {
   //orthographic
   //location <60,10,0>
   location <80, 20, -42>
   //location <20, 20, 0>	// Camera location
   //location <-50,0,0>
   look_at <44,0,0>		// simple command for camera direction
   //location <30,-15,0>
   //location <-25, 10, -38>
   //look_at <10,0,-7>
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
   color rgb <.4, .4, .4>	// color of light

}
/*light_source { 
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
}*/
    
#declare ship=
union{

#declare tankset=
union {
sphere {<0,0,5>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<0,0,-5>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
}


#declare SqarTor=
union {
disc{
	<0, 0, 0>, <1, 0, 0>, bigness, (bigness*.285)
	texture {pigment{enghue}
	finish {ambient .45}}}

disc{
	<4, 0, 0>, <5, 0, 0>, bigness, (bigness*.285)
	texture {pigment{enghue}
	finish {ambient .45}}}
	

cylinder{
	<0, 0, 0>, <4, 0, 0>, bigness
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}

cylinder{
	<0, 0, 0>, <4, 0, 0>, (bigness*.285)
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}
}
/*difference{
cylinder{
	<0, 0, 0>, <4, 0, 0>, bigness
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}

cylinder{
	<0, 0, 0>, <4, 0, 0>, (bigness*.285)
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}
}*/

#declare body=
union{
cylinder{<0, 0, 2.5>, <5, 0, 2.5>, .08}
cylinder{<0, 0, -2.5>, <5, 0, -2.5>, .08}
cylinder{<0, 0, 0>, <5, 0, 0>, .08}
cylinder{<0, 0, 2.5>, <5, 0, -2.5>, .08}
cylinder{<0, 0, -2.5>, <5, 0, 2.5>, .08}
texture {pigment{strut}}
finish{ambient .45}
}

#declare bodyset=
union{
object {body translate 4.3*y
             rotate 30*x}
object {body translate 4.3*y
             rotate 330*x}

object {body translate 4.3*y
             rotate 150*x}
object {body translate 4.3*y
             rotate 210*x}

object {body translate 4.3*y
             rotate 270*x}
object {body translate 4.3*y
             rotate 90*x}
}

#declare tankhex=
union {
object {tankset}
object {tankset rotate <60,0,0>}
object {tankset rotate <120,0,0>}
}

#declare tiebar=
cylinder{
	<0, 0, -7.5>, <18, 0, -7.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
}


#declare planetie=
union{
cylinder{
	<0, 6.8, 2.5>, <0, 6.8, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
cylinder{
	<0, -6.8, 2.5>, <0, -6.8, -2.5>, .08
	texture {pigment{strut}}
	finish{ambient .45}
	}
}

#declare tieset=
union{
object{planetie}
object{planetie rotate <120,0,0>}
object{planetie rotate <240,0,0>}
}

#declare ionsection=
union{
box{
	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{
	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
	
box{
	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	rotate <120,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{
	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	rotate <120,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
	
box{
	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	rotate <240,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{
	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	rotate <240,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
}

#declare iontube=
union{
  object{ionsection translate -5*x}
  object{ionsection}
  object{ionsection translate 5*x}

  disc{-5*x,1*x, 2.9, 2.7
    texture {pigment{enghue}
    finish {ambient .45}}
    }
  cylinder{-5*x, 4*x, 2.9
    open
    texture { 
      pigment{enghue}
      finish {ambient .45}
      }
    }

  cylinder{-5*x, 4*x, 2.7
    open
    texture { 
      pigment{enghue}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
      }
    }
  cylinder{<-5.5, 0, -3>, <-4, 0, -3>, .1
    texture { 
      pigment{ Red }
      finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
      }
    }
  cylinder{<-5.5, 0, 3>, <-4, 0, 3>, .1
    texture { 
      pigment{ Red }
      finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
      }
    }
}

//#declare exhaust=
/*union {
 lathe {
    bezier_spline
    4, <0,12>, <1,2.25>, <2,1.125>, <3,.36>
    texture { 
      pigment {rgbft <.1, .15, .2, 0.5, 0>}
    }
    finish {
      diffuse 1
      ambient rgb <0, 0.5, 0.7>
    }
    hollow
    interior {
        media {emission 3} 
    } 
    rotate <0,0,90>
  }
  
  lathe {
    bezier_spline
    4, <0,9>, <1,2.25>, <2,1.125>, <3,.36>
    texture { 
      pigment {rgbft <.2, .3, .32, .9, .7>}
    }
    finish {
      diffuse .45
    }
    hollow
    rotate <0,0,90>
    scale <.5,.3,.3>
    //translate <-5,0,0>
  }
 
  cone {
    <0, 0, 0>, 3    // Center and radius of one end
    <-15, 0, 0>, 4.0    // Center and radius of other end
    open              // Removes end caps
    texture { 
      pigment {
        gradient x
        color_map{
          [0.0 color rgbft <0, 0, 0, 0, 1>]
          [1.0 color rgbft <.4, .6, .64, 1, .5>]
        }
        scale 15
      }
    }
    finish {
      diffuse 1
    }
    
  }
  
  light_source { 
  <1,0,0> 
  color White*65 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at <-12,0,0>
  radius 45
  falloff 5
  tightness 2
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
  }
  translate -5*x
}*/

object{exhaust2(12) translate -4.5*x}

#declare engine=
union{
object{tankhex}
object {SqarTor translate <2.5,0,0>}
object{tankhex translate <9,0,0>}
object {SqarTor translate <11.5,0,0>}
object{tankhex translate <18,0,0>}

object{tiebar}
object{tiebar rotate <60,0,0>}
object{tiebar rotate <120,0,0>}
object{tiebar rotate <180,0,0>}
object{tiebar rotate <240,0,0>}
object{tiebar rotate <300,0,0>}

object{tieset}
object{tieset translate <9,0,0>}
object{tieset translate <18,0,0>}
}

#declare bodytube=
union{
object{bodyset}
object{bodyset translate <5,0,0>}
object{bodyset translate <10,0,0>}
object{bodyset translate <15,0,0>}
object{bodyset translate <20,0,0>}
object{bodyset translate <25,0,0>}
object{bodyset translate <30,0,0>}
object{bodyset translate <35,0,0>}
object{bodyset translate <40,0,0>}
object{bodyset translate <45,0,0>}
object{bodyset translate <50,0,0>}
}


#declare crewsect=
union{
sphere {<0,0,0>, 3
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<6,0,-10>, 3
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<6,0,10>, 3
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<15,0,0>, 3
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<2.8, 0, 0>, <14, 0, 0>, 1.1
	texture {pigment{Grey}
	finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
	}
cylinder{<6, 0, -8.5>, <6, 0, 8.5>, 1.1
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
	}
box{<3.6,-1.2,2>, <8.1,1.3,-2>
   texture {pigment{Grey}
   finish {ambient .4 diffuse 2 specular 0.1 roughness 0.1}}
   }

cone{<17.8, 0, 0>, 1.1    // Center and radius of one end
    <18.5, 0, 0>, 2.5    // Center and radius of other end
    texture {pigment {Grey}
    finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
    }
cylinder{<18.5, 0, 0>, <24, 0, 0>, 2.5
	texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
cone{<24, 0, 0>, 2.5    // Center and radius of one end
    <24.7, 0, 0>, 1.1    // Center and radius of other end
    texture {pigment {Grey}
    finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
    }
}

#declare bridge=
sphere {<0,0,0>, 6
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        scale <1,(5.8/6),1>
        }

#declare dishstruts=
union{
cylinder{<-1,0,-1>,<-1,2,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,0,1>,<-1,2,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<1,0,-1>,<1,2,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<1,0,1>,<1,2,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}


cylinder{<-1,0,-1>,<1,2,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<1,0,-1>,<-1,2,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<-1,0,1>,<1,2,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<1,0,1>,<-1,2,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<-1,0,1>,<-1,2,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,0,-1>,<-1,2,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<1,0,1>,<1,2,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<1,0,-1>,<1,2,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

}

#declare dishbase=
union{
 box{<5.5,0,5.2>,<-5.5,3.4,-5.2>
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
 
 polygon {5, <5.5, 3.4, 5.4>, <-5.5, 3.4, 5.4>, <-3.9, 4.7, 3.2>, <3.9, 4.7, 3.2>, <5.5, 3.4, 5.4> //Left Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}

 polygon {5, <5.5, 3.4, -5.4>, <-5.5, 3.4, -5.4>, <-3.9, 4.7, -3.2>, <3.9, 4.7, -3.2>, <5.5, 3.4, -5.4> //Right Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
 
 polygon {5, <5.5, 3.4, 5.4>, <3.9, 4.7, 3.2>, <3.9, 4.7, -3.2>, <5.5, 3.4, -5.4>, <5.5, 3.4, 5.4> //Front Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
 
 polygon {5, <-5.5, 3.4, 5.4>, <-3.9, 4.7, 3.2>, <-3.9, 4.7, -3.2>, <-5.5, 3.4, -5.4>, <-5.5, 3.4, 5.4> //Back Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
    
 box{<3.9,4.7,3.2>,<-3.9,6,-3.2>
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}   
       
       
 polygon {5, <3.9,6,3.2>, <-3.9,6,3.2>, <-1.25, 12.5, 1.25>, <1.25, 12.5, 1.25>, <3.9,6,3.2> //Left Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}

 polygon {5, <3.9,6,-3.2>, <-3.9,6,-3.2>, <-1.25, 12.5, -1.25>, <1.25, 12.5, -1.25>, <3.9,6,-3.2> //Left Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
 
 polygon {5, <3.9,6,3.2>, <3.9, 6, -3.2>, <1.25, 12.5, -1.25>, <1.25, 12.5, 1.25>, <3.9,6,3.2> //Front Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
 
 polygon {5, <-3.9,6,3.2>, <-3.9, 6, -3.2>, <-1.25, 12.5, -1.25>, <-1.25, 12.5, 1.25>, <-3.9,6,3.2> //Back Side
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
     
 translate <0,-13.2,0>     
}

#declare dishtower=
union{
object {dishstruts translate <0,-1,0>}
//object {dishbase}
object {dishstruts}
object {dishstruts translate <0,2,0>}
object {dishstruts translate <0,4,0>}
object {dishstruts translate <0,6,0>}


/*cylinder{<-1,8,-1>,<1.8,12,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,8,1>,<1.8,12,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<-1,8,-1>,<1.8,12,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,8,1>,<1.8,12,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}*/
        
cylinder{<1,4,-1>,<2.4,4,-1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<1,4,1>,<2.4,4,1>,.1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
 
 cylinder{<0,0,-1.1>,<0,0,1.1>,1.1
        texture {pigment{Grey}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
 disc{<0,0,-1.12>,<0,0,1>,.5,.35
     texture {pigment{LightGrey}
     finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
     }
 disc{<0,0,1.12>,<0,0,-1>,.5,.35
     texture {pigment{LightGrey}
     finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
     }
     
 lathe{
    linear_spline
    5, <0,0>, <1.6,0>, <2.2,.4>, <1.6,.8>, <0,.8>
    pigment {Grey}
    finish {ambient .2 diffuse 2 specular 0.1 roughness 1}
    translate <0,-1.8,0>}
    
    #declare table=
    union{
    box{<-1.2,0,-1.2>,<1.2,1.6,-1.19>
    pigment {Grey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
    box{<-1,.2,-1.21>,<1,1,-1.19>
    pigment {LightGrey}
    finish {ambient .15 diffuse 2 specular 0.1 roughness 1}}
    translate <0,-3,0>
    }

 object{table}
 object{table rotate <0,90,0>}
 object{table rotate <0,180,0>}
 object{table rotate <0,-90,0>}
 
}

#declare topsatdish=
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
   rotate <0,0,-70>
 }
cylinder{<-1,.9,-.45>,<.4,2.94,-.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.45>,<.4,2.94,.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<-1,.9,-.45>,<.4,2.94,.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.45>,<.4,2.94,-.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
}

#declare lowsatdish=
union{
  union{
    object{ Paraboloid_Y
          clipped_by {box{ <-2,-1,-2>, <2,.8,2> }}
          pigment {White}
          finish {ambient .5}
          scale <3,1.6,3>
          }
    object{ Paraboloid_Y
          clipped_by {box{ <-2,-1,-2>, <2,.8,2> }}
          pigment {White}
          finish {ambient .5}
          scale <3,1.5,3>
          translate <0,.1,0>
          }
    cylinder{<2.48, .8*1.6, 0>, <0, 3.241, 0>, .07
	  texture {pigment{Grey}
	  finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
          }      
    cylinder{<0, 2.9, 0>, <0, 3.4, 0>, .1
	  texture {pigment{Grey}
	  finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
          }
    rotate <0,0,-70>
    translate .05*x
  } 
cylinder{<-1,.9,-.45>,<.32,2.91,-.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.45>,<.32,2.91,.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<-1,.9,-.45>,<.32,2.91,.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.45>,<.32,2.91,-.45>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}} 
}

#declare dishset=
union{
object{topsatdish  translate <0,12.65,0>}
object{dishtower scale <.45,.45,.45> translate <-.5,10,0>}
object{dishbase scale <.45,.4,.45> translate <-.5,8.9,0>}
object{lowsatdish  translate <0,12.65,0> rotate 180*x}
object{dishtower scale <.45,.45,.45> translate <-.5,10,0> rotate 180*x}
object{dishbase scale <.45,.4,.45> translate <-.5,8.9,0> rotate 180*x}
}


object{engine scale <1.3,1.3,1.3>}
object{bodytube translate <17,0,0>}
object{crewsect translate <39.3,0,0>}
object{bridge translate <70,0,0>}
object{dishset translate <45,0,0>}

object{iontube}

}

object { sphere { <0, 0, 0>,10000 }
       hollow
       texture {
               pigment{image_map{gif "./starfield.gif"}}
               //scale <80000, 50000, 30000>
               finish { crand .05 ambient .7 }
       }
}

object{ship}

