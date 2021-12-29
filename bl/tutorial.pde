class Tutorial{
  Hero hero;
  boolean active; // set to false when tutorial ends
  
  Tutorial(Hero hero){
    this.hero = hero;
    active = true;
  }
  
  boolean checkActive(){
    int x = (int)hero.get_corr().x;
    return x < 1000;
  }
  
  void update(){
    active = checkActive();
  }
  
}
