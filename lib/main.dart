import 'package:flutter/material.dart';
import 'package:flutter_application_3/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  static const Color lightBG = Color(0xffFAFAFA);
  static const Color lightFG = Color(0xff262626);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Instagram Clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String activePage = 'home';

  void placeholderFunc() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          height: 30,
          child: Text(widget.title)
          ),
        backgroundColor: MyApp.lightBG,
        foregroundColor: MyApp.lightFG,
        titleSpacing:  MediaQuery.of(context).size.width * 0.25 + 11,
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.25),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.081,
                  height: MediaQuery.of(context).size.height * 0.035,
                  child: const TextField (
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      isCollapsed: true,
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    ),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      activePage = 'home';
                    });
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: Icon(activePage == 'home' ? Icons.home : Icons.home_outlined),
                  tooltip: "Home Page",
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const TestPage(title: 'Test Page');
                    }));
                  },
                  icon: const Icon(Icons.chat_bubble_outline),
                  tooltip: "Messenger",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_box_outlined),
                  tooltip: "New Posts",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.explore_outlined),
                  tooltip: "Find People",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                  tooltip: "Activity Feed",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_outlined),
                  tooltip: "Profile",
                ),
              ],
            ),
          ),
        ],
        // flexibleSpace: const Text("placeholder"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 1,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.020),
            child: Row(
              children: <Widget> [
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
