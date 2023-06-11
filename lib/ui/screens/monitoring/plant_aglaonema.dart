import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PlantAglaonema extends StatefulWidget {
  const PlantAglaonema({super.key});

  @override
  State<PlantAglaonema> createState() => _PlantAglaonemaState();
}

class _PlantAglaonemaState extends State<PlantAglaonema> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('tanaman');
  PlantData? realTimeValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          final dynamic snapshotValue = event.snapshot.value;
          if (snapshotValue is Map<String, dynamic>) {
            final Map<String, dynamic> data = snapshotValue;
            realTimeValue = PlantData(
              name: data['name'],
              temp: data['temp'],
              humy: data['humy'],
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Monitoring Page',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (realTimeValue != null)
                Text(
                  'Plant Name: ${realTimeValue!.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              if (realTimeValue != null)
                Text(
                  'Temperature: ${realTimeValue!.temp}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              if (realTimeValue != null)
                Text(
                  'Humidity: ${realTimeValue!.humy}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantData {
  final String name;
  final String temp;
  final String humy;

  PlantData({required this.name, required this.temp, required this.humy});
}
