class RegisterModel {
  RegisterModel({
    required this.message,
    required this.error,
    required this.successfull,
    required this.user,
  });
  late final String message;
  late final int successfull;
  late final String error;
  late final List<User> user;

  RegisterModel.fromJson(Map<String, dynamic> json){
    if(json['message']!=null) {
      message = json['message'];
    }
    if(json['successfull']!=null) {
      successfull = json['successfull'];
    }

    if(json['error']!=null) {
      error = json['error'];
    }
  if(json['user'] !=null) {
    user = List.from(json['user']).map((e) => User.fromJson(e)).toList();
  }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['successfull'] = successfull;
    _data['error'] = error;
    _data['user'] = user.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class User {
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.apiToken,
    required this.phone,
    required this.gender,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.UserLogActivity,
  });
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String apiToken;
  late final String phone;
  late final String gender;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  late final List<dynamic> UserLogActivity;

  User.fromJson(Map<String, dynamic> json){
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    apiToken = json['api_token'];
    phone = json['phone'];
    gender = json['gender'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    UserLogActivity = List.castFrom<dynamic, dynamic>(json['UserLogActivity']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['api_token'] = apiToken;
    _data['phone'] = phone;
    _data['gender'] = gender;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    _data['UserLogActivity'] = UserLogActivity;
    return _data;
  }
}