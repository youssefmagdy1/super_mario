static class Ground 
{
    static Ground[] grounds = new Ground[20]  ;
    static int last_index = 0 ;
    private int from  ,to ; 

    
    public  Ground (int _from , int _to  )
    {
        this.from = _from ;
        this.to = _to ;
    }
    public static void insert(int _from , int _to ) {
        grounds[last_index++] = new Ground( _from , _to) ;
    }

    // public  void draw (PImage img ,int h , int height  )
    // {
    //     int i = -1 ; 
    //     int end =0 , start = 0;  
    //     for(Ground gnd : Ground.grounds)
    //     {

    //         image(img , gnd.from ,600-40);
    //         img.resize(gnd.to  , 40 ) ;
    //         // i++ ;
            
    //         // if(gnd != null )
    //         // {
    //         //     // println(gnd) ;
    //         //     if(i == 0 )
    //         //     {
    //         //         // println(2) ; 

    //         //         end = gnd.to ; 
    //         //         start = gnd.from;
    //         //         continue ;   
    //         //     }
    //         //     else {
    //         //         img.copy(start , height-h, (end-start), h 
    //         //                 , gnd.from , height-h , (gnd.to - gnd.from), h);

    //         //         // println(1) ; 
    //         //     }
    //         // }
    //     }
    //     // return img ; 
    // }

}