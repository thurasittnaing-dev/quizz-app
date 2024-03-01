import 'package:flutter/material.dart';
import 'package:quizz/my_app.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  return runApp(const MyApp());
}
