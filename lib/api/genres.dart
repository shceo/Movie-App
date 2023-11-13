// class Genres {
//   List<Genres>? genres;

//   Genres({this.genres});

//   Genres.fromJson(Map<String, dynamic> json) {
//     if (json['genres'] != null) {
//       genres = <Genres>[];
//       json['genres'].forEach((v) {
//         genres!.add(Genres.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (genres != null) {
//       data['genres'] = genres!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class GenresIds {
//   int? id;
//   String? name;

//   GenresIds({this.id, this.name});

//   GenresIds.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }






class Genres {
  List<GenreIds>? genres;

  Genres({this.genres});

  Genres.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <GenreIds>[];
      json['genres'].forEach((v) {
        genres!.add(GenreIds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GenreIds {
  int? id;
  String? name;

  GenreIds({this.id, this.name});

  GenreIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}