class Evil extends GameObj
{

    int step = 3 ; 
    int screen_height ; 
    int drop_rate = 7 ; 

    public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh)
    {
        super(_x , _y , true , img , _h , _w  );
        this.set_dir('L') ;
        this.screen_height= _sh  ;
    }

    private boolean is_touch_ground(GameObj[] objects_arr  )
    {
        if(this.is_intersect(objects_arr ) == 1 )
            return true ;

        for(Ground gnd : Ground.grounds){
            if(gnd != null){
                if(this.get_x() > gnd.from  && this.get_x() < gnd.to){
                    if( abs (this.get_y() - (this.screen_height-(Ground.height+this.get_height()) )) <= this.drop_rate ){
                        return true ;
                    }
                }
            }
        }
        return false ; 
    }

    public void update (GameObj[] objects_arr)
    {
        int temp = this.is_intersect(objects_arr,true) ;
        // t
        // println(this.get_x() , this.index.get_x() ,  this.index.get_height());
        if(temp > 0 ){
            println(temp ) ;
        println( this.get_x() , this.index.get_x() ,  this.index.get_width());
        println( this.get_y() ,  this.get_height() ,  this.index.get_y() , this.index.get_height());

        }
        if( temp == 3 )
            this.set_dir('L');
        if( temp == 4 )
            this.set_dir('R') ;

        if(this.get_dir()=='L')
            move(-this.step,0) ;
        else 
            move(this.step ,0) ;

        if(!is_touch_ground(objects_arr))
            move(0,this.drop_rate)  ;  
    }
}