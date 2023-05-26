import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();

}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar.medium(
            centerTitle: true,
            title: const Text("Profil", style: TextStyle(
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
                    Text("ini adalah tampilan profil"),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}