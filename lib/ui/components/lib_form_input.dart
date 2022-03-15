import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibFormInput extends StatelessWidget {
  String? hint;
  Function? onChange;
  String type;
  TextEditingController controller = TextEditingController();


  LibFormInput({
    Key? key, this.hint,
    this.onChange,
    this.type = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: controller,
      obscureText: type.toLowerCase() == 'password',
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      textAlign: TextAlign.center,
      // style: TextStyle(
      //     color: Colors.black87
      //     color: Colors.black87
      // ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: kTextColor,
      ),
      decoration: kFormInputDecoration.copyWith(
        hintText: '$hint',
      ),
    );
  }
}
