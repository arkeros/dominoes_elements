library dominoes_elements.tile;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('dominoes-tile')
class DominoesTile extends PolymerElement {  
  @published int left = 0;
  @published int right = 0;
  
  DominoesTile.created() : super.created();
  
  @ComputedProperty('left + right')
  int get value => readValue(#value);
  
  @ComputedProperty('left == right')
  bool get isDouble => readValue(#isDouble);
}