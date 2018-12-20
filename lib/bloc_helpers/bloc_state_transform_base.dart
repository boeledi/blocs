import 'package:blocs/bloc_helpers/bloc_event_state.dart';
import 'package:blocs/bloc_helpers/bloc_provider.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

///
/// Based class used for the transformation of a states
///
abstract class BlocStateTransformBase<T, S extends BlocState> implements BlocBase {
    //
    // Initial State
    //
    final T initialState;

    //
    // Transformed States
    //
    BehaviorSubject<T> _stateController = BehaviorSubject<T>();
    Stream<T> get state => _stateController;

    //
    // [Must Override] state handler
    //
    Stream<T> stateHandler({T currentState, S newState});

    //
    // Constructor
    //
    BlocStateTransformBase({
        @required this.initialState,
        @required BlocEventStateBase<BlocEvent, BlocState> blocIn,
    }){
        assert(blocIn != null);
        assert(blocIn is BlocEventStateBase<BlocEvent, BlocState>);

        blocIn.state.listen((BlocState stateIn){
            T currentState = _stateController.value ?? initialState;

            stateHandler(currentState: currentState, newState: stateIn).forEach((T newState){
                _stateController.sink.add(newState);
            });
        });
    }

    @override
    void dispose(){
        _stateController?.close();
    }
}
