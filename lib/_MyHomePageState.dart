import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  int myIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body:
        CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar.medium(
              centerTitle: true,
              title: const Text("Beranda", style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24
                ),
              ),
              backgroundColor: Colors.lightGreenAccent.withOpacity(0.9),
            ),
            const SliverToBoxAdapter(
              child: Scrollbar(
                thumbVisibility: true,
                  thickness: 10,
                  trackVisibility: true,
                  child:
                  SizedBox(
                    height: 1000,
                    child:
                    Text("ini adalah penampilan data"),
                  )
              ),
            ),
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.lightGreenAccent,
            label: "Beranda"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor),
            backgroundColor: Colors.lightBlueAccent,
            label: "Monitor"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.lime,
            label: "Akun"
          )
        ],
      ),
    );
  }
}