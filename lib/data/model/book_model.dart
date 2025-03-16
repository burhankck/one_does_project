import 'package:one_does_project/data/model/reflectable_model.dart';
import 'package:one_does_project/data/network/general_model.dart';

@reflector
class BookModel extends GeneralTypeModel {
  List<Datum>? data;

  BookModel({this.data});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    data:
        json["data"] != null
            ? List<Datum>.from(
              json["data"] != null
                  ? json["data"]!
                      .where((x) => x != null)
                      .map((x) => Datum.fromJson(x))
                  : [],
            )
            : null,
  );
}

class Datum {
  int? id;
  int? year;
  String? title;
  String? handle;
  String? publisher;
  String? isbn;
  int? pages;
  List<String>? notes;
  DateTime? createdAt;
  List<Villain>? villains;

  Datum({
    this.id,
    this.year,
    this.title,
    this.handle,
    this.publisher,
    this.isbn,
    this.pages,
    this.notes,
    this.createdAt,
    this.villains,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    year: json["Year"],
    title: json["Title"],
    handle: json["handle"],
    publisher: json["Publisher"],
    isbn: json["ISBN"],
    pages: json["Pages"],
    notes:
        json["Notes"] != null
            ? List<String>.from(
              json["Notes"]!.where((x) => x != null).map((x) => x),
            )
            : null,
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    villains:
        json["villains"] == null
            ? []
            : List<Villain>.from(
              json["villains"] != null
                  ? json["villains"]!
                      .where((x) => x != null)
                      .map((x) => Villain.fromJson(x))
                  : [],
            ),
  );
}

class Villain {
  String? name;
  String? url;

  Villain({this.name, this.url});

  factory Villain.fromJson(Map<String, dynamic> json) =>
      Villain(name: json["name"], url: json["url"]);
}
