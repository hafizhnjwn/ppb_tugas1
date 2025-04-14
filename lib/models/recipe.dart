import 'package:flutter/material.dart';

const String tableName = "recipe";

const String idField = "_id";
const String nameField = "name";
const String textField = "text";
const String iconPathField = "iconPath";
const String boxColorField = "boxColor"; // New field
const String viewIsSelectedField = "viewIsSelected"; // New field

const List<String> recipeColumns = [
  idField,
  nameField,
  textField,
  iconPathField,
  boxColorField, // New field
  viewIsSelectedField, // New field
];

const String boolType = "BOOLEAN NOT NULL";
const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
const String textType = "TEXT NOT NULL";
const String textTypeNullable = "TEXT";

class Recipe {
  final int? id;
  final String name;
  final String text;
  final String? iconPath;
  final Color boxColor; // Constant Green 200
  final bool viewIsSelected;

  const Recipe({
    this.id,
    required this.name,
    required this.text,
    this.iconPath,
    this.viewIsSelected = false, // Default value
  }) : boxColor = const Color(0xFFA5D6A7); // Green 200

  static Recipe fromJson(Map<String, dynamic> json) => Recipe(
    id: json[idField],
    name: json[nameField],
    text: json[textField],
    iconPath: json[iconPathField],
    viewIsSelected: json[viewIsSelectedField] == 1,
  );

  Map<String, dynamic> toJson() => {
    idField: id,
    nameField: name,
    textField: text,
    iconPathField: iconPath,
    boxColorField: boxColor.value, // Still include in JSON
    viewIsSelectedField: viewIsSelected ? 1 : 0,
  };

  Recipe copyWith({
    int? id,
    String? name,
    String? text,
    String? iconPath,
    bool? viewIsSelected,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      text: text ?? this.text,
      iconPath: iconPath ?? this.iconPath,
      viewIsSelected: viewIsSelected ?? this.viewIsSelected,
    );
  }
}
