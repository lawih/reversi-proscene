import remixlab.proscene.*;
import remixlab.bias.event.*;

TranslatedBoard graphicBoard;
Scene scene;
Tile tile;
int size = 8;

void setup(){
  size(800, 600, P3D); // window size
  scene = new Scene(this); // create a Scene instance
  scene.setAxesVisualHint(false); // hide axis
  scene.setGridVisualHint(false); // hide grid
  
  graphicBoard = new TranslatedBoard( size );  
}

void draw() {
  background(0);
  lights(); // lights on
  
  spotLight(150, 150, 150, scene.camera().position().x(), scene.camera().position().y(), scene.camera().position().z(), 0, 0, -1, 1, 20);
  spotLight(100, 100, 100, scene.camera().position().x(), scene.camera().position().y(), scene.camera().position().z(), 0, 0, 1, 1, 20);
  
  graphicBoard.update();
  scene.drawFrames();
  scene.beginScreenDrawing();
  drawText();
  scene.endScreenDrawing();
}

public void drawText() {
  fill(#BBBBBB); 
  // Skipped and player 
  textSize(12); 
  fill(#EEEEEE);
  text("Press 's' to show possible moves, 'n' to start a new game.", 5, height - 5);
  String player = (graphicBoard.player == 'W' ? "White" : "Black");
  text( player + ", you go.", 5, height - 20);
  textSize(20);
  if(graphicBoard.player == 'W')
    fill(#FADE69);
  text( "White tiles: " + graphicBoard.board.whiteTiles, 5, 20);
  fill(#EEEEEE);
  if(graphicBoard.player == 'B')
    fill(#FADE69);
  text( "Black tiles: " + graphicBoard.board.blackTiles, 5, 45);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    graphicBoard.setShowingMoves();
  } else if (key == 'n' || key == 'N') {    
    graphicBoard.clear(); 
  } 
}