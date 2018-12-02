import 'package:blocs/bloc_helpers/bloc_event_state.dart';

class RegistrationState extends BlocState {
  RegistrationState({
    this.isBusy: false,
    this.isSuccess: false,
    this.isFailure: false,
  });

  final bool isBusy;
  final bool isSuccess;
  final bool isFailure;

  factory RegistrationState.noAction() {
    return RegistrationState();
  }

  factory RegistrationState.busy(){
    return RegistrationState(isBusy: true,);
  }

  factory RegistrationState.success(){
    return RegistrationState(isSuccess: true,);
  }

  factory RegistrationState.failure(){
    return RegistrationState(isFailure: true,);
  }

}