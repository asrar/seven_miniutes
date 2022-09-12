class RegisteredAsAMemberModel {
  RegisteredAsAMemberModel({
    required this.message,
    required this.successfull,
  });
  late final String message;
  late final int successfull;

  RegisteredAsAMemberModel.fromJson(Map<String, dynamic> json){
    message = json['message']??"";
    successfull = json['successfull']??0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['successfull'] = successfull;
    return _data;
  }
}