// ignore_for_file: must_be_immutable, unused_field

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_trip_project/models/trip.dart';
import 'package:my_trip_project/services/call_api.dart';
import 'package:my_trip_project/utils/env.dart';

class upDelUI extends StatefulWidget {
  Trip? trip;
  upDelUI({super.key, this.trip});

  @override
  State<upDelUI> createState() => _upDelUIState();
}

class _upDelUIState extends State<upDelUI> {
  TextEditingController locationNameCtrl = TextEditingController(text: '');
  TextEditingController costCtrl = TextEditingController(text: '');
  TextEditingController startDateCtrl = TextEditingController(text: '');
  TextEditingController endDateCtrl = TextEditingController(text: '');

  File? _imageSelected;
  File? _imageSelected2;
  File? _imageSelected3;

  String? _imageBase64Selected;
  String? _imageBase64Selected2;
  String? _imageBase64Selected3;

  String? _startDateSelected;
  String? _endDateSelected;

  String? _Lat;
  String? _Lng;

  Position? _currentPosition;

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await _determinePosition();
    if (!mounted) return; // Check if the widget is still in the tree
    setState(() {
      _currentPosition = position;
      _Lat = position.latitude.toString();
      _Lng = position.longitude.toString();
    });
  }

  Future<void> _opencamera() async {
    final XFile? _picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (_picker != null) {
      setState(() {
        _imageSelected = File(_picker.path);
        _imageBase64Selected = base64Encode(_imageSelected!.readAsBytesSync());
      });
    }
  }

  Future<void> _openGallery() async {
    final XFile? _picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (_picker != null) {
      setState(() {
        _imageSelected = File(_picker.path);
        _imageBase64Selected = base64Encode(_imageSelected!.readAsBytesSync());
      });
    }
  }

//รูป2
  Future<void> _opencamera2() async {
    final XFile? _picker2 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (_picker2 != null) {
      setState(() {
        _imageSelected2 = File(_picker2.path);
        _imageBase64Selected2 =
            base64Encode(_imageSelected2!.readAsBytesSync());
      });
    }
  }

  Future<void> _openGallery2() async {
    final XFile? _picker2 = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (_picker2 != null) {
      setState(() {
        _imageSelected2 = File(_picker2.path);
        _imageBase64Selected2 =
            base64Encode(_imageSelected2!.readAsBytesSync());
      });
    }
  }

  //รูป3
  Future<void> _opencamera3() async {
    final XFile? _picker3 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (_picker3 != null) {
      setState(() {
        _imageSelected3 = File(_picker3.path);
        _imageBase64Selected3 =
            base64Encode(_imageSelected3!.readAsBytesSync());
      });
    }
  }

  Future<void> _openGallery3() async {
    final XFile? _picker3 = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (_picker3 != null) {
      setState(() {
        _imageSelected3 = File(_picker3.path);
        _imageBase64Selected3 =
            base64Encode(_imageSelected3!.readAsBytesSync());
      });
    }
  }

  Future<void> _openCalendar1() async {
    final DateTime? _startPicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (_startPicker != null) {
      setState(() {
        _startDateSelected = _startPicker.toString().substring(0, 10);
        startDateCtrl.text = convertToThaiDate(_startPicker);
      });
    }
  }

  Future<void> _openCalendar2() async {
    final DateTime? _endPicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (_endPicker != null) {
      setState(() {
        _endDateSelected = _endPicker.toString().substring(0, 10);
        endDateCtrl.text = convertToThaiDate(_endPicker);
      });
    }
  }

//เมธอดแปลงวันที่แบบสากล (ปี ค.ศ.-เดือน ตัวเลข-วัน ตัวเลข) ให้เป็นวันที่แบบไทย (วัน เดือน ปี)
  //                             2023-11-25
  convertToThaiDate(date) {
    String day = date.toString().substring(8, 10);
    String year = (int.parse(date.toString().substring(0, 4)) + 543).toString();
    String month = '';
    int monthTemp = int.parse(date.toString().substring(5, 7));
    switch (monthTemp) {
      case 1:
        month = 'มกราคม';
        break;
      case 2:
        month = 'กุมภาพันธ์';
        break;
      case 3:
        month = 'มีนาคม';
        break;
      case 4:
        month = 'เมษายน';
        break;
      case 5:
        month = 'พฤษภาคม';
        break;
      case 6:
        month = 'มิถุนายน';
        break;
      case 7:
        month = 'กรกฎาคม';
        break;
      case 8:
        month = 'สิงหาคม';
        break;
      case 9:
        month = 'กันยายน';
        break;
      case 10:
        month = 'ตุลาคม';
        break;
      case 11:
        month = 'พฤศจิกายน';
        break;
      default:
        month = 'ธันวาคม';
    }

    return int.parse(day).toString() + ' ' + month + ' ' + year;
  }

  showWaringDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.green[50],
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'คำเตือน',
          ),
        ),
        content: Text(
          msg,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ตกลง',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future showCompleteDialog(context, msg) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.green[50],
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'ผลการทำงาน',
          ),
        ),
        content: Text(
          msg,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ตกลง',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _getCurrentLocation();
    locationNameCtrl.text = widget.trip!.location_name!;
    startDateCtrl.text = widget.trip!.start_date!;
    endDateCtrl.text = widget.trip!.end_date!;
    costCtrl.text = widget.trip!.cost!.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'แก้ไข/ลบ บันทึกการเดินทาง',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // รูปที่ 1 - อยู่ตรงกลางด้านบน
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                _opencamera()
                                    .then((value) => Navigator.pop(context));
                              },
                              leading: Icon(
                                Icons.camera_alt,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Open Camera...',
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 5.0,
                            ),
                            ListTile(
                              onTap: () {
                                _openGallery()
                                    .then((value) => Navigator.pop(context));
                              },
                              leading: Icon(
                                Icons.browse_gallery,
                                color: Colors.blue,
                              ),
                              title: Text(
                                'Open Gallery...',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.green),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: _imageSelected == null
                              ? NetworkImage(
                                  '${Env.hostName}/mt6552410001/picupload/trip/${widget.trip!.trip_image}')
                              : FileImage(_imageSelected!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // รูปที่ 2 และ 3 - อยู่ด้านล่างซ้ายขวา
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // รูปที่ 2
                      GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                _opencamera2()
                                    .then((value) => Navigator.pop(context));
                              },
                              leading: Icon(
                                Icons.camera_alt,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Open Camera...',
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 5.0,
                            ),
                            ListTile(
                              onTap: () {
                                _openGallery2()
                                    .then((value) => Navigator.pop(context));
                              },
                              leading: Icon(
                                Icons.browse_gallery,
                                color: Colors.blue,
                              ),
                              title: Text(
                                'Open Gallery...',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.green),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: _imageSelected2 == null
                              ? NetworkImage(
                                  '${Env.hostName}/mt6552410001/picupload/trip/${widget.trip!.trip_image_2}')
                              : FileImage(_imageSelected2!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                      SizedBox(width: 10), // เว้นช่องว่างระหว่างรูปที่ 2 กับ 3
                      // รูปที่ 3
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  onTap: () {
                                    _opencamera3().then(
                                        (value) => Navigator.pop(context));
                                  },
                                  leading: Icon(
                                    Icons.camera_alt,
                                    color: Colors.red,
                                  ),
                                  title: Text(
                                    'Open Camera...',
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 5.0,
                                ),
                                ListTile(
                                  onTap: () {
                                    _openGallery3().then(
                                        (value) => Navigator.pop(context));
                                  },
                                  leading: Icon(
                                    Icons.browse_gallery,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    'Open Gallery...',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.green),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: _imageSelected3 == null
                                  ? NetworkImage(
                                      '${Env.hostName}/mt6552410001/picupload/trip/${widget.trip!.trip_image_3}')
                                  : FileImage(_imageSelected3!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'สถานที่',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: TextField(
                  controller: locationNameCtrl,
                  decoration: InputDecoration(
                    hintText: 'ป้อนชื่อสถานที่',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ค่าใช้จ่าย',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: TextField(
                  controller: costCtrl,
                  decoration: InputDecoration(
                    hintText: 'ป้อนค่าใช้จ่าย',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'วันที่กิน',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: startDateCtrl,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'เลือกวันที่เริ่ม',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _openCalendar1();
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: endDateCtrl,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'เลือกวันที่สิ้นสุด',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _openCalendar2();
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  if (locationNameCtrl.text.isEmpty) {
                    showWaringDialog(context, 'กรุณาใส่ชื่อร้าน');
                  } else if (costCtrl.text.isEmpty) {
                    showWaringDialog(context, 'กรุณาใส่ราคา');
                  } else {
                    Trip trip;
                    if (_imageSelected == null) {
                      trip = Trip(
                        trip_id: widget.trip!.trip_id,
                        user_id: widget.trip!.user_id,
                        start_date: startDateCtrl.text.trim(),
                        end_date: endDateCtrl.text.trim(),
                        location_name: locationNameCtrl.text.trim(),
                        latitude: widget.trip!.latitude,
                        longitude: widget.trip!.longitude,
                        cost: costCtrl.text.trim(),
                      );
                    } else {
                      trip = Trip(
                        trip_id: widget.trip!.trip_id,
                        user_id: widget.trip!.user_id,
                        start_date: startDateCtrl.text.trim(),
                        end_date: endDateCtrl.text.trim(),
                        location_name: locationNameCtrl.text.trim(),
                        latitude: widget.trip!.latitude,
                        longitude: widget.trip!.longitude,
                        cost: costCtrl.text.trim(),
                        trip_image: _imageBase64Selected,
                        trip_image_2: _imageBase64Selected2,
                        trip_image_3: _imageBase64Selected3,
                      );
                    }
                    CallAPI.callUpdateTripAPI(trip).then((value) {
                      if (value.message == '1') {
                        showCompleteDialog(
                                context, 'แก้ไขบันทึกการเดินทางสําเร็จ')
                            .then((value) {
                          Navigator.pop(context, trip);
                        });
                      } else if (value.message == '0') {
                        showWaringDialog(
                            context, 'แก้ไขบันทึกการเดินทางไม่สําเร็จ');
                      }
                    });
                  }
                },
                child: Text(
                  'แก้ไขบันทึกการเดินทาง',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  Trip trip = Trip(
                    trip_id: widget.trip!.trip_id,
                  );
                  CallAPI.callDeleteTripAPI(trip).then((value) {
                    if (value.message == '1') {
                      showCompleteDialog(context, 'ลบบันทึกการเดินทางสําเร็จ')
                          .then((value) {
                        Navigator.pop(context);
                      });
                    } else if (value.message == '0') {
                      showWaringDialog(context, 'ลบบันทึกการเดินทางไม่สําเร็จ');
                    }
                  });
                },
                child: Text(
                  'ลบบันทึกการเดินทาง',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
