import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'dart:async';


/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;  
  var stream = getChatStream();
  
  Timer.run(() {
    var chatbox = query("#chatbox");
    stream.pipe(query("#chatbox").xtag);
  });
      
      
  
}


Stream<ChatMessage> getChatStream() {
  final messages = [new ChatMessage("Tom", "My dog has no nose"),
                    new ChatMessage("Sally", "Really, how does he smell?"),
                    new ChatMessage("Tom", "Terrible!")];
  
  var controller = new StreamController<ChatMessage>();
   
 
  var counter = 0;
  new Timer.periodic(new Duration(seconds:1), (timer) {
    if (messages.length > 0) {
      var message = messages.removeAt(0); // pull the first message of the list
      message.timestamp = new DateTime.now();
      controller.add(message);
    }
    else {
      controller.close();
      timer.cancel();
    }
  });
  
  return controller.stream;
}

class ChatMessage {
  final String from;
  final String message;
  DateTime timestamp;
 
  ChatMessage(this.from, this.message);
      
}