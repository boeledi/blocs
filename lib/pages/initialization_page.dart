import 'package:blocs/bloc_widgets/bloc_state_builder.dart';
import 'package:blocs/blocs/application_initialization/application_initialization_bloc.dart';
import 'package:blocs/blocs/application_initialization/application_initialization_event.dart';
import 'package:blocs/blocs/application_initialization/application_initialization_state.dart';
import 'package:flutter/material.dart';

class InitializationPage extends StatefulWidget {
  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  ApplicationInitializationBloc bloc;

  @override
  void initState(){
    super.initState();
    bloc = ApplicationInitializationBloc();
    bloc.emitEvent(ApplicationInitializationEvent());
  }

  @override
  void dispose(){
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext pageContext) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: BlocEventStateBuilder<ApplicationInitializationState>(
              bloc: bloc,
              builder: (BuildContext context, ApplicationInitializationState state){
                if (state.isInitialized){
                  //
                  // Once the initialization is complete, let's move to another page
                  //
                  WidgetsBinding.instance.addPostFrameCallback((_){
                    Navigator.of(context).pushReplacementNamed('/decision');
                  });
                }
                return Text('Initialization in progress... ${state.progress}%');
              },
            ),
          ),
        ),
      ),
    );
  }
}