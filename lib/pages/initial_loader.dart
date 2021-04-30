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

  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: Icon(
              Icons.expand_more,
              size: 50.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          secondChild(),
          SizedBox(
            height: 80.0,
          ),
        ],
      ),
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Image(
                  image: AssetImage('asset/images/icon.png'),
                  width: _heartAnimation.value,
                ),
              );
            },
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
