import 'package:bn_staff/pages/home.dart';
import 'package:bn_staff/pages/tasks.dart';
import 'package:bn_staff/pages_v2/tasks_home.dart';
import 'package:bn_staff/pages_v2/tasks_listing.dart';
import 'package:bn_staff/util/custom_amination.dart';
import 'package:bn_staff/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'core/colors.dart';
import 'core/theme.dart';
import 'pages/login.dart';
import 'pages/initial_loader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:math' as math;

void main() {
  configLoading();

  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Ninja',
      theme: getAppTheme(context),
      builder: EasyLoading.init(),
      home: TasksHome(),
    );
  }
}

class WidgetDemo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<WidgetDemo> {
  ScrollController scrollController = new ScrollController();
  bool isVisible = true;

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible)
          setState(() {
            isVisible = true;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              PElevatedButton(
                text: 'Text',
                onPressed: (){

                },
              ),
              CustomScrollView(
                controller: scrollController,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                   padding: const EdgeInsets.all(20.0),
                   sliver: new SliverList(
                     delegate: new SliverChildListDelegate(
                       <Widget>[
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                         const Text('My temp data'),
                         const Text('Wow its working'),
                       ],
                     ),
                   ),
                      ),
                ],
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: isVisible ? 160.0 : 0.0,
            child: Container(
              color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    flex: 11,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 16, left: 20),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Rooms Left To Clean',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '54',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              startAngle: 270,
                              endAngle: 270,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.6,
                              axisLineStyle: AxisLineStyle(
                                  cornerStyle: CornerStyle.bothFlat,
                                  color: Colors.black12,
                                  thickness: 6),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: 20,
                                  cornerStyle: CornerStyle.bothFlat,
                                  width: 6,
                                  sizeUnit:
                                  GaugeSizeUnit.logicalPixel,
                                  color: PColors.backgroundColor,
                                ),
                              ],
                            )
                          ],
                        ),
                        Center(
                          child: Text(
                            '18%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
