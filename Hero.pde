class Hero extends GameObj
{
    int level ;
    int super_start_time=0 ; 
    char dir  ;
    private int jump_status = 0 ; 
    GameObj[] objects_array ; 
    int last_time_fire =0 ;

    public Hero(PImage img)
    {
        super(10 , 600-(100+30) ,true , img , 50 , 50) ; 
        this.set_dir('R') ;

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

    private boolean is_touch_ground(GameObj[] objects_arr  )
    {
        if(this.is_intersect(this.objects_array) == 1 )
            return true ;
        for(Ground gnd : Ground.grounds){
            if(gnd != null){
                // println(gnd.from + " " + this.get_x() + " "+ gnd.to ) ;
                if(this.get_x() > gnd.from  && this.get_x() < gnd.to){
                    if(this.get_y() == 600-(100+30)){
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
        this.move(0,-5) ;
        this.set_jump_status(this.jump_status - 1 ) ;
    }

    public void walk_right()
    {
        this.move(10 , 0) ; 
        this.set_dir('R') ;
    }
    public void walk_left()
    {
        this.move(-10 , 0) ; 
        this.set_dir('L') ;

    }
    public void drop_down()
    {
        this.move(0,5) ;
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


    public void draw( PImage[] img_arr , GameObj[] objects_arr)
    {
        if(!this.is_touch_ground(objects_arr)  && this.check_jump_status() == 0 )
            this.drop_down(); 
        else if( this.check_jump_status() > 0 )
            this.jump_up() ;
        else 
            change_photo(img_arr[0] , 50 , 50 ) ;

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


}