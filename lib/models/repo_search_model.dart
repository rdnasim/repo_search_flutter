import 'dart:convert';

class RepoSearchModel {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final int stargazersCount;
  final int forksCount;
  final String language;
  final DateTime updatedAt;

  RepoSearchModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.stargazersCount,
    required this.forksCount,
    required this.language,
    required this.updatedAt,
  });

  RepoSearchModel copyWith({
    int? id,
    String? name,
    String? fullName,
    String? description,
    int? stargazersCount,
    int? forksCount,
    String? language,
    DateTime? updatedAt,
  }) {
    return RepoSearchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      description: description ?? this.description,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      forksCount: forksCount ?? this.forksCount,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'stargazers_count': stargazersCount,
      'forks_count': forksCount,
      'language': language,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory RepoSearchModel.fromMap(Map<String, dynamic> map) {
    return RepoSearchModel(
      id: map['id'],
      name: map['name'],
      fullName: map['full_name'],
      description: map['description'],
      stargazersCount: map['stargazers_count'],
      forksCount: map['forks_count'],
      language: map['language'],
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RepoSearchModel.fromJson(String source) =>
      RepoSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RepoSearchModel{id: $id, name: $name, fullName: $fullName, description: $description, stargazersCount: $stargazersCount, forksCount: $forksCount, language: $language, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(covariant RepoSearchModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.fullName == fullName &&
        other.description == description &&
        other.stargazersCount == stargazersCount &&
        other.forksCount == forksCount &&
        other.language == language &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fullName.hashCode ^
        description.hashCode ^
        stargazersCount.hashCode ^
        forksCount.hashCode ^
        language.hashCode ^
        updatedAt.hashCode;
  }
}
