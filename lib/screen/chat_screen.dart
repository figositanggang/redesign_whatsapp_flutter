import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
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
      appBar: _appBar(context),
      body: Column(
        children: [
          Expanded(
            child: ChatDisplay(
              chat_id: widget.chat_id,
            ),
          ),
          ChatForm(
            chat_id: widget.chat_id,
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final chatFormProv = Provider.of<ChatFormProvider>(context);

    return AppBar(
      titleSpacing: -10,
      elevation: 10,
      backgroundColor: appBarColor,
      leading: IconButton(
        icon: Icon(Ionicons.arrow_back),
        onPressed: () {
          chatFormProv.setController = "";
          Navigator.pop(context);
        },
      ),
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
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: scaffoldColor,
              context: context,
              barrierColor: scaffoldColor.withOpacity(.75),
              builder: (context) {
                return _MyBottomSheet();
              },
            );
          },
          icon: Icon(Ionicons.settings_outline),
        ),
      ],
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

class _MyBottomSheet extends StatelessWidget {
  const _MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        color: scaffoldColor,
        border: Border(top: BorderSide(color: Colors.white.withOpacity(.25))),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            userBottomSheet.length,
            (index) {
              var user = userBottomSheet[index];
              return _radio(
                context,
                user,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _radio(BuildContext context, String user) {
    final radioProv = Provider.of<ChatBottomSheetProvider>(context);

    return RadioListTile(
      title: Text(user),
      value: user,
      groupValue: radioProv.getValue,
      onChanged: (val) {
        radioProv.setValue = val;
        Navigator.pop(context);
      },
    );
  }
}
