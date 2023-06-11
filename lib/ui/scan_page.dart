import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_holticulture_4/constants/constants_value.dart';
import 'package:smart_holticulture_4/ui/screens/monitoring/plant_aglaonema.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String realTimeValue = '0';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute (builder: (BuildContext context) => PlantAglaonema(),),);
                      },
                      icon: Icon(
                        Icons.share,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons_ui/scan_image.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Tap to Scan',
                        style: TextStyle(
                          color: Constants.primaryColor.withOpacity(.80),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            left: 20,
            child: Center(
              child: Container(
                color: Colors.red,
                child: FutureBuilder(
                  future: _fApp,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something wrong with Firebase", style: TextStyle(color: Colors.white),);
                    } else if (snapshot.hasData) {
                      return const Text("Info : Firebase Initialized", style: TextStyle(color: Colors.white),);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
