import 'package:blocs/bloc_helpers/bloc_event_state.dart';
import 'package:blocs/blocs/registration/registration_event.dart';
import 'package:blocs/blocs/registration/registration_state.dart';

class RegistrationBloc extends BlocEventStateBase<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : super(
          initialState: RegistrationState.noAction(),
        );

  @override
  Stream<RegistrationState> eventHandler(RegistrationEvent event, RegistrationState currentState) async* {
    if (event.event == RegistrationEventType.working){
      yield RegistrationState.busy();
print('Registration of ${event.email}/${event.password}');

      await Future.delayed(const Duration(seconds: 1));

      yield RegistrationState.success();
    }
  }
}