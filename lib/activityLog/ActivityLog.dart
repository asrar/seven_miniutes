class ActivityLogModel {
  ActivityLogModel({
    required this.msg,
  });
  late final String msg;

  ActivityLogModel.fromJson(Map<String, dynamic> json){
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    return _data;
  }
}