class Snake{
  int mapsize = 1000;
  int squaresize = 25;
  int slength = 6;
  int swinglen = 1;//round(slength/2);
  ArrayList<Integer> MoveQueue = new ArrayList<Integer>();
  boolean down = false;
  int highestcliff = 40;
  boolean loopreg = true;
  boolean firstseek = false;
  boolean moveleftnext = false;
  boolean wasupfirst = false;
  int yoffirstturn = 0;
  boolean returnfirst = false;
  boolean secondseek = false;
  int xoffirstturn = 0;
  boolean returnsecond = false;
  int[][] pos = {{19,19,19,19,19,19},{19,20,21,22,23,24}};//([0][0], [1][0]) = head
  int[] headpos = new int[2];//x, y
  boolean justhit = false;
  boolean dead = false;
  int[] scolor = new int[3];
  int flavor;
  int xdir;
  int ydir;
  char lastmove = 'u';
  boolean hitapplelastmove = false;
  int moves = 0;
  Snake(){

    Build();
  }
  void Build(){
    Show();
  }
  void Show(){
    if(loopreg)
      fill(0, 173, 0);
    else if(firstseek)
      fill(50, 98, 252);
    else if(secondseek)
      fill(179, 30, 30);
    else
      fill(255,0,255);
    for(int i = 0; i < pos[0].length; i++){
      rect(pos[0][i] * squaresize, pos[1][i] * squaresize, squaresize, squaresize);
    }
    fill(0);
    if(lastmove == 'u'){
      rect(pos[0][0] * squaresize + squaresize/5, pos[1][0] * squaresize, squaresize / 5, squaresize / 5);//left eye
      rect(pos[0][0] * squaresize + squaresize/5 * 3, pos[1][0] * squaresize, squaresize / 5, squaresize / 5);//right eye
    }else if(lastmove == 'd'){
      rect(pos[0][0] * squaresize + squaresize/5, pos[1][0] * squaresize + 20, squaresize / 5, squaresize / 5);//left eye
      rect(pos[0][0] * squaresize + squaresize/5 * 3, pos[1][0] * squaresize + 20, squaresize / 5, squaresize / 5);//right eye
    }else if(lastmove == 'l'){
      rect(pos[0][0] * squaresize, pos[1][0] * squaresize + 15, squaresize / 5, squaresize / 5);//left eye
      rect(pos[0][0] * squaresize, pos[1][0] * squaresize + 5, squaresize / 5, squaresize / 5);//right eye
    }else if(lastmove == 'r'){
      rect(pos[0][0] * squaresize + 20, pos[1][0] * squaresize + 15, squaresize / 5, squaresize / 5);//left eye
      rect(pos[0][0] * squaresize + 20, pos[1][0] * squaresize + 5, squaresize / 5, squaresize / 5);//right eye
    }
  }
  void Move(int direction){//left, right, up, down
    if(hitapplelastmove){
      Grow();
      hitapplelastmove = false;
    }
    if(direction == 1){//                                                                        left
      if(!hits(pos[0][0] - 1, pos[1][0])){
        fill(16, 21, 74);
        rect(pos[0][slength - 1] * squaresize, pos[1][slength - 1] * squaresize, squaresize, squaresize); 
        for(int i = slength - 1; i  > 0; i--){// i = length - 1 (index) - last one (-1)
          pos[0][i] = pos[0][i - 1];
          pos[1][i] = pos[1][i - 1];
        }
        pos[0][0] = pos[0][0] - 1;
      }else{
        dead = true;
      }
      lastmove = 'l';
    }else if(direction == 2){//                                                                   right
      if(!hits(pos[0][0] + 1, pos[1][0])){
        fill(16, 21, 74);
        rect(pos[0][slength - 1] * squaresize, pos[1][slength - 1] * squaresize, squaresize, squaresize);
        for(int i = slength - 1; i  > 0; i--){// i = length - 1 (index) - last one (-1)
          pos[0][i] = pos[0][i - 1];
          pos[1][i] = pos[1][i - 1];
        }
        pos[0][0] = pos[0][0] + 1;
      }else{
        dead = true;
      }
      lastmove = 'r';
    }else if(direction == 3){//                                                                  up
      if(!hits(pos[0][0], pos[1][0] - 1)){
        fill(16, 21, 74);
        rect(pos[0][slength - 1] * squaresize, pos[1][slength - 1] * squaresize, squaresize, squaresize);
        for(int i = slength - 1; i  > 0; i--){// i = length - 1 (index) - last one (-1)
          pos[0][i] = pos[0][i - 1];
          pos[1][i] = pos[1][i - 1];
        }
        pos[1][0] = pos[1][0] - 1;
      }else{
        dead = true;
      }
      lastmove = 'u';
    }else if(direction == 4){//                                                                   down
      if(!hits(pos[0][0], pos[1][0] + 1)){
        fill(16, 21, 74);
        rect(pos[0][slength - 1] * squaresize, pos[1][slength - 1] * squaresize, squaresize, squaresize);
        for(int i = slength - 1; i  > 0; i--){// i = length - 1 (index) - last one (-1)
          pos[0][i] = pos[0][i - 1];
          pos[1][i] = pos[1][i - 1];
        }
        pos[1][0] = pos[1][0] + 1;
      }else{
        dead = true;
      }
      lastmove = 'd';
    }else{
      println("oh no" + direction);
    }
    headpos[0] = pos[0][0];
    headpos[1] = pos[1][0];
    moves++;
    Show();
  }
  boolean hits(int x, int y){
    boolean hits = false;
    for(int i = 0; i < slength; i++){
      if((x == pos[0][i] && y == pos[1][i])){
        hits = true;
      }
    }
    if(headpos[0] == -1 || headpos[0] == 40 || headpos[1] == -1 || headpos[1] == 40)
      hits = true;
    return hits;
  }
  void Grow(){
    int[][] oldpos = new int[slength][slength];
    for(int i = 0; i < slength; i++){
      oldpos[0][i] = pos[0][i];
      oldpos[1][i] = pos[1][i];
    }
    slength++;
    pos = new int[slength][slength];
    for(int i = 0; i < slength - 1; i++){
      pos[0][i] = oldpos[0][i];
      pos[1][i] = oldpos[1][i];
    }
    swinglen = ceil((slength + swinglen*3)/40);
    if(swinglen == 0)
      swinglen = 1;
    else if(swinglen >= 37)
      swinglen = 39;
  }

  void SmartMove(){//AI
    if(MoveQueue.isEmpty()){
      if(loopreg){
        if(!down){//up
          if(headpos[0] != 39){
            if(headpos[1] > 1)
                Move(3);
            else{
              Move(2);
              down = true;
            }
          }else{
            if(headpos[1] > 0){
              Move(3);
            }else{
              Move(1);
              down = true;
            }
          }
        }else{//down
          if(headpos[1] != 0){//if not at top
            if(headpos[1] < swinglen){//going up and in loop zone
              if(headpos[1] < 39)
                Move(4);
              else{
                Move(2);
                down = false;
              }
            }else{//going back up but not at loop yet
              Move(2);
              down = false;
            }
          }else{//if at top
            if(headpos[0] > 0)
              Move(1);
            else{//LOOPREG LOOP OVER --------------------------------------------------------------------------------
              Move(4);
              highestcliff = 40;
            }
          }
        }
        //MOVEMENT ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        //CHECKING FOR SEEK >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        if(a.pos[0] == headpos[0] && headpos[1] != 0 && a.pos[1] > headpos[1] && a.pos[1] < highestcliff && a.pos[1] > swinglen){
          firstseek = true;
          loopreg = false;
          xoffirstturn = headpos[0];
        }
      }else if(firstseek){
        if(down || swinglen == 1){
          if(!hitapplelastmove){
            if(returnfirst){
              if(a.pos[1] == headpos[1] && headpos[1] > swinglen + 4 && a.pos[0] > headpos[0]){//if finds second apple for seek 2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
                boolean bodyonright = false;
                for(int i = 1; i < pos[0].length; i++)
                  if(pos[0][i] > headpos[0] && pos[1][i] == headpos[1] - 1)//if body is to right
                    bodyonright = true;
                if(!bodyonright){
                  secondseek = true;
                  firstseek = false;
                  returnfirst = false;
                  Move(2);
                }else{
                  Move(3);
                }
              }else{
                if(headpos[1] <= swinglen){//                       BACK TO LOOP ---------------------------------------------------------------------------------------------
                  down = false;
                  returnfirst = false;
                  firstseek = false;
                  loopreg = true;
                  secondseek = false;
                  returnsecond = false;
                  wasupfirst = false;
                  moveleftnext = false;
                  xoffirstturn = 0;
                }
                else if(headpos[1] == yoffirstturn + 1){
                  Move(2);
                  yoffirstturn = 0;
                }else
                  Move(3);
              }
            }else{//if going out first search
              if(wasupfirst){
                if(moveleftnext){
                  yoffirstturn = headpos[1];
                  Move(1);
                  wasupfirst = false;
                }else{
                  if(!bodyExists(headpos[0] - 1, headpos[1]) && headpos[1] > swinglen + 1){//if body NOT on left and under the swing len
                    println("baka mitai");
                    Move(1);
                    yoffirstturn = headpos[1];
                    wasupfirst = false;
                  }
                  else if(!bodyExists(headpos[0] - 1, headpos[1]))
                    moveleftnext = true;
                  if(a.pos[1] == headpos[1] + 1){//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ queue moves for case where apple is just below the snake's path
                    MoveQueue.add(1);
                    MoveQueue.add(4);
                    MoveQueue.add(2);
                    MoveQueue.add(2);
                    MoveQueue.add(3);
                    MoveQueue.add(3);
                    down = false;
                    returnfirst = false;
                    firstseek = false;
                    loopreg = true;
                    secondseek = false;
                    returnsecond = false;
                    wasupfirst = false;
                    moveleftnext = false;
                    xoffirstturn = 0;
                  }
                  Move(4);
                }
              }else
                Move(4);
            }
          }else{
            if(!returnfirst){
              Move(2);
              returnfirst = true;
            }else{
              Move(3);
            }
          }
        }else{//if going up
          if(headpos[1] > 1)
            Move(3);
          else{
            Move(2);
            down = true;
            wasupfirst = true;
          }
        }
      }else if(secondseek){
        if(returnsecond){
          if(headpos[0] > xoffirstturn + 1 && !bodyExists(headpos[0] - 1, headpos[1])){//if not back on track
            Move(1);
          }else{//if hits back to trail
            Move(3);
            returnfirst = true;
            returnsecond = false;
            firstseek = true;
          }
        }else{
          if(!hitapplelastmove){
            Move(2);
          }else{
            Move(3);
            returnsecond = true;
            highestcliff = headpos[1];
          }
        }
      }
    }else{//if has queued moves -------------------
      Move(MoveQueue.get(0));
      MoveQueue.remove(0);
    }
  }
  boolean bodyExists(int x, int y){
    boolean exists = false;
    for(int i = 0; i < pos[0].length && !exists; i++)
      if(x == pos[0][i] && y == pos[1][i])
        exists = true;
    return exists;
  }
}
