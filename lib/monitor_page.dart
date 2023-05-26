import 'package:flutter/material.dart';

class MonitorHomePage extends StatefulWidget {
  const MonitorHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MonitorHomePage();

}

class _MonitorHomePage extends State<MonitorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar.medium(
            centerTitle: true,
            title: const Text("Monitor", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24
            ),
            ),
            backgroundColor: Colors.white30,
          ),
          SliverToBoxAdapter(
            child: Scrollbar(
                thickness: 10,
                trackVisibility: true,
                child:
                Container(
                  color: Colors.white,
                  child: const SizedBox(
                    height: 1000,
                    child:
                    Text("ini adalah tampilan monitor"),
                  ),
                )
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 75,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.blue,
                child: Text("1"),
              ),
              Container(
                color: Colors.pink,
                child: Text("2"),
              ),
              Container(
                color: Colors.yellow,
                child: Text("3"),
              ),
              Container(
                color: Colors.red,
                child: Text("4"),
              ),
              Container(
                color: Colors.black,
                child: Text(
                  "Desired Appbar Conainer  number 5, which will stuck\n there instead of the sliverappbar sliver example when it reached to the top ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text("6"),
              ),
              Container(
                color: Colors.blue,
                child: Text("7"),
              ),
              Container(
                color: Colors.yellow,
                child: Text("8"),
              ),
              Container(
                color: Colors.blue,
                child: Text("9"),
              ),
              Container(
                color: Colors.pink,
                child: Text("10"),
              ),
              Container(
                color: Colors.blue,
                child: Text("11"),
              ),
              Container(
                color: Colors.yellow,
                child: Text("12"),
              ),
              Container(
                color: Colors.blue,
                child: Text("13"),
              ),
              Container(
                color: Colors.purpleAccent,
                child: Text("14"),
              ),
              Container(
                color: Colors.white,
                child: Text("15"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}