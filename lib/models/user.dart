
class User {
  final String id;
  final String name;
  final String surName;
  final String email;
  final String userRole;

  User({this.id, this.name,this.surName, this.email, this.userRole});

  User.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        surName = data['surName'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surName': surName,
      'email': email,
      'userRole': userRole,
    };
  }
}
