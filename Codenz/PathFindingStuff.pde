class PathFinding{
  public PathFinding(HexagonMovement movement_){
      movement = movement_;     
  }
  
  //this is the most basic algorithm, it starts by setting all the hexagonals density to 1
  //then sets the density of the blocked hexagonals to a constant BLOCKED_DENSITY.
  //And sum the constant, SIDE_BLOCKED_DENSITY, to all 6 hexagonals at the sides of the blocked one.
  //Finally, it will move to the hexagonal in wich, the sum of the path in a straight line until the end of the board, is shorter
  
  public int getNextPosition(Coord pos){  
      int possible_pos[] = new int[6];
      int dir            = -1;                        //For return
      Coord temp         = new Coord(pos);            //Buffer for test if Hex is locked
      
      //Array for all 6 possible move locations
      possible_pos[movement.UP_RIGHT]   = sumDirectionDensity(pos,movement.UP_RIGHT);
      possible_pos[movement.UP_LEFT]    = sumDirectionDensity(pos,movement.UP_LEFT);
      possible_pos[movement.SIDE_LEFT]  = sumDirectionDensity(pos,movement.SIDE_LEFT);
      possible_pos[movement.SIDE_RIGHT] = sumDirectionDensity(pos,movement.SIDE_RIGHT);
      possible_pos[movement.DOWN_LEFT]  = sumDirectionDensity(pos,movement.DOWN_LEFT);
      possible_pos[movement.DOWN_RIGHT] = sumDirectionDensity(pos,movement.DOWN_RIGHT);
      

      //check if direction is't blocked
      while(true)
      {
        temp.set(pos);                                                           //reset inital position
        dir = LowestPositiveIndex(possible_pos,6);                               
        if (dir==movement.NONE) {return dir;};                                   //return -1 if rat is trap(every element is -1)
        movement.move(temp,dir); 
        if(!movement.isValidField(temp))  {possible_pos[dir] = -1;  continue;}   //movement invalid, go to next one
        if((pf.markedHexagons[temp.x][temp.y]&pf.HEX_BLOCKED)== 0)               //check for blocked hexagon
          break;
        possible_pos[dir] = -1;
      }
      
      return dir;
  }
  
  public void resetAllDensity()                                                   //Initialize all hexes to the default density
  {
    density = new int[movement.maxright+1][movement.maxbottom+1];                 //Only needed in case of there is a reset on the size of field
    
    for (int x = 0; x <= movement.maxright; x++)
        for (int y = 0; y <= movement.maxbottom; y++)
            density[x][y] = DEFAULT_DENSITY;
  }
  
  //need to be called every time there is a valid click
  public void setDensityBlockHex(int x, int y){
    Coord temp = new Coord(x,y);
    density[x][y] = BLOCKED_DENSITY;
    
    for(int i = 0;i<=5;i++){
      movement.move(temp,i);
      if(movement.isValidField(temp))
        density[temp.x][temp.y] += SIDE_BLOCKED_DENSITY;
      temp.x = x;
      temp.y = y;
    }
  }
  
  //Sum all hexs in 1 directions until reach the boarder
  private int sumDirectionDensity(Coord pos,int move_type){
    int result = 0;
    Coord temp = new Coord(pos);
    
    movement.move(temp,move_type);            //do not sum the density of the hex player
    while(movement.isValidField(temp)){
      result += density[temp.x][temp.y];
      movement.move(temp,move_type);
    }
    return result;
  }
  
  //index of Lowest number BIGGER THEN -1 in int array
  private int LowestPositiveIndex(int [] arr1,int size){  
    int index = movement.NONE;
    int min = 1000000;
    for (int i=0; i<size; i++){
        if (arr1[i] < min && arr1[i] >movement.NONE){
            min = arr1[i];
            index = i;
        }
    }
    return index ;
  }
 
  //constants for desity, this will influence the "bot"
  //need to be optimized
  private final int BLOCKED_DENSITY = 5;
  private final int SIDE_BLOCKED_DENSITY = 3;
  private final int DEFAULT_DENSITY = 1;
  
  private HexagonMovement movement;
  private int density[][];
}
