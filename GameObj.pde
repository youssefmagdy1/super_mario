import java.util.Arrays;  

class GameObj {

    public PImage img ;
    protected int x_pos , y_pos ;
    protected char dir ;
    protected float img_scale ;
    public boolean is_move , is_vis; 
    

    public GameObj(int _x , int _y , boolean _is_move , PImage img, int h , int w)
    {
        this.set_coordintes(_x,_y ); 
        this.is_move = _is_move ; 
        this.change_photo(img,h,w) ; 

        // this.set_height(height);
        // this.set_width(width) ; 


    }
    void  set_coordintes(int _x , int _y )
    {
        this.x_pos = _x ;
        this.y_pos = _y ;
    }

    
    // method to set position and get 
    int get_x()
    {
        return this.x_pos  ;
    }
    void set_x(int x)
    {
        this.x_pos =x ; 
    }
    void set_y(int y)
    {
        this.y_pos =y ; 
    }
    int get_y()
    {
        return this.y_pos  ;
    }

    // method used in resize and get demention 
    int get_height()
    {
        return this.img.height ;
    }
    int get_width()
    {
        return this.img.width ;
    }
    void resize(int x , int y )
    {
        this.img.resize(x,y) ; 
    }


    void change_photo(PImage  _img , int h , int w )
    {
        this.img = _img ; 
        if(h!= -1 && w != -1  )
            this.resize(h,w) ;
    }

    /* check if intersect 
        1=> form bottom 
        2=> from top 
        3=> from right
        4=> from left 
        -1 =>  didn't intersect  
    */
    int is_intersect (GameObj[] objects_array)
    {
        int temp =-1 ;
        if(objects_array != null)
            for(GameObj obj : objects_array)
            {
                if(obj != null)
                {
                    temp = Intersect.check(this , obj) ;
                    if (temp > 0 )
                        break ;  
                }         
            }
        return temp ;
    } 
    

    // method to draw how much the object will move in x dir and y dir 
    void move (int x , int y )
    {
        this.set_x(this.get_x() + x);
        this.set_y(this.get_y() + y);
        // this.draw() ; 
    }

    public void draw()
    {
        image(this.img , this.get_x() , this.get_y(), this.get_height() , this.get_width()) ; 
    } 

    public char get_dir()
    {   
        return this.dir ; 
    }

    public void  set_dir(char _dir  )
    {
        this.dir = _dir ;
    }

}
