import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputView extends StatelessWidget {

  final String label;
  final String detailLabel;
  final TextInputType textInputType;//TextInputType.number
  final FormFieldValidator formValidations;

  final Function(String) onChange;

  final isSecure;

  InputView({this.label,this.detailLabel,this.textInputType,this.formValidations,this.onChange,this.isSecure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: FormBuilderTextField(
        name: label,
        obscureText: this.isSecure,

        decoration: InputDecoration(
          labelText: detailLabel,
        ),
        onChanged: (newValue) {

          this.onChange(newValue);

          print(newValue);

        },
        // valueTransformer: (text) => num.tryParse(text),
        validator: formValidations,
        keyboardType: textInputType,
      ),
    );

  }
}

