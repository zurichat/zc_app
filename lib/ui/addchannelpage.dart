import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddClassChannel extends StatelessWidget {
  const AddClassChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 411.0,
                    height: 54.0,
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text('Cancel',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text('Channels',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text('Create',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    hintText: 'Jump to...',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Container(child: Text('#',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    )),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Text('Announcement',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),

                        )
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                        child: Text("22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Container(child: Text('#',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    )),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Text('Give Away',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),

                        )
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                        child: Text("22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Container(child: Text('#',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    )),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Text('Team Socrates',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),

                        )
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                        child: Text("22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Container(child: Text('#',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    )),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Text('Design Submission',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),

                        )
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                        child: Text("22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Container(child: Text('#',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    )),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Text('Task Deadline',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),

                        )
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                        child: Text("22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Container(child: Text('#',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    )),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Text('Give Away',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),

                        )
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(4),
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                        child: Text("22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

