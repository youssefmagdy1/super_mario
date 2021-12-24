///adfaffsdfsfdasfsafd
import java.util.*;

int HEIGHT = 1000 ;
int WIDTH = 1000 ;
int x , temp =0 , temp2 =0 ; 
int half_screen = 400 ; // how the mario go so far half 


boolean isShiftPressed = false ,
        isUPPressed = false ,
        isRIGHTPressed = false ,
        isLEFTPressed = false ,
        isDOWNPressed = false ;

// Stack<FireBall> mario_fire = new Stack<FireBall> ;
List<FireBall> mario_fire=new ArrayList<FireBall>();  


GameObj[] shapes = new GameObj[10] ; 
Hero superMario ;  
PImage mario_jump , mario_left , mario_right , fire_ball; 

// PImage gnd , superMarioRed , su ; 
// Ground[] ground = new Ground[20] ; 
PImage gnd , pipe;

/*
    0=> orignal 
    1=> move right 
    2=> move left 
    3=> jump 
    4=> fire 
    5=> star 
*/
PImage[] mario_photos_arr =  new PImage[6] ; 

void setup() {
    size(800, 600);


    gnd = loadImage("ground.png" );
    mario_jump = loadImage("mario_jump.png" );
    mario_right= loadImage("mario_left_pos0.png") ;
    mario_left = loadImage("mario_right_pos0.png") ;
    fire_ball = loadImage("fireball.png") ;
    pipe = loadImage("pngegg (2).png") ;



    superMario = new Hero( mario_right) ; 
    Ground.insert(0 ,1000) ;


    shapes[0] = new GameObj(500 , (600-100)-88 , false , pipe , 100 , 200 ) ;

    mario_photos_arr[0] = mario_right ; mario_photos_arr[2] = mario_jump ; mario_photos_arr[1] = mario_left ; 
    // Ground.draw(gnd, 40 , 600 ) ;

    

}

void draw() {

    // background 
    background(0, 0, 0);


    // when move to half of screen  translate the screen
    if(superMario.get_x() > half_screen )
    {
        translate( -superMario.get_x() +400 , 0 );
        half_screen = superMario.get_x() ; 
    }
    else 
    {
        translate(-half_screen+400 , 0 ) ;
    }


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
    // Iterator<FireBall> iter =  mario_fire.iterator(); 
    for(FireBall ball : mario_fire)
    {
        // FireBall str = iter.next();
        if(ball != null)
        {
            if(ball.is_intersect(shapes) > 0 ) 
            {
                // iter.remove();
                // mario_fire.remove(ball) ;
                println("done") ;
            }
            else
            {
                ball.update();
                ball.draw() ;
            }
            
        }
        
    }

    // draw shapes 
    for(GameObj shape : shapes)
    {
        if(shape != null)
        {
            // ball.update();
            shape.draw() ;
            
        }
    }


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
                if(superMario.is_intersect(shapes) != 3)
                    superMario.walk_right(mario_left) ;
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
                    if(superMario.is_intersect(shapes) != 4)
                        superMario.walk_left(mario_right) ;
            }
            // for fire ball 
            if(keyCode == SHIFT)
            {
                if(superMario.get_last_time_fire()+300 < millis() )
                {
                    mario_fire.add(new FireBall(1 , superMario.get_x() , superMario.get_y() , 
                                fire_ball , superMario.get_dir())) ;
                    superMario.set_last_time_fire(millis()) ;
                }
            }
        }
    }
    
    // println(this.superMario.is_intersect(shapes)) ;
    // draw super mario 
    superMario.draw(mario_photos_arr , shapes) ;


}

// void keyPressed() {
//   if (keyCode == SHIFT ) isShiftPressed = true;
//   if (keyCode == UP ) isUPPressed = true;
//   if (keyCode == RIGHT ) isRIGHTPressed = true;
//   if (keyCode == LEFT ) isLEFTPressed = true;
//   if (keyCode == DOWN ) isDOWNPressed = true;


// }
// void keyReleased() {
//   if (keyCode == SHIFT) isShiftPressed = false;
//   if (char(keyCode) == 'R') isRPressed = false;
// }

//done
