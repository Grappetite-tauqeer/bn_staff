import 'package:bn_staff/core/colors.dart';
import 'package:bn_staff/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class TasksHome extends StatelessWidget {
  var _volumeValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Tasks'),),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(Config.COMMON_PADDING),
            child: Center(
              child: Container(

                width: MediaQuery
                    .of(context)
                    .size
                    .width / Config.HOME_CARD_WIDTH_RATIO,
                height: MediaQuery
                    .of(context)
                    .size
                    .width / Config.HOME_CARD_HEIGHT_RATIO,

                child: Card(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child:Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(child: Container()),

                      Expanded(
                        child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(minimum: 0,
                                maximum: 100,
                                startAngle: 270,
                                endAngle: 270,
                                showLabels: false,
                                showTicks: false,
                                radiusFactor: 0.6,
                                axisLineStyle: AxisLineStyle(
                                    cornerStyle: CornerStyle.bothFlat,
                                    color: Colors.black12,
                                    thickness: 8),
                                pointers: <GaugePointer>[
                                  RangePointer(

                                    value: _volumeValue,
                                    cornerStyle: CornerStyle.bothFlat,
                                    width: 8,
                                    sizeUnit: GaugeSizeUnit.logicalPixel,
                                    color: PColors.backgroundColor,
                                  ),

                                ],
                              )
                            ],

                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
        ),
      ),

    );
  }
}




