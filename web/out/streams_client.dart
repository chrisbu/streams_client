// Auto-generated from streams_client.html.
// DO NOT EDIT.

library streams_client_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'chatbox.dart';
import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'dart:async';


// Original code



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
// Additional generated code
void init_autogenerated() {
  var _root = autogenerated.document.body;
  var __chatbox, __sample_container_id;
  var __t = new autogenerated.Template(_root);
  __sample_container_id = _root.query('#sample_container_id');
  __chatbox = __sample_container_id.query('#chatbox');
  __t.component(new ChatBoxComponent.forElement(__chatbox));
  __t.create();
  __t.insert();
}

//@ sourceMappingURL=streams_client.dart.map