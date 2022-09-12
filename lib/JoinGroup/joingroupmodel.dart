class JoinGroupModel {
  JoinGroupModel({
    required this.message,
    required this.successfull,
  });

  late final String message;
  late  var successfull;

  JoinGroupModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "";
    successfull = json['successfull'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['successfull'] = successfull;
    return _data;
  }
}
