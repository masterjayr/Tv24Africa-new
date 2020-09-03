import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Settings')),
      body: SettingsList(
        // backgroundColor: Color(0xFF800000),
         backgroundColor: Colors.black,
        sections: [
          SettingsSection(
            title: 'Preferences',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              // SettingsTile(
              //     title: 'Location',
              //     subtitle: 'Nigeria',
              //     leading: Icon(Icons.gps_not_fixed)),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                    notificationsEnabled = value;
                  });
                },
              ),
              // SettingsTile.switchTile(
              //   title: 'Enable Notifications',
              //   enabled: notificationsEnabled,
              //   leading: Icon(Icons.notifications_active),
              //   switchValue: true,
              //   onToggle: (value) {},
              // ),
            ],
          ),
          SettingsSection(
            title: 'policies',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description),
                  onTap: (){
                     showDialog(
                      context: context,
                      builder: (context) => NewCustomDialog(
                            title: "Terms of Service",
                            description:
                                """this terms governs and apply to your access and use of this platform offered by Tv24africa.com
                                """,
                          ));
                  },
                  )
                  ,
              SettingsTile(
                title: 'developer info',
                leading: Icon(Icons.info),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                            title: "Dev Info",
                            description:
                                """this app was developed by Edache praise for digitalnest abuja nigeria
                                  itsirpraise@gmail.com
                                """,
                          ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  CustomDialog({this.buttonText, this.description, this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 16,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Okay")),
              )
            ],
          ),
        ),
        Positioned(
          top: -40,
          left: 100,
          // right: 16,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/dev.gif"),
            backgroundColor: Colors.red,
            radius: 60,
          ),
        )
      ],
    );
  }
}



class NewCustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  NewCustomDialog({this.buttonText, this.description, this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 16,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Okay")),
              )
            ],
          ),
        ),
        // Positioned(
        //   top: -40,
        //   left: 100,
        //   // right: 16,
        //   child: CircleAvatar(
        //     backgroundImage: AssetImage("assets/images/dev.gif"),
        //     backgroundColor: Colors.red,
        //     radius: 60,
        //   ),
        // )
      ],
    );
  }
}

