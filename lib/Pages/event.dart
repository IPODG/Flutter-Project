import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';



class EventPage extends StatefulWidget {

  const  EventPage({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => const EventPage(),
  );
  @override
  _EventPageState createState() => _EventPageState();

}

class _EventPageState extends State<EventPage> {
    var battery = Battery();
    //Gets the State of Battery
    int percentage = 0;

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getBatteryPercentage();
    }

    void getBatteryPercentage() async{
      final level = await battery.batteryLevel;
      //  Battery percentage stored in level
      percentage = level;

      setState(() {

      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
            title: const Text("Event")
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const Text("Join our events!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
              ,

            ),
            Positioned(
                child: Container(
                  height: 220,
                  width: 500,
                  color: Colors.green[100],
                  child: Column(
                    children: [
                      Image.asset('./images/dom-fou-YRMWVcdyhmI-unsplash.jpg',
                      height: 150,
                      width: 230),
                      const Text("At the Stoke University we have a range of events, you can try out. We always welcome student feedback and suggestions on new events.",style: TextStyle(fontSize: 18,color: Colors.black),textAlign: TextAlign.center)
                    ],

                ),
                  ),
                ),

            ElevatedButton(
                child: const Text('Check your battery life here for the event!',style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black12,
              ),
                onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
                 MaterialBanner(
                  padding: const EdgeInsets.all(1),
                  content: Text('Your Battery Percentage is: $percentage'),
                  leading: const Icon(Icons.battery_alert, size: 49,),
                  actions: <Widget>[
                   TextButton(child:const Text("Cancel"),
                     onPressed:  () {
                       ScaffoldMessenger.of(context)
                           .hideCurrentMaterialBanner();
                     }
                     )
                  ],
                ),
                ),
            ),
             const Text(
               "Epic Games Event",
                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center

             ),
             Container(
                height: 220,
                width: 500,
                 color: Colors.green[100],
                child: Column(
                  children: [
                    Image.asset('./images/stem-list-EVgsAbL51Rk-unsplash (1).jpg',
                        height: 150,
                        width: 230),
                    const Text("The Epic Games Event allows students show off their gaming skills. There will be 10 Amazon gift vouchers up for grade for winners! Book tickets below.",style: TextStyle(fontSize: 16,color: Colors.black)),
                  ],
                ),
              ),

            ElevatedButton(
              child: const Text('Book the event here!',style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black26,
              ),
              onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  padding: const EdgeInsets.all(1),
                  content: const Text('Sorry the Event Tickets are not available'),
                  leading: const Icon(Icons.error),
                  actions: <Widget>[
                    TextButton(child:const Text("Cancel"),
                        onPressed:  () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }





