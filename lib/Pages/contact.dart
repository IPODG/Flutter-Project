import 'package:flutter/material.dart';


const categories = [
  {"image": "img_2.png", "name": "Contact@stoke.com"},
  {"image": "img_3.png","name": "01267747843"},
  {"image": "img_1.png", "name": "ST4 1PD"},
  {"image": "img.png", "name": "Free Parking!"},


];

class ContactPage extends StatefulWidget {
  const  ContactPage({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => const ContactPage(),
  );
  @override
  _ContactPageState createState() => _ContactPageState();

}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Contact"),
          backgroundColor: Colors.blue,

      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[

          Container(
                child: const Text("Contact us here!",
                style: TextStyle(fontSize: 40),),
            alignment: Alignment.center,
          ),

          Positioned(
            child:SizedBox(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: categories.map((category) => Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                   color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset("images/${category['image']}",
                          width: 100,
                          height: 75,
                        ),
                        Text("${category['name']}", style: TextStyle(color: Colors.black),
                        )

                      ],
                    ),
                  ),

          )).toList(),
          ),
          ),
          ),
          Container(
            height: 50,
            color: Colors.teal[100],

            child: const Text("COVID-19 Information",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
          ),
          Row(
            children: <Widget> [
            SizedBox(
              height: 75,
              child: Image.asset('./images/images.png',height: 50,),
            ),
            const Text("We require our students to do 2\n tests a week and wear masks\naround the campus.We are following\nthe Governments guidelines and keep\nstudents updated.",style: TextStyle(fontSize: 18)),
          ],
          ),

                Container(
                padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                 child: const Text("Local GP", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,)
                   ,textAlign: TextAlign.center,)

            ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("Before you start, make sure you register with our Stoke GP. It is vital you did this, so your medical information gets transferred across and you have access to your medication.",
                      style: TextStyle(fontSize: 18)),

                ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("More support", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,)
              ,textAlign: TextAlign.center,)
          ),
      Container(
        padding: const EdgeInsets.all(8),
        child:  const Text('Below is our admin team to sort out any further enquires.',
            style: TextStyle(fontSize: 18)
        ),
      ),

      Wrap(
        spacing: 40.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('AH')),
            label: const Text('Ash Hugom',style: TextStyle(fontSize: 20)),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('ML')),
            label: const Text('Mick Laravel',style: TextStyle(fontSize: 20)),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('IW')),
            label: const Text('Indigo Wall',style: TextStyle(fontSize: 20)),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('JN')),
            label: const Text('Julian Namba',style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
              ],
              ),
        );


  }
}