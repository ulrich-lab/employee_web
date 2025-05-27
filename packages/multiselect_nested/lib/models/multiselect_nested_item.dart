// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MultiSelectNestedItem {
  dynamic id;
  String name;
  String? type;
  List<MultiSelectNestedItem> children;
  bool isSelected;

  MultiSelectNestedItem({
    required this.id,
    required this.name,
     this.type,
    required this.children,
    this.isSelected = false,
  });

  void setSelected(bool value) {
    isSelected = value;
  }

  factory MultiSelectNestedItem.fromJson(Map<String, dynamic> json) {
    return MultiSelectNestedItem(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      children: json["children"] == null
          ? []
          : List<MultiSelectNestedItem>.from(json["children"]
              .map((item) => MultiSelectNestedItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "children": children,
      };

  MultiSelectNestedItem copyWith({
    dynamic? id,
    String? name,
    String? type,
    List<MultiSelectNestedItem>? children,
    bool? isSelected,
  }) {
    return MultiSelectNestedItem(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      children: children ?? this.children,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

List<MultiSelectNestedItem> multiSelectNestedFromJson(String str) =>
    List<MultiSelectNestedItem>.from(
        json.decode(str).map((x) => MultiSelectNestedItem.fromJson(x)));

String multiSelectNestedToJson(List<MultiSelectNestedItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
