import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
import 'package:whatsapp_ui/theme.dart';

class ChatForm extends StatelessWidget {
  const ChatForm({Key? key}) : super(key: key);

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
            ElevatedButton(
              onPressed: () {
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
            ),
          ],
        ),
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

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: List.generate(
              chatProv.getChats[chat_id]["user_chat"].length,
              (index) {
                final chat = chatProv.getChats[chat_id]["user_chat"][index];
                return _chat(chat: chat);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _chat({required String chat}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(2),
            width: 50,
            child: Text(chat),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
