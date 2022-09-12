import 'dart:convert';

class GetPrayerPosts {
  GetPrayerPosts({
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

  GetPrayerPosts.fromJson(Map<String, dynamic> json){
    print("print from podo 0");
    id = json['id'];
    iid = json['iid'];
    refId = null;
    print("print from podo 1");
    qitem = json['nitem'];
    publish = json['publish'];
    name = json['name'];
    description = json['description'];
    print("print from podo 2");
    SevenImages1 = List.from(json['SevenImages']).map((e)=>SevenImages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    print("print from podo 7");
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['iid'] = iid;
    _data['ref_id'] = refId;
    _data['qitem'] = qitem;
    print("print from podo 8");
    _data['publish'] = publish;
    _data['name'] = name;
    _data['description'] = description;
    _data['SevenImages'] = SevenImages1.map((e)=>e.toJson()).toList();
    print("print from podo 9");
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
    print("print from podo 4");
    id = json['id'];
    image = json['image'];
    imgPlay = json['img_play'];
    print("print from podo 5");
  }

  Map<String, dynamic> toJson() {
    print("print from podo 6");
    final _data = <String, dynamic>{};

    _data['id'] = id;
    _data['image'] = image;
    _data['img_play'] = imgPlay;
    return _data;
  }
}