#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."

#local enghue=Grey/2;
#local strut=Silver;
#local crewcolor=Silver;

declare wirerad=
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

#declare bodyset=
union{
object {wirerad translate <0,4,0>}
object {wirerad translate <0,4,0> rotate 180*x}

object {wirerad translate <0,4,0> rotate 60*x}
object {wirerad translate <0,4,0> rotate -60*x}

object {wirerad translate <0,4,0> rotate 120*x}
object {wirerad translate <0,4,0> rotate -120*x}
cylinder{<0,0,0>,<4,0,0>,2.5
        texture {pigment{strut}}
	finish{ambient .45}
	}
}

#declare exhaust=
union {
 lathe {
    bezier_spline
    4, <0,12>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {rgbft <.1, .15, .2, 0.5, 0>}}
    finish {diffuse 1 ambient rgb <0, 0.5, 0.7>}
    hollow
    interior{media {emission 6}} 
    rotate <0,0,90>
  }
  
  lathe {
    bezier_spline
    4, <0,9>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {rgbft <.2, .3, .32, .9, .7>}}
    finish {diffuse .45}
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
  
  /*light_source { 
  <1,0,0> 
  color White*35 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at <-12,0,0>
  radius 45
  falloff 5
  tightness 2
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
  }*/
}

#declare coil=
union{
cylinder{<-1,1.6,-1>,<1,1.6,-1>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-1,1.6,1>,<1,1.6,1>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
box{<-1,1.55,-1>,<1,1.65,1>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}

cylinder{<-1,0,-1>,<1,0,-1>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-1,0,1>,<1,0,1>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
box{<-1,-.05,-1>,<1,.05,1>
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}

cylinder{<0,1.6,0>,<0,0,0>,.4
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}

torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.2,0>}
torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.4,0>}
torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.6,0>}
torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,.8,0>}
torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1,0>}
torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1.2,0>}
torus{.9,.03
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        translate <0,1.4,0>}
}

#declare engine=
union{
cylinder{<.25,0,0>,<-.25,0,0>,6
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
torus{6,.3
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z}
cylinder{<0,0,0>,<-1.5,0,0>,2.5
        texture {pigment{strut}}
	finish{ambient .45}}
cylinder{<-1,0,0>,<-4,0,0>,2
        open
        texture {pigment{strut}}
	finish{ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
torus{5.5,.3
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z
        translate <-10,0,0>}
torus{4,.25
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z
        translate <-10,0,0>}

cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 45*x}
cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*x}
cylinder{<-10,4,0>,<-10,5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 135*x}

cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 45*x}
cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*x}
cylinder{<-10,-4,0>,<-10,-5.5,0>,.2
	pigment {enghue}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 0.1}
        rotate 135*x}

object{coil translate <-2.5,3.8,0>}
object{coil translate <-7.5,3.8,0>}
object{coil translate <-2.5,3.8,0> rotate 180*x}
object{coil translate <-7.5,3.8,0> rotate 180*x}
                            
object{coil translate <-2.5,3.8,0> rotate 60*x}
object{coil translate <-7.5,3.8,0> rotate 60*x}
object{coil translate <-2.5,3.8,0> rotate -60*x}
object{coil translate <-7.5,3.8,0> rotate -60*x}

object{coil translate <-2.5,3.8,0> rotate 120*x}
object{coil translate <-7.5,3.8,0> rotate 120*x}
object{coil translate <-2.5,3.8,0> rotate -120*x}
object{coil translate <-7.5,3.8,0> rotate -120*x}
}

#declare bodytube=
union{
object{bodyset}
object{bodyset translate <4,0,0>}
object{bodyset translate <8,0,0>}
object{bodyset translate <12,0,0>}
object{bodyset translate <16,0,0>}
object{bodyset translate <20,0,0>}
object{bodyset translate <24,0,0>}
object{bodyset translate <28,0,0>}
object{bodyset translate <32,0,0>}
object{bodyset translate <36,0,0>}
object{bodyset translate <40,0,0>}
object{bodyset translate <44,0,0>}
object{bodyset translate <48,0,0>}
object{bodyset translate <52,0,0>}
object{bodyset translate <56,0,0>}
object{bodyset translate <60,0,0>}
object{bodyset translate <64,0,0>}
object{bodyset translate <68,0,0>}
object{bodyset translate <72,0,0>}
object{bodyset translate <76,0,0>}
object{bodyset translate <80,0,0>}
object{bodyset translate <84,0,0>}
object{bodyset translate <88,0,0>}
object{bodyset translate <92,0,0>}
object{bodyset translate <96,0,0>}
object{bodyset translate <100,0,0>}
}

#declare crewsect=
union{
cone{<0,0,0>,2.5
     <.5,0,0>,4.5
     pigment {Grey}
     finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<.5,0,0>,<2,0,0>,5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
object {wirerad translate <2,5,0>}
object {wirerad translate <2,5,0> rotate 180*x}
object {wirerad translate <2,5,0> rotate 60*x}
object {wirerad translate <2,5,0> rotate -60*x}
object {wirerad translate <2,5,0> rotate 120*x}
object {wirerad translate <2,5,0> rotate -120*x}
cylinder{<2,0,0>,<7,0,0>,3
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<7,0,0>,<8.5,0,0>,5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<8.5,0,0>,<9.5,0,0>,4
        pigment {Grey}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}      
cylinder{<9.5,0,0>,<20,0,0>,4.5
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<20,0,0>,<21,0,0>,4
        pigment {crewcolor}
        finish {ambient .15 diffuse 2 specular 0.1 roughness 0.1}}}

#declare powerplant=
union{
sphere {<6.5,0,0>, 8
        clipped_by{box{<0,-8,-8>,<14.5,8,8>}}
        pigment {Silver}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        }
difference{
 sphere{<6.5,0,0>, 9
        clipped_by{box{<6.5,-9,-9>,<15.5,9,9>}}
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}
        }
 sphere{<6.5,0,0>, 8.5}
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
   rotate <0,0,-70>
 }
cylinder{<-1,.9,-.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}

/*cylinder{<-1,.9,-.4>,<.4,2.94,.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}
cylinder{<-1,.9,.4>,<.4,2.94,-.4>,.05
        pigment {Grey}
        finish {ambient .5 diffuse 2 specular 0.1 roughness 1}}*/
}

#declare hab=
union{
  sphere{<0,10,0>,10
        clipped_by {cylinder{<0,0,0>,<0,2,0>,4}}
        pigment {White}
        finish {ambient .5}
        }
  cylinder{<0,.85,0>,<0,8.85,0>,4
        pigment {White}
        finish {ambient .25 diffuse 2 specular 0.1 roughness 1}}
  torus{3.5,.5
        translate <0,8.85,0>
        pigment {White}
        finish {ambient .25 diffuse 2 specular 0.1 roughness 1}}
  cone{<0,9.25,0>,3.8
       <0,10.5,0>,1.5
        pigment {White}
        finish {ambient .25 diffuse 2 specular 0.1 roughness 1}}
  
}

#declare solarpanel=
union{
box{<-5.5,10,-.05>,<-2.5,40,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<-1.5,10,-.05>,<1.5,40,.05>
      pigment {rgb <.3,.3,.5>}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
box{<2.5,10,-.05>,<5.5,40,.05>
      pigment {rgb <.3,.3,.5>}
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
box{<-5.5,39.9,-.1>,<5.5,40.1,.1>
      pigment {Silver}
      finish {ambient 0 diffuse 2 specular 0.1 roughness 1}}
}

