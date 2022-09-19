import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Chats {
  List<Map> chats = [
    {
      "chat_id": 0,
      "user_name": "David",
      "user_date": DateFormat.jm().format(
        DateFormat("hh:mm:ss")
            .parse("${_now.hour}:${_now.minute}:${_now.second}"),
      ),
      "user_chat_preview": "Hello Mark",
      "user_profile_url":
          "https://res.cloudinary.com/unlinked/image/upload/v1663078784/WhatsApp%20UI%20-%20Flutter%20Project/User%20Profile%20Picture/0x0_y3m1aq.jpg",
      "user_chat": [
        {
          "time": _now,
          "user": "user",
          "chat": "halo mark",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
      ],
    },
    {
      "chat_id": 1,
      "user_name": "Andy",
      "user_date": DateFormat.jm().format(
        DateFormat("hh:mm:ss")
            .parse("${_now.hour}:${_now.minute}:${_now.second}"),
      ),
      "user_chat_preview": "Hello Lon",
      "user_profile_url":
          "https://res.cloudinary.com/unlinked/image/upload/v1663165855/WhatsApp%20UI%20-%20Flutter%20Project/User%20Profile%20Picture/im-580612_bvjvjr.jpg",
      "user_chat": [
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
        {
          "time": _now,
          "user": "user",
          "chat": "halo elon",
        },
        {
          "time": _now,
          "user": "other",
          "chat": "halo juga",
        },
      ],
    },
  ];
}

class ChatProvider extends ChangeNotifier {
  List<Map> _chats = Chats().chats;
  List<Map> get getChats => _chats;
  // set addChat(List val) {
  //   _chats[val[0]]["user_chat"].add(val[1]);
  //   notifyListeners();
  // }
  addChat(chat, id) {
    _chats[id]["user_chat"].add(chat);
    notifyListeners();
  }

  ScrollController _scrollController = ScrollController();
  double scrollPos = 300;
  ScrollController get getScrollController => _scrollController;
  set setScrollController(val) {
    scrollPos = val;
    notifyListeners();
  }
}

DateTime get _now => DateTime.now();

class ChatFormProvider extends ChangeNotifier {
  TextEditingController _controller = TextEditingController();
  TextEditingController get getController => _controller;

  set setController(val) {
    TextSelection prevSelection = _controller.selection;
    _controller = TextEditingController(text: val);
    try {
      _controller.selection = prevSelection;
    } catch (e) {}
    notifyListeners();
  }
}

List userBottomSheet = ["user", "other"];

class ChatBottomSheetProvider extends ChangeNotifier {
  String _value = userBottomSheet[0];
  String get getValue => _value;
  set setValue(val) {
    _value = val;
    notifyListeners();
  }
}
