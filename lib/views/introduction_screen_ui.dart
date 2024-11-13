// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:my_trip_project/views/login_ui.dart';

class IntroductioScreenUI extends StatefulWidget {
  const IntroductioScreenUI({super.key});

  @override
  State<IntroductioScreenUI> createState() => _IntroductioScreenUIState();
}

class _IntroductioScreenUIState extends State<IntroductioScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.green[50],
      body: Flexible(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.green[50],
          autoScrollDuration: 2000,
          infiniteAutoScroll: true,
          scrollPhysics: BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: Text(
                'WANDERLUST',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              image: Image.asset(
                'assets/images/trip_intro1.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              bodyWidget: Column(
                children: [
                  Text(
                    'Adventure Awaits',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'สัมผัสการเดินทางที่ไม่มีสิ้นสุด กับการออกสำรวจดินแดนใหม่ ๆ ที่ยังไม่เคยพบเจอ สัมผัสธรรมชาติที่อุดมสมบูรณ์และวิถีชีวิตท้องถิ่น สายลมที่พัดผ่าน และท้องฟ้าที่เปิดกว้างจะทำให้ทุกการเดินทางเต็มไปด้วยความหมาย',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                'ESCAPE',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              image: Image.asset(
                'assets/images/trip_intro2.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              bodyWidget: Column(
                children: [
                  Text(
                    'Discover the Unseen',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'ปลดปล่อยตัวเองจากความวุ่นวายและสู่การผจญภัยที่น่าตื่นเต้น สัมผัสความสงบเงียบท่ามกลางธรรมชาติ หรือปล่อยใจไปกับท้องทะเลที่ไม่มีที่สิ้นสุด ทุกที่ที่คุณไป จะเป็นช่วงเวลาแห่งการหลบหนีที่ไม่เหมือนใคร',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                'EXPLORE',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              image: Image.asset(
                'assets/images/trip_intro3.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              bodyWidget: Column(
                children: [
                  Text(
                    'Find Your Horizon',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'โลกกว้างรอคอยการค้นพบใหม่ๆ ทุกการเดินทางคือการเปิดโอกาสให้ได้สัมผัสความงามที่ซ่อนอยู่ พบปะผู้คนหลากหลายเชื้อชาติ วัฒนธรรมที่น่าหลงใหล ทุกย่างก้าวคือประสบการณ์ที่น่าจดจำ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                'JOURNEY',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              image: Image.asset(
                'assets/images/trip_intro4.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              bodyWidget: Column(
                children: [
                  Text(
                    'Make Every Mile Count',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'การเดินทางแต่ละครั้งเต็มไปด้วยเรื่องราวที่รอให้คุณได้ค้นพบ ไม่ว่าจะเป็นการนั่งรถท่องเที่ยวในชนบทหรือการเดินทางไปยังเมืองใหม่ การเดินทางทำให้คุณได้เรียนรู้จากสิ่งที่เห็นและสัมผัส ทำให้ทุกไมล์มีความหมาย',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
          showSkipButton: true,
          skip: Text(
            'ข้าม',
            style: GoogleFonts.kanit(
              color: Colors.green,
            ),
          ),
          skipOrBackFlex: 0,
          dotsContainerDecorator: BoxDecoration(),
          onSkip: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginUI())),
          dotsDecorator: DotsDecorator(
              size: Size(
                MediaQuery.of(context).size.width * 0.01,
                MediaQuery.of(context).size.width * 0.01,
              ),
              color: Colors.grey,
              activeSize: Size(
                MediaQuery.of(context).size.width * 0.02,
                MediaQuery.of(context).size.width * 0.01,
              ),
              activeColor: Colors.green,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ))),
          next: Icon(
            Icons.arrow_forward,
            color: Colors.green,
          ),
          nextFlex: 0,
          done: Text(
            'เริ่มต้น',
            style: GoogleFonts.kanit(color: Colors.green),
          ),
          onDone: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginUI())),
        ),
      ),
    );
  }
}
