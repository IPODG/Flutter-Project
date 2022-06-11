import 'package:flutter/material.dart';
import 'package:light_sensor/light_sensor.dart';

class lightsensor extends StatefulWidget {
  const  lightsensor({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => const lightsensor(),
  );
  @override
  _lightsensorPageState createState() => _lightsensorPageState();
}



class _lightsensorPageState extends State<lightsensor> {
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Light Sensor")
  ),
  body: FutureBuilder(
    future: LightSensor.hasSensor,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final bool? hasSensor = snapshot.data as bool?;
          if (hasSensor == null) {
            return const Text(
            'Unable to find out if there is a light sensor');
              } else if (hasSensor) {
                return StreamBuilder<int>(
            stream: LightSensor.lightSensorStream,
            builder: (context, snapshot) {
          if (snapshot.hasData) {
          return
          Text('Running on: ${snapshot.data} LUX',style: TextStyle(fontSize: 50));
          } else {
          return const Text('Running on: unknown');
          }
        });
      } else {
          return const Text("Your device doesn't have a light sensor");
          }
        } else {
    return const Center(child: CircularProgressIndicator());
  }
  }),
  );
}
}