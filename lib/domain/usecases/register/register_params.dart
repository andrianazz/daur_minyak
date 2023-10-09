class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phone;

  RegisterParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation,
      required this.phone});
}
