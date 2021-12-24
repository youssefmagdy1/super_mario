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
        super(x ,y ,true , img , 5 , 5 ) ;
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

    // public int update()
    // {
        // if()
    
    // }
}