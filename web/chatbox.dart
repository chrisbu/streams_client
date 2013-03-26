import 'package:web_ui/web_ui.dart';
import 'dart:async';
import 'package:web_ui/watcher.dart' as watchers;

class ChatBoxComponent extends WebComponent implements StreamConsumer {  
  List messages = new List();
  final completer = new Completer();
  
  /**
   * Returns the total number of messages received in the future
   */
  Future consume(Stream stream) {
    stream.listen(_onMessage, 
        onError: _onError, 
        onDone: _onDone,
        unsubscribeOnError: true);
    
    return completer.future;
  }
  
  _onMessage(message) {
    messages.add(message);
    watchers.dispatch();
    print("${message.timestamp} -  ${message.from}: ${message.message}");

  }
  
  _onError(error) {
    //TODO: render error notification
    print("Error: $error");
  }
  
  _onDone() {
    completer.complete(messages);
    watchers.dispatch();
  }
}


