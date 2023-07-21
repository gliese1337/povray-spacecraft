#include "textures.inc"
#include "SHAPES.INC."

#macro Scaf1(scolor, length, bigness)
union{
#local i = 0;
#while(i<length*10)
  union{
    cylinder{-5*z,<10,0,-5>,.15}
    cylinder{5*z,<10,0,5>,.15}

    cylinder{<0,2,0>,<10,2,0>,.1}
    sphere{<5,2,0>,.15}
    cylinder{<0,0,5>,<5,2,0>,.1}
    cylinder{<10,0,5>,<5,2,0>,.1}
    cylinder{<5,0,5>,<5,2,0>,.1}
    sphere{<5,0,5>,.15}
    cylinder{<0,0,-5>,<5,2,0>,.1}
    cylinder{<10,0,-5>,<5,2,0>,.1}
    cylinder{<5,0,-5>,<5,2,0>,.1}
    sphere{<5,0,-5>,.15}
    
    translate i*x
  }
  #local i = i + 10;
#end  
  pigment {scolor}
  finish {diffuse 2 specular 0.1 roughness 1 phong .7}
  scale bigness
}
#end

#macro Scaf2(scolor,length, bigness)
union{
#local i = 0;
#while(i<length*5)
  union{
    cylinder{2.5*z, <5, 0, 2.5>, .08*pow(bigness,.3)}
    cylinder{-2.5*z, <5, 0, -2.5>, .08*pow(bigness,.3)}
    cylinder{0, 5*x, .08*pow(bigness,.3)}
    cylinder{2.5*z, <5, 0, -2.5>, .08*pow(bigness,.3)}
    cylinder{-2.5*z, <5, 0, 2.5>, .08*pow(bigness,.3)}
    cylinder{<2.5,-.02*pow(bigness,.3),0>,<2.5,.02*pow(bigness,.3),0>, .25*pow(bigness,.3)}
    translate i*x
  }
  #local i = i + 5;
#end
  texture {pigment{scolor}}
  finish{ambient .45}
  scale bigness
}
#end

#macro Scaf3(scolor, length, bigness)
union{
#local i = 0;
#while(i<length*5)
  union{
    cylinder{-5*z,<5,0,-5>,.15}
    cylinder{5*z,<5,0,5>,.15}

    cylinder{<0,2,0>,<5,2,0>,.1}
    sphere{<5,2,0>,.15}
    cylinder{<0,0,5>,<5,2,0>,.1}
    cylinder{<10,0,5>,<5,2,0>,.1}
    cylinder{<5,0,5>,<5,2,0>,.1}
    sphere{<5,0,5>,.15}
    cylinder{<0,0,-5>,<5,2,0>,.1}
    cylinder{<10,0,-5>,<5,2,0>,.1}
    cylinder{<5,0,-5>,<5,2,0>,.1}
    
    translate i*x
  }
  #local i = i + 5;
#end
  union{
    cylinder{<0,0,-5>,<5,0,-5>,.15}
    cylinder{<0,0,5>,<5,0,5>,.15}
    sphere{<5,0,-5>,.15}
    sphere{<5,0,5>,.15}
    translate length*5*x
  }
  sphere{<0,0,-5>,.15}
  sphere{<0,0,5>,.15}  
  pigment {scolor}
  finish {diffuse 2 specular 0.1 roughness 1 phong .7}
  scale bigness
}
#end

#macro body2(scolor,length, bigness)
union{
#local i = 0;
        #while(i<6)
                object {Scaf2(scolor,length,bigness) translate (4.33*bigness)*y rotate 60*i*x}
                #local i = i + 1;
        #end
}
#end

#macro HexTruss(scolor,length,bigness)
union{
  #local facet1=
  union{
    cylinder{2.5*z, <5, 0, 2.5>, .08*pow(bigness,.3)}
    cylinder{-2.5*z, <5, 0, -2.5>, .08*pow(bigness,.3)}
    cylinder{-2.5*z, <5, 0, 2.5>, .08*pow(bigness,.3)}
    cylinder{-2.5*z, 2.5*z, .08*pow(bigness,.3)}
  }
  #local facet2=
  union{
    cylinder{2.5*z, <5, 0, -2.5>, .08*pow(bigness,.3)}
    cylinder{-2.5*z, 2.5*z, .08*pow(bigness,.3)}
  }
  #local j = 0;
  #while(j<length)
    union{
      #local i = 0;
      #while(i<6)
        object {facet1 translate (4.33*bigness)*y rotate 60*i*x}
        object {facet2 translate (4.33*bigness)*y rotate 60*(i+1)*x}
        #local i = i + 2;
      #end
      cylinder{<5,4.33,2.5>,<5,0,-5>, .08*pow(bigness,.3)}
      cylinder{<5,0,-5>,<5,-4.33,2.5>, .08*pow(bigness,.3)}
      cylinder{<5,-4.33,2.5>,<5,4.33,2.5>, .08*pow(bigness,.3)}
      translate 5*bigness*j*x
      rotate 60*j*x
    }
    #local j = j + 1;
  #end
  material{scolor}
}
#end 

#macro Beam1(scolor, length, bigness)
union{
  difference{
    box{<0,-.5,-.05>,<length,.5,.05>}
    #local i = 0;
    #while(i<length)
      cylinder{<.5,0,-.06>,<.5,0,.06>,.4
        translate i*x
        }
      #local i = i + 1;
    #end
  }
  box{<0,-.5,-.4>,<length,-.48,.4>}
  box{<0,.5,-.4>,<length,.48,.4>}
  pigment {scolor}
  finish {diffuse 2 specular 0.1 roughness 1 phong 0}
  scale bigness
}
#end

#macro Beam2(scolor, length, bigness)
union{
  difference{
    box{<0,-.5,-.05>,<length,.5,.05>}
    #local i = -.5;
    #while(i<length)
      cylinder{<.5,.27,-.06>,<.5,.27,.06>,.2
        translate i*x
        }
      cylinder{<.5,-.27,-.06>,<.5,-.27,.06>,.2
        translate i*x
        }
      #local i = i + .5;
    #end
  }
  difference{
    box{<0,-.05,-.5>,<length,.05,.5>}
    #local i = 0;
    #while(i<length)
      cylinder{<.25,-.06,.27>,<.25,.06,.27>,.2
        translate i*x
        }
      cylinder{<.25,-.06,-.27>,<.25,.06,-.27>,.2
        translate i*x
        }
      #local i = i + .5;
    #end
  }
  pigment {scolor}
  finish {diffuse 2 specular 0.1 roughness 1 phong 0}
  scale bigness
}
#end