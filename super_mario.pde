int HEIGHT = 1000 ;
int WIDTH = 1000 ;
int x ; 
GameObj test , test2 ;
GameObj[] arr = new GameObj[10] ; 
Hero superMario ;
PImage gnd ; 
// Ground[] ground = new Ground[20] ; 

void setup() {
    size(720, 600);
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

void draw() {
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
