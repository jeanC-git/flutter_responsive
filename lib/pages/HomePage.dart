import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';

import 'package:responsive2/utils/colors.dart' as color;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
      print(info);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: Container(
          padding: EdgeInsets.only(left: 30, top: 70, right: 30),
          child: Column(
            children: [
              HeaderHomePage(),
              SizedBox(
                height: 30,
              ),
              SubHeaderHomePage(),
              SizedBox(
                height: 20,
              ),
              FirstCardHomePage(),
              SizedBox(
                height: 5,
              ),
              SecondCardHomePage(),
              BodyTitleHomePage(),
              BodyListHomePage(
                info: info,
              )
            ],
          ),
        ));
  }
}

class BodyListHomePage extends StatelessWidget {
  final List? info;
  const BodyListHomePage({
    this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: OverflowBox(
      maxWidth: MediaQuery.of(context).size.width,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            itemCount: this.info!.length.toDouble() ~/ 2,
            itemBuilder: (_, i) {
              int a = 2 * i;
              int b = 2 * i + 1;
              return Row(
                children: [
                  Container(
                    height: 170,
                    width: (MediaQuery.of(context).size.width - 90) / 2,
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.only(left: 30, bottom: 30, top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(5, 5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.1)),
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(-5, -5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.1))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(this.info![a]['img']))),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          this.info![a]['title'],
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: color.AppColor.homePageDetail),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 170,
                    width: (MediaQuery.of(context).size.width - 90) / 2,
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.only(left: 30, bottom: 30, top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(5, 5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.1)),
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(-5, -5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.1))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(this.info![b]['img']))),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          this.info![b]['title'],
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: color.AppColor.homePageDetail),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    ));
  }
}

class BodyTitleHomePage extends StatelessWidget {
  const BodyTitleHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Area of focus",
          style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w500,
              color: color.AppColor.homePageTitle),
        )
      ],
    );
  }
}

class SecondCardHomePage extends StatelessWidget {
  const SecondCardHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/card.jpg"), fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        offset: Offset(8, 10),
                        color: color.AppColor.gradientSecond.withOpacity(0.3)),
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(-1, -5),
                        color: color.AppColor.gradientSecond.withOpacity(0.3))
                  ])),
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.only(right: 200, bottom: 30),
            decoration: BoxDecoration(
              // color: Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/figure.png"),
                // fit: BoxFit.fill
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 100,
            // color: Colors.redAccent.withOpacity(0.3),
            margin: EdgeInsets.only(left: 140, top: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "You are doing great",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.homePageDetail),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: "Keep it up\n",
                      style: TextStyle(
                          color: color.AppColor.homePagePlanColor,
                          fontSize: 11.sp),
                      children: [
                    TextSpan(
                      text: "stick to your plan",
                    )
                  ]))
            ]),
          )
        ],
      ),
    );
  }
}

class FirstCardHomePage extends StatelessWidget {
  const FirstCardHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Radius border = Radius.circular(10);
    const Radius borderTopRight = Radius.circular(80);

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: border,
            bottomLeft: border,
            bottomRight: border,
            topRight: borderTopRight),
        boxShadow: [
          BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 20,
              color: color.AppColor.gradientSecond.withOpacity(0.2))
        ],
        gradient: LinearGradient(colors: [
          color.AppColor.gradientFirst.withOpacity(0.8),
          color.AppColor.gradientSecond.withOpacity(0.9)
        ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 25, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Next workout",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: color.AppColor.homePageContainerTextSmall),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Legs Toning",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: color.AppColor.homePageContainerTextSmall),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "and Glutes Workout",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: color.AppColor.homePageContainerTextSmall),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 15.sp,
                      color: color.AppColor.homePageContainerTextSmall,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "60 min.",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                          color: color.AppColor.gradientFirst,
                          blurRadius: 10,
                          offset: Offset(4, 8)),
                    ],
                  ),
                  child: Icon(
                    Icons.play_circle_fill,
                    size: 45.sp,
                    color: color.AppColor.homePageContainerTextSmall,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SubHeaderHomePage extends StatelessWidget {
  const SubHeaderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Your program",
            style: TextStyle(
                fontSize: 16.sp,
                color: color.AppColor.homePageSubtitle,
                fontWeight: FontWeight.w700)),
        Expanded(child: Container()),
        Text("Details",
            style: TextStyle(
                fontSize: 16.sp, color: color.AppColor.homePageDetail)),
        SizedBox(
          width: 5,
        ),
        Icon(Icons.arrow_forward,
            size: 15.sp, color: color.AppColor.homePageIcons),
      ],
    );
  }
}

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Training",
            style: TextStyle(
                fontSize: 25.sp,
                color: color.AppColor.homePageTitle,
                fontWeight: FontWeight.w700)),
        Expanded(child: Container()),
        Icon(Icons.arrow_back_ios,
            size: 16.sp, color: color.AppColor.homePageIcons),
        SizedBox(width: 10),
        Icon(Icons.calendar_today_outlined,
            size: 16.sp, color: color.AppColor.homePageIcons),
        SizedBox(width: 15),
        Icon(Icons.arrow_forward_ios,
            size: 16.sp, color: color.AppColor.homePageIcons),
      ],
    );
  }
}
