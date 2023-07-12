#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "SHAPES.INC."

#macro airlock()
union{
  union{
    cylinder{0,2*x,1.25}
    cone{0,1.25,.5*x,2.5}
    cylinder{.5*x,2*x,2.5}
    cone{2*x,2.5,2.5*x,1.3}
    cone{2.5*x,1.3,2.8*x,1.1}
    cylinder{2.8*x,5.2*x,1.1}
    cone{5.2*x,1.1,5.4*x,.8}
    cone{5.4*x,.8,5.5*x,.5}
    pigment {Silver}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
  }

//door        
  difference{
  cylinder{4*x,<4,0,-1.11>,1
        pigment {Silver}
        finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1 phong 1}}
  cylinder{<4,0,-1.1>,<4,0,-1.2>,.9
        pigment {Grey}
        finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}}
  }
//hinges
  union{
    box{<4.89,.45,0>,<5.01,-.45,-1.1101>}
    cylinder{<4.95,.36,-1.1>,<4.95,.4,-1.1>,.2}
    cylinder{<4.95,-.36,-1.1>,<4.95,-.4,-1.1>,.2}
    cylinder{<4.95,.12,-1.1>,<4.95,.16,-1.1>,.15}
    cylinder{<4.95,-.12,-1.1>,<4.95,-.16,-1.1>,.15}
    cylinder{<0,.12,-1.1>,<0,.16,-1.1>,.15
        clipped_by{box{<0,.12,-1.25>,<-.15,.16,-.95>}}
        scale 2.5*x
        translate 4.95*x}
    cylinder{<0,-.12,-1.1>,<0,-.16,-1.1>,.15
        clipped_by{box{<0,-.12,-1.25>,<-.15,-.16,-.95>}}
        scale 2.5*x
        translate 4.95*x}
    pigment {Grey}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
  }

//hinge braces
  union{
    cylinder{<4.95,.38,-1.28>,<4.6,.38,-1.28>,.02}
    cylinder{<4.95,-.38,-1.28>,<4.6,-.38,-1.28>,.02}
        
    cylinder{<4.6,.38,-1.28>,<4.3,.38,-1.1>,.02}
    cylinder{<4.6,-.38,-1.28>,<4.3,-.38,-1.1>,.02}
        
    cylinder{<4.3,.38,-1.1>,<3.5,.42,-1.1>,.02}
    cylinder{<4.3,-.38,-1.1>,<3.5,-.42,-1.1>,.02}
        
    cylinder{<4.6,.38,-1.28>,<4.6,.38,-1.1>,.019}
    cylinder{<4.6,-.38,-1.28>,<4.6,-.38,-1.1>,.019}
    pigment {Grey}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
  }

//handle
  union{
    torus{.05,.01
        rotate 90*z
        translate <4.4,.13,-1.1>
        clipped_by{box{<4.39,.13,-1>,<4.41,.19,-1.16>}}
        }
    cylinder{<4.4,.13,-1.16>,<4.4,-.13,-1.16>,.01}
    torus{.05,.01
        rotate 90*z
        translate <4.4,-.13,-1.1>
        clipped_by{box{<4.39,-.13,-1>,<4.41,-.19,-1.16>}}
        }
    pigment {Silver}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
  }

//lock handle
  union{
    sphere{<3.45,.1,-1.16>,.01}
    cylinder{<3.45,.1,-1.16>,<3.45,-.05,-1.16>,.01}
    torus{.05,.01
        rotate 90*z
        translate <3.45,-.05,-1.1>
        clipped_by{box{<3.44,-.05,-1>,<3.46,-.16,-1.16>}}
        }
    pigment {Silver}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
  }
        
//lock wheel
  union{
    torus{.25,.02
        rotate 90*x
        translate <4,0,-1.2>
        }
    cylinder{<3.6,0,-1.2>,<4.25,0,-1.2>,.02}
    cylinder{<-.25,0,-1.2>,<.4,0,-1.2>,.02
        rotate 60*z
        translate 4*x}
    cylinder{<-.25,0,-1.2>,<.4,0,-1.2>,.02
        rotate -60*z
        translate 4*x}
    cylinder{<4,0,-1>,<4,0,-1.15>,.03}
    pigment {Copper}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1 phong .7}
  }
  
//studs
#local stud=
 union{
   cylinder{<.4,0,-1>,<.4,0,-1.15>,.04
        pigment {Grey/1.2}}
   cylinder{<.4,0,-1.135>,<0,.07,-1.135>,.01
        pigment {White}}
   cylinder{<-.4,0,-1.135>,<0,.07,-1.135>,.01
        pigment {White}}
   cylinder{<0,.07,-1>,<0,.07,-1.15>,.04
        pigment {Grey/1.2}}
   finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
 }
 union{
   sphere{<3.225,0,-1.1>,.066
        pigment {Gold/2+Yellow/2}}
   object{stud rotate 90*z translate <3.3,0,0>}
   object{stud rotate 30*z translate <3.62,.59,0>}
   object{stud rotate 150*z translate <3.65,-.59,0>}
   cylinder{<4.47,.65,-1>,<4.47,.65,-1.15>,.04
        pigment {Grey/1.2}}
   cylinder{<4.47,.65,-1.135>,<4,.77,-1.135>,.01
        pigment {White}}

   cylinder{<4.47,-.65,-1>,<4.47,-.65,-1.15>,.04
        pigment {Grey/1.2}}
   cylinder{<4.47,-.65,-1.135>,<4,-.77,-1.135>,.01
        pigment {White}}
   cylinder{<4,-.77,-1>,<4,-.77,-1.15>,.04
        pigment {Grey/1.2}}
  
   finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}
 }
//cage
  difference{
    cylinder{5.6*x,5.65*x,1.15
        pigment {Silver}}
    cylinder{5.59*x,5.66*x,1.05
        pigment {Silver}}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1 phong 1}
  }
  union{
    box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        rotate 22.5*x}
    box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        rotate 157.5*x}
    box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        rotate -22.5*x}
    box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        rotate -157.5*x}

    box{<4.9,.025,1.075>,<5.61,.025,1.125>
        pigment {Grey}}
    box{<4.9,.025,-1.075>,<5.61,.025,-1.125>
        pigment {Grey}}
        
    box{<0,.3,1>,<3.7,-.3,1.55>
        pigment {Grey*1.2}}
    cylinder{<3.6,0,-1.3>,<4.3,0,-1.3>,.2
        pigment {Grey}
        rotate -177.5*x}
    box{<4.2,.3,1>,<4.9,-.3,1.55>
        pigment {Grey*1.2}}

    box{<4.9,-.025,1.1>,<5.65,.025,1.1>
        pigment {Grey*1.2}}
    box{<4.9,-.025,-1.1>,<5.65,.025,-1.1>
        pigment {Grey*1.2}}
    finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1 phong 1}
  }
}
#end

#local hatch=
union{
  difference{
  cylinder{0,-.11*z,1.1
        pigment {Silver}
        finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1 phong 1}}
  cone{-.1*z,1.05,-.2*z,.9
        pigment {Grey}
        finish {ambient 0.0 diffuse 2 specular 0.1 roughness 1}}
  }

/*hinges
  box{<4.89,.45,0>,<5.01,-.45,-1.1101>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.95,.36,-1.1>,<4.95,.4,-1.1>,.2
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.95,-.36,-1.1>,<4.95,-.4,-1.1>,.2
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.95,.12,-1.1>,<4.95,.16,-1.1>,.15
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.95,-.12,-1.1>,<4.95,-.16,-1.1>,.15
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<0,.12,-1.1>,<0,.16,-1.1>,.15
        clipped_by{box{<0,.12,-1.25>,<-.15,.16,-.95>}}
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}
        scale 2.5*x
        translate 4.95*x}
  cylinder{<0,-.12,-1.1>,<0,-.16,-1.1>,.15
        clipped_by{box{<0,-.12,-1.25>,<-.15,-.16,-.95>}}
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}
        scale 2.5*x
        translate 4.95*x}

//hinge braces
  cylinder{<4.95,.38,-1.28>,<4.6,.38,-1.28>,.02
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.95,-.38,-1.28>,<4.6,-.38,-1.28>,.02
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
        
  cylinder{<4.6,.38,-1.28>,<4.3,.38,-1.1>,.02
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.6,-.38,-1.28>,<4.3,-.38,-1.1>,.02
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
        
  cylinder{<4.3,.38,-1.1>,<3.5,.42,-1.1>,.02
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.3,-.38,-1.1>,<3.5,-.42,-1.1>,.02
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
        
  cylinder{<4.6,.38,-1.28>,<4.6,.38,-1.1>,.019
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.6,-.38,-1.28>,<4.6,-.38,-1.1>,.019
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1}}

//handle
  torus{.05,.01
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1}
        rotate 90*z
        translate <4.4,.13,-1.1>
        clipped_by{box{<4.39,.13,-1>,<4.41,.19,-1.16>}}
        }
  cylinder{<4.4,.13,-1.16>,<4.4,-.13,-1.16>,.01
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1}}
  torus{.05,.01
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1}
        rotate 90*z
        translate <4.4,-.13,-1.1>
        clipped_by{box{<4.39,-.13,-1>,<4.41,-.19,-1.16>}}
        }

//lock handle
  sphere{<3.45,.1,-1.16>,.01
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<3.45,.1,-1.16>,<3.45,-.05,-1.16>,.01
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1}}
  torus{.05,.01
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1}
        rotate 90*z
        translate <3.45,-.05,-1.1>
        clipped_by{box{<3.44,-.05,-1>,<3.46,-.16,-1.16>}}
        }
        
//lock wheel
  torus{.25,.02
        pigment {Copper}
        finish {diffuse 2 specular 0.1 roughness 1 phong .7}
        rotate 90*x
        translate <4,0,-1.2>
        }
  cylinder{<3.75,0,-1.2>,<4.25,0,-1.2>,.02
        pigment {Copper}
        finish {diffuse 2 specular 0.1 roughness 1 phong .7}}
  cylinder{<-.25,0,-1.2>,<.25,0,-1.2>,.02
        pigment {Copper}
        finish {diffuse 2 specular 0.1 roughness 1 phong .7}
        rotate 60*z
        translate 4*x}
  cylinder{<-.25,0,-1.2>,<.25,0,-1.2>,.02
        pigment {Copper}
        finish {diffuse 2 specular 0.1 roughness 1 phong .7}
        rotate -60*z
        translate 4*x}
  cylinder{<4,0,-1>,<4,0,-1.15>,.03
        pigment {Copper}
        finish {diffuse 2 specular 0.1 roughness 1 phong .7}}

//studs
#local stud=
 union{
  cylinder{<.4,0,-1>,<.4,0,-1.15>,.04
        pigment {Grey/1.2}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<.4,0,-1.135>,<0,.07,-1.135>,.01
        pigment {White}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<-.4,0,-1.135>,<0,.07,-1.135>,.01
        pigment {White}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<0,.07,-1>,<0,.07,-1.15>,.04
        pigment {Grey/1.2}
        finish {diffuse 2 specular 0.1 roughness 1}}
 }

  sphere{<3.225,0,-1.1>,.066
        pigment {Gold/2+Yellow/2}
        finish {diffuse 2 specular 0.1 roughness 1}}
object{stud rotate 90*z translate <3.3,0,0>}
object{stud rotate 30*z translate <3.62,.59,0>}
object{stud rotate 150*z translate <3.65,-.59,0>}
  cylinder{<4.47,.65,-1>,<4.47,.65,-1.15>,.04
        pigment {Grey/1.2}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.47,.65,-1.135>,<4,.77,-1.135>,.01
        pigment {White}
        finish {diffuse 2 specular 0.1 roughness 1}}

  cylinder{<4.47,-.65,-1>,<4.47,-.65,-1.15>,.04
        pigment {Grey/1.2}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4.47,-.65,-1.135>,<4,-.77,-1.135>,.01
        pigment {White}
        finish {diffuse 2 specular 0.1 roughness 1}}
  cylinder{<4,-.77,-1>,<4,-.77,-1.15>,.04
        pigment {Grey/1.2}
        finish {diffuse 2 specular 0.1 roughness 1}}
 
//cage
 difference{
  cylinder{5.6*x,5.65*x,1.15
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}}
  cylinder{5.59*x,5.66*x,1.05
        pigment {Silver}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}}
 }
  box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        rotate 22.5*x}
  box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        rotate 157.5*x}
  box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        rotate -22.5*x}
  box{<0,1.075,-.025>,<5.61,1.125,.025>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        rotate -157.5*x}

  box{<4.9,.025,1.075>,<5.61,.025,1.125>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        }
  box{<4.9,.025,-1.075>,<5.61,.025,-1.125>
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        }
        
  box{<0,.3,1>,<3.7,-.3,1.55>
        pigment {Grey*1.2}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        }
  cylinder{<3.6,0,-1.3>,<4.3,0,-1.3>,.2
        pigment {Grey}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        rotate -177.5*x}
  box{<4.2,.3,1>,<4.9,-.3,1.55>
        pigment {Grey*1.2}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        }

  box{<4.9,-.025,1.1>,<5.65,.025,1.1>
        pigment {Grey*1.2}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        }
  box{<4.9,-.025,-1.1>,<5.65,.025,-1.1>
        pigment {Grey*1.2}
        finish {diffuse 2 specular 0.1 roughness 1 phong 1}
        }
*/}


/*#macro dock(mcolor,scolor,ext,ang)
union{
  #local link = union{
    box{<0,-.07,.05>,<.17,.07,.06>}
    cylinder{<.17,0,.05>,<.17,0,.06>,.07}
    box{<0,-.07,-.05>,<.17,.07,-.06>}
    cylinder{<.17,0,-.05>,<.17,0,-.06>,.07}
  }
  #local cring = union{
    difference{
      cylinder{-.2*x,0,1.3}
      cylinder{-.21*x,.01*x,1.1}
      //#local i = 0;
      //#while(i<36)
      //  box{<-.1,-.25,.1>,<.1,.25,-.1> rotate 45*z translate 1.2*y rotate (5+10*i)*x}
      //  box{<-.1,-.25,.1>,<.1,.25,-.1> rotate -45*z translate 1.2*y rotate (10*i-5)*x}
      //  #local i = i + 1;
      //#end
    }
    object{link translate 1.2*y}
    object{link translate 1.2*y rotate 120*x}
    object{link translate 1.2*y rotate -120*x}
    //translate -.2*x
    material{mcolor}
    
  }
  #local hydraulic = union{
    cylinder{<-ext+.1,1.2,0>,<-.1,1,0>,.05}
    object{link rotate 180*y translate 1*y}
    material{mcolor}
  }
  #local wing = difference{
   cylinder{0,-1.5*x,1.5
        clipped_by{object{Wedge(50) rotate 90*z}}
        }
   cylinder{.01*x,-1.6*x,1.4}
   material{mcolor}
   rotate -65*x
   translate -1.45*y
   rotate -ang*z
   translate 1.45*y
 }
 
 object{cring translate -ext*x}
 object{hydraulic}
 object{hydraulic rotate 120*x}
 object{hydraulic rotate -120*x}
 
 object{wing rotate 30*x}
 object{wing rotate 150*x}
 object{wing rotate -90*x}  
  
}
#end*/             

#macro dock(mcolor,scolor,ext)
union{
  difference{
    cylinder{0,1*x,1.5}
    cylinder{-.1*x,1.1*x,1.4}
    #local i = 0;
    #while(i<6)
      cone{<1.001,1.45,0>,.04,<.95,1.45,0>,0
            rotate 60*i*x
           }
      cylinder{<.95,1.45,0>,<.95,1.45,-.1>,.01
            rotate 60*i*x
           }
      #local i = i + 1;
    #end
    material{mcolor}
  }
  #local i = 0;
  #while(i<6)
    difference{
      cone{<0.999,1.45,0>,.04,<1.05,1.45,0>,0}
      cylinder{<1.02,1.45,0>,<1.03,1.45,-.1>,.01}
      rotate (60*i+30)*x
      material{scolor}
    }
    cylinder{<.97,1.45,-.02>,<.95,1.45,-.1>,.01
             rotate 60*i*x
             material{scolor}
            }
    #local i = i + 1;
  #end
  
  #local dring = union{
    difference{
      cylinder{0,.07*x,1.35}
      cylinder{-.001*x,.071*x,1.25}
    }
    difference{
      union{
        #local i = 0;
        #while(i<3)
          intersection{
            cone{0,1.35,.5*x,.7}
            cylinder{-.1*x,1*x,1.25}
            prism{0,1.31,4
                  <-.01,-.6>,<1,0>,<-.01,.6>,<-.01,-.6>
                  }
            rotate 120*i*x
          } 
          #local i = i + 1;
        #end
        }
      cone{-.01*x,1.3,.51*x,.68}
    }

    material{mcolor}
  }
  /*
  #local link = union{
    box{<0,-.07,.05>,<.17,.07,.06>}
    cylinder{<.17,0,.05>,<.17,0,.06>,.07}
    box{<0,-.07,-.05>,<.17,.07,-.06>}
    cylinder{<.17,0,-.05>,<.17,0,-.06>,.07}
  }
  #local cring = union{
    difference{
      cylinder{-.2*x,0,1.3}
      cylinder{-.21*x,.01*x,1.1}
      //#local i = 0;
      //#while(i<36)
      //  box{<-.1,-.25,.1>,<.1,.25,-.1> rotate 45*z translate 1.2*y rotate (5+10*i)*x}
      //  box{<-.1,-.25,.1>,<.1,.25,-.1> rotate -45*z translate 1.2*y rotate (10*i-5)*x}
      //  #local i = i + 1;
      //#end
    }
    object{link translate 1.2*y}
    object{link translate 1.2*y rotate 120*x}
    object{link translate 1.2*y rotate -120*x}
    //translate -.2*x
    material{mcolor}
    
  }
  #local hydraulic = union{
    cylinder{<-ext+.1,1.2,0>,<-.1,1,0>,.05}
    object{link rotate 180*y translate 1*y}
    material{mcolor}
  }
  #local wing = difference{
   cylinder{0,-1.5*x,1.5
        clipped_by{object{Wedge(50) rotate 90*z}}
        }
   cylinder{.01*x,-1.6*x,1.4}
   material{mcolor}
   rotate -65*x
   translate -1.45*y
   rotate -ang*z
   translate 1.45*y
 }
 
 object{cring translate -ext*x}
 object{hydraulic}
 object{hydraulic rotate 120*x}
 object{hydraulic rotate -120*x}
 
 object{wing rotate 30*x}
 object{wing rotate 150*x}
 object{wing rotate -90*x}  
    */
 object{dring translate 1.1*x}
}
#end