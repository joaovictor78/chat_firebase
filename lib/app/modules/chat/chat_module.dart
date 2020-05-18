import 'package:be_star/app/modules/chat/chat_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:be_star/app/modules/chat/chat_page.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController(userSelected: i.args.data)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ChatPage(userSelected: args.data)),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
