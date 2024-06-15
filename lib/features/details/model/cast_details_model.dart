class CastDetailsModel {
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final String? origin;
  final String? location;
  final String? image;
  final List<Episode>? episodes;

  CastDetailsModel({
    this.name,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episodes,
  });

  factory CastDetailsModel.fromJson(Map<String, dynamic> json) {
    var episodeList = json['episode'] as List?;
    List<Episode>? episodes =
        episodeList?.map((i) => Episode.fromJson(i)).toList();

    return CastDetailsModel(
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: json['origin']?['name'],
      location: json['location']?['name'],
      image: json['image'],
      episodes: episodes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'origin': origin,
      'location': location,
      'image': image,
      'episode': episodes?.map((e) => e.toJson()).toList(),
    };
  }
}

class Episode {
  final String? name;

  Episode({this.name});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
