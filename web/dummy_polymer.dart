import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('dummy-polymer')
class DummyPolymer extends PolymerElement {
  @observable String color = "red";
  @observable String title;
  @observable num clicks = 0;
  Element titleElement;
  
  DummyPolymer.created() : super.created() {
    var root = getShadowRoot('dummy-polymer');
    root.applyAuthorStyles = true;
  }
  
  void enteredView() {
    super.enteredView();
    titleElement = $['title'];
  }
  
  void changeColor(Event e, var detail, Node target){
    clicks++;
    
    if (color == "red") {
      color = "green";
    } 
    else if (color == "green") {
      color = "blue";
    }
    else {
      color = "red";
    }
    titleElement.style.backgroundColor = color;
  }
  
}