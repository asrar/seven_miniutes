import 'dart:convert';

class GetSunnahPosts {
  GetSunnahPosts({
    required this.id,
    required this.iid,
    this.refId,
    required this.qitem,
    required this.publish,
    required this.name,
    required this.description,
    required this.SevenImages1,
  });
  late final int id;
  late final int iid;
  late final Null refId;
  late final String qitem;
  late final String publish;
  late final String name;
  late final String description;
  late final List<SevenImages> SevenImages1;

  GetSunnahPosts.fromJson(Map<String, dynamic> json){
    id = json['id'];
    iid = json['iid'];
    refId = null;
    qitem = json['sitem'];
    publish = json['publish'];
    name = json['name'];
    description = json['description'];
    SevenImages1 = List.from(json['SevenImages']).map((e)=>SevenImages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['iid'] = iid;
    _data['ref_id'] = refId;
    _data['qitem'] = qitem;
    _data['publish'] = publish;
    _data['name'] = name;
    _data['description'] = description;
    _data['SevenImages'] = SevenImages1.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SevenImages {
  SevenImages({
    required this.id,
    required this.image,
    required this.imgPlay,
  });
  late final int id;
  late final String image;
  late final int imgPlay;

  SevenImages.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    imgPlay = json['img_play'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['img_play'] = imgPlay;
    return _data;
  }
}