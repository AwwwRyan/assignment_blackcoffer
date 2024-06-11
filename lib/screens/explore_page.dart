import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusables/searchbar.dart';

class explore_page extends StatefulWidget {
  const explore_page({super.key});

  @override
  State<explore_page> createState() => _explore_pageState();
}

class _explore_pageState extends State<explore_page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<UserProfile> userProfiles = [
    UserProfile(
      name: 'Alice Johnson',
      location: 'New York, NY',
      role: 'Software Engineer',
      distance: '3 miles',
      profileScore: 90,
      bio: 'Passionate software engineer with a love for coding and problem-solving.',
      interests: ['Coffee', 'Movies', 'Dining'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Carol Williams',
      location: 'Chicago, IL',
      role: 'Marketing Manager',
      distance: '10 miles',
      profileScore: 88,
      bio: 'Experienced marketing manager with a strategic mindset.',
      interests: ['Hobbies', 'Friendship'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Dave Brown',
      location: 'Austin, TX',
      role: 'Project Manager',
      distance: '8 miles',
      profileScore: 92,
      bio: 'Project manager with a passion for organization and efficiency.',
      interests: ['Friendship', 'Movies'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Eve Davis',
      location: 'Seattle, WA',
      role: 'Data Scientist',
      distance: '6 miles',
      profileScore: 95,
      bio: 'Data scientist with a love for numbers and data analysis.',
      interests: ['Movies', 'Dining'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Frank Wilson',
      location: 'Miami, FL',
      role: 'Financial Analyst',
      distance: '4 miles',
      profileScore: 89,
      bio: 'Financial analyst with expertise in financial modeling and analysis.',
      interests: ['Dining', 'Business'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Grace Martinez',
      location: 'Denver, CO',
      role: 'UX Designer',
      distance: '7 miles',
      profileScore: 87,
      bio: 'UX designer focused on creating user-friendly interfaces.',
      interests: ['Dating', 'Hobbies'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Henry Lee',
      location: 'Boston, MA',
      role: 'HR Specialist',
      distance: '2 miles',
      profileScore: 91,
      bio: 'HR specialist with a commitment to employee development.',
      interests: ['Matrimony', 'Business'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Isabel Taylor',
      location: 'Portland, OR',
      role: 'Content Writer',
      distance: '12 miles',
      profileScore: 86,
      bio: 'Content writer with a passion for storytelling and creative writing.',
      interests: ['Coffee', 'Hobbies', 'Movies'],
      profileImage: null,
    ),
    UserProfile(
      name: 'Jack Anderson',
      location: 'Los Angeles, CA',
      role: 'Sales Manager',
      distance: '9 miles',
      profileScore: 93,
      bio: 'Sales manager with a strong background in building client relationships.',
      interests: ['Friendship', 'Dining'],
      profileImage: null,
    ),
  ];
  List<ServiceProfile> serviceProfiles = [
    ServiceProfile(
      name: 'John Doe',
      location: 'New York, NY',
      role: 'Plumber',
      distance: '3 miles',
      profileScore: 90,
      bio: 'Experienced plumber with over 15 years in the industry.',
      contactNumber: '555-1111',
      profileImage: null,
      yearsOfExperience: 15,
    ),
    ServiceProfile(
      name: 'Jane Smith',
      location: 'San Francisco, CA',
      role: 'Electrician',
      distance: '5 miles',
      profileScore: 88,
      bio: 'Certified electrician specializing in residential wiring.',
      contactNumber: '555-2222',
      profileImage: null,
      yearsOfExperience: 10,
    ),
    ServiceProfile(
      name: 'Mike Johnson',
      location: 'Chicago, IL',
      role: 'Carpenter',
      distance: '10 miles',
      profileScore: 85,
      bio: 'Skilled carpenter with a focus on custom furniture.',
      contactNumber: '555-3333',
      profileImage: null,
      yearsOfExperience: 12,
    ),
    ServiceProfile(
      name: 'Emily Davis',
      location: 'Austin, TX',
      role: 'Painter',
      distance: '8 miles',
      profileScore: 92,
      bio: 'Professional painter known for attention to detail.',
      contactNumber: '555-4444',
      profileImage: null,
      yearsOfExperience: 8,
    ),
    ServiceProfile(
      name: 'Chris Brown',
      location: 'Seattle, WA',
      role: 'Landscaper',
      distance: '6 miles',
      profileScore: 87,
      bio: 'Landscaping expert with innovative design solutions.',
      contactNumber: '555-5555',
      profileImage: null,
      yearsOfExperience: 9,
    ),
    ServiceProfile(
      name: 'Laura Wilson',
      location: 'Miami, FL',
      role: 'Mason',
      distance: '4 miles',
      profileScore: 89,
      bio: 'Experienced mason specializing in stone and brickwork.',
      contactNumber: '555-6666',
      profileImage: null,
      yearsOfExperience: 14,
    ),
    ServiceProfile(
      name: 'David Lee',
      location: 'Denver, CO',
      role: 'Roofer',
      distance: '7 miles',
      profileScore: 84,
      bio: 'Professional roofer with expertise in all types of roofing.',
      contactNumber: '555-7777',
      profileImage: null,
      yearsOfExperience: 11,
    ),
    ServiceProfile(
      name: 'Sara Martinez',
      location: 'Boston, MA',
      role: 'HVAC Technician',
      distance: '2 miles',
      profileScore: 91,
      bio: 'Certified HVAC technician with a focus on energy efficiency.',
      contactNumber: '555-8888',
      profileImage: null,
      yearsOfExperience: 13,
    ),
    ServiceProfile(
      name: 'James Anderson',
      location: 'Portland, OR',
      role: 'Mechanic',
      distance: '12 miles',
      profileScore: 86,
      bio: 'Auto mechanic with a passion for high-performance vehicles.',
      contactNumber: '555-9999',
      profileImage: null,
      yearsOfExperience: 7,
    ),
    ServiceProfile(
      name: 'Rachel Green',
      location: 'Los Angeles, CA',
      role: 'Interior Designer',
      distance: '9 miles',
      profileScore: 93,
      bio: 'Creative interior designer with a modern aesthetic.',
      contactNumber: '555-1010',
      profileImage: null,
      yearsOfExperience: 10,
    ),
  ];
  List<BusinessProfile> businessProfiles = [
    BusinessProfile(
      name: 'Tech Solutions Inc.',
      location: 'San Francisco, CA',
      distance: '5 miles',
      profileScore: 85,
      bio: 'Leading provider of tech solutions and IT services.',
      contactNumber: '555-1234',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Green Gardens',
      location: 'Portland, OR',
      distance: '10 miles',
      profileScore: 92,
      bio: 'Specializing in sustainable gardening and landscaping.',
      contactNumber: '555-5678',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Urban Eats',
      location: 'New York, NY',
      distance: '2 miles',
      profileScore: 88,
      bio: 'Gourmet food with a focus on locally sourced ingredients.',
      contactNumber: '555-8765',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Fitness First',
      location: 'Los Angeles, CA',
      distance: '8 miles',
      profileScore: 78,
      bio: 'Top-notch fitness center with personal training and group classes.',
      contactNumber: '555-4321',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Creative Studios',
      location: 'Austin, TX',
      distance: '15 miles',
      profileScore: 90,
      bio: 'Innovative design and media production studio.',
      contactNumber: '555-9876',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Fresh Market',
      location: 'Seattle, WA',
      distance: '3 miles',
      profileScore: 82,
      bio: 'Local farmers market offering fresh produce and handmade goods.',
      contactNumber: '555-6543',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Auto Care Experts',
      location: 'Chicago, IL',
      distance: '12 miles',
      profileScore: 77,
      bio: 'Expert auto repair and maintenance services.',
      contactNumber: '555-3210',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Bright Minds Academy',
      location: 'Boston, MA',
      distance: '7 miles',
      profileScore: 91,
      bio: 'High-quality educational programs for children.',
      contactNumber: '555-4322',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Style Boutique',
      location: 'Miami, FL',
      distance: '9 miles',
      profileScore: 84,
      bio: 'Fashion-forward clothing and accessories store.',
      contactNumber: '555-7890',
      profileImage: null,
    ),
    BusinessProfile(
      name: 'Wellness Spa',
      location: 'Denver, CO',
      distance: '6 miles',
      profileScore: 89,
      bio: 'Relaxing spa with a variety of wellness treatments.',
      contactNumber: '555-0987',
      profileImage: null,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Color(0xff143D59),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,  // Color for the text of the selected tab
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Personal'),
              Tab(text: 'Services'),
              Tab(text: 'Businesses'),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            personalTab(),
            servicesTab(),
            businessesTab(),
          ],
        )),
      ],
    );
  }
  Widget personalTab() {
    return Column(
      children: [SizedBox(height: 8,),
        searchbar(),
        Expanded(
          child: ListView.builder(
            itemCount: userProfiles.length,
            itemBuilder: (context, index) {
              final user = userProfiles[index];
              return GestureDetector(
                onTap: (){print(user.name+" tapped");},
                child: Container(
                  height: 180,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 30,
                        left: 50,
                        child: Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            border: Border.all(
                              color: Color(0xFFE4E9ED),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${user.location} | ${user.role}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          user.distance,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              child: LinearProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff143D59)),
                                                value: user.profileScore / 100,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Profile Score - ${user.profileScore}%',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 8.0, right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("invited " + user.name);
                                        },
                                        child: Text(
                                          '+ INVITE',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Wrap(
                                        spacing: 8.0,
                                        children: user.interests.map((interest) {
                                          IconData icon;
                                          Color color;
                                          switch (interest) {
                                            case 'Coffee':
                                              icon = Icons.coffee;
                                              color = Colors.brown; // Example color for Coffee
                                              break;
                                            case 'Business':
                                              icon = Icons.business;
                                              color = Colors.lightBlue.shade200; // Example color for Business
                                              break;
                                            case 'Hobbies':
                                              icon = Icons.sports_baseball_rounded;
                                              color = Colors.green; // Example color for Hobbies
                                              break;
                                            case 'Friendship':
                                              icon = Icons.people;
                                              color = Colors.orange; // Example color for Friendship
                                              break;
                                            case 'Movies':
                                              icon = Icons.movie_creation_outlined;
                                              color = Colors.red; // Example color for Movies
                                              break;
                                            case 'Dining':
                                              icon = Icons.emoji_food_beverage_rounded;
                                              color = Colors.purple; // Example color for Dining
                                              break;
                                            case 'Dating':
                                              icon = Icons.people_alt_rounded;
                                              color = Colors.pink; // Example color for Dating
                                              break;
                                            case 'Matrimony':
                                              icon = Icons.church_rounded;
                                              color = Colors.grey; // Example color for Matrimony
                                              break;
                                            default:
                                              icon = Icons.interests;
                                              color = Colors.black; // Default color
                                          }
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(icon, color: color, size: 14),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    interest,
                                                    style: TextStyle(
                                                        color: color,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      child: Text(
                                        user.bio,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Color(0xFFB8C5CD),
                            image: user.profileImage != null
                                ? DecorationImage(
                                    image: NetworkImage(user.profileImage!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: user.profileImage == null
                              ? Center(
                                  child: Text(
                                    user.name.split(' ').map((e) => e[0]).join(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF1A3F5A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget servicesTab() {
    return Column(
      children: [
        SizedBox(height: 8,),
        searchbar(),
        Expanded(
          child: ListView.builder(
            itemCount: serviceProfiles.length,
            itemBuilder: (context, index) {
              final service = serviceProfiles[index];
              return GestureDetector(
                onTap: (){print(service.name+" tapped");},
                child: Container(
                  height: 180,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 30,
                        left: 50,
                        child: Container(
                          height: 145,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            border: Border.all(
                              color: Color(0xFFE4E9ED),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          service.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${service.location} | ${service.distance}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              child: LinearProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff143D59)),
                                                value: service.profileScore / 100,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Profile Score - ${service.profileScore}%',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 8.0, right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("invited " + service.name);
                                        },
                                        child: Text(
                                          '+ INVITE',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, bottom: 8.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 18.0),
                                        child: InkWell(
                                          onTap: () {
                                            print("calling");
                                          },
                                          child: Container(
                                            width: 26.0,
                                            height: 26.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF0E2E43),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons
                                                    .call, // You can change this to any icon you prefer
                                                size: 18.0,
                                                color: Colors
                                                    .white, // Icon color inside the circular container
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print("calling");
                                        },
                                        child: Container(
                                          width: 26.0,
                                          height: 26.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF0E2E43),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons
                                                  .contacts_rounded, // You can change this to any icon you prefer
                                              size: 18.0,
                                              color: Colors
                                                  .white, // Icon color inside the circular container
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    '${service.role} | ${service.yearsOfExperience} years of exprience',
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      child: Text(
                                        service.bio,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Color(0xFFB8C5CD),
                            image: service.profileImage != null
                                ? DecorationImage(
                                    image: NetworkImage(service.profileImage!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: service.profileImage == null
                              ? Center(
                                  child: Text(
                                    service.name.split(' ').map((e) => e[0]).join(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF1A3F5A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget businessesTab() {
    return Column(
      children: [
        SizedBox(height: 8,),
        searchbar(),
        Expanded(
          child: ListView.builder(
            itemCount: businessProfiles.length,
            itemBuilder: (context, index) {
              final business = businessProfiles[index];
              return GestureDetector(
                onTap: (){print(business.name+" tapped");},
                child: Container(
                  height: 180,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 30,
                        left: 50,
                        child: Container(
                          height: 145,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            border: Border.all(
                              color: Color(0xFFE4E9ED),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          business.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${business.location} | ${business.distance}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              child: LinearProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff143D59)),
                                                value: business.profileScore / 100,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Profile Score - ${business.profileScore}%',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, bottom: 8.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 18.0),
                                        child: InkWell(
                                          onTap: () {
                                            print("calling");
                                          },
                                          child: Container(
                                            width: 26.0,
                                            height: 26.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF0E2E43),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons
                                                    .call, // You can change this to any icon you prefer
                                                size: 18.0,
                                                color: Colors
                                                    .white, // Icon color inside the circular container
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 18.0),
                                        child: InkWell(
                                          onTap: () {
                                            print("contacts");
                                          },
                                          child: Container(
                                            width: 26.0,
                                            height: 26.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF0E2E43),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons
                                                    .contacts_rounded, // You can change this to any icon you prefer
                                                size: 18.0,
                                                color: Colors
                                                    .white, // Icon color inside the circular container
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 18.0),
                                        child: InkWell(
                                          onTap: () {
                                            print("location");
                                          },
                                          child: Container(
                                            width: 26.0,
                                            height: 26.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF0E2E43),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons
                                                    .location_on_outlined, // You can change this to any icon you prefer
                                                size: 18.0,
                                                color: Colors
                                                    .white, // Icon color inside the circular container
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      child: Text(
                                        business.bio,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Color(0xFFB8C5CD),
                            image: business.profileImage != null
                                ? DecorationImage(
                                    image: NetworkImage(business.profileImage!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: business.profileImage == null
                              ? Center(
                                  child: Text(
                                    business.name.split(' ').map((e) => e[0]).join(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF1A3F5A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class UserProfile {
  final String name;
  final String location;
  final String role;
  final String distance;
  final int profileScore;
  final String bio;
  final List<String> interests;
  final String? profileImage;

  UserProfile({
    required this.name,
    required this.location,
    required this.role,
    required this.distance,
    required this.profileScore,
    required this.bio,
    required this.interests,
    this.profileImage,
  });
}

class ServiceProfile {
  final String name;
  final String location;
  final String role;
  final String distance;
  final int profileScore;
  final String bio;
  final String contactNumber;
  final String? profileImage;
  final int yearsOfExperience;

  ServiceProfile({
    required this.name,
    required this.location,
    required this.role,
    required this.distance,
    required this.profileScore,
    required this.bio,
    required this.contactNumber,
    this.profileImage,
    required this.yearsOfExperience,
  });
}

class BusinessProfile {
  final String name;
  final String location;
  final String distance;
  final int profileScore;
  final String bio;
  final String contactNumber;
  final String? profileImage;

  BusinessProfile({
    required this.name,
    required this.location,
    required this.distance,
    required this.profileScore,
    required this.bio,
    required this.contactNumber,
    this.profileImage,
  });
}
