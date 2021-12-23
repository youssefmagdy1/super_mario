int x ; 
GameObj test , test2 ;
GameObj[] arr = new GameObj[10] ; 

void setup() {
    size(512, 512);
    // PImage = loadImage("superMario.jpeg");
     test = new GameObj(20 ,20,true,"superMario.jpeg" , 50 , 50 ) ; 
     test2 = new GameObj(60 ,500,true,"superMario.jpeg" , 50 , 50 ) ; 
     arr[0] = test2 ;
}

void draw() {
    background(0, 0, 0);
    test.draw(0,10);
    test2.draw(0,0);

    // print(arr) ; 
       // image(test.img, 20+x, 20, 20, 20);

    // x+= 10 ; 

}
