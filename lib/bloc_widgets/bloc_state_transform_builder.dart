import 'package:blocs/bloc_helpers/bloc_event_state.dart';
import 'package:blocs/bloc_helpers/bloc_state_transform_base.dart';
import 'package:flutter/material.dart';

typedef Widget AsyncBlocStateBuilder<BlocState>(BuildContext context, BlocState state);

class BlocStateTransformBuilder<T extends BlocState, S extends BlocState> extends StatelessWidget {
    const BlocStateTransformBuilder({
        Key key,
        @required this.builder,
        @required this.transformBloc,
    }): assert(builder != null),
        assert(transformBloc != null),
        super(key: key);

    final BlocStateTransformBase<T,S> transformBloc;
    final AsyncBlocStateBuilder<T> builder; 

    @override
    Widget build(BuildContext context){
        return StreamBuilder<T>(
            stream: transformBloc.state,
            initialData: transformBloc.initialState,
            builder: (BuildContext context, AsyncSnapshot<T> snapshot){
                return builder(context, snapshot.data);
            },
        );
   }
}
