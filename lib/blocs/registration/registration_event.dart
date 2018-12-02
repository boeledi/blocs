import 'package:blocs/bloc_helpers/bloc_event_state.dart';

class RegistrationEvent extends BlocEvent {
  RegistrationEvent({
    this.event,
    this.email,
    this.password,
  });

  final RegistrationEventType event;
  final String email;
  final String password;
}

enum RegistrationEventType {
  none,
  working,
}