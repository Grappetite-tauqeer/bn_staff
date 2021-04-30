import 'package:bn_staff/core/colors.dart';
import 'package:bn_staff/pages/tasks.dart';
import 'package:bn_staff/util/dio.dart';
import 'package:bn_staff/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../widgets/input_view.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  bool showCompany = false;

  LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  'asset/images/icon.png',
                ),
                width: 120,
              ),
              SizedBox(height: 16,),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: PColors.blue,
                  fontSize: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Please, fill the below information to Log in',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: 8,),

              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: false,
                child: Column(
                  children: [
                    InputView(
                      label: 'Email Address',
                      detailLabel: 'Please Enter email address',
                      textInputType: TextInputType.emailAddress,
                      formValidations: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),

                        ],
                      ),
                    ),
                    InputView(
                      label: 'Password',
                      detailLabel: 'Please Enter your password',
                      textInputType: TextInputType.emailAddress,
                      formValidations: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),

                        ],
                      ),
                      isSecure: true,
                    ),

                    if (showCompany) ... [
                      InputView(
                        label: 'Company Url',
                        detailLabel: 'Please Enter your company url',
                        textInputType: TextInputType.emailAddress,
                        formValidations: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                      ),

                    ],

                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(12.0),
                child: PElevatedButton(
                    text: 'LOG IN',
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print('Correct');

                        EasyLoading.show(
                          status: 'loading...',
                        );
                        //
                        LoginApiProvider().getUser("bookingninjas.tso2@isvedition.org.tsodev5", "Targetman9988\$ypqrLXFM3io3ozghvWaCq980", successCallBack: (){
                          EasyLoading.dismiss();
                          EasyLoading.showToast('Loaded in successfully');

                          Route route = MaterialPageRoute(builder: (context) => Tasks());
                          Navigator.pushReplacement(context, route);

                        } , failedCallBack:  (){
                          EasyLoading.showToast('Error while logging in');

                        });

                      } else {
                        print('Wrong');

                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
