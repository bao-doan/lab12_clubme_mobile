import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibFormInput extends StatelessWidget {
  String? hint;
  Function? onChange;
  Function? validator;
  String type;
  // TextEditingController controller = TextEditingController();
  TextEditingController? controller;

  LibFormInput({
    Key? key, this.hint,
    this.onChange,
    this.type = '',
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      validator: (value) {
        return (validator ?? (value) => null)(value);
      },
      obscureText: type.toLowerCase() == 'password',
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: kTextColor,
      ),
      decoration: kFormInputDecoration.copyWith(
        hintText: '$hint',
      ),
    );
  }
}
