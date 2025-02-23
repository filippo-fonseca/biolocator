import 'package:biolocator/screens/dashboard_screen.dart';
import 'package:biolocator/services/locationService.dart';
import 'package:flutter/material.dart';
import "package:biolocator/constants.dart";

class WelcomeScreen extends StatelessWidget {
  static String id = "welcome_screen";
  final locationService = LocationService();
  @override
  Widget build(BuildContext context) {
    locationService.requestLocationAccess();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://www.lefthudson.com/wp-content/uploads/2019/11/blue-iphone-background-awesome-blue-blur-iphone-6-plus-wallpaper-abstract-iphone-6-plus-wallpapers-inspiration-of-blue-iphone-background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Biolocator.",
                style: kHeader1TextStyle,
                textAlign: TextAlign.center,
              ),
              ButtonDisplay(),
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "Created by Mark Music and Filippo Fonseca. \nBiology 9 Summative Assesment (Criterion D).",
                  style: kHeader1TextStyle.copyWith(
                      fontSize: 15.0, color: Colors.black, height: 1.75),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationService = LocationService();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async {
                var locationData = await locationService.getUserLocation();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(
                      lat: locationData.latitude,
                      long: locationData.longitude,
                      altitude: locationData.altitude,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Initialize",
                        style: kButtonTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
