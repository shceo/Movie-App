// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'authentication_event.dart';
// part 'authentication_state.dart';

// class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
//   AuthenticationBloc() : super(AuthenticationInitial()) {
//     on<RegisterEvent>(_registerPageEvent);
//     on<AuthEvent>(_authPageEvent);  
//     on<SignOutEvent>(_signOutEvent);
//   }
  
//   Future<void> _registerPageEvent(RegisterEvent event, Emitter<AuthenticationState> emit) async{
//     emit(RegistrationState());
//   }
  
//   Future<void> _authPageEvent (
//     AuthEvent event, Emitter<AuthenticationState> emit) async {
//       emit(AuthState());
//     }
    
//       Future<void> _signOutEvent (
//     SignOutEvent event, Emitter<AuthenticationState> emit) async {
//       FirebaseAuth.instance.signOut();
//       emit(AuthState());
// }
// }