// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_trip_project/models/myprofile.dart';
import 'package:my_trip_project/models/trip.dart';
import 'package:my_trip_project/services/call_api.dart';
import 'package:my_trip_project/utils/env.dart';
import 'package:my_trip_project/views/insert_trip_ui.dart';
import 'package:my_trip_project/views/up_del_ui.dart';
import 'package:my_trip_project/views/update_myprofile_ui.dart';

class HomeUI extends StatefulWidget {
  Myprofile? myprofile;

  HomeUI({
    super.key,
    this.myprofile,
  });

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
//ตัวแปรเก็บข้อมูลบันทึกการกินที่ได้จากการเรียกใช้ API
  Future<List<Trip>>? tripData;

  //สร้างเมธอดที่เรียกใช้งานเมธอดที่เรียก API ที่ CallAPI
  getAllTripByUserIdAPI(Trip trip) {
    setState(() {
      tripData = CallAPI.getAllTripByUserIdAPI(trip);
    });
  }

  @override
  void initState() {
    //สร้างตัวแปรเก็บข้อมูลที่จะส่งไปตอนเรียกใช้ API
    Trip trip = Trip(
      user_id: widget.myprofile!.user_id,
    );
    //เรียกใช้ API เพื่อดึงข้อมูลบันทึกการกิน
    getAllTripByUserIdAPI(trip);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'บันทึกการเดินทาง',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pop(context); หรือ
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                '${Env.hostName}/mt6552410001/picupload/myprofile/${widget.myprofile!.user_image}',
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.35,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              'ชื่อผู้ใช้: ${widget.myprofile!.username!}',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'อีเมล์: ${widget.myprofile!.email!}',
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UpdateMyProfileUi(myprofile: widget.myprofile),
                  ),
                ).then((value) {
                  //ตรวจสอบก่อนว่าเมื่อย้อนกลับมาหน้านี้มีการส่งข้อมูลมาด้วยหรือไม่
                  if (value != null) {
                    //เอาค่าที่ส่งกลับมาหลังจากแก้ไขเสร็จมาแก้ให้กับ widget.member
                    setState(() {
                      widget.myprofile?.email = value.email;
                      widget.myprofile?.password = value.password;
                      widget.myprofile?.username = value.username;
                    });
                  }
                });
              },
              child: Text(
                '(UPDATE PROFILE)',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Trip>>(
                  future: tripData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty ||
                          snapshot.data![0].message == "0") {
                        return Center(child: Text("ยังไม่มีพบข้อมูล"));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => upDelUI(
                                          trip: snapshot.data![index],
                                        ),
                                      ),
                                    ).then((value) {
                                      setState(() {
                                        Trip trip = Trip(
                                          user_id: widget.myprofile!.user_id,
                                        );
                                        getAllTripByUserIdAPI(trip);
                                      });
                                    });
                                  },
                                  tileColor: index % 2 == 0
                                      ? Colors.red[50]
                                      : Colors.green[50],
                                  leading: ClipRRect(
                                    child: Image.network(
                                      '${Env.hostName}/mt6552410001/picupload/trip/${snapshot.data![index].trip_image}',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data![index].location_name!,
                                  ),
                                  subtitle: Text(
                                    '${snapshot.data![index].start_date!} - ${snapshot.data![index].end_date!}',
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    }
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InsertTripUI(
                user_id: widget.myprofile!.user_id!,
              ),
            ),
          ).then((value) {
            setState(() {
              Trip trip = Trip(
                user_id: widget.myprofile!.user_id,
              );
              getAllTripByUserIdAPI(trip);
            });
          });
        },
        // child: Icon(
        //   Icons.add,
        //   color: Colors.white,
        // ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          'เพิ่มการเดินทาง',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
