/* autogenerated by Processing revision 1277 on 2021-12-24 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.*;
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
int x , temp =0 , temp2 =0 ; 
int half_screen = 400 ; // how the mario go so far half 

// Stack<FireBall> mario_fire = new Stack<FireBall> ;
List<FireBall> mario_fire=new ArrayList<FireBall>();  


GameObj[] shapes = new GameObj[10] ; 
Hero superMario ;
PImage mario_jump , mario , fire_ball; 
// PImage gnd , superMarioRed , su ; 
// Ground[] ground = new Ground[20] ; 
PImage gnd ;

/*
    0=> orignal 
    1=> move right 
    2=> move left 
    3=> jump 
    4=> fire 
    5=> star 
*/
PImage[] mario_photos_arr =  new PImage[6] ; 

 public void setup() {
    /* size commented out by preprocessor */;


    gnd = loadImage("ground.png" );
    mario_jump = loadImage("mario_jump.png" );
    mario = loadImage("superMario.png") ;
    fire_ball = loadImage("fireball.png") ;



    superMario = new Hero( mario) ; 
    Ground.insert(0 ,1000) ;
    // Ground.insert(190 ,220) ;
    // Ground.insert(200 ,600) ;


   mario_photos_arr[0] = mario ; mario_photos_arr[1] = mario_jump ; 
    // Ground.draw(gnd, 40 , 600 ) ;

    

}

 public void draw() {

    // background 
    background(0, 0, 0);


    // when move to half of screen  translate the screen
    if(superMario.get_x() > half_screen )
    {
        translate( -superMario.get_x() +400 , 0 );
        half_screen = superMario.get_x() ; 
    }
    else 
        translate(-half_screen+400 , 0 ) ;



    // draw the ground
    for(Ground gndObj : Ground.grounds)
    {
        if(gndObj != null )
        {
            image(gnd , gndObj.from ,600-100);
            gnd.resize(gndObj.to , 100);

            // image(gnd , gndObj.from ,600-40);
            // temp = gnd.width ; 
            // temp2 = gndObj.to - gndObj.from ; 
            // while(temp2 < temp)
            // {
            //     image(gnd , gndObj.from+temp2 ,600-100);
            //     temp2+= temp ; 
            // }
            // image(gnd , gndObj.from+temp2 , 600-100);
            // gnd.resize(gndObj.to , 100);
        }
    }

    // move the fireballs 
    // for(FireBall ball : mario_fire)
    // {
    //     if(ball != null)
    //     {
    //         ball.update();
    //         ball.draw() ;

            
    //     }
    // }

    // move mario on key press 
    if(keyPressed)
    {
        if (key == CODED) {
            if (keyCode == UP) 
            {
                if(superMario.is_touch_ground(shapes))
                {
                    superMario.set_jump_status(20) ;
                    superMario.change_photo(mario_jump,50,50) ;
                    superMario.jump_up() ;
                }
            }
            if (keyCode == RIGHT )
            {
                if(superMario.is_intersect(shapes) != 4)
                    superMario.walk_right() ;
            }
            if (keyCode == DOWN) 
            {
                if(!superMario.is_touch_ground(shapes))
                {
                    superMario.drop_down() ;
                }
            }
            if (keyCode == LEFT )
            {
                if (superMario.get_x() > half_screen-399)
                    if(superMario.is_intersect(shapes) != 3)
                        superMario.walk_left() ;
            }
            if(keyCode == SHIFT)
            {
                mario_fire.add(new FireBall(1 , superMario.get_x() , superMario.get_y() , 
                                fire_ball , superMario.get_dir())) ;
            }
        }
    }
    

    // draw super mario 
    superMario.draw(mario_photos_arr , shapes) ;


}
class FireBall extends GameObj
{
    int from = 0  ; // 1=> is for hero 
                    // 0=> is for evil  

     PImage img ; 

    float theta = 0.0f;  // Start angle at 0
    float amplitude = 5.0f;  // Height of wave

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


     public void change_photo(PImage  _img , int h , int w )
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
     public int is_intersect (GameObj[] objects_array)
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

    public char get_dir()
    {   
        return this.dir ; 
    }

    public void  set_dir(char _dir  )
    {
        this.dir = _dir ;
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
class Hero extends GameObj
{
    int level ;
    int super_start_time=0 ; 
    char dir  ;
    private int jump_status = 0 ; 
    GameObj[] objects_array ; 

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


  public void settings() { size(800, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "super_mario" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
