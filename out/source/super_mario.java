/* autogenerated by Processing revision 1277 on 2021-12-23 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.Arrays;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class super_mario extends PApplet {

int HEIGHT = 1000 ;
int WIDTH = 1000 ;
int x ; 
GameObj test , test2 ;
GameObj[] arr = new GameObj[10] ; 
Hero superMario ;
PImage gnd ; 
// Ground[] ground = new Ground[20] ; 

 public void setup() {
    /* size commented out by preprocessor */;
    // PImage = loadImage("superMario.jpeg");
    //  test = new GameObj(20 ,20,true,"superMario.png" , 50 , 50 ) ; 
    //  test2 = new GameObj(60 ,500,true,"superMario.png" , 50 , 50 ) ; 
    //  arr[0] = test2 ;
    superMario = new Hero("superMario.png" ) ; 
    Ground.insert(0 ,200) ;
    Ground.insert(200 ,220) ;
    Ground.insert(220 ,300) ;
    // ground[0] = new Ground(0 , 200 ) ; 
    // ground[1] = new Ground(200 , 220 ) ; 
    // ground[2] = new Ground( 220, 300 ) ; 
    // print(Ground.grounds.from) ;
    // for(Ground gnd : Ground.grounds)
    // {
    //     if(gnd != null)
    // }
    gnd = loadImage("ground.png" );
    Ground.draw(gnd, 40 , 600 ) ;



}

 public void draw() {
    background(0, 0, 0);

    image(gnd , 0 , 600-40  ) ;
    gnd.resize(Ground.grounds[0].to , 40) ;
    
    if(keyPressed)
    {
        if (key == CODED) {
            if (keyCode == UP) 
            {
                superMario.jump_up() ;
            }
            if (keyCode == RIGHT )
            {
                superMario.walk_right() ;
            }
            if (keyCode == DOWN) 
            {
                superMario.drop_down() ;
            }
            if (keyCode == LEFT )
            {
                superMario.walk_left() ;
            }
        }
    }
    
    superMario.draw() ;

    // superMario.move(1 ,0 ) ; 
    // test.move(0,10);
    // test2.move(0,0);

    // print(arr) ; 
       // image(test.img, 20+x, 20, 20, 20);

    // x+= 10 ; 

}
  

class GameObj {

    public PImage img ;
    protected int x_pos , y_pos ;
    protected char dir ;
    protected float img_scale ;
    public boolean is_move , is_vis; 
    

    public GameObj(int _x , int _y , boolean _is_move , String img, int h , int w)
    {
        this.set_coordintes(_x,_y ); 
        this.is_move = _is_move ; 
        this.change_photo(img) ; 
        this.resize(h,w) ;

        // this.set_height(height);
        // this.set_width(width) ; 


    }
     public void  set_coordintes(int _x , int _y )
    {
        this.x_pos = _x ;
        this.y_pos = _y ;
    }

    
    // method to set position and get 
     public int get_x()
    {
        return this.x_pos  ;
    }
     public void set_x(int x)
    {
        this.x_pos =x ; 
    }
     public void set_y(int y)
    {
        this.y_pos =y ; 
    }
     public int get_y()
    {
        return this.y_pos  ;
    }

    // method used in resize and get demention 
     public int get_height()
    {
        return this.img.height ;
    }
     public int get_width()
    {
        return this.img.width ;
    }
     public void resize(int x , int y )
    {
        this.img.resize(x,y) ; 
    }


     public void change_photo(String  _img )
    {
        this.img = loadImage(_img) ; 
    }

    /* check if intersect 
        1=> form bottom 
        2=> from top 
        3=> from right
        4=> from left 
        -1 =>  didn't intersect  
    */
     public int is_intersect (GameObj[] objects_array)
    {
        int temp =-1 ;
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
     public void move (int x , int y )
    {
        this.set_x(this.get_x() + x);
        this.set_y(this.get_y() + y);
        // this.draw() ; 
    }

    public void draw()
    {
        image(this.img , this.get_x() , this.get_y() , this.get_height() , this.get_width()) ; 
    } 


}
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

    public static void draw (PImage img ,int h , int height  )
    {
        int i = -1 ; 
        int end =0 , start = 0;  
        for(Ground gnd : Ground.grounds)
        {
            i++ ;
            
            if(gnd != null )
            {
                // println(gnd) ;
                if(i == 0 )
                {
                    // println(2) ; 

                    end = gnd.to ; 
                    start = gnd.from;
                    continue ;   
                }
                else {
                    img.copy(start , height-h, (end-start), h 
                            , gnd.from , height-h , (gnd.to - gnd.from), h);

                    // println(1) ; 
                }
            }
        }
        // return img ; 
    }

}
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
static class Intersect{

     public static int check (GameObj obj1 , GameObj obj2 )
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


  public void settings() { size(720, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "super_mario" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
