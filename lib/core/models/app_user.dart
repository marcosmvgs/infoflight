class AppUser {
  final String id;
  final String? name;
  final String email;
  final String password;

  const AppUser({
    required this.id,
    this.name,
    required this.email,
    required this.password
  });
}
