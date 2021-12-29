class Tutorial{
  Hero hero;
  boolean active; // set to false when tutorial ends
  PFont font;
  String Message = ("Game Name\nUse The Arrow Keys To Move\nL-shift To Throw Fire");
  
  Tutorial(Hero hero){
    this.hero = hero;
    active = true;
    font = loadFont("data/Ravie-48.vlw");
    textFont(font);
    
  }
  
  boolean checkActive(){
    int x = (int)hero.get_corr().x;
    return x < 1000;
  }
  
  void update(){
    active = checkActive();
    //textFont(font, 48);
    fill(0,130,255);
    textAlign(CENTER);
    text(Message, 500, 100);
  }
  
}