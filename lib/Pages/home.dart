import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const  HomePage({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => const HomePage(),
  );
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future weatherFuture = WeatherNetworkService.getWeatherData("Stoke");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home"),
      ),
        body: FutureBuilder(
          future: weatherFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
               return WeatherDataWidget(
                  weather: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 128.0,
                ),
              );
            } else {
              return const LinearProgressIndicator(
                value: null,
              );
          }
        },
      ),
    );
  }
}

class Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Contact"),
    ),
    body: ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[

    Container(
    height: 50,
    child: const Text("Child",
    textAlign: TextAlign.center,),
    ),

  ],
  ),

  );
}
}


class WeatherNetworkService {
  static Future<Weather> getWeatherData(cityName) async {
    String myKey = "0063c940f831620d7af4a83a6a7a0280";

    String openWeatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&units=metric&appid=${myKey}";
    print(openWeatherUrl);

    var response = await http.get(Uri.parse(openWeatherUrl));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Weather.fromJson(jsonResponse);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
class Weather {
  //model for weather api
  String name;
  double temperature;
  double temperatureFeeling;
  String weatherPic;

  Weather(this.name, this.temperature, this.temperatureFeeling, this.weatherPic);

  factory Weather.fromJson(Map<String, dynamic> jsonResponse) => Weather(
      jsonResponse["name"],
      jsonResponse["main"]["temp"],
      jsonResponse["main"]["feels_like"],
      jsonResponse["weather"][0]["main"]
  );
}

class WeatherDataWidget extends StatelessWidget {
  final Weather weather;
  const WeatherDataWidget({required this.weather});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(

        children: <Widget>[
          const Text('Welcome to Stoke University',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,),

          // Text(
          //   weather.name,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //     fontSize: 20,
          //   ),
          // ),
          Text(
            weather.weatherPic,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20, color: Colors.black,
            ),
          ),
          Text(
            "${weather.temperature.toStringAsFixed(2)}°C",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          weather.temperatureFeeling < 15.0
              ? const Icon(
            Icons.cloud,
            color: Colors.black,
            size: 40,
          )
              : const Icon(
            Icons.wb_sunny,
            color: Colors.black,
            size: 40,
           ),
        Container(
          color: Theme.of(context).backgroundColor,
          child: const Text(
            "The weather on campus today is shown above",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
          ),
        ),
               Container(
                 color: Theme.of(context).backgroundColor,
               child: const Text('On our application, you can check out how the university started, how to contact us further and future events you can attend!',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,),

    ),
                 Container(
                   height: 220,
                   width: 500,
                   color: Colors.grey,
                 child:Image.asset('./images/jason-goodman-Oalh2MojUuk-unsplash.jpg',
                 height: 150,
                 width: 230,
                 ),
           ),
               Container(
                      color: Theme.of(context).backgroundColor,
                 child: const Text("If you want to attend any other of our open days they are on:",style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                 ),

               ),
               Wrap(
                 spacing: 40.0, // gap between adjacent chips
                 runSpacing: 4.0, // gap between lines
                 children: const <Widget>[
                   Chip(
                     backgroundColor: Colors.blueAccent,
                     label: Text('18th January',style: TextStyle(fontSize: 20)),
                   ),
                   Chip(
                     backgroundColor: Colors.blueAccent,
                     label: Text('28th March',style: TextStyle(fontSize: 20)),
                   ),
                 ],
             ),
               Container(
                 child: const Text('To show our support for Ukraine we have changed our home page background to blue and yellow!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellowAccent),
                   textAlign: TextAlign.center,),
                 color: Colors.blueAccent,
               ),
         ],
      ),
    );
  }
}





