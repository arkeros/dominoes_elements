library dominoes_elements.board;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'dominoes_tile.dart';

@CustomTag('dominoes-board')
class DominoesBoard extends PolymerElement {  
  int rootIndex = 0;
  
  DominoesBoard.created() : super.created() {
    rootIndex = tiles.indexOf(root);
    
    int i = leftmostId;
    for(DominoesTile tile in tiles) {
      if (tile.id != "root")
        tile.id = "tile$i";
      
      if (i == 8) {
        tile.vertical = true;     
        tile.swapped = false;
        
        i += 2;
      } else {        
        tile.vertical = ((7 < i && i < 12) || (-12 < i && i < -7)) != tile.isDouble;
        tile.swapped = i < -11 || 11 < i;
        
        i += tile.isDouble ? 1 : 2;
      }      
    }
    
    print(this.tiles);    
    print(rootIndex);
  }
  
  int get leftmostId {
    int id = -2 * rootIndex;
    for(int i = 0;tiles[i].id != 'root';i++) {
      if (tiles[i].isDouble)
        id++;
    }
    return id;
  }
  
  List<DominoesTile> get tiles {
    return $['tiles'].getDistributedNodes();    
  }
  
  DominoesTile get root {
    for(DominoesTile tile in tiles) {
      if (tile.id == "root")
        return tile;
    }
    
    DominoesTile default_root = tiles[tiles.length ~/ 2]; 
    default_root.id = "root";
    return default_root;
  }
}
