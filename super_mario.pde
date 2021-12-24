//alllllllllllllllllo
int HEIGHT = 1000 ;
int WIDTH = 1000 ;
int x ; 
GameObj test , test2 ;
GameObj[] shapes = new GameObj[10] ; 
Hero superMario ;
// PImage gnd , superMarioRed , su ; 
// Ground[] ground = new Ground[20] ; 

void setup() {
    size(720, 600);

    superMario = new Hero("superMario.png" ) ; 
    Ground.insert(0 ,200) ;
    Ground.insert(200 ,220) ;
    Ground.insert(220 ,300) ;


    gnd = loadImage("ground.png" );
    Ground.draw(gnd, 40 , 600 ) ;



}

void draw() {
    background(0, 0, 0);

    //draw the ground  
    image(gnd , 0 , 600-40  ) ;
    gnd.resize(Ground.grounds[0].to , 40) ;

    // draw the shapes 

    
    if(keyPressed)
    {
        if (key == CODED) {
            if (keyCode == UP) 
            {
                if(superMario.is_touch_ground())
                {
                    superMario.set_jump_status(20) ;
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
                if(!superMario.is_touch_ground())
                {
                    superMario.drop_down() ;
                }
            }
            if (keyCode == LEFT )
            {
                if(superMario.is_intersect(shapes) != 3)
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

//aaaaahhhhhhhhh
