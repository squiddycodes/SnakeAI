class Apple{
  int mapsize = 1000;
  int squaresize = 25;
  int[] pos = new int[2];//x, y
  Apple(){
    int[][] tempsnk = {{420},{420}};
    MakeNewAppleAt(19,5);
  }
  void MakeNewApple(int[][] snakepos){
    int randx = (int)random(25,39);//0-39
    int randy = (int)random(30,39);//0-39
    boolean found = false;
    while(!found){
      found = true;
      randx = (int)random(0,39);//0-39
      randy = (int)random(0,39);//0-39
      try{
      for(int i = 0; i < snakepos[0].length; i++){
        if(randx == snakepos[0][i] && randy == snakepos[1][i]){
          found = false;
        }
      }
      }catch(Exception e){}
    }
    fill(207, 64, 45);
    //rect(randx*squaresize, randy*squaresize, squaresize, squaresize);
    ellipse(randx*squaresize + squaresize/2,randy*squaresize + squaresize/2, 20, 20);
    pos[0] = randx;
    pos[1] = randy;
  }
  void MakeNewAppleAt(int x, int y){
    fill(207, 64, 45);
    ellipse(x*squaresize + squaresize/2,y*squaresize + squaresize/2, 20, 20);
    //rect(x*squaresize, y*squaresize, squaresize, squaresize);
    pos[0] = x;
    pos[1] = y;
  }
}
