static class Intersect{

    static int check (GameObj obj1 , GameObj obj2 )
    {
       int obj1_x = obj1.get_x()  ,
           obj1_y = obj1.get_y() ,
           obj1_h = obj1.get_height() ,
           obj1_w = obj1.get_width() ;

       int obj2_x = obj2.get_x()  ,
           obj2_y = obj2.get_y() ,
           obj2_h = obj2.get_height() ,
           obj2_w = obj2.get_width() ;


        

        //down
        // obj1 hit obj2 from bottom 
        if(  obj1_y+obj1_h == obj2_y 
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

        // left 
        else if ( obj1_x == obj2_x 
            &&(   (obj1_y >= obj2_y && obj1_y <= obj2_y+obj2_h  ) 
                ||( obj1_y+obj1_h >= obj2_y && obj1_y+obj1_h <= obj2_y+obj2_h  ) 
            )
        )
            return 3 ;


        //right 
        else if ( obj1_x == obj2_x +obj2_w
            &&(   (obj1_y >= obj2_y && obj1_y <= obj2_y+obj2_h  ) 
                ||( obj1_y+obj1_h >= obj2_y && obj1_y+obj1_h <= obj2_y+obj2_h  ) 
            )
        )
            return 4 ;  


        else 
            return -1 ;
        
        


    }


}