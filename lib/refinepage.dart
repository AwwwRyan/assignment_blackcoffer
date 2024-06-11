import 'package:asignment_blackcoffer/bottomnav.dart';
import 'package:flutter/material.dart';

class refinepage extends StatefulWidget {
  const refinepage({super.key});

  @override
  State<refinepage> createState() => _refinepageState();
}

class _refinepageState extends State<refinepage> {
  String _selectedAvailability = 'Available | Hey Let Us Connect';
  TextEditingController _statusController = TextEditingController(text: 'Hi community! I am open to new connections 😊');
  double _distance = 50;
  List<String> _selectedPurposes = [];
  final List<String> _purposes = [
    'Coffee', 'Business', 'Hobbies', 'Friendship', 'Movies', 'Dining', 'Dating', 'Matrimony'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E2E43),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => bottomnav()));
          },
        ),
        title: Text("Refine", style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Your Availability'),
            Container(
              width: MediaQuery.of(context).size.width,
              child: DropdownButtonFormField<String>(
                value: _selectedAvailability,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                items: <String>[
                  'Available | Hey Let Us Connect',
                  'Busy | Do Not Disturb',
                  'Away | Will Be Back Soon',
                  'Offline | Not Available'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedAvailability = newValue!;
                  });
                },
                icon: Icon(Icons.arrow_drop_down),
                iconEnabledColor: Colors.black,
                iconSize: 24,
              ),
            ),
              SizedBox(height: 16),
              Text('Add Your Status'),
            TextField(
              controller: _statusController,
              maxLength: 250,
              maxLines: null, // Allows the TextField to expand and support multiple lines
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adds padding inside the TextField
              ),
            ),
              SizedBox(height: 16),
              Text('Select Hyper local Distance'),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xFF0E2E43),
                  inactiveTrackColor: Color(0xFF0E2E43).withOpacity(0.3),
                  thumbColor: Color(0xFF0E2E43),
                  overlayColor: Color(0xFF0E2E43).withOpacity(0.2),
                  valueIndicatorColor: Color(0xFF0E2E43),
                  valueIndicatorTextStyle: TextStyle(color: Colors.white),
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  value: _distance,
                  min: 1,
                  max: 100,
                  divisions: 99,
                  label: _distance.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _distance = value;
                    });
                  },
                ),
              ),SizedBox(height: 16),
              Text('Select Purpose'),
              Wrap(
                spacing: 8.0,
                children: _purposes.map((String purpose) {
                  bool isSelected = _selectedPurposes.contains(purpose);
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ChoiceChip(
                      label: Text(purpose),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedPurposes.add(purpose);
                          } else {
                            _selectedPurposes.remove(purpose);
                          }
                        });
                      },
                      selectedColor: Color(0xff143D59),
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Change this value to make it more or less circular
                      ),
                      avatar: null, // Remove the tick mark (check mark)
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 16,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xff143D59), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                    ),
                  ),
                  onPressed: () {
                    print('Selected Availability: $_selectedAvailability');
                    print('Status: ${_statusController.text}');
                    print('Distance: $_distance');
                    print('Selected Purposes: $_selectedPurposes');
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => bottomnav()));
                  },
                  child: Text('Save & Explore'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
