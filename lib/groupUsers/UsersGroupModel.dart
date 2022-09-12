class UsersGroupModel {
  UsersGroupModel({
    required this.Data,
  });
  late final List<Data1> Data;

  UsersGroupModel.fromJson(Map<String, dynamic> json){
    Data = List.from(json['Data']).map((e)=>Data1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Data'] = Data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data1 {
  Data1({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.UserGroups,
    required this.activities,
    required this.UserLogActivity,
  });
  late final String firstName;
  late final String lastName;
  late final int id;
  late final List<UserGroups1> UserGroups;
  late final Activities activities;
  late final List<UserLogActivity1> UserLogActivity;

  Data1.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    id = json['id'];
    UserGroups = List.from(json['UserGroups']).map((e)=>UserGroups1.fromJson(e)).toList();
    activities = Activities.fromJson(json['activities']);
    UserLogActivity = List.from(json['UserLogActivity']).map((e)=>UserLogActivity1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['id'] = id;
    _data['UserGroups'] = UserGroups.map((e)=>e.toJson()).toList();
    _data['activities'] = activities.toJson();
    _data['UserLogActivity'] = UserLogActivity.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UserGroups1 {
  UserGroups1({
    required this.id,
    required this.userId,
    required this.name,
    required this.uniqueKey,
    required this.enable,
    required this.Members,
  });
  late final int id;
  late final String userId;
  late final String name;
  late final String uniqueKey;
  late final String enable;
  late final List<Members1> Members;

  UserGroups1.fromJson(Map<String, dynamic> json){
    print("--- print from userGroup1 ");
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    uniqueKey = json['unique_key'];
    enable = json['enable'];
    Members = List.from(json['Members']).map((e)=>Members1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['unique_key'] = uniqueKey;
    _data['enable'] = enable;
    _data['Members'] = Members.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Members1 {
  Members1({
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
    required this.deletedAt,
    required this.bio,
     required this.gender,
    required this.dob,
    required this.pic,
    required this.country,
    required this.state,
    required this.city,
    required this.address,
    required this.postal,
    required this.userId,
    required this.groupId,
    required this.enable,
    required this.UserLogActivity,
  });
  late final int id;
  late final String email;
  late final String phone;
  late final String apiToken;
  late final List<dynamic> permissions;
  late final String lastLogin;
  late final String firstName;
  late final String lastName;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final String bio;
  late final String gender;
  late final String dob;
  late final String pic;
  late final String country;
  late final String state;
  late final String city;
  late final String address;
  late final String postal;
  late final String userId;
  late final String groupId;
  late final String enable;
  late final List<dynamic> UserLogActivity;

  Members1.fromJson(Map<String, dynamic> json){
    print("--- print from member1 ");
    id = json['id'];
    email = json['email'];
    if(json['phone'] == null) {
      phone = "";
    }else {
      phone = json['phone'];
    }
    apiToken = json['api_token'];
    permissions = List.castFrom<dynamic, dynamic>(json['permissions']);
    print("--- print from member 2 ");
    lastLogin = json['last_login'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = "";
    bio = "";
    gender = json['gender'];
    dob = "";
    pic = "";
    country = "";
    state = "";
    city = "";
    address = "";
    postal = "null";
    userId = json['user_id'];
    groupId = json['group_id'];
    enable = json['enable'];
    print("--- print from member3 ");
    UserLogActivity = List.castFrom<dynamic, dynamic>(json['UserLogActivity']);
    print("--- print from member4 ");
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
    _data['dob'] = dob;
    _data['pic'] = pic;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['address'] = address;
    _data['postal'] = postal;
    _data['user_id'] = userId;
    _data['group_id'] = groupId;
    _data['enable'] = enable;
    _data['UserLogActivity'] = UserLogActivity;
    return _data;
  }
}

class Activities {
  Activities({
  required this.day0,
  required this.day6,
  required this.day5,
  required this.day4,
  required this.day3,
  required this.day2,
  required this.day1,
});
late final String day0;
late final String day6;
late final String day5;
late final String day4;
late final String day3;
late final String day2;
late final String day1;

Activities.fromJson(Map<String, dynamic> json){
day0 = json['0'].toString();
day6 = json['-6'].toString();
day5 = json['-5'].toString();
day4 = json['-4'].toString();
day3 = json['-3'].toString();
day2 = json['-2'].toString();
day1 = json['-1'].toString();
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['0'] = day0;
  _data['-6'] = day6;
  _data['-5'] = day5;
  _data['-4'] = day4;
  _data['-3'] = day3;
  _data['-2'] = day2;
  _data['-1'] = day1;
  return _data;
}
}

class UserLogActivity1 {
  UserLogActivity1({
    required this.id,
    required this.userId,
    required this.topicId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
  late final String topicId;
  late final String createdAt;
  late final String updatedAt;

  UserLogActivity1.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    topicId = json['topic_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['topic_id'] = topicId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}