class UserModel {
  String? name, email;
  int? password;

  UserModel({required this.name, required this.email, required this.password});

  factory UserModel.fromMap(Map m1) {
    return UserModel(
        name: m1['name'], email: m1['email'], password: m1['password']);
  }

  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'password':password
    };
  }
}
