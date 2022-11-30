abstract class RegisterEvent{}

class RegisterEmailChanged extends RegisterEvent{
  final String email;

  RegisterEmailChanged({required this.email});
}

class RegisterFullNameChanged extends RegisterEvent{
  final String fullName;

  RegisterFullNameChanged({required this.fullName});
}

class RegisterPasswordChanged extends RegisterEvent{
  final String password;

  RegisterPasswordChanged({required this.password});
}

class RegisterConfirmPasswordChanged extends RegisterEvent{
  final String confirmPassword;

  RegisterConfirmPasswordChanged({required this.confirmPassword});
}

class RegisterSubmitted extends RegisterEvent{
  
}