// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_app_eateso/pages/sign-up/bloc/sign_up_event.dart';
// import 'package:project_app_eateso/pages/sign-up/bloc/sign_up_state.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
//   RegisterBloc() : super(RegisterState());

//   Stream<RegisterState> mapEventToState(RegisterEvent event){
//     // Email updated
//     if(event is RegisterEmailChanged){
//       yield state.copyWith(email: event.email);
//     } //Form submitted
//     else(event is RegisterSubmitted){
//       yield state.copyWith(formStatus: FormSubmitting());
//     }
//   }
// }