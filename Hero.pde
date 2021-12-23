class Hero extends GameObj
{
    int level ;
    int super_start_time=0 ; 
    char dir  ;
    private int jump_status = 0 ; 
    GameObj[] objects_array ; 

    public Hero(String img)
    {
        super(10 , 600-80 ,true , img , 50 , 50) ; 

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

    //  private boolean is_touch_ground(GameObj[] objects_array , Ground[] groundArr )
    private boolean is_touch_ground( )
    {
        // if(this.is_intersect(this.objects_array) > 0 )
        //     return true ;
        for(Ground gnd : Ground.grounds)
            if(gnd != null)
                if(this.get_x() > gnd.from  && this.get_x() < gnd.to)
                    if(this.get_y() == 600-80)
                        return true ;
        // else 
        return false ; 
    }

    public void adj_level(int adj , String img_after )
    {
        this.level = adj ;
        this.change_photo(img_after) ; 
    }

    public void jump(int x , int y   )
    {
        int temp = this.check_jump_status(); 
        // should jump 50 so will call this function 5 time each time with 10 step should put with 6 
        if(this.is_touch_ground())
        {
            println("touch") ;
            this.set_jump_status(30) ;
            move(x,y);
        }
        else if (temp != 0 )
        {
            if(temp > 0 )
            {
                println("not") ;
                // if(temp != 1 )
                    this.set_jump_status(this.jump_status - 1 ) ;
                // else 
                    // this.set_jump_status(-30) ;

                move(x,y) ;
            }
            else 
            {
                println("wah") ;
                this.set_jump_status(this.jump_status + 1 ) ;
                move(x,-y) ;
    
            }
        }
        else if (this.get_y() < 600-80) 
        {
            println("yes") ;
            move(0,-y) ;
            this.set_jump_status(-30) ;
        }
        // delay(100) ;

    }
    public void jump_up()
    {
        this.jump(0,-5) ;
    }
    public void jump_right()
    {
        this.jump(5,-5) ;
    }
    public void jump_left()
    {
        this.jump(-5,-5) ;
    }

    public void walk_right()
    {
        this.move(10 , 0) ; 
    }
    public void walk_left()
    {
        this.move(-10 , 0) ; 
    }
    public void drop_down()
    {
        this.move(0,-5) ;
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
    //     FireBall ball = new FireBall( this.get_x()  , this.get_y() , 1 );
    //     return ball ;  
    // }


    public void draw( )
    {
        // if(this.check_jump_status() > 0 && !this.is_touch_ground() )
        println("rrr") ;
        if(this.check_jump_status() !=  0  ){
            println("JUMP") ;
            this.jump(0,-5) ;
        }
        // else if (!this.is_touch_ground() )
        //     this.drop_down();
        else 
            super.draw() ;
    }


}