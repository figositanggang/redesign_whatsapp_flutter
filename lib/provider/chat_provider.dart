import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Chats {
  List<Map> chats = [
    {
      "chat_id": 0,
      "user_name": "Mark Zuckerberg",
      "user_date": DateFormat.jm().format(
        DateFormat("hh:mm:ss")
            .parse("${_now.hour}:${_now.minute}:${_now.second}"),
      ),
      "user_chat_preview": "Hello Mark",
      "user_profile_url":
          "https://res.cloudinary.com/unlinked/image/upload/v1663078784/WhatsApp%20UI%20-%20Flutter%20Project/User%20Profile%20Picture/0x0_y3m1aq.jpg",
      "user_chat": [
        "Oy lek, sehat kau?",
        "Baguslah",
      ],
    },
    {
      "chat_id": 1,
      "user_name": "Ilong Mas",
      "user_date": DateFormat.jm().format(
        DateFormat("hh:mm:ss")
            .parse("${_now.hour}:${_now.minute}:${_now.second}"),
      ),
      "user_chat_preview": "Hello Lon",
      "user_profile_url":
          "https://res.cloudinary.com/unlinked/image/upload/v1663165855/WhatsApp%20UI%20-%20Flutter%20Project/User%20Profile%20Picture/im-580612_bvjvjr.jpg",
      "user_chat": [
        "Oy asw, sehat kau?",
        "Baguslah",
        "Oy asw, sehat kau?",
        "Baguslah",
        "Oy asw, sehat kau?",
        "Baguslah",
        "Oy asw, sehat kau?",
        "Baguslah",
        "Oy asw, sehat kau?",
        "Baguslah",
      ],
    },
  ];
}

class ChatProvider extends ChangeNotifier {
  List<Map> _chats = Chats().chats;
  List<Map> get getChats => _chats;
}

DateTime _now = DateTime.now();

class ChatFormProvider extends ChangeNotifier {
  TextEditingController _controller = TextEditingController();
  TextEditingController get getController => _controller;

  set setController(val) {
    TextSelection prevSelection = _controller.selection;
    _controller = TextEditingController(text: val);
    _controller.selection = prevSelection;
    notifyListeners();
  }
}
