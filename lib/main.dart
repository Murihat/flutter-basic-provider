import 'package:basicprovider/WeatherInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Basic Provider"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[MySpecialHeading(), MySpecialContent()],
          ),
        ),
        floatingActionButton: FloatingActionBtn(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    // var weatherInfo = Provider.of<WeatherInfo>(context);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Consumer<WeatherInfo>(
        builder: (context, weatherInfo, _) => Text(
          "Temperature Type ${weatherInfo.temperatureType}",
          style: TextStyle(color: decideColor(weatherInfo)),
        ),
      ),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Consumer<WeatherInfo>(
          builder: (context, weatherInfo, _) =>
              Text("Temperature  ${weatherInfo.temperatureVal}"),
        ));
  }
}

class FloatingActionBtn extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      onPressed: () {
        String newTempType =
            weatherInfo.temperatureType == "celcius" ? "far" : "celcius";
        weatherInfo.changeTemperatureType = newTempType;
      },
      tooltip: "Change Type",
      child: Icon(Icons.change_history),
    );
  }
}
