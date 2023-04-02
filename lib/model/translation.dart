class Translation {
  Translation({
    this.id = 0,
    this.translationableType = "",
    this.translationableId = 0,
    this.locale = "",
    this.key = "",
    this.value = "",
  });

  int id;
  String translationableType;
  int translationableId;
  String locale;
  String key;
  String value;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"] ?? 0,
        translationableType: json["translationable_type"] ?? "",
        translationableId: json["translationable_id"] ?? 0,
        locale: json["locale"] ?? "",
        key: json["key"] ?? "",
        value: json["value"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "translationable_type": translationableType,
        "translationable_id": translationableId,
        "locale": locale,
        "key": key,
        "value": value,
      };
}
