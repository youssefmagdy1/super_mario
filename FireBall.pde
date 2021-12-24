class FireBall extends GameObj
{
    int from = 0  ; // 1=> is for hero 
                    // 0=> is for evil  

     PImage img ; 

    float theta = 0.0;  // Start angle at 0
    float amplitude = 5.0;  // Height of wave

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

    public void update()
    {
        int temp = Math.round( sin(this.theta)*15) ;
        // edit x 
        if(this.get_dir() == 'L')
            this.move(-4,0) ;  
        else 
            this.move(4,0) ;  
            
        // edit y  
        /* edit this  to mario/2  */
        // if (this.get_y() < 600-25 +100 )
        //     this.move(0,5) ;
        // else 
            this.set_y(470 + temp ) ;
            // this.move(0 , sin(theta) *20 );
        // if(this.get_y() < 300)

        // println(this.get_x() + " "+this.get_y() + " " + temp ) ;
        this.theta += 0.2 ; 
    }

}