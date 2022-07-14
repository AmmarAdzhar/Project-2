import 'package:flutter/material.dart';
import 'package:project_2/Screens/Geolocation/GeolocationProvider.dart';
import 'package:project_2/Screens/Geolocation/components/GeolocationBody.dart';
import 'package:project_2/Screens/Splashpage/splashpage.dart';
import 'package:project_2/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GeolocationProvider(),
            child: GeolocationBody(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LIVE TRACKING',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.yellow[200],
          ),
          home: Splashpage(),
        ));
  }
}
