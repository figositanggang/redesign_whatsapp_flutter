import 'package:flutter/material.dart';
import 'package:whatsapp_ui/theme.dart';
import 'package:whatsapp_ui/widget/chat_screen_widgets.dart';

class ChatScreen extends StatefulWidget {
  final int chat_id;
  final String user_profile_url;
  final String user_name;
  final String user_chat_preview;
  final String user_date;
  final user_chat;

  const ChatScreen({
    Key? key,
    required this.user_profile_url,
    required this.user_name,
    required this.user_chat_preview,
    required this.user_date,
    required this.user_chat,
    required this.chat_id,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Expanded(
            child: ChatDisplay(
              chat_id: widget.chat_id,
            ),
          ),
          ChatForm(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      titleSpacing: -10,
      elevation: 10,
      backgroundColor: appBarColor,
      title: Row(
        children: [
          _avatarAppBar(),
          SizedBox(width: 5),
          Text(
            widget.user_name,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _avatarAppBar() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.user_profile_url),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Image.network(widget.user_profile_url),
            );
          },
        );
      },
    );
  }
}
