class LogInModel {
  LogInModel({
    required this.loginUser,
  });
  late final LoginUser loginUser;

  LogInModel.fromJson(Map<String, dynamic> json){
    loginUser = LoginUser.fromJson(json['loginUser']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['loginUser'] = loginUser.toJson();
    return _data;
  }
}

class LoginUser {
  LoginUser({
    required this.id,
    required this.email,
    required this.phone,
    required this.apiToken,
    required this.permissions,
    required this.lastLogin,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.bio,
    required this.gender,
    required this.groupUniqueId,
    this.dob,
    this.pic,
    this.country,
    this.state,
    this.city,
    this.address,
    this.postal,
    required this.UserGroups,
    required this.UserLogActivity,
    required this.roles,
  });
  late final int id;
  late final String email;
  late final String? phone;
  late final String apiToken;
  late final List<dynamic> permissions;
  late final List<dynamic> lastLogin;
  late final String firstName;
  late final String lastName;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null bio;
  late final String gender;
  late final Null dob;
  late final Null pic;
  late final Null country;
  late final Null state;
  late final Null city;
  late final Null address;
  late final Null postal;
  late final String groupUniqueId;
  late final List<dynamic> UserGroups;
  late final List<dynamic> UserLogActivity;
  late final List<Roles> roles;

  LoginUser.fromJson(Map<String, dynamic> json){
    print("-- ground 0");
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    apiToken = json['api_token'];
    print("-- ground 1");
    permissions = List.castFrom<dynamic, dynamic>(json['permissions']);
    lastLogin = List.castFrom<dynamic, dynamic>(json['last_login']);
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    print("-- ground 2");
    deletedAt = null;
    bio = null;
    gender = json['gender'];
    groupUniqueId = json['group_id'];
    dob = null;
    pic = null;
    country = null;
    state = null;
    city = null;
    address = null;
    postal = null;
    if(json['UserGroups'] != null ) {
      UserGroups = List.castFrom<dynamic, dynamic>(json['UserGroups']);
    }
    print("-- ground 3");
    UserLogActivity = List.castFrom<dynamic, dynamic>(json['UserLogActivity']);
    print("-- ground 4");
    roles = List.from(json['roles']).map((e)=>Roles.fromJson(e)).toList();
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['api_token'] = apiToken;
    _data['permissions'] = permissions;
    _data['last_login'] = lastLogin;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['bio'] = bio;
    _data['gender'] = gender;
    _data['group_id'] = groupUniqueId;
    _data['dob'] = dob;
    _data['pic'] = pic;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['address'] = address;
    _data['postal'] = postal;
    _data['UserGroups'] = UserGroups;
    _data['UserLogActivity'] = UserLogActivity;
    return _data;
  }


}

class Roles {
  Roles({
    required this.id,
    required this.slug,
    required this.name,
    required this.permissions,
    required this.createdAt,
    required this.updatedAt,
  //  required this.pivot,
  });
  late final int id;
  late final String slug;
  late final String name;
  late final List<dynamic> permissions;
  late final String createdAt;
  late final String updatedAt;
 // late final Pivot pivot;

  Roles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    permissions = List.castFrom<dynamic, dynamic>(json['permissions']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  //  pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slug'] = slug;
    _data['name'] = name;
    _data['permissions'] = permissions;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    //_data['pivot'] = pivot.toJson();
    return _data;
  }
}