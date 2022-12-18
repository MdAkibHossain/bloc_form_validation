abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangeEvent(
    this.emailValue,
    this.passwordValue,
  );
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmitEvent(
    this.email,
    this.password,
  );
}
