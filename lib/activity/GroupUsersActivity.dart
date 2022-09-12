class GroupUsersActivityModel {
  GroupUsersActivityModel({
    required this.Data,
  });
  late final List<Data1> Data;

  GroupUsersActivityModel.fromJson(Map<String, dynamic> json){
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
    required this.activities,
    required this.UserGroups,
    required this.UserLogActivity,
  });
  late final String firstName;
  late final String lastName;
  late final int id;
  late final Activities activities;
  late final List<dynamic> UserGroups;
  late final List<UserLogActivity1> UserLogActivity;

  Data1.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    id = json['id'];
    activities = Activities.fromJson(json['activities']);
    UserGroups = List.castFrom<dynamic, dynamic>(json['UserGroups']);
    UserLogActivity = List.from(json['UserLogActivity']).map((e)=>UserLogActivity1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['id'] = id;
    _data['activities'] = activities.toJson();
    _data['UserGroups'] = UserGroups;
    _data['UserLogActivity'] = UserLogActivity.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Activities {
  Activities({
    required this.day0,
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
  });
  late final String day0;
  late final String day1;
  late final String day2;
  late final String day3;
  late final String day4;
  late final String day5;
  late final String day6;

  Activities.fromJson(Map<String, dynamic> json){
    day0 = json['day0'];
    day1 = json['day-1'];
    day2 = json['day-2'];
    day3 = json['day-3'];
    day4 = json['day-4'];
    day5 = json['day-5'];
    day6 = json['day-6'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day0'] = day0;
    _data['day-1'] = day1;
    _data['day-2'] = day2;
    _data['day-3'] = day3;
    _data['day-4'] = day4;
    _data['day-5'] = day5;
    _data['day-6'] = day6;
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