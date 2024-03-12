class Account {
  final String _name;
  final String _email;
  final String _password;
  final String _id;

  Account({
    required String name,
    required String email,
    required String password,
    required String id,
  })  : _name = name,
        _email = email,
        _password = password,
        _id = id;

  String getName() => _name;
  String getEmail() => _email;
  String getPassword() => _password;
  String getid() => _id;
}
