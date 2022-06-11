import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:testme/Pages/lightsensor.dart';


class AboutPage extends StatefulWidget {
  const  AboutPage({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => const AboutPage(),
  );
  @override
  _AboutPageState createState() => _AboutPageState();
}



class _AboutPageState extends State<AboutPage> {
  var battery = Battery();
  //Gets the State and details of Battery
  int percentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryPercentage();
  }

  void getBatteryPercentage() async {
    final level = await battery.batteryLevel;
    //  Battery percentage stored in level and get future data
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
          title: const Text("About")
      ),
       body:ListView(
       padding: const EdgeInsets.all(8),
       children: [
         Container(
         color: Colors.teal[100],
         child: Text("When we started",
           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
           textAlign: TextAlign.center
           ,
         ),


         ),
         const Text(
           "As Stoke-On-Trent was getting popular with our ceramics industry, many business struggled to be successful and get trade. Most families wanted their children to get educated"
               ",so this could help innovate their families business further. As a community, the local council decided to build Stoke University in 1985. It started with 1000 students and has now grown"
               " 20000 active students.",
           textAlign: TextAlign.center,
           style: TextStyle(
             fontSize:20,
             fontFamily: 'Raleway',
           ),
         ),
         SizedBox(

             child: Image.asset(
               './images/mosaic-3394375__340.webp', height: 250,),
             width: 230
         ),
         Container(
           color: Colors.teal[100],
         child: Text(
             "The above mosaic was created by one of our early students and is located in our library building! At night time make sure you check out this mosaic, we use lights to make it shine.",
           style: TextStyle(
             fontSize:18,)),
         ),
         ElevatedButton(
           style: ElevatedButton.styleFrom(
             primary: Colors.black26,
           ),onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
               builder: (context)=>const lightsensor()));
    }, child: const Text("Check your phone Light sensor here",style: TextStyle(
           fontSize:20,
         )),
         ),
       ],
       ),
    );
  }
}







