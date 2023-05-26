import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _DashBoardPage();
  
}

class _DashBoardPage extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightGreen.shade50,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            floating: true,
            pinned: true,
            expandedHeight: 160.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Beranda", style: TextStyle(color: Colors.green),),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child:
              Center(
                child: Text("Mempelajari beberapa tanaman hias yang menarik."),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 75,
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20
                ),
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
              Expanded(child: Text("app")),
              Container(
                color: Colors.red,
                child: Text("4"),
              ),
              Container(
                color: Colors.red,
                child: Text("4"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
