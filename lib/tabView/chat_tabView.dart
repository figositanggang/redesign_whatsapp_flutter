import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
import 'package:whatsapp_ui/screen/chat_screen.dart';

class ChatTabView extends StatefulWidget {
  const ChatTabView({Key? key}) : super(key: key);

  @override
  State<ChatTabView> createState() => _ChatTabViewState();
}

class _ChatTabViewState extends State<ChatTabView> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        children: List.generate(
          chatProvider.getChats.length,
          (index) {
            var chat = chatProvider.getChats[index];
            return _Chat(
              user_profile_url: chat["user_profile_url"],
              user_name: chat["user_name"],
              user_chat_preview: chat["user_chat_preview"],
              user_date: chat["user_date"],
              user_chat: chat["user_chat"],
              chat_id: chat["chat_id"],
            );
          },
        ),
      ),
    );
  }
}

class _Chat extends StatelessWidget {
  final int chat_id;
  final String user_profile_url;
  final String user_name;
  final String user_chat_preview;
  final String user_date;
  final user_chat;

  const _Chat({
    Key? key,
    required this.user_profile_url,
    required this.user_name,
    required this.user_chat_preview,
    required this.user_date,
    required this.user_chat,
    required this.chat_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: ListTile(
            tileColor: Color.fromARGB(37, 198, 250, 255),
            leading: GestureDetector(
              child: CircleAvatar(
                radius: 27,
                backgroundImage: NetworkImage(user_profile_url),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Image.network(user_profile_url),
                    );
                  },
                );
              },
            ),
            title: Text(
              user_name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              user_chat_preview,
              style: TextStyle(color: Colors.white.withOpacity(.75)),
            ),
            trailing: Text(
              user_date,
              style: TextStyle(color: Colors.white.withOpacity(.75)),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  user_profile_url: user_profile_url,
                  user_name: user_name,
                  user_chat_preview: user_chat_preview,
                  user_date: user_date,
                  user_chat: user_chat,
                  chat_id: chat_id,
                ),
              ),
            );
          },
          hoverColor: Colors.white.withOpacity(.1),
          focusColor: Colors.white.withOpacity(.1),
          highlightColor: Colors.white.withOpacity(.1),
        ),
        Divider(
          color: Colors.white.withOpacity(.1),
          height: 0,
        ),
      ],
    );
  }
}
