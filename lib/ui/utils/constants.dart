import 'package:flutter/material.dart';

const kTextColor = Colors.white;
const kAccentColor = Colors.lightGreenAccent;
const kRadius = 20.0;

final kFormInputDecoration = InputDecoration(
  hintText: 'Enter your value',
  hintStyle: TextStyle(
    color: Colors.white60,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35.0),
      borderSide: BorderSide(
          color: Colors.red,
          width: .0
      )
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35.0),
      borderSide: BorderSide(
          color: kAccentColor,
          width: 2.0
      )
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35.0),
      borderSide: BorderSide(
          color: Colors.white,
          width: 2.0
      )
  ),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 15,
  ),
);