import 'package:bn_staff/model/user.dart';
import 'package:bn_staff/util/dio.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants.dart';
import '../pages/login.dart';
import '../pages/tasks.dart';

class InitialLoader extends StatefulWidget {
  @override
  _InitialLoaderState createState() => _InitialLoaderState();
}

class _InitialLoaderState extends State<InitialLoader>
    with TickerProviderStateMixin {
  Animation _arrowAnimation, _heartAnimation;

  AnimationController _arrowAnimationController, _heartAnimationController;

  void goToMainScreen() async {

    User user = await User.getCurrentUser();

    if (user == null) {
      goToLogin();
    } else {
      LoginApiProvider().getUser(user.username, user.password,
          successCallBack: () {
        Future.delayed(const Duration(seconds: 1), () {
          MutualActions.goToView(Tasks(), context);
        });
      }, failedCallBack: () {
        goToLogin();
      });
    }
  }

  void goToLogin() {
    Future.delayed(const Duration(seconds: 1), () {
      MutualActions.goToView(LoginView(), context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getLocation();

    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });

    _heartAnimationController.forward();

    goToMainScreen();
  }

  /**/

  void moveToNextView() {
    Future.delayed(const Duration(seconds: 1), () {
      MutualActions.goToView(Tasks(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Color.fromRGBO(87, 164, 255, 1),
                Color.fromRGBO(125, 181, 248, 1),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Container()),
            Expanded(flex: 3, child: secondChild()),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Housekeeping App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: AnimatedBuilder(
                  animation: _heartAnimationController,
                  builder: (context, child) {
                    return Center(
                      child: Image(
                        image: AssetImage('asset/images/logo.png'),
                        width: _heartAnimation.value,
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 84,
                    child: Image(
                      image: AssetImage('asset/images/logoText.png'),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }
}
