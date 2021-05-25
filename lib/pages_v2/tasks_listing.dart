import 'package:bn_staff/core/constants.dart';
import 'package:bn_staff/util/custom_app_bar.dart';
import 'package:bn_staff/widgets/listing_card.dart';
import 'package:bn_staff/widgets/top_button.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';


class TasksListing extends StatefulWidget {
  @override
  _TasksListingState createState() => _TasksListingState();
}

class _TasksListingState extends State<TasksListing> {
  bool roomsToClean = true;

  bool allRooms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar('Tasks'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: Config.COMMON_PADDING,right: Config.COMMON_PADDING,bottom: Config.COMMON_PADDING),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TopButton(
                      text: 'Rooms to Clean(54)',
                      isSelected: roomsToClean,
                      onTap: () {
                        setState(() {
                          if (roomsToClean == false) {
                            this.roomsToClean = true;
                            this.allRooms = false;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TopButton(
                      text: 'All Rooms(66)',
                      isSelected: allRooms,
                      onTap: () {
                        setState(() {
                          if (allRooms == false) {
                            this.roomsToClean = false;
                            this.allRooms = true;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 25,
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                        height: 20,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    return ListingCard(
                      floorName: '1st Floor',
                      roomsLeft: 12,
                      onTap: () {},
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),

            ],
          ),
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardA,
              leading: CircleAvatar(child: Text('A')),
              title: Text('Tap me!'),
              subtitle: Text('I expand!'),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.toggleExpansion();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
              expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Tap me!'),
              subtitle: Text('I expand, too!'),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the card above!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.toggleExpansion();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}