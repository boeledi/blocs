import 'package:blocs/bloc_widgets/bloc_state_builder.dart';
import 'package:blocs/blocs/registration/registration_bloc.dart';
import 'package:blocs/blocs/registration/registration_event.dart';
import 'package:blocs/blocs/registration/registration_form_bloc.dart';
import 'package:blocs/blocs/registration/registration_state.dart';
import 'package:blocs/widgets/pending_action.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _retypeController;
  RegistrationFormBloc _registrationFormBloc;
  RegistrationBloc _registrationBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _retypeController = TextEditingController();
    _registrationFormBloc = RegistrationFormBloc();
    _registrationBloc = RegistrationBloc();
  }

  @override
  void dispose() {
    _registrationBloc?.dispose();
    _registrationFormBloc?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _retypeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<RegistrationState>(
        bloc: _registrationBloc,
        builder: (BuildContext context, RegistrationState state) {
          if (state.isBusy) {
            return PendingAction();
          } else if (state.isSuccess) {
            return _buildSuccess();
          } else if (state.isFailure) {
            return _buildFailure();
          }
          return _buildForm();
        });
  }

  Widget _buildSuccess() {
    return Center(
      child: Text('Success'),
    );
  }

  Widget _buildFailure() {
    return Center(
      child: Text('Failure'),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        children: <Widget>[
          StreamBuilder<String>(
              stream: _registrationFormBloc.email,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    errorText: snapshot.error,
                  ),
                  controller: _emailController,
                  onChanged: _registrationFormBloc.onEmailChanged,
                  keyboardType: TextInputType.emailAddress,
                );
              }),
          StreamBuilder<String>(
              stream: _registrationFormBloc.password,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    errorText: snapshot.error,
                  ),
                  controller: _passwordController,
                  obscureText: false,
                  onChanged: _registrationFormBloc.onPasswordChanged,
                );
              }),
          StreamBuilder<String>(
              stream: _registrationFormBloc.confirmPassword,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'retype password',
                    errorText: snapshot.error,
                  ),
                  controller: _retypeController,
                  obscureText: false,
                  onChanged: _registrationFormBloc.onRetypePasswordChanged,
                );
              }),
          StreamBuilder<bool>(
              stream: _registrationFormBloc.registerValid,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return RaisedButton(
                  child: Text('Register'),
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          _registrationBloc.emitEvent(RegistrationEvent(
                              event: RegistrationEventType.working,
                              email: _emailController.text,
                              password: _passwordController.text));
                        }
                      : null,
                );
              }),
        ],
      ),
    );
  }
}
