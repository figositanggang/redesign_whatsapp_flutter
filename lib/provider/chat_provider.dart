import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChatProvider extends ChangeNotifier {
  List<Map> _chats = Chats().chats;
  List<Map> get getChats => _chats;
}

DateTime _now = DateTime.now();

class Chats {
  List<Map> chats = [
    {
      "user_name": "Mark Zuckerberg",
      "user_date": DateFormat.jm().format(
        DateFormat("hh:mm:ss")
            .parse("${_now.hour}:${_now.minute}:${_now.second}"),
      ),
      "user_chat_preview": "Hello Mark",
      "user_profile_url":
          "https://res.cloudinary.com/unlinked/image/upload/v1663078784/WhatsApp%20UI%20-%20Flutter%20Project/User%20Profile%20Picture/0x0_y3m1aq.jpg",
      "user_chat": {
        "user": [],
        "another_user": [],
      },
    },
  ];
}
