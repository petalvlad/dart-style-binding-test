import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dummy_polymer.dart';

@CustomTag('container-polymer')
class ContainerPolymer extends PolymerElement {
  PolymerElement firstPolymer, secondPolymer, currentPolymer;
  Element container;
  
  ContainerPolymer.created() : super.created();
  
  void enteredView() {
    super.enteredView();
    container = $['container'];
  }
  
  void first(Event e, var detail, Node target) {
    showFirst(false);
  }
  
  void firstPrepared(Event e, var detail, Node target) {
    showFirst(true);
  }
  
  void showFirst(bool prepare) {
    if (firstPolymer == null) {
      DummyPolymer dummyPolymer = new Element.tag("dummy-polymer");
      dummyPolymer.title = "first";
      firstPolymer = dummyPolymer;
    }
    
    if (currentPolymer != firstPolymer) {
      if (secondPolymer != null) {
        secondPolymer.remove();
      }
      
      if (prepare) {
        firstPolymer.prepareElement();  
      }
      currentPolymer = firstPolymer;
      container.children.add(firstPolymer); 
    }
  }
  
  void second(Event e, var detail, Node target){
    if (currentPolymer != secondPolymer) {
      DummyPolymer dummyPolymer = new Element.tag("dummy-polymer");
      dummyPolymer.title = "second";
      secondPolymer = dummyPolymer;
      if (firstPolymer != null) {
        firstPolymer.remove();
      }

      currentPolymer = secondPolymer;
      container.children.add(secondPolymer);
    }
  }
  
}