class AllCastModel {
  final List<Character> results;

  AllCastModel({required this.results});

  factory AllCastModel.fromJson(Map<String, dynamic> json) {
    var list = json['characters']['results'] as List;
    List<Character> charactersList =
        list.map((i) => Character.fromJson(i)).toList();
    return AllCastModel(results: charactersList);
  }
}

class Character {
  final String id;
  final String name;
  final String image;

  Character({required this.id, required this.name, required this.image});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
