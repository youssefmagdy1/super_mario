static class Intersect{

    static int check (GameObj obj1 , GameObj obj2 , boolean  debug)
    {
       int obj1_x = obj1.get_x()  ,
           obj1_y = obj1.get_y() ,
           obj1_h = obj1.get_height() ,
           obj1_w = obj1.get_width() ;

       int obj2_x = obj2.get_x()  ,
           obj2_y = obj2.get_y() ,
           obj2_h = obj2.get_height() ,
           obj2_w = obj2.get_width() ;


        //    boolean check = obj1.get_width() < obj2.get_width();
        //     int obj1_x,obj1_y,obj1_h,obj1_w,obj2_x,obj2_y,obj2_h,obj2_w;
        //     if(check){
        //         // to insure that the first object i always the smallest in width.
        //         obj1_x = obj1.get_x() ;
        //         obj1_y = obj1.get_y() ;
        //         obj1_h = obj1.get_height() ;
        //         obj1_w = obj1.get_width() ;

        //         obj2_x = obj2.get_x()  ;
        //         obj2_y = obj2.get_y() ;
        //         obj2_h = obj2.get_height() ;
        //         obj2_w = obj2.get_width() ;

        //     }else{
                
        //         obj2_x = obj1.get_x()  ;
        //         obj2_y = obj1.get_y() ;
        //         obj2_h = obj1.get_height() ;
        //         obj2_w = obj1.get_width() ;

        //         obj1_x = obj2.get_x()  ;
        //         obj1_y = obj2.get_y() ;
        //         obj1_h = obj2.get_height() ;
        //         obj1_w = obj2.get_width() ;
        //     }


        
        if(debug)
        {
            // println(obj2_h , obj2_w , obj2_x , obj2_y ) ;
            // println(obj1_h , obj1_w , obj1_x , obj1_y ) ;
        }

        // right 
        if ( abs(obj1_x+obj1_w  - obj2_x ) < 7 
            &&(   (obj1_y >= obj2_y && obj1_y <= obj2_y+obj2_h  ) 
                ||( obj1_y+obj1_h >= obj2_y && obj1_y+obj1_h <= obj2_y+obj2_h  ) 
            )
        )
            return 3 ;


        //left 
        else if (   obj1_x == obj2_x + obj2_w 
            &&(   (obj1_y >= obj2_y && obj1_y <= obj2_y+obj2_h  ) 
                ||( obj1_y+obj1_h >= obj2_y && obj1_y+obj1_h <= obj2_y+obj2_h  ) 
            )
        )
            return 4 ;  

        //down
        // obj1 hit obj2 from bottom 
        else if( abs( obj1_y + obj1_h - obj2_y )< 4  
            &&( (obj1_x >= obj2_x && obj1_x <= obj2_x+obj2_w  ) 
                ||( obj1_x+obj1_w >= obj2_x && obj1_x+obj1_w <= obj2_x+obj2_w  ) 
            )
        ) 
            return 1 ;

        // up  
        else if(  obj1_y == obj2_y +obj2_h
            &&( (obj1_x >= obj2_x && obj1_x <= obj2_x+obj2_w  ) 
                ||( obj1_x+obj1_w >= obj2_x && obj1_x+obj1_w <= obj2_x+obj2_w  ) 
            )
        ) 
            return 2 ;

        


        else 
            return -1 ;
        
        


    }


}