#macro hab()
union{
  sphere{10*y,10
        clipped_by {cylinder{0,2*y,4}}
        }
  cylinder{.85*y,8.85*y,4}
  torus{3.5,.5
        translate 8.85*y}
  cone{9.25*y,3.8
       10.5*y,1.5}
  pigment {White}
  finish {ambient .25 diffuse 2 specular 0.1 roughness 1}
}
#end

#macro boltplate(scolor,bcolor)
union{
  cylinder{0,.02*x,1.1}
  #local i = 0;
  #while(i<24)
        cylinder{<.01,1.05,0>,<.03,1.05,0>,.04
                pigment {bcolor}
                rotate 15*i*x}
        #local i = i + 1;
  #end
  material{scolor}
}
#end

#macro tunnel(tcolor, pcolor, bcolor, length)
union{
  cylinder{0,length*x,1}
  object{boltplate(pcolor,bcolor)}
  object{boltplate(pcolor,bcolor) rotate 180*y translate length*x}
  material{tcolor}
}
#end

#macro H_tunnel(tcolor, pcolor, bcolor, length)
difference{
  tunnel(tcolor, pcolor, bcolor, length)
  cylinder{-.01,(length+.01)*x,.95
    material{tcolor}
  }
}
#end

#macro Tjunc(tcolor,pcolor,bcolor,llength,rlength,slength)
union{
  object{tunnel(tcolor,pcolor,bcolor,rlength+llength) translate -llength*x rotate 90*y}
  cylinder{0,slength*x,1
    material{tcolor}
  }
  object{boltplate(pcolor,bcolor) rotate 180*y translate slength*x}
}
#end

#macro elbow(scolor, pcolor, bcolor, rad, ang)
union{
  torus{rad,1
        clipped_by{Wedge(ang)}
        rotate 180*y}
  object{boltplate(pcolor,bcolor) rotate 180*y translate -rad*z}        
  object{boltplate(pcolor,bcolor) translate -rad*z rotate ang*y}
  material{scolor}               
}
#end

#macro H_elbow(scolor, pcolor, bcolor, rad, ang)
difference{
  elbow(scolor, pcolor, bcolor, rad, ang)
  torus{rad,.95
    material{scolor}
  }
}
#end

#declare CylEndC=
  union{
    cone{0,1.1,1*x,2}
    #local i = 0;
    #while(i<4)
      union{
      cylinder{<.01,1.25,0>,<1,2.15,0>,.01}
      sphere{<.01,1.25,0>,.01}
      sphere{<1,2.15,0>,.01}
      cylinder{<.01,.9,0>,<.01,1.25,0>,.01}
      cylinder{<.59,1.4,0>,<.59,1.75,0>,.01}
        rotate 90*i*x
        #local i = i + 1;
      }
    #end
  }
  
#macro CylModC(mcolor,scolor)
union{
  union{   
    #local strut=cylinder{1.9*y,2.15*y,.02}
    #local i = 0;
    #while(i<4)
      union{
        cylinder{<.02,2.15,0>,<5.98,2.15,0>,.02}
        sphere{<.02,2.15,0>,.02}
        sphere{<5.98,2.15,0>,.02}
        object{strut translate .02*x}
        object{strut translate 1.495*x}
        object{strut translate 3*x}
        object{strut translate 4.495*x}
        object{strut translate 5.98*x}
        rotate 90*i*x
        #local i = i + 1;
      }
    #end
    material{scolor}
    translate 1*x
  }
  union{
    cylinder{1*x,7*x,2}
    object{CylEndC}
    object{CylEndC rotate 180*y translate 8*x}
    material{mcolor}
  }
}
#end

#macro H_CylModC(mcolor,scolor)
difference{
  CylMod1(mcolor,scolor)
  union{
    cylinder{1*x,7*x,1.95}
    cone{-.05,.95,1*x,1.95}
    cone{7*x,1.95,8.05*x,.95}
    material{mcolor}
  }
}  
#end

#declare CylEndS=
    intersection{
      sphere{4.5*x,4.5}
      cylinder{0,.5*x,2}
    }

#macro CylModS(mcolor,scolor,length)
union{
  union{
    cylinder{.5*x,(length-.5)*x,2}
    object{CylEndS}
    object{CylEndS rotate 180*y translate length*x}
    material{mcolor}
  }
  union{   
    #local strut=cylinder{1.9*y,2.1*y,.01}
    #local i = 0;
    #while(i<4)
      union{
        cylinder{<.01,2.1,0>,<length-1.01,2.1,0>,.01}
        object{strut translate .01*x}
        object{strut translate .01*x rotate 45*x}
        object{strut translate ((length-1)/2)*x}
        object{strut translate (length-1.01)*x}
        object{strut translate (length-1.01)*x rotate 45*x}
        rotate (45+90*i)*x
        #local i = i + 1;
      }
    #end
    torus{2.1,.01
      rotate 90*z
      translate .01*x}
    torus{2.1,.01
      rotate 90*z
      translate (length-1.01)*x}
    material{scolor}
    translate .5*x
  }
}
#end

#macro CylEndDoors(e,length,mcolor)
  #if(e=-1)
    cylinder{0,.5*x,1.1
      material{mcolor}
    }
  #end
  #if(e=1)
    cylinder{(length-.5)*x,length*x,1.1
      material{mcolor}
    }
  #end
  #if(e=2)
    cylinder{0,length*x,1.1
      material{mcolor}
    }
  #end
#end

#macro CylModS_0(e,mcolor,scolor,length)
union{
  object{CylModS(mcolor,scolor,length)}
  CylEndDoors(e,length,mcolor)
}
#end

#macro H_CylEndDoors(e,length)
  #if(e=-1)
    cylinder{-.1*x,.6*x,.95}
  #end
  #if(e=1)
    cylinder{(length-.6)*x,(length+.1)*x,.95}
  #end
  #if(e=2)
    cylinder{-.1*x,(length+.1)*x,.95}
  #end
#end

#macro H_CylModS_0(e,mcolor,scolor,length)
difference{
  object{CylModS_0(e,mcolor,scolor,length)}
  H_CylEndDoors(e,length)
  cylinder{.5*x,(length-.5)*x,1.95}
}
#end

#macro CylModS_1(e,mcolor,scolor,length)
union{
  object{CylModS(mcolor,scolor,length)}
  union{
    CylEndDoors(e,length,mcolor)
    cylinder{-2.25*z,0,1.1 translate x*length/2}
    material{mcolor}  
  }
}
#end

#macro H_CylModS_1(e,mcolor,scolor,length)
difference{
  object{CylModS_1(e,mcolor,scolor,length)}
  H_CylEndDoors(e,length)
  cylinder{-2.26*z,0,.95 translate x*length/2}
  cylinder{.5*x,(length-.5)*x,1.95}
}
#end

#macro CylModS_2L(e,mcolor,scolor,length)
union{
  object{CylModS(mcolor,scolor,length)}
  union{
    CylEndDoors(e,length,mcolor)
    cylinder{-2.25*y,0,1.1 translate x*length/2}
    cylinder{-2.25*z,0,1.1 translate x*length/2}
    material{mcolor}  
  }
}
#end

#macro H_CylModS_2L(e,mcolor,scolor,length)
difference{
  object{CylModS_2L(e,mcolor,scolor,length)}
  H_CylEndDoors(e,length)
  cylinder{-2.26*y,0,.95 translate x*length/2}
  cylinder{-2.26*z,0,.95 translate x*length/2}
  cylinder{.5*x,(length-.5)*x,1.95}
}
#end

#macro CylModS_2(e,mcolor,scolor,length)
union{
  object{CylModS(mcolor,scolor,length)}
  union{
    CylEndDoors(e,length,mcolor)
    cylinder{-2.25*z,2.25*z,1.1 translate x*length/2}
    material{mcolor}  
  }
}
#end

#macro H_CylModS_2(e,mcolor,scolor,length)
difference{
  object{CylModS_2(e,mcolor,scolor,length)}
  H_CylEndDoors(e,length)
  cylinder{-2.26*z,2.26*z,.95 translate x*length/2}
  cylinder{.5*x,(length-.5)*x,1.95}
}
#end

#macro CylModS_3(e,mcolor,scolor,length)
union{
  object{CylModS(mcolor,scolor,length)}
  union{
    CylEndDoors(e,length,mcolor)
    cylinder{-2.25*y,0,1.1 translate x*length/2}
    cylinder{-2.25*z,2.25*z,1.1 translate x*length/2}
    material{mcolor}  
  }
}
#end

#macro H_CylModS_3(e,mcolor,scolor,length)
difference{
  object{CylModS_3(e,mcolor,scolor,length)}
  H_CylEndDoors(e,length)
  cylinder{-2.26*y,0,.95 translate x*length/2}
  cylinder{-2.26*z,2.26*z,.95 translate x*length/2}
  cylinder{.5*x,(length-.5)*x,1.95}
}
#end

#macro CylModS_4(e,mcolor,scolor,length)
union{
  object{CylModS(mcolor,scolor,length)}
  union{
    CylEndDoors(e,length,mcolor)
    cylinder{-2.25*z,2.25*z,1.1 translate x*length/2}
    cylinder{-2.25*y,2.25*y,1.1 translate x*length/2}
    material{mcolor}  
  }
}
#end

#macro H_CylModS_4(e,mcolor,scolor,length)
difference{
  object{CylModS_4(e,mcolor,scolor,length)}
  H_CylEndDoors(e,length)
  cylinder{-2.26*z,2.26*z,.95 translate x*length/2}
  cylinder{-2.26*y,2.26*y,.95 translate x*length/2}
  cylinder{.5*x,(length-.5)*x,1.95}
}
#end


#macro endcap(scolor,bcolor)
union{
  object{boltplate(scolor,bcolor)}
  sphere{-1*x,sqrt(2)
        clipped_by{cylinder{0,.5*x,1.1}}
        }
  material{scolor}
}
#end

#macro adapter(mcolor,bcolor)
union{
  cylinder{0,.25*x,1}
  cone{.25*x,1,.75*x,1.25}
  cylinder{.75*x,1*x,1.25}
  object{boltplate(mcolor,bcolor)}
  material{mcolor}
}
#end

#macro S4Hub(mcolor,pcolor,bcolor)
union{
  sphere{0,1.6
        clipped_by{box{<-1.5,-2,-1.5>,<1.5,2,1.5>}}}
        
  cylinder{-1.5*x,1.5*x,1}
  cylinder{-1.5*z,1.5*z,1}
  object{boltplate(pcolor,bcolor) translate -1.5*x}
  object{boltplate(pcolor,bcolor) rotate 180*y translate 1.5*x}
  object{boltplate(pcolor,bcolor) rotate 90*z translate -1.5*y}
  object{boltplate(pcolor,bcolor) rotate -90*z translate 1.5*y}
  material{mcolor}
}
#end

#macro H_S4Hub(mcolor,pcolor,bcolor)
difference{
  S4Hub(mcolor,pcolor,bcolor)
  sphere{0,1.55}
  cylinder{-1.6*x,1.6*x,.95}
  cylinder{-1.6*z,1.6*z,.95}
}
#end

#macro S6Hub(mcolor,pcolor,bcolor)
union{
  sphere{0,1.6
        clipped_by{box{<-1.5,-1.5,-1.5>,<1.5,1.5,1.5>}}
        }        
  cylinder{-1.5*x,1.5*x,1}
  cylinder{-1.5*y,1.5*y,1}
  cylinder{-1.5*z,1.5*z,1}
  object{boltplate(pcolor,bcolor) translate -1.5*x}
  object{boltplate(pcolor,bcolor) rotate 180*y translate 1.5*x}
  object{boltplate(pcolor,bcolor) rotate 90*y translate 1.5*z}
  object{boltplate(pcolor,bcolor) rotate -90*y translate -1.5*z}
  object{boltplate(pcolor,bcolor) rotate 90*z translate -1.5*y}
  object{boltplate(pcolor,bcolor) rotate -90*z translate 1.5*y}
  material{mcolor}
}
#end

#macro H_S6Hub(mcolor,pcolor,bcolor)
difference{
  S6Hub(mcolor,pcolor,bcolor)
  sphere{0,1.55}
  cylinder{-1.6*x,1.6*x,.95}
  cylinder{-1.6*y,1.6*y,.95}
  cylinder{-1.6*z,1.6*z,.95}
}
#end

#macro WindowSphere1(scolor,gcolor,bigness)
union{
  difference{
    sphere{0,bigness+.05}
    sphere{0,bigness-.05}
    material{gcolor}
  }
  union{
    torus{bigness,.1}
    torus{bigness,.1 rotate 90*x}
    torus{bigness,.1 rotate 90*z}
    torus{bigness/sqrt(2),.1 translate y*bigness/sqrt(2)}
    torus{bigness/sqrt(2),.1 translate -y*bigness/sqrt(2)}
    torus{bigness/sqrt(2),.1 rotate 90*x translate z*bigness/sqrt(2)}
    torus{bigness/sqrt(2),.1 rotate 90*x translate -z*bigness/sqrt(2)}
    torus{bigness/sqrt(2),.1 rotate 90*z translate x*bigness/sqrt(2)}
    torus{bigness/sqrt(2),.1 rotate 90*z translate -x*bigness/sqrt(2)}

    material{scolor}
  }
}
#end

#macro WindowSphere2(scolor,gcolor,bigness)
union{
  difference{
    sphere{0,bigness+.05}
    sphere{0,bigness-.05}
    material{gcolor}
  }
  union{
    torus{bigness,.1}
    torus{bigness,.1 rotate 90*x}
    torus{bigness,.1 rotate 90*z}
    union{
      torus{bigness/sqrt(2),.1/1.155 translate y*bigness/2}
      torus{bigness/sqrt(2),.1/1.155 translate -y*bigness/2}
      torus{bigness/sqrt(2),.1/1.155 rotate 90*x translate z*bigness/2}
      torus{bigness/sqrt(2),.1/1.155 rotate 90*x translate -z*bigness/2}
      torus{bigness/sqrt(2),.1/1.155 rotate 90*z translate x*bigness/2}
      torus{bigness/sqrt(2),.1/1.155 rotate 90*z translate -x*bigness/2}
      scale 1.155
    }
      torus{1.15*bigness/2,.1 translate y*bigness/1.22}
      torus{1.15*bigness/2,.1 translate -y*bigness/1.22}
      torus{1.15*bigness/2,.1 rotate 90*x translate z*bigness/1.22}
      torus{1.15*bigness/2,.1 rotate 90*x translate -z*bigness/1.22}
      torus{1.15*bigness/2,.1 rotate 90*z translate x*bigness/1.22}
      torus{1.15*bigness/2,.1 rotate 90*z translate -x*bigness/1.22}
    material{scolor}
  }
  rotate <45,30,0>
}
#end

#macro WindowSphere3(scolor,gcolor,bigness,res)
#declare N = res;
#declare Half = 0;
#declare Method = 1;
#declare Thickness=.0002;
#include "GeoDome.inc"
union{
  object{Frame material{scolor} scale bigness}
  #if(res>3)
    difference{
      sphere{0,bigness}
      sphere{0,bigness-.05}
      material{gcolor}
    }
  #else
    object{Facets material{gcolor} scale bigness}
  #end
}
#end