import 'dart:convert';

import 'package:flutter/painting.dart';

import '../../../domain/category/category.dart';

class CategoryDto {
  final String? id;
  final String name;
  final int color;
  CategoryDto({
    this.id,
    required this.name,
    required this.color,
  });

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      id: category.id,
      name: category.name,
      color: category.color.value,
    );
  }

  Category toDomain() => Category(
        id: id,
        name: name,
        color: Color(color),
      );

  CategoryDto copyWith({
    String? id,
    String? name,
    int? color,
  }) {
    return CategoryDto(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      'name': name,
      'color': color,
    };
  }

  factory CategoryDto.fromMap(Map<String, dynamic> map) {
    return CategoryDto(
      id: map['id'],
      name: map['name'] ?? '',
      color: map['color']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMapWithoutId());

  factory CategoryDto.fromJson(String source) =>
      CategoryDto.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryDto(id: $id, name: $name, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryDto &&
        other.id == id &&
        other.name == name &&
        other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;
}
