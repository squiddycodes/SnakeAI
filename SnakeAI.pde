int squaresize = 25;
int mapsize = 1000;//40 by 40
int snum = 4;
Apple a;
Snake s;
void setup() {//runs once at start
 size(1000, 1000);
 background(16, 21, 74);
  for(int x = 0; x < mapsize; x+=squaresize) {//columns
    for(int y = 0; y < mapsize; y+=squaresize) {//rows
      fill(16, 21, 74);
      rect( x, y, squaresize, squaresize );
    }
  }
  a = new Apple();
  s = new Snake();

  for(int i = 0; i < 90; i++)
    s.Grow();
}
int num = 0;
void draw(){
    //print(s.swinglen);
    s.SmartMove();
    if(hitsApple(s, a)){//change 0 to i
      println("Ate apple at " + a.pos[0] + ", " + a.pos[1]);
      s.hitapplelastmove = true;
      //a.MakeNewApple(s.pos);
      switch(num){
        case 0:
          a.MakeNewAppleAt(25,32);
        break;case 1:
          a.MakeNewAppleAt(30,22);
        break;case 2:
          a.MakeNewAppleAt(31,7);//6
        break;case 3:
          a.MakeNewAppleAt(7,4);
        break;case 4:
          a.MakeNewAppleAt(26,34);
        break;case 5:
          a.MakeNewAppleAt(28,35);
        break;case 6:
          a.MakeNewAppleAt(23,6);
        break;case 7:
          a.MakeNewAppleAt(21,5);
        break;
        default:
          a.MakeNewApple(s.pos);
        break;
      }
      num++;
    }
    //delay(150);
  //}
}
void mousePressed(){
  //delay(5000);
  num = 0;
  fill(160);
  Kill();
  //s.Grow();
}
void Kill(){
  for(int i = 0; i < s.pos[0].length; i++)
    rect(s.pos[0][i] * squaresize, s.pos[1][i] * squaresize, squaresize, squaresize);
  a = new Apple();
  s = new Snake();
  for(int i = 0; i < 90; i++)
    s.Grow();
}
/*void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      s.Move(3, false);
    } else if (keyCode == DOWN) {
      s.Move(4, false);
    }
    else if (keyCode == LEFT) {
      s.Move(1, false);
    } else if (keyCode == RIGHT) {
      s.Move(2, false);
    }
  }
  
  for(int i = 0; i < snum - 1; i++){
    if(hitsApple(snakes[i], apples[i])){
      println("Apple hit");
      snakes[i].hitlastmove = true;
      apples[i].MakeNewApple(s.pos);
    }
  }
}*/
boolean hitsApple(Snake s, Apple a){
  boolean hits = false;
  for(int i = 0; i < s.slength; i++){
    if(s.pos[0][i] == a.pos[0] && s.pos[1][i] == a.pos[1]){
      hits = true;
    }
  }
  return hits;
}
