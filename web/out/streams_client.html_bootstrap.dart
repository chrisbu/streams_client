library bootstrap;

import 'package:web_ui/watcher.dart' as watcher;
import 'streams_client.dart' as userMain;

main() {
  watcher.useObservers = false;
  userMain.main();
  userMain.init_autogenerated();
}