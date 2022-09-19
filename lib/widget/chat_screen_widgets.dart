import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
import 'package:whatsapp_ui/theme.dart';

class ChatForm extends StatefulWidget {
  final int chat_id;
  const ChatForm({Key? key, required this.chat_id}) : super(key: key);

  @override
  State<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  @override
  Widget build(BuildContext context) {
    final _chatFormProv = Provider.of<ChatFormProvider>(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 8),
        decoration: BoxDecoration(color: scaffoldColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller: _chatFormProv.getController,
                  onChanged: (val) {
                    _chatFormProv.setController = val;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    hintText: "Ketik Pesan",
                  ),
                ),
              ),
            ),
            _sendMessage(context),
          ],
        ),
      ),
    );
  }

  // Send Message Button
  Widget _sendMessage(BuildContext context) {
    final _chatFormProv = Provider.of<ChatFormProvider>(context);
    final _chatProv = Provider.of<ChatProvider>(context);
    final _chatBottomSheetProv = Provider.of<ChatBottomSheetProvider>(context);

    addChat() {
      if (_chatFormProv.getController.text.toString() != "") {
        _chatProv.addChat(
          {
            "time": DateTime.now(),
            "user": _chatBottomSheetProv.getValue.toString(),
            "chat": _chatFormProv.getController.text.toString(),
          },
          widget.chat_id,
        );
        _chatFormProv.setController = "";
      }
    }

    return ElevatedButton(
      onPressed: () {
        addChat();
        FocusScope.of(context).unfocus();
      },
      child: Icon(
        Ionicons.send,
        size: 20,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

class ChatDisplay extends StatelessWidget {
  final int chat_id;

  const ChatDisplay({
    Key? key,
    required this.chat_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProv = Provider.of<ChatProvider>(context);
    final _lengthChat = chatProv.getChats[chat_id]["user_chat"].length;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          chatProv.setScrollController = notification.metrics.pixels;
          return true;
        },
        child: ListView(
          controller: chatProv.getScrollController,
          children: List.generate(
            _lengthChat,
            (index) {
              final chat = chatProv.getChats[chat_id]["user_chat"][index];
              return _chat(
                chat: chat["chat"],
                user: chat["user"],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _chat({required String chat, required String user}) {
    return Column(
      children: [
        Align(
          alignment:
              user == "user" ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(chat),
            decoration: BoxDecoration(
              color: appBarColor.withRed(20),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
