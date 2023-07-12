#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."
#include "./Tug.inc"

  /*global_settings {
  ambient_light White*5
  }*/
  
#declare bigness = 7.5;
#declare enghue=Grey;
#declare strut=Silver;
#declare crewcolor=Silver;

camera {
   orthographic
   //location <60,10,0>
   //location <60, 10, -115>
   location <20, -20, -30>	// Camera location
   //location <-50,0,0>
   //location <150,10,-90>
   look_at <60,0,0>		// simple command for camera direction
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
	<-30,0,0>
	color rgb <.5, .5, .5>
	spotlight
        point_at <10,0,0>
}
    

declare body=
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

#declare bodyset=
union{
object {body translate <0,4.3,0>
             rotate <30,0,0>}
object {body translate <0,-4.3,0>
             rotate <30,0,0>}

object {body translate <0,4.3,0>
             rotate <150,0,0>}
object {body translate <0,-4.3,0>
             rotate <150,0,0>}

object {body translate <0,4.3,0>
             rotate <270,0,0>}
object {body translate <0,-4.3,0>
             rotate <270,0,0>}
}

#declare hytankset=
union {
sphere {<0,0,7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.4,0,7>,<-2.4,0,2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.4,0,7>,<-2.4,0,2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<2.4,0,7>,<2.4,0,2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<2.4,0,7>,<2.4,0,2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}


sphere {<0,0,-7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.4,0,-7>,<-2.4,0,-2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.4,0,-7>,<-2.4,0,-2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<2.4,0,-7>,<2.4,0,-2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<2.4,0,-7>,<2.4,0,-2>,.1
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
}

#declare antankset=
union {
sphere {<0,0,7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<0,0,7>,<20,0,7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<20,0,7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.3,0,7>,<-2.3,0,2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.3,0,7>,<-2.3,0,2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<22.3,0,7>,<22.3,0,2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<22.3,0,7>,<22.3,0,2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}        

sphere {<0,0,-7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<0,0,-7>,<20,0,-7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<20,0,-7>, 2.5
        pigment {enghue}
        finish {ambient .05 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.3,0,-7>,<-2.3,0,-2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-2.3,0,-7>,<-2.3,0,-2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<22.3,0,-7>,<22.3,0,-2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<22.3,0,-7>,<22.3,0,-2>,.2
        pigment {White}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}       
}


#declare ionsection=
union{
box{    <0, 2.85, 1.7>, <5, 2.9, -1.7>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
	
box{	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	rotate <120,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	rotate <120,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
	
box{	<0, 2.85, 1.7>, <5, 2.9, -1.7>
	rotate <240,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
box{	<0, -2.85, 1.7>, <5, -2.9, -1.7>
	rotate <240,0,0>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
	}
}

#declare iontube=
union{
object{ionsection translate <-5,0,0>}

disc{	<-5, 0, 0>, <1, 0, 0>, 2.9, 2.7
	texture {pigment{enghue}
	finish {ambient .45}}}

	

cylinder{<-5, 0, 0>, <0, 0, 0>, 2.9
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}

cylinder{<-5, 0, 0>, <0, 0, 0>, 2.7
	open
	texture { 
		pigment{enghue}
		finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}	
}
}

#declare exhaust=
union {
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
    translate <-5,0,0>
  }
 
  cone {
    <0, 0, 0>, 3    // Center and radius of one end
    <-15, 0, 0>, 4.0    // Center and radius of other end
    open              // Removes end caps
    texture { 
      pigment {rgbft <.2, .3, .32, .5, .25>*2}
    }
    finish {
      diffuse 1
    } 
  }
}

#declare engine=
union{
object {antankset}
object {antankset rotate <60,0,0>}
object {antankset rotate <120,0,0>}
object {hytankset translate <26,0,0>}
object {hytankset translate <26,0,0> rotate <60,0,0>}
object {hytankset translate <26,0,0> rotate <120,0,0>}

object{iontube}
object{iontube translate <5,0,0>}
object{iontube translate <10,0,0>}
object{iontube translate <15,0,0>}
object{iontube translate <20,0,0>}
object{iontube translate <25,0,0>}
object{iontube translate <30,0,0>}
sphere{<30,0,0>,2.9
        texture {pigment{enghue}
	finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
	}
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


#declare shield=  
union {
disc{<0, 0, 0>, <1, 0, 0>, 9, 1
	texture {pigment{enghue}
	finish {ambient .45}}}

disc{<2, 0, 0>, <1, 0, 0>, 9, 1
	texture {pigment{enghue}
	finish {ambient .45}}}
	

cylinder{<0, 0, 0>, <2, 0, 0>, 9
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}

cylinder{<0, 0, 0>, <2, 0, 0>, 1
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}
}

#declare mring=  
union {
disc{<0, 0, 0>, <1, 0, 0>, 11.5, 11
	texture {pigment{enghue}
	finish {ambient .45}}}

disc{<2, 0, 0>, <1, 0, 0>, 9, 2
	texture {pigment{enghue}
	finish {ambient .45}}}
	

cylinder{<0, 0, 0>, <2, 0, 0>, 11.5
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}

cylinder{<0, 0, 0>, <2, 0, 0>, 11
	open
	texture { 
		pigment{enghue}
		finish {ambient .45}}
	
}
}
#declare greenhouse=
union{
 torus{7,1
    texture {pigment {Grey}
    finish {ambient .2 diffuse 2 specular 0.1 roughness 0.1}}
    rotate <0,0,90>
    }
 torus{7,1
    texture {pigment {Grey}
    finish {ambient .2 diffuse 2 specular 0.1 roughness 0.1}}
    rotate <0,0,90>
    translate <2,0,0>
    }
 torus{7,1
    texture {pigment {Grey}
    finish {ambient .2 diffuse 2 specular 0.1 roughness 0.1}}
    rotate <0,0,90>
    translate <4,0,0>
    }
}


#declare crewsect=
union{
object{shield translate <-7,0,0>}
object{shield translate <23.15,0,0>}
object{mring translate <11,0,0>}
object{greenhouse translate <-4,0,0>}	

cone{<0, 0, 0>, 2    // Center and radius of one end
    <1.5, 0, 0>, 8    // Center and radius of other end
    texture {pigment {Orange}
    finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
    }
cylinder{<1.5, 0, 0>, <21.5, 0, 0>, 8
	texture {pigment{Orange}
	finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
        }
cone{<21.5, 0, 0>, 8    // Center and radius of one end
    <23, 0, 0>, 2    // Center and radius of other end
    texture {pigment {Orange}
    finish {ambient .7 diffuse 2 specular 0.1 roughness 0.1}}
    }
}

#declare ram=
 lathe {
    bezier_spline
    4, <.125,12>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {Silver}}
    finish {ambient .5 diffuse 1}
    rotate <0,0,90>
    scale <.75,10,10> 
  }

#declare ramstrut=
union{
cylinder{<120,7.5,0>,<133,25,0>, .1
        texture {pigment {Silver}}
        finish {ambient 1 diffuse 1}
}
cylinder{<123.6,7.5,0>,<133,25,0>, .1
        texture {pigment {Silver}}
        finish {ambient 1 diffuse 1}
}
cylinder{<120,7.5,0>,<123.6,8.9,0>, .1
        texture {pigment {Silver}}
        finish {ambient 1 diffuse 1}
}
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
cylinder{<-1,.9,-.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

cylinder{<-1,.9,-.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
}

#declare fin=
union{
polygon{5, <-1,5,0>, <10,5,0>, <8,25,0>, <.5,25,0>, <-1,5,0>
      pigment {rgb <.3,.3,.3>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
cylinder{<2,0,0>,<2,25,0>,.1
      pigment {rgb <.3,.3,.3>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
}
  
#declare powerplant=
union{
  box{<0,-2,-2>,<4,2,2>
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
  sphere{<9,0,0>,2.2
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
  sphere{<14,0,0>,2.2
      pigment {Grey}
      finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
object {fin}
object {fin rotate <120,0,0>}
object {fin rotate <240,0,0>}
object {fin translate <12,0,0>}
object {fin translate <12,0,0> rotate <120,0,0>}
object {fin translate <12,0,0> rotate <240,0,0>}
}      



object{engine scale <1.3,1.3,1.3>}
object{bodytube}
object{bodytube translate <50,0,0>}
object{crewsect translate <99.5,0,0>}
object{ram translate <133.5,0,0>}
object{ramstrut}
object{ramstrut rotate 120*x}
object{ramstrut rotate 240*x}

cylinder{<30,0,0>,<125,0,0>,1
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
object{powerplant translate <50,0,0>}
object{exhaust translate <-6,0,0>}
object{tug scale .2 translate <70,-7,0>}