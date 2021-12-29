class Hero extends GameObj
{
    int level=0 ;
    int super_start_time=0 ; 
    char dir  ;
    private int jump_status = 0 ; 
    GameObj[] objects_array ; 
    int last_time_fire =0 ;
    int screen_height ;
    int drop_rate = 8 ;
    int jump_rate = 7 ;

    public Hero(PImage img , int h , int w , int sh)
    {
        super(10 , sh-(Ground.height+h) ,true , img , h , w ) ; 
        this.set_dir('R') ;
        this.screen_height = sh ;
    }

    public int get_level()
    {
        return this.level ;
    }
    public void set_level(int l)
    {
        this.level = l ;
    }

    public boolean is_super()
    {
        if(this.super_start_time - millis() < 10 * 1000)
            return true ;
        else 
            return false ;
    }
    public void  set_super()
    {
        this.super_start_time = millis() ; 
    }

    private boolean is_touch_ground(  )
    {
        for(Ground gnd : Ground.grounds){
            if(gnd != null){
                // println(gnd.from + " " + this.get_x() + " "+ gnd.to ) ;
                if(this.get_x() > gnd.from  && this.get_x() < gnd.to){
                    if( abs (this.get_y() - (this.screen_height-(Ground.height+this.get_height()) )) <= this.drop_rate ){
                        return true ;
                    }
                }
            }
        }
        // else 
        return false ; 
    }

    public void adj_level(int adj , PImage img_after , int h , int w  )
    {
        this.level = adj ;
        this.change_photo(img_after, h ,w ) ; 
    }

    public void jump_up()
    {
        this.move(0,-this.jump_rate) ;
        this.set_jump_status(this.jump_status - 1 ) ;
    }

    public void walk_right(PImage img )
    {
        this.move(10 , 0) ; 
        if(this.get_dir() != 'R')
            this.change_photo(img , 50 ,50 ) ;
        this.set_dir('R') ;
        
    }
    public void walk_left(PImage img)
    {
        this.move(-10 , 0) ; 
        if(this.get_dir() != 'R')
            this.change_photo(img , 50 ,50 ) ;
        this.set_dir('L') ;

    }
    public void drop_down()
    {
        this.move(0,this.drop_rate) ;
    }

    public void set_jump_status(int i )
    {
        this.jump_status = i ;
    }

    public int check_jump_status()
    {
        return this.jump_status ; 
    }

    // public FireBall fire()
    // {
    //     FireBall ball = new FireBall( this.get_x()  , this.get_y() , 1  ,);
    //     return ball ;  
    // }


    public void draw( PImage[] img_arr , GameObj[] objects_arr ,Evil[] evils )
    {

        // check for evil intersect 
        int tmp =  this.is_intersect(evils, true);
        // println(tmp) ;
        if(tmp == 1 )
        {
            int t = this.get_intersect_obj().get_y() +this.get_intersect_obj().get_height() ;
            println("win");
            // println( t,this.get_intersect_obj().get_x()) ;
            // println(this.get_y() , this.get_x()) ;
        }
        else if (tmp > 0 )
        {   
            println("lose");

            // this.dec_level() ;
        }

        int obj_intersection = this.is_intersect(objects_arr) ; 
       
        if( obj_intersection == 2 )
            this.set_jump_status(0 )  ; 
            
        // if(this.is_intersect(evils) )

        // touching ground and jump power 
        if(!( this.is_touch_ground() || obj_intersection == 1  )  && this.check_jump_status() == 0 )
        {
            this.drop_down(); 
            change_photo(img_arr[2] , 50 , 50 ) ;
        }
        else if( this.check_jump_status() > 0 )
        {
            this.jump_up() ;
            change_photo(img_arr[2] , 50 , 50 ) ;
        }
        else{
            if(this.get_dir()=='R')
                change_photo(img_arr[0] , 50 , 50 ) ;
            else 
                change_photo(img_arr[1] , 50 , 50 ) ;
        }

        


        super.draw() ;
    }

    public int get_last_time_fire()
    {
        return this.last_time_fire ; 
    }
    public void set_last_time_fire(int t)
    {
        this.last_time_fire = t  ; 
    }

    public void dec_level()
    {
        if(this.get_level() > 0)
            this.set_level(this.get_level() -1 );
        else 
            this.lose();
    }

    public void lose()
    {
        println("lose") ;
    }

}