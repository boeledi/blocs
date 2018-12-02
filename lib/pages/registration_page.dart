import 'package:blocs/pages/registration_form.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registration form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}