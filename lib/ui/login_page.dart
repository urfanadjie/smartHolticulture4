import 'package:flutter/material.dart';
import 'package:smart_holticulture_4/constants/constants_value.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
