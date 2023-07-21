//sphere.inc   writjoints by Shuhei Kawachi

#ifndef( N )
   #declare N = 3;
#end 
#ifndef( R_Joints )
   #declare R_Joints = 0.02 / N;
#end
#ifndef( R_Frame )
   #declare R_Frame = 0.02 / N;
#end
#ifndef( Thickness )
   #declare Thickness = R_Frame / 2;
#end
#ifndef( Method )
   #declare Method = 0;
#end
#ifndef( Half )
   #declare Half = 0;
#end

#if( Half )
   #local Joints_Num = 26;
   #local Frame_Num = 65;
   #local Facets_Num = 40;
#else
   #local Joints_Num = 42;
   #local Frame_Num = 120;
   #local Facets_Num = 80;
#end

#local Joints_Data = array[42] { < 0.723607, 0.447214, -0.525731> ,
                              < 0.723607, 0.447214,  0.525731> ,
                              <-0.276393, 0.447214,  0.850651> ,
                              < 0,        1,         0       > ,
                              <-0.894427, 0.447214,  0       > ,
                              <-0.276393, 0.447214, -0.850651> ,
                              < 0.850651, 0.525731,  0       > ,
                              < 0.425325, 0.850651, -0.309017> ,
                              < 0.262866, 0.525731, -0.809017> ,
                              < 0.587785, 0,        -0.809017> ,
                              < 0.951057, 0,        -0.309017> ,
                              < 0.262866, 0.525731,  0.809017> ,
                              < 0.425325, 0.850651,  0.309017> ,
                              < 0.951057, 0,         0.309017> ,
                              < 0.587785, 0,         0.809017> ,
                              <-0.16246,  0.850651,  0.5     > ,
                              <-0.688191, 0.525731,  0.5     > ,
                              < 0,        0,         1       > ,
                              <-0.587785, 0,         0.809017> ,
                              <-0.525731, 0.850651,  0       > ,
                              <-0.16246,  0.850651, -0.5     > ,
                              <-0.688191, 0.525731, -0.5     > ,
                              <-0.951057, 0,        -0.309017> ,
                              <-0.951057, 0,         0.309017> ,
                              <-0.587785, 0,        -0.809017> ,
                              < 0,        0,        -1       > ,
                               
                             -< 0.723607, 0.447214, -0.525731> ,
                             -< 0.723607, 0.447214,  0.525731> ,
                             -<-0.276393, 0.447214,  0.850651> ,
                             -< 0,        1,         0       > ,
                             -<-0.894427, 0.447214,  0       > ,
                             -<-0.276393, 0.447214, -0.850651> ,
                             -< 0.850651, 0.525731,  0       > ,
                             -< 0.425325, 0.850651, -0.309017> ,
                             -< 0.262866, 0.525731, -0.809017> ,
                             -< 0.262866, 0.525731,  0.809017> ,
                             -< 0.425325, 0.850651,  0.309017> ,
                             -<-0.16246,  0.850651,  0.5     > ,
                             -<-0.688191, 0.525731,  0.5     > ,
                             -<-0.525731, 0.850651,  0       > ,
                             -<-0.16246,  0.850651, -0.5     > ,
                             -<-0.688191, 0.525731, -0.5     > }  

#local Frame_Data = array[120][2] { { 1, 7 },   { 1, 8 },   { 1, 9 },   { 1, 10 },  { 1, 11 },
                                  { 2, 7 },   { 2, 12 },  { 2, 13 },  { 2, 14 },  { 2, 15 },
                                  { 3, 12 },  { 3, 16 },  { 3, 17 },  { 3, 18 },  { 3, 19 },
                                  { 4, 8 },   { 4, 13 },  { 4, 16 },  { 4, 20 },  { 4, 21 },
                                  { 5, 17 },  { 5, 20 },  { 5, 22 },  { 5, 23 },  { 5, 24 },
                                  { 6, 9 },   { 6, 21 },  { 6, 22 },  { 6, 25 },  { 6, 26 },
                                  { 7, 8 },   { 7, 11 },  { 7, 13 },  { 7, 14 },  { 8, 9 },
                                  { 8, 13 },  { 8, 21 },  { 9, 10 },  { 9, 21 },  { 9, 26 },
                                  { 10, 11 }, { 10, 26 }, { 11, 14 }, { 12, 13 }, { 12, 15 },
                                  { 12, 16 }, { 12, 18 }, { 13, 16 }, { 14, 15 }, { 15, 18 },
                                  { 16, 17 }, { 16, 20 }, { 17, 19 }, { 17, 20 }, { 17, 24 },
                                  { 18, 19 }, { 19, 24 }, { 20, 21 }, { 20, 22 }, { 21, 22 },
                                  { 22, 23 }, { 22, 25 }, { 23, 24 }, { 23, 25 }, { 25, 26 },
                                   
                                  { 27, 33 }, { 27, 34 }, { 27, 35 }, { 19, 27 }, { 24, 27 },
                                  { 28, 33 }, { 28, 36 }, { 28, 37 }, { 23, 28 }, { 25, 28 },
                                  { 29, 36 }, { 29, 38 }, { 29, 39 }, { 26, 29 }, { 10, 29 },
                                  { 30, 34 }, { 30, 37 }, { 30, 38 }, { 30, 40 }, { 30, 41 },
                                  { 31, 39 }, { 31, 40 }, { 31, 42 }, { 14, 31 }, { 11, 31 },
                                  { 32, 35 }, { 32, 41 }, { 32, 42 }, { 15, 32 }, { 18, 32 },
                                  { 33, 34 }, { 24, 33 }, { 33, 37 }, { 23, 33 }, { 34, 35 },
                                  { 34, 37 }, { 34, 41 }, { 19, 35 }, { 35, 41 }, { 18, 35 },
                                  { 36, 37 }, { 25, 36 }, { 36, 38 }, { 26, 36 }, { 37, 38 },
                                  { 38, 39 }, { 38, 40 }, { 10, 39 }, { 39, 40 }, { 11, 39 },
                                  { 40, 41 }, { 40, 42 }, { 41, 42 }, { 14, 42 }, { 15, 42 } }
                                   
                                   

#local Facets_Data = array[80][3] { { 1, 7, 8 },   { 4, 8, 13 },   { 2, 13, 7 },   { 8, 7, 13 },   { 1, 8, 9 },
                                 { 6, 9, 21 },  { 4, 21, 8 },   { 9, 8, 21 },   { 1, 9, 10 },   { 6, 26, 9 },
                                 { 10, 9, 26 }, { 1, 10, 11 },  { 1, 11, 7 },   { 2, 7, 14 },   { 7, 11, 14 },
                                 { 2, 12, 13 }, { 4, 13, 16 },  { 3, 16, 12 },  { 13, 12, 16 }, { 3, 17, 16 },
                                 { 4, 16, 20 }, { 5, 20, 17 },  { 16, 17, 20 }, { 4, 20, 21 },  { 6, 21, 22 },
                                 { 5, 22, 20 }, { 21, 20, 22 }, { 5, 23, 22 },  { 6, 22, 25 },  { 22, 23, 25 },
                                 { 6, 25, 26 }, { 2, 14, 15 },  { 2, 15, 12 },  { 3, 12, 18 },  { 15, 18, 12 },
                                 { 3, 19, 17 }, { 5, 17, 24 },  { 17, 19, 24 }, { 5, 24, 23 },  { 3, 18, 19 },
                                   
                                 { 27, 34, 33 }, { 30, 37, 34 }, { 28, 33, 37 }, { 34, 37, 33 }, { 27, 35, 34 },
                                 { 32, 41, 35 }, { 30, 34, 41 }, { 35, 41, 34 }, { 27, 19, 35 }, { 32, 35, 18 },
                                 { 19, 18, 35 }, { 27, 24, 19 }, { 27, 33, 24 }, { 28, 23, 33 }, { 33, 23, 24 },
                                 { 28, 37, 36 }, { 30, 38, 37 }, { 29, 36, 38 }, { 37, 38, 36 }, { 29, 38, 39 },
                                 { 30, 40, 38 }, { 31, 39, 40 }, { 38, 40, 39 }, { 30, 41, 40 }, { 32, 42, 41 },
                                 { 31, 40, 42 }, { 41, 42, 40 }, { 31, 42, 14 }, { 32, 15, 42 }, { 42, 15, 14 },
                                 { 32, 18, 15 }, { 28, 25, 23 }, { 28, 36, 25 }, { 29, 26, 36 }, { 25, 36, 26 },
                                 { 29, 39, 10 }, { 31, 11, 39 }, { 39, 11, 10 }, { 31, 14, 11 }, { 29, 10, 26 } } 


#fopen File_Handle "Facets.inc" write
   #write( File_Handle, "#macro Facets_CSG( C1, C2, C3 )\n" )
   #write( File_Handle, "   #local V1 = vnormalize( vcross( C2 - C1, C3 - C2 ) );\n" ) 
   #write( File_Handle, "   #local Dis = abs( vdot( C1, V1 ) );\n" )    
   #write( File_Handle, "   #local V2 = vnormalize( -vcross( V1, C2 - C1 ) );\n" )
   #write( File_Handle, "   #local V3 = vnormalize( -vcross( V1, C3 - C2 ) );\n" )
   #write( File_Handle, "   #local V4 = vnormalize( -vcross( V1, C1 - C3 ) );\n" )  
   #write( File_Handle, "   object {\n" )
   #write( File_Handle, "   intersection {\n" )
   #write( File_Handle, "                  plane { -V1, ( Dis + Thickness / 2 ) }\n" )
   #write( File_Handle, "                  plane { -V1, ( Dis - Thickness / 2 ) inverse }\n" ) 
   #write( File_Handle, "                  plane { V2, vdot( V2, C1 ) }\n" )
   #write( File_Handle, "                  plane { V3, vdot( V3, C2 ) }\n" )
   #write( File_Handle, "                  plane { V4, vdot( V4, C3 ) }\n" )
   #write( File_Handle, "                 }\n" )
   #write( File_Handle, "   clipped_by { box { <min( min( C1.x, C2.x ), C3.x ), min( min( C1.y, C2.y ), C3.y )," )
   #write( File_Handle, " min( min( C1.z, C2.z ), C3.z )> - Thickness," )
   #write( File_Handle, " <max( max( C1.x, C2.x ), C3.x ), max( max( C1.y, C2.y ), C3.y )," )
   #write( File_Handle, " max( max( C1.z, C2.z ), C3.z )> + Thickness } }\n" )
   #write( File_Handle, "   }\n" ) 
   #write( File_Handle, "#end\n\n" )
#fclose File_Handle  


#if( N != 1 )

//++++++++++++++++++++++++ Zahyo no shuturyoku +++++++++++++++++++++++++++++++++;

#macro Interpolate( N1, N2, Num )
   #local V3 = vnormalize( vcross( Joints_Data[N1-1], Joints_Data[N2-1] ) );
   #local D_Theta = degrees( acos( vdot ( Joints_Data[N1-1], Joints_Data[N2-1] ) ) / Num );
   #local Cnt = 1;
   #while( Cnt < Num )
      #write( File_Handle, "#declare C_", N1, "_", N2, "_", Cnt, " = ", vaxis_rotate( Joints_Data[N1-1], V3, Cnt * D_Theta ), ";\n" )
      #local Cnt = Cnt + 1;
   #end
#end

#fopen File_Handle "Zahyo.inc" write
   #local Cnt1 = 0;
   #while( Cnt1 < Joints_Num )
      #write( File_Handle, "#declare C_", Cnt1 + 1, " = ", Joints_Data[Cnt1], ";\n" )
      #local Cnt1 = Cnt1 + 1;
   #end
#fclose File_Handle

#fopen File_Handle "Zahyo.inc" append
   #local Cnt1 = 0;
   #while( Cnt1 < Frame_Num )
      Interpolate( Frame_Data[Cnt1][0], Frame_Data[Cnt1][1], N ) 
      #local Cnt1 = Cnt1 + 1;
   #end
#fclose File_Handle 

#macro Interpolate2( A, V1, V2, Num, J )
   #switch( J )
      #case( 0 ) #declare A = V1; #break
      #case( Num ) #declare A = V2; #break
      #range( 1, Num - 1 )
         #local V3 = vnormalize( vcross( V1, V2 ) );
         #local D_Theta = degrees( acos( vdot ( V1, V2 ) ) / Num ); 
         #declare A = vaxis_rotate( V1, V3, J * D_Theta );
      #break
   #end
#end

#local P = array[N+1][N+1]
#local I = 0;
#local J = 0;
#while ( I < N + 1 )
   #local J = 0;
   #while( J < N + 1 )
      #local P[I][J] = <0, 0, 0>;
      #local J = J + 1;
   #end
   #local I = I + 1;
#end
#local P[0][0] = <0, 0, 0>;
#local Cnt1 = 0; 
#fopen File_Handle "Zahyo.inc" append
   #while( Cnt1 < Facets_Num )
      #local J = 0;
      #while( J < N + 1 )
         Interpolate2( P[0][J], Joints_Data[Facets_Data[Cnt1][0]-1], Joints_Data[Facets_Data[Cnt1][1]-1], N, J )
         #local J = J + 1;
      #end
      #local J = 1;
      #while( J < N + 1 )
         Interpolate2( P[J][J], Joints_Data[Facets_Data[Cnt1][0]-1], Joints_Data[Facets_Data[Cnt1][2]-1], N, J )
         #local J = J + 1;
      #end 
      
      #local J = 1;
      #while( J < N )
         Interpolate2( P[J][N], Joints_Data[Facets_Data[Cnt1][1]-1], Joints_Data[Facets_Data[Cnt1][2]-1], N, J )
         #local J = J + 1;
      #end
      
      #local I = 2;
      #local Tmp_ary = array[3] { <0, 0, 0>, <0, 0, 0>, <0, 0, 0> }
      #while( I < N )
         #local J = 1;
         #while( J < I )
            Interpolate2( Tmp_ary[0], P[0][I], P[I][I], I, J )
            Interpolate2( Tmp_ary[1], P[0][I-J], P[N+J-I][N], N+J-I, J)
            Interpolate2( Tmp_ary[2], P[J][J], P[J][N], N-J, I-J )
            #local P[J][I] = vnormalize( Tmp_ary[0] + Tmp_ary[1] + Tmp_ary[2] );
            #local J = J + 1;
         #end  
         #local I = I + 1;
      #end
      #local I = 2;
      #while( I < N )
         #local J = 1;
         #while( J < I )
            #write( File_Handle, "#declare D_", Cnt1 + 1, "_", J, "_", I, " = ", P[J][I], ";\n" )
            #local J = J + 1;
         #end
         #local I = I + 1;
      #end 
      #local Cnt1 = Cnt1 + 1;
   #end
#fclose File_Handle

#debug "Zahyo.inc is ready.\n"

//+++++++++++++++++++++++++ Joints no shuturyoku +++++++++++++++++++++++++++++++++++;

#fopen File_Handle "Joints.inc" write 
   #write( File_Handle, "#declare Joints = object { union {\n")
   #local Cnt1 = 0;
   #while( Cnt1 < Joints_Num )
      #write( File_Handle, "sphere { C_", Cnt1 + 1, ", R_Joints }\n" )
      #local Cnt1 = Cnt1 + 1;
   #end 
   #local Cnt1 = 0;
   #while( Cnt1 < Frame_Num )
      #local Cnt2 = 1;
      #while( Cnt2 < N )
         #write( File_Handle, "sphere { C_", Frame_Data[Cnt1][0], "_", Frame_Data[Cnt1][1], "_",Cnt2, ", R_Joints }\n" )
         #local Cnt2 = Cnt2 + 1;
      #end
      #local Cnt1 = Cnt1 + 1;
   #end 
#fclose File_Handle

#fopen File_Handle "Joints.inc" append
   #local Cnt1 = 0;
   #while( Cnt1 < Facets_Num )
      #local I = 2;
      #while( I < N )
         #local J = 1;
         #while( J < I )
            #write( File_Handle, "sphere { D_", Cnt1 + 1, "_", J, "_", I, ", R_Joints }\n" )
            #local J = J + 1;
         #end
         #local I = I + 1;
      #end 
      #local Cnt1 = Cnt1 + 1;
   #end
   #write( File_Handle, "}\n}\n" )
#fclose File_Handle

#debug "Joints.inc is ready.\n" 

//+++++++++++++++++++++++ Frame no shuturyoku ++++++++++++++++++++++++++++++++++++

#fopen File_Handle "Frame.inc" write
   #write( File_Handle, "#declare Frame = object { union {\n" )
   #local Cnt1 = 0;
   #while( Cnt1 < Frame_Num )
      #local I = 1;
      #write( File_Handle, "cylinder { C_", Frame_Data[Cnt1][0], ", C_", Frame_Data[Cnt1][0], "_", Frame_Data[Cnt1][1], "_", I, ", R_Frame }\n" )
      #while( I < N - 1 ) 
         #write( File_Handle, "cylinder { C_", Frame_Data[Cnt1][0], "_", Frame_Data[Cnt1][1], "_", I, ", C_", Frame_Data[Cnt1][0], "_", Frame_Data[Cnt1][1], "_", I + 1, ", R_Frame }\n" )
         #local I = I + 1;
      #end
      #write( File_Handle, "cylinder { C_", Frame_Data[Cnt1][0], "_", Frame_Data[Cnt1][1], "_", I, ", C_", Frame_Data[Cnt1][1], ", R_Frame }\n" )
      #local Cnt1 = Cnt1 + 1;
   #end
#fclose File_Handle
                        
#macro Tmp( X, Y, Z )
   #if( X < Y )
      concat( "C_", str( X, 0, 0 ), "_", str( Y, 0, 0 ), "_", str( Z, 0, 0 ) )
   #else
      concat( "C_", str( Y, 0, 0 ), "_", str( X, 0, 0 ), "_", str( N - Z, 0, 0 ) )
   #end
#end

#macro Func( I, J, K )
   #switch( J )
      #case( 0 )
         #switch( K )
            #case( 0 )
               concat( "C_", str( Facets_Data[I][0], 0, 0 ) )
            #break
            #case( N )
               concat( "C_", str( Facets_Data[I][1], 0, 0 ) )
            #break
            #range( 1, N - 1 )
               Tmp( Facets_Data[I][0], Facets_Data[I][1], K )
            #break
         #end 
      #break
      #case( N )
         concat( "C_", str( Facets_Data[I][2], 0, 0 ) )
      #break
      #range( 1, N - 1 )
         #if( K = N )
            Tmp( Facets_Data[I][1], Facets_Data[I][2], J )
         #else
            #if( J = K )
               Tmp( Facets_Data[I][0], Facets_Data[I][2], J )
            #else
               concat( "D_", str( I + 1, 0, 0 ), "_", str( J, 0, 0 ), "_", str( K, 0, 0 ) )
            #end
         #end
      #break
   #end
#end 



#fopen File_Handle "Frame.inc" append
   #local Cnt1 = 0;
   #while( Cnt1 < Facets_Num )
      #local I = 1;
      #while( I < N )
         #local J = 0;
         #while( J < I )
            #write( File_Handle, "cylinder { ", Func( Cnt1, J, I ), ", ", Func( Cnt1, J + 1, I + 1 ), ", R_Frame }\n" )
            #write( File_Handle, "cylinder { ", Func( Cnt1, J + 1, I + 1 ), ", ", Func( Cnt1, J + 1, I ), ", R_Frame }\n" )
            #write( File_Handle, "cylinder { ", Func( Cnt1, J + 1, I ), ", ", Func( Cnt1, J, I ), ", R_Frame }\n" )
            #local J = J + 1;
         #end
         #local I = I + 1;
      #end
      #local Cnt1 = Cnt1 + 1;
   #end
   #write( File_Handle, "}\n}\n" )
#fclose File_Handle

#debug "Frame.inc is ready.\n" 

//++++++++++++++++++++++++ Facets no shuturyoku +++++++++++++++++++++++++++++++++;

#fopen File_Handle "Facets.inc" append
   #write( File_Handle, "#declare Facets = object { union {\n" )
   #local Cnt1 = 0;
   #while( Cnt1 < Facets_Num )
      #local I = 1;
      #while( I < N )
         #local J = 0;
         #while( J < I )
            #if( Method )
               #write( File_Handle, "Facets_CSG( ", Func( Cnt1, J, I ), ", ", Func( Cnt1, J + 1, I + 1 ), ", ", Func( Cnt1, J + 1, I ), " )\n" )
            #else
               #write( File_Handle, "triangle { ", Func( Cnt1, J, I ), ", ", Func( Cnt1, J + 1, I + 1 ), ", ", Func( Cnt1, J + 1, I ), " }\n" )
            #end
            #local J = J + 1;
         #end
         #local I = I + 1;
      #end
      
      #local I = 0;
      #while( I < N )
         #local J = 0;
         #while( J < I + 1 )
            #if( Method )
               #write( File_Handle, "Facets_CSG( ", Func( Cnt1, J, I), ", ", Func( Cnt1, J, I + 1), ", ", Func( Cnt1, J + 1, I + 1 ), " )\n" )              
            #else
               #write( File_Handle, "triangle { ", Func( Cnt1, J, I), ", ", Func( Cnt1, J, I + 1), ", ", Func( Cnt1, J + 1, I + 1 ), " }\n" )
            #end
            #local J = J + 1;
         #end
         #local I = I + 1;
      #end
      
      #local Cnt1 = Cnt1 + 1;
   #end 
      #write( File_Handle, "}\n}\n" )
#fclose File_Handle

#debug "Facets.inc is ready." 

#else

//++++++++++++++++++++++++++++++++ N = 1 no toki ++++++++++++++++++++++++++++++++++++++++++

#fopen File_Handle "Zahyo.inc" write
   #local Cnt1 = 0;
   #while( Cnt1 < Joints_Num )
      #write( File_Handle, "#declare C_", Cnt1 + 1, " = ", Joints_Data[Cnt1], ";\n" )
      #local Cnt1 = Cnt1 + 1;
   #end
#fclose File_Handle

#debug "Zahyo.inc is ready.\n"

#fopen File_Handle "Joints.inc" write
   #write( File_Handle, "#declare Joints = object { union {\n" )
   #local Cnt1 = 0;
   #while( Cnt1 < Joints_Num )
      #write( File_Handle, "sphere { C_", Cnt1 + 1, ", R_Joints }\n" )
      #local Cnt1 = Cnt1 + 1;
   #end
   #write( File_Handle, "}\n}\n" )
#fclose File_Handle

#debug "Joints.inc is ready.\n"

#fopen File_Handle "Frame.inc" write
   #write( File_Handle, "#declare Frame = object { union {\n" )
   #local Cnt1 = 0;
   #while( Cnt1 < Frame_Num )
      #write( File_Handle, "cylinder { C_", Frame_Data[Cnt1][0], ", C_", Frame_Data[Cnt1][1], ", R_Frame }\n" )
      #local Cnt1 = Cnt1 + 1;
   #end
   #write( File_Handle, "}\n}\n" )
#fclose File_Handle

#debug "Frame.inc is ready.\n"

#fopen File_Handle "Facets.inc" append
   #write( File_Handle, "#declare Facets = object { union {\n" )
   #local Cnt1 = 0;
   #while( Cnt1 < Facets_Num )
      #if( Method )
         #write( File_Handle, "Facets_CSG( C_", Facets_Data[Cnt1][0], ", C_", Facets_Data[Cnt1][1], ", C_", Facets_Data[Cnt1][2], " )\n" )
      #else
         #write( File_Handle, "triangle { C_", Facets_Data[Cnt1][0], ", C_", Facets_Data[Cnt1][1], ", C_", Facets_Data[Cnt1][2], " }\n" )
      #end
      #local Cnt1 = Cnt1 + 1;
   #end
      #write( File_Handle, "}\n}\n" )
#fclose File_Handle

#debug "Facets.inc is ready." 

#end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "Zahyo.inc" 
#include "Joints.inc" 
#include "Frame.inc" 
#include "Facets.inc"

         