class AccountModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String education;
  final String stage;
  final String level;

  AccountModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.education,
      required this.stage,
      required this.level});
}
