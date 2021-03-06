import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/services/networking/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:uk_city_planner/widgets/snack_bar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: 'planner-banner',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage('assets/images/settings-banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15.0,
                bottom: 20.0,
                width: 250,
                top: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello User,',
                      // widget.pointOfInterest.name,
                      style: TextStyle(
                          color: Color(0xff23adb0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          shadows: <Shadow>[
                            Shadow(
                              color: CupertinoColors.black,
                              blurRadius: 10,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Welcome to \nsettings...',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              shadows: <Shadow>[
                                Shadow(
                                  color: CupertinoColors.black,
                                  blurRadius: 20,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: Container(
                // color: Color(0xff1dbfc2),
                ),
          ),
          Positioned(
            // logo/banner at the top of the screen
            top: size.height * 0.7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF1CBDC0), Color(0xFF1CBDC0)],
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.logout),
                color: Colors.white,
                onPressed: () { // on login button pressed, send credentials to service
                  ScaffoldMessenger.of(context).showSnackBar(LogoutMessages().logoutMessage());
                  context.read<AuthenticationService>().signOut();
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Positioned(
            child: Text('Logout Here'),
          ),
        ],
      ),
    );
  }
}
