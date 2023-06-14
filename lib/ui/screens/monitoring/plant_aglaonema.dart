import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PlantAglaonema extends StatefulWidget {
  const PlantAglaonema({super.key});

  @override
  State<PlantAglaonema> createState() => _PlantAglaonemaState();
}

class _PlantAglaonemaState extends State<PlantAglaonema> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('tanaman');
  var data;

  var dataObject;

  var dataTemp = 0;
  var dataLight = 0;
  var dataHumy = 0;
  var dataName = "";
  var dataStatus = "";
  var dataSoilMoisture = 0;

  @override
  void initState() {
    super.initState();
    dbRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          dataObject = event.snapshot.value;
          print(dataObject);
          dataTemp = dataObject['aglaonema']['temp'].toInt();
          dataHumy = dataObject['aglaonema']['humy'];
          dataLight = dataObject['aglaonema']['lumens'];
          dataSoilMoisture = dataObject['aglaonema']['pH'];
          dataStatus = dataObject['aglaonema']['status'];
          dataName = dataObject['aglaonema']['name'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataName,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(42.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                _getGauge(),
                _getRadialGaugeHumy(),
                _getRadialGaugeSoilMoisture(),
                _getRadialGaugeLight(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: GaugeTitle(
            text: "Temperatur",
            textStyle:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: dataTemp.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Column(
                  children: [
                    Text(
                      dataTemp.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      dataStatus,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }

  Widget _getRadialGaugeHumy() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: GaugeTitle(
            text: "Kelembaban",
            textStyle:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: dataHumy.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Column(
                  children: [
                    Text(
                      dataHumy.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getRadialGaugeSoilMoisture() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: const GaugeTitle(
            text: "Kelembaban Tanah",
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 100, maximum: 1024, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 100,
                endValue: 500,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 500,
                endValue: 900,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 900,
                endValue: 1024,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: dataSoilMoisture.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Column(
                  children: [
                    Text(
                      dataSoilMoisture.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getRadialGaugeLight() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: const GaugeTitle(
            text: "Cahaya",
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 100, maximum: 1024, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 100,
                endValue: 500,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 500,
                endValue: 900,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 900,
                endValue: 1024,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: dataLight.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Column(
                  children: [
                    Text(
                      dataLight.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }
}

class PlantData {
  String? temp;
  String? humy;
  String? name;

  PlantData({this.temp, this.humy, this.name});

  PlantData.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    humy = json['humy'];
    name = json['name'];
  }
}
