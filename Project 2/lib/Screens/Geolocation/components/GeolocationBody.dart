import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_2/Screens/Geolocation/GeolocationProvider.dart';
import 'package:project_2/Screens/Mainpage/Mainpage_screen.dart';
import 'package:provider/provider.dart';

class GeolocationBody extends StatefulWidget {
  @override
  _GeolocationBodyState createState() => _GeolocationBodyState();
}

class _GeolocationBodyState extends State<GeolocationBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<GeolocationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MainpageScreen()));
            },
          ),
          title: Text(
            "Geolocation Live Tracking",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
        ),
        body: googleMapUI());
  }

  Widget googleMapUI() {
    return Consumer<GeolocationProvider>(
        builder: (consumerContext, model, child) {
      if (model.locationPosition != null) {
        return Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition:
                    CameraPosition(target: model.locationPosition, zoom: 18),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set<Marker>.of(model.markers.values),
                onMapCreated: (GoogleMapController controller) {},
              ),
            )
          ],
        );
      }
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
