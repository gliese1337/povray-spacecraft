#include "textures.inc"
#include "SHAPES.INC."

#macro tankset(tcolor,pcolor,scolor)
union{
sphere {<0,8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<0,-8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
sphere {<0,8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 60*x}
sphere {<0,-8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 60*x}
sphere {<0,8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 120*x}
sphere {<0,-8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 120*x}

torus {8.2,.7
        pigment {pcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z}
torus {5,.4
        pigment {scolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        rotate 90*z}
cylinder{<0,6,0>,<0,0,0>, .6
	texture {pigment{pcolor}}
	finish{ambient .45}
	}
cylinder{<0,-6,0>,<0,0,0>, .6
	texture {pigment{pcolor}}
	finish{ambient .45}
	}
cylinder{<0,6,0>,<0,0,0>, .6
	texture {pigment{pcolor}}
	finish{ambient .45}
	rotate 60*x}
cylinder{<0,-6,0>,<0,0,0>, .6
	texture {pigment{pcolore}}
	finish{ambient .45}
	rotate 60*x}
cylinder{<0,6,0>,<0,0,0>, .6
	texture {pigment{pcolor}}
	finish{ambient .45}
	rotate 120*x}
cylinder{<0,-6,0>,<0,0,0>, .6
	texture {pigment{pcolor}}
	finish{ambient .45}
	rotate 120*x}

cylinder{<-2.75,0,0>,<2.75,0,0>, 2.5
	texture {pigment{scolor}}
	finish{ambient .45}
	}
}
#end

#macro longtank(tcolor,scolor,pcolor)
union{
sphere {<7,8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
cylinder{<7,8,0>,<37,8,0>, 2.5
	texture {pigment{scolor}}
	finish{ambient .45}
	}
sphere {<37,8,0>, 2.5
        pigment {tcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}}
        
#local i = 0;
#while(i<6)
        torus {2.5,.2
                rotate 90*z
                pigment {tcolor}
                finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
                translate <5*i+7,8,0>}
        #local i = i + 1;
#end

#local i = 0;
#while(i<6)
        cylinder{<7,2.5,0>,<37,2.5,0>, .2
        	texture {pigment{tcolor}}
	        finish{ambient .45}
	        rotate 60*i*x translate 8*y}   
        #local i = i + 1;
#end

torus {3,.4
        rotate 90*x
        bounded_by{box{<-3.4,0,-.4>,<0,3.4,.4>}}
        pigment {pcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate <5,5,0>}
torus {3,.4
        rotate 90*x
        bounded_by{box{<3.4,0,-.4>,<0,3.4,.4>}}
        pigment {pcolor}
        finish {ambient .45 diffuse 2 specular 0.1 roughness 0.1}
        translate <39,5,0>}
}
#end

#macro hytank(tcolor,scolor,pcolor)
union{
#local i = 0;
#while(i<6)
        object{longtank(tcolor,scolor,pcolor) rotate 60*i*x}
        #local i = i + 1;
#end

cylinder{<1.5,0,0>,<42.5,0,0>, 5
	texture {pigment{scolor}}
	finish{ambient .45}
	}
cone{<0,0,0>, 2.5
        <1.5,0,0>, 5
	texture {pigment{scolor}}
	finish{ambient .45}
	}
cone{<42.5,0,0>, 5
        <44,0,0>, 2.5
	texture {pigment{scolor}}
	finish{ambient .45}
	}
}
#end