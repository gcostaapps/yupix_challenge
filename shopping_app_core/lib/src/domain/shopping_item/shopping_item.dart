import 'dart:convert';

class ShoppingItem {
  final String? id;
  final String name;
  final String imageUrl;
  final String imageName;
  final bool isFavorite;
  final DateTime? favoritedAt;
  final int position;
  final String categoryId;
  const ShoppingItem({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.imageName,
    required this.isFavorite,
    this.favoritedAt,
    required this.position,
    required this.categoryId,
  }) : assert(
          !isFavorite || (isFavorite && favoritedAt != null),
          'Item must have favoritedAt if is favorite',
        );

  ShoppingItem copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? imageName,
    bool? isFavorite,
    DateTime? favoritedAt,
    int? position,
    String? categoryId,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      imageName: imageName ?? this.imageName,
      isFavorite: isFavorite ?? this.isFavorite,
      favoritedAt: favoritedAt ?? this.favoritedAt,
      position: position ?? this.position,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'imageName': imageName,
      'isFavorite': isFavorite,
      'favoritedAt': favoritedAt?.millisecondsSinceEpoch,
      'position': position,
      'categoryId': categoryId,
    };
  }

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'],
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      imageName: map['imageName'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      favoritedAt: map['favoritedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['favoritedAt'])
          : null,
      position: map['position']?.toInt() ?? 0,
      categoryId: map['categoryId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingItem.fromJson(String source) =>
      ShoppingItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShoppingItem(id: $id, name: $name, imageUrl: $imageUrl, imageName: $imageName, isFavorite: $isFavorite, favoritedAt: $favoritedAt, position: $position, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShoppingItem &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.imageName == imageName &&
        other.isFavorite == isFavorite &&
        other.favoritedAt == favoritedAt &&
        other.position == position &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        imageName.hashCode ^
        isFavorite.hashCode ^
        favoritedAt.hashCode ^
        position.hashCode ^
        categoryId.hashCode;
  }
}
