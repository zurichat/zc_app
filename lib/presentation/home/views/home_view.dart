import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:hng/commons/components/components.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/background/appBarLogo.png',
                fit: BoxFit.cover,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'YourAppTitle',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Jump To...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.message_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Threads',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.document_scanner_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text('Draft',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Icon(Icons.file_copy, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Files',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.add_chart,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Integrate',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Channels',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 140),
                    Container(
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Text(
                        '#',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                        child: Text(
                      'announcements',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Text(
                        '#',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'games',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Text(
                        '#',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'general',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: Text(
                        '#',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'questions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Direct Messages',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 80),
                    Container(
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/background/bga.png',
                        ),
                        radius: 17.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Princess',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/background/bga.png',
                        ),
                        radius: 17.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Tobi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/background/bga.png',
                        ),
                        radius: 17.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                        child: Text(
                      'Victor',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/background/bga.png',
                        ),
                        radius: 17.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Fierce',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.open_in_new_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
