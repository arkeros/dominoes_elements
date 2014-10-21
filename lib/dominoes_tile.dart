library dominoes_elements.tile;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('dominoes-tile')
class DominoesTile extends PolymerElement {  
  @PublishedProperty(reflect: true) int left = 0;
  @PublishedProperty(reflect: true) int right = 0;
  @PublishedProperty(reflect: true) bool vertical = false;
  @PublishedProperty(reflect: true) bool raised = false;
  @PublishedProperty(reflect: true) bool swapped = false;
  @PublishedProperty(reflect: true) bool flipped = false;
  
  DominoesTile.created() : super.created();
  
  @ComputedProperty('left + right')
  int get value => readValue(#value);
  
  @ComputedProperty('left == right')
  bool get isDouble => readValue(#isDouble);
  
  String toString() {
    return "[$left·$right]";  
  }
}