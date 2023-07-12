#macro exhaust1(power)
union{
  lathe{
    bezier_spline
    4, <0,power>, <1,power/5.333>, <2,power/10.666>, <3,power/33.333>
    hollow
    interior {
      media {
        intervals 5
        samples 5
        emission power/6
        //scattering {1, rgb <.01,.05,.03>}
        density {
          spherical
          scale <3,power,3>
          //warp {turbulence <.8,.07,.05>}
          density_map {
            [0 rgb 0]
            [.5 rgb <0, .2, .3>]
            [.6 rgb <.2, .3, .4>]
            [.7 color <.3, .4, .4>]
            [.8 color <.5, .6, .6>]
            [.9 color <.6, .8, .8>]
            [1 color White ]
          } //density_map
        } //density
      } //media
    } //interior
    texture {
      pigment {Clear}
    }//texture
    rotate 90*z
  }//lathe
 
  /*light_source { 0 
    color rgb <.1,.5,.3>*20
  }*/
}
#end

#macro exhaust2(power)
union {
  lathe{
    bezier_spline
    4, <0,power>, <1,power/5.333>, <2,power/10.666>, <3,power/33.333>
    hollow
    interior {
      media {
        intervals 5
        samples 5
        emission power/10
        //scattering {1, rgb <.01,.05,.03>}
        density {
          spherical
          scale <3,power,3>
          //warp {turbulence <.8,.07,.05>}
          density_map {
            [0 rgb 0]
            [1 color <.3, .4, .4>]
          } //density_map
        } //density
      } //media
    } //interior
    texture {
      pigment {Clear}
    }//texture
    rotate 90*z
  }//lathe
  
  lathe{
    bezier_spline
    4, <0,power>, <1,power/5.333>, <2,power/10.666>, <3,power/33.333>
    hollow
    interior {
      media {
        intervals 5
        samples 5
        emission power/10
        //scattering {1, rgb <.01,.05,.03>}
        density {
          spherical
          scale <3,power,3>
          //warp {turbulence <.8,.07,.05>}
          density_map {
            [0 rgb 0]
            [1 color <.6, .8, .8>]
          } //density_map
        } //density
      } //media
    } //interior
    texture {
      pigment {Clear}
    }//texture
    scale <.4,.7,.4>
    rotate 90*z
  }//lathe
 
/*  light_source { 
  1*x 
  color White*35 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at -12*x
  radius 45
  falloff 5
  tightness 2
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
  }*/
}
#end
/*#macro exhaust2()
union {
 lathe {
    bezier_spline
    4, <0,12>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {rgbft <.1, .15, .2, 0.5, 1>}}
    finish {diffuse 1 ambient rgb <0, 0.5, 0.7>}
    hollow
    interior{media {emission 6}} 
    rotate 90*z
  }
  
  lathe {
    bezier_spline
    4, <0,9>, <1,2.25>, <2,1.125>, <3,.36>
    texture {pigment {rgbft <.2, .3, .32, .9, 1>}}
    finish {diffuse .45}
    hollow
    interior{media {emission 2}}
    rotate 90*z
    scale <.5,.3,.3>
    translate -5*x
  }
 
  cone {
    0, 3    // Center and radius of one end
    -15*x, 4.0    // Center and radius of other end
    open              // Removes end caps
    texture { 
      pigment {
        gradient x
        color_map{
          [0.0 color rgbft <.4, .6, .64, 1, .5>]
          [1.0 color rgbft <0, 0, 0, 0, 1>]
        }
      }
    }
    finish {
      diffuse 1
    }
    
  }
  
  light_source { 
  1*x 
  color White*35 //rgb <.2, .3, .32>*20
  shadowless
  spotlight       
  point_at -12*x
  radius 45
  falloff 5
  tightness 2
  //area_light <1, 0, 0>, <0, 0, 1>, 2, 2   
  //adaptive 1
  //jitter
  }
}
#end*/



#macro exhaust3(power)
union{
  sphere{-.5*x,1
    clipped_by{box{<-1.5,1,1>,<0,-1,-1>}}
    hollow
    interior {
      media {
        intervals 5
        samples 5
        emission power/6
        //scattering {1, rgb <.01,.05,.03>}
        density {
          spherical
          //warp {turbulence <.8,.07,.05>}
          density_map {
            [0 rgb 0]
            [.5 rgb <0, .2, .3>]
            [.6 rgb <.2, .3, .4>*1.5]
            [.7 color <.3, .4, .4>*1.5]
            [.8 color <.5, .6, .6>*1.5]
            [.9 color <.6, .8, .8>*1.5]
            [1 color White*1.5 ]
          } //density_map
        } //density
      } //media
    } //interior
    texture {
      pigment {Clear}
    }//texture
    scale x*power
  }
  /*light_source { 0 
    color rgb <.1,.5,.3>*20
  }*/
}
#end

#macro exhaust4(power)
union{
  lathe{
    cubic_spline
    8, <-.5,power*1.2>, <0,power>, <1,power/1.5>, <1.5,power/3>, <1.6,power/5>, <1.5,power/7>, <1.2,power/15>, <0,0>
    hollow
    interior {
      media {
        intervals 5
        samples 5
        emission power/6
        //scattering {1, rgb <.01,.05,.03>}
        density {
          spherical
          scale <3,power,3>
          //warp {turbulence <.8,.07,.05>}
          density_map {
            [0 rgb 0]
            [.5 rgb <0, .2, .3>]
            [.6 rgb <.2, .3, .4>]
            [.7 color <.3, .4, .4>]
            [.8 color <.5, .6, .6>]
            [.9 color <.6, .8, .8>]
            [1 color White ]
          } //density_map
        } //density
      } //media
    } //interior
    texture {
      pigment {Clear}
    }//texture
    rotate 90*z
  }//lathe
 
  /*light_source { 0 
    color rgb <.1,.5,.3>*20
  }*/
}
#end

#macro flywheel()
  union{
    cylinder{.5*y,-.5*y,4}
    cone{-.5*y,4,-1.1*y,1.5}      
        
    cone{.5*y,3.85,1*y,1.5}
    cylinder{1*y,1.2*y,1.5}
    cone{1.2*y,1.3,2.3*y,.35}
    cylinder{2.3*y,2.5*y,.3}
    #declare i=1;
    #while(i<6)
      prism{-.01,.01,4
        <.35,0>,<.35,2.3>,<1.5,1.2>,<4,.5>
        rotate -90*x
        rotate 72*i*y
        }
      #declare i = i+1;
    #end
    #declare i=1;
    #while(i<16)
      cylinder{<1.4,1.1,0>,<1.4,1.21,0>.04
        pigment{Black}
        rotate (12+24*i)*y
        }
      #declare i = i+1;
    #end
    #declare i=1;
    #while(i<31)
      cylinder{<3.91,.4,0>,<3.91,.51,0>.04
        pigment{Black}
        rotate (6+12*i)*y
        }
      #declare i = i+1;
    #end
  }
#end

#macro ring(r) 
torus{r,.05
  scale 4*y
  rotate 90*z
  }
#end

#macro mag_nozzle1(mat)
union{
  object{ring(2)}
  object{ring(1) translate 3*x}
  #local i = 0;
  #while(i<12)
    prism{
      linear_spline
      .02,-.02,10
      <-.2,2>,<-.06,2.2>,<.2,2.2>,<2.8,1.2>,<3.2,1.2>,<5,2>,
      <5,1.8>,<3.3,1>,<2.8,1>,<.2,2>
      rotate 30*i*x
    }
    box{<3.2,-.02,1.1>,<4,.02,1>
      rotate 30*i*x
    }
    #local i = i + 1;
  #end
  difference{
    cylinder{3.95*x,4.*x,1}
    cylinder{3.9*x,4.1*x,.85}
  }
  material{mat}
}      
#end