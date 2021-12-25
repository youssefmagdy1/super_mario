///adfaffsdfsfdasfsafd
import java.util.*;
float angle = 0.0, sun_motion = 0.0;
int screen_width = 1000 ; int screen_height = 600 ;
int half_screen = screen_width/2 ; 
int ground_height = 100;
int background_counter = 1;
boolean background_f = true;

int mario_height = 50 ;
int mario_width = 50 ; 

int mario_jump_step = 50 ; // this step is * by 5 
int time_between_fireball = 400 ; // this time is in millesec


// values of keyboard keys 
boolean isShiftPressed = false ,
        isUPPressed = false ,
        isRIGHTPressed = false ,
        isLEFTPressed = false ,
        isDOWNPressed = false ;

// Stack<FireBall> mario_fire = new Stack<FireBall> ;
List<FireBall> mario_fire=new ArrayList<FireBall>();  


GameObj[] shapes = new GameObj[10] ; 
Hero superMario ;  
PImage mario_jump , mario_left , mario_right , fire_ball, sun, moon; 

// PImage gnd , superMarioRed , su ; 
// Ground[] ground = new Ground[20] ; 
PImage gnd , pipe , block, background_day, background_night;

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
    size(1000, 600);
    smooth();
    Ground.height = ground_height ; 


    gnd = loadImage("ground.png" );
    mario_jump = loadImage("mario_jump.png" );
    mario_right= loadImage("mario_left_pos0.png") ;
    mario_left = loadImage("mario_right_pos0.png") ;
    fire_ball = loadImage("fireball.png") ;
    pipe = loadImage("pngegg (2).png") ;
    block = loadImage("pngegg (1).png") ;
    background_day = loadImage("sky_day.jpg");
    background_night = loadImage("sky_night.jpg");
    sun = loadImage("sun.png");
    moon = loadImage("moon.png");
    
    background_day.resize(1000, 600);
    background_night.resize(1000, 600);
    sun.resize(150, 150);
    moon.resize(100, 100);    
    
    
    superMario = new Hero( mario_right , mario_height , mario_width , screen_height) ; 
    Ground.insert(0 ,1000) ;


    shapes[0] = new GameObj(500 , (600-100)-200 , false , pipe , 200 , 200 ) ;
    shapes[1] = new GameObj(300 , (600-100)-100 , false , block , 50 , 50 ) ;

    mario_photos_arr[0] = mario_right ; mario_photos_arr[2] = mario_jump ; mario_photos_arr[1] = mario_left ; 
    // Ground.draw(gnd, 40 , 600 ) ;

    

}

void draw() {

    // background 
    int co = millis();
    if(co > (1000 * background_counter)){
        ++background_counter;
        if(background_f == true)
            background_f = false;
        else
          background_f = true;
    }
    
    if(background_f == true){    
        background(background_day);
        pushMatrix();
        translate(100, 100);
        rotate(angle);
        imageMode(CENTER);
        image(sun, 0, 0);
        angle += 0.01;
        popMatrix();
        imageMode(CORNER);
    }
    else{
        background(background_night);
        imageMode(CENTER);
        image(moon, 100, 100);
        imageMode(CORNER);
     }
    

    // when move to half of screen  translate the screen
    if(superMario.get_x() > half_screen )
    {
        translate( -superMario.get_x() +(screen_width/2) , 0 );
        half_screen = superMario.get_x() ; 
    }
    else 
    {
        translate(-half_screen+(screen_width/2) , 0 ) ;
    }


    // draw the ground
    for(Ground gndObj : Ground.grounds)
    {
        if(gndObj != null )
        {
            image(gnd , gndObj.from , screen_height-Ground.height );
            gnd.resize(gndObj.to , Ground.height );

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
                ball.update(screen_height , Ground.height , mario_height);
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
    // if(keyPressed)
    // {
        // if (key == CODED) {
            // if (keyCode == UP) 
            if (isUPPressed) 
            {
                if(superMario.is_touch_ground(shapes))
                {
                    superMario.set_jump_status(mario_jump_step) ;
                    superMario.change_photo(mario_jump,50,50) ;
                    superMario.jump_up() ;
                }
            }
            // if (keyCode == RIGHT )
            if (isRIGHTPressed)
            {
                if(superMario.is_intersect(shapes) != 3)
                    superMario.walk_right(mario_left) ;
            }
            // if (keyCode == DOWN) 
            if (isDOWNPressed) 
            {
                if(!superMario.is_touch_ground(shapes))
                {
                    superMario.drop_down() ;
                }
            }
            if (isLEFTPressed)
            {
                if (superMario.get_x() > half_screen-screen_width/2)
                    if(superMario.is_intersect(shapes) != 4)
                        superMario.walk_left(mario_right) ;
            }
            // for fire ball 
            if(isShiftPressed)
            {
                if(superMario.get_last_time_fire()+time_between_fireball < millis() )
                {
                    mario_fire.add(new FireBall(1 , superMario.get_x() , superMario.get_y() , 
                                fire_ball , superMario.get_dir())) ;
                    superMario.set_last_time_fire(millis()) ;
                }
            }
        // }
    // }
    
    // println(this.superMario.is_intersect(shapes)) ;
    // draw super mario 
    superMario.draw(mario_photos_arr , shapes) ;


}

void keyPressed() {
  if (keyCode == SHIFT ) isShiftPressed = true;
  if (keyCode == UP ) isUPPressed = true;
  if (keyCode == RIGHT ) isRIGHTPressed = true;
  if (keyCode == LEFT ) isLEFTPressed = true;
  if (keyCode == DOWN ) isDOWNPressed = true;


}
void keyReleased() {
  if (keyCode == SHIFT ) isShiftPressed = false;
  if (keyCode == UP ) isUPPressed = false;
  if (keyCode == RIGHT ) isRIGHTPressed = false;
  if (keyCode == LEFT ) isLEFTPressed = false;
  if (keyCode == DOWN ) isDOWNPressed = false;

}
