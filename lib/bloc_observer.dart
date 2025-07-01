// ignore: file_names
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
@override
void onCreate(BlocBase bloc) {
  super.onCreate(bloc);
  // Add your custom logic here if needed
}

  @override
  void onEvent(Bloc bloc, Object? event) {
	super.onEvent(bloc, event);
	// Add your custom logic here if needed
  }

  @override
  void onChange(BlocBase bloc, Change change) {
	super.onChange(bloc, change);
	// Add your custom logic here if needed
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
	super.onTransition(bloc, transition);
	// Add your custom logic here if needed
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
	super.onError(bloc, error, stackTrace);
	// Add your custom logic here if needed
  }
}