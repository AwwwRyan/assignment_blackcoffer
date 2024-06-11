import 'package:asignment_blackcoffer/refinepage.dart';
import 'package:asignment_blackcoffer/reusables/bottomnavicons.dart';
import 'package:asignment_blackcoffer/screens/chat.dart';
import 'package:asignment_blackcoffer/screens/connections.dart';
import 'package:asignment_blackcoffer/screens/contacts.dart';
import 'package:asignment_blackcoffer/screens/explore_page.dart';
import 'package:asignment_blackcoffer/screens/groups.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  var user_name = "Aryan";
  var user_add = "Aryans location";
  List pages = [
    explore_page(),
    connections(),
    chat(),
    contacts(),
    groups(),
  ];
  int currindex = 0;

  void onexplorepagepress() {
    setState(() {
      currindex = 0;
    });
  }

  void onconnectionspagepress() {
    setState(() {
      currindex = 1;
    });
  }

  void onchatpagepress() {
    setState(() {
      currindex = 2;
    });
  }

  void oncontactspagepress() {
    setState(() {
      currindex = 3;
    });
  }

  void ongrouppagepress() {
    setState(() {
      currindex = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E2E43),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Howdy ' + user_name,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 14),
                SizedBox(width: 4),
                Text(
                  user_add,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => refinepage()));
              },style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0E2E43), elevation: 0),
                child: Column(
                  children: [
                    Icon(Icons.check_box, color: Colors.white, size: 18),
                    Text(
                      "Refine",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomnavicons(
                  onTap: onexplorepagepress,
                  iconData: Icons.remove_red_eye_rounded,
                  label: 'explore',
                  isActive: currindex == 0,
                ),
                bottomnavicons(
                  onTap: onconnectionspagepress,
                  iconData: Icons.supervisor_account,
                  label: 'Connections',
                  isActive: currindex == 1,
                ),
                bottomnavicons(
                  onTap: onchatpagepress,
                  iconData: Icons.chat,
                  label: 'Chat',
                  isActive: currindex == 2,
                ),
                bottomnavicons(
                  onTap: oncontactspagepress,
                  iconData: Icons.contact_phone,
                  label: 'Contacts',
                  isActive: currindex == 3,
                ),
                bottomnavicons(
                  onTap: ongrouppagepress,
                  iconData: Icons.group,
                  label: 'Groups',
                  isActive: currindex == 4,
                ),
              ],
            )),
      ),
      body: pages[currindex],
    );
  }
}
