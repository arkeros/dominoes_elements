library dominoes_elements.board;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'dominoes_tile.dart';

@CustomTag('dominoes-board')
class DominoesBoard extends PolymerElement {  
  int rootIndex = 0;
  
  DominoesBoard.created() : super.created() {
    rootIndex = tiles.indexOf(root);
    int i = -2 * rootIndex;

    for(DominoesTile tile in tiles) {
      if (tile.id != "root") {
        tile.id = "tile$i";
      }
      i += 2;
    }
    
    print(this.tiles);    
    print(rootIndex);
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
