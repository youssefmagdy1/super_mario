class FireBall extends GameObj
{
    int from = 0  ; // 1=> is for hero 
                    // 0=> is for evil  

     PImage img ; 

    float theta = 0.0;  // Start angle at 0
    float amplitude = 5.0;  // Height of wave

    int h = 20 ; 
    int w = 20 ; 
    int step = 5 ; 

    // float period = 500.0;  // How many pixels before the wave repeats
    // float dx;  // Value for incrementing X, a function of period and xspacing
    // float[] yvalues; 


    public FireBall (int from , int x , int y, PImage img , char dir )
    {
        super(x ,y ,true , img , 20 , 20 ) ;
        this.set_from(from) ;
        this.set_dir(dir) ;
    }
    public void set_from(int f )
    {
        this.from = f;
    }
    public int from()
    {
        return this.from ; 
    }

    public void update(int sh , int gh , int mh)
    {
        int temp = Math.round( sin(this.theta)*200) ;
        // edit x 
        if(this.get_dir() == 'L')
            this.move(-this.step,0) ;  
        else 
            this.move(this.step,0) ;  
            
        // edit y  
        /* edit this  to mario/2  */
        if (this.get_y() < sh-gh-mh/2 )
        {
            this.move(0,this.step-2) ;
            this.theta = 3.14 ; 
        }
        else 
        {
            this.set_y(sh-gh-mh/2 + temp ) ;
            this.theta += 0.1 ; 

        }
            // this.move(0 , sin(theta) *20 );
        // if(this.get_y() < 300)

        // println(this.get_x() + " "+this.get_y() + " " + temp ) ;
    }

}