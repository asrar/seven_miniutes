
import 'dart:convert';

List<Dictionary> dictionaryFromJson(String str) => List<Dictionary>.from(json.decode(str).map((x) => Dictionary.fromJson(x)));

String dictionaryToJson(List<Dictionary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dictionary {
  Dictionary({
    required this.data,
  });

  Map<String, List<Datum>> data;

  factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
    data: Map.from(json["Data"]).map((k, v) => MapEntry<String, List<Datum>>(k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "Data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.typeId,
    required this.indexId,
    required this.name,
    required this.description,
    required this.enable,
    required this.type,
  });

  int id;
  int typeId;
  int indexId;
  String name;
  String description;
  int enable;
  Type type;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    typeId: json["type_id"],
    indexId: json["index_id"],
    name: json["name"],
    description: json["description"],
    enable: json["enable"],
    type: Type.fromJson(json["Type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_id": typeId,
    "index_id": indexId,
    "name": name,
    "description": description,
    "enable": enable,
    "Type": type.toJson(),
  };
}

class Type {
  Type({
    required this.id,
    required this.types,
  });

  int id;
  Types types;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    types: json["types"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    ///
    ///
    ///
    ///
    // "types": typesValues.reverse[types],
  };
}

enum Types { NITEM, QITEM, SITEM }
///
///
///
///
///
// final typesValues = EnumValues({
//   "Nitem": Types.NITEM,
//   "Qitem": Types.QITEM,
//   "Sitem": Types.SITEM
// });

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues( this.map,  this.reverseMap);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
