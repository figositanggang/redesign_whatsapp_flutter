import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
import 'package:whatsapp_ui/provider/tab_bar_provider.dart';
import 'package:whatsapp_ui/tabView/chat_tabView.dart';
import 'package:whatsapp_ui/theme.dart';
import 'package:ionicons/ionicons.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabBarProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => ChatFormProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
        GestureType.onTapDown,
        GestureType.onTapCancel,
        GestureType.onTapUp,
      ],
      child: MaterialApp(
        home: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: HomePage()),
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("WhatsApp"),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatTabView(),
          Center(
            child: Icon(Icons.abc),
          ),
          Center(
            child: Icon(Icons.abc),
          ),
        ],
      ),
    );
  }

  AppBar MyAppBar(
    String? title,
  ) {
    return AppBar(
      title: Text(
        title!,
        style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(.75)),
      ),
      backgroundColor: appBarColor,
      elevation: 0,
      toolbarHeight: 70,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Ionicons.camera,
            color: Colors.white.withOpacity(.75),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Ionicons.search,
            color: Colors.white.withOpacity(.75),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white.withOpacity(.75),
          ),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: [
          Tab(text: "CHAT"),
          Tab(text: "STATUS"),
          Tab(text: "PANGGILAN"),
        ],
      ),
    );
  }
}
