import 'package:hive/hive.dart';
import 'package:one_does_project/data/model/reflectable_model.dart';
import 'package:one_does_project/data/network/general_model.dart';



part 'book_model.g.dart'; // Hive adaptörü için gerekli
@reflector
@HiveType(typeId: 0) // Benzersiz typeId
class BookModel extends GeneralTypeModel {
  @HiveField(0)
  List<Datum>? data;

  BookModel({this.data});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        data: json["data"] != null
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

@HiveType(typeId: 1) // Benzersiz typeId
class Datum {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? year;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? handle;

  @HiveField(4)
  String? publisher;

  @HiveField(5)
  String? isbn;

  @HiveField(6)
  int? pages;

  @HiveField(7)
  List<String>? notes;

  @HiveField(8)
  DateTime? createdAt;

  @HiveField(9)
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
        notes: json["Notes"] != null
            ? List<String>.from(
                json["Notes"]!.where((x) => x != null).map((x) => x),
              )
            : null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        villains: json["villains"] == null
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

@HiveType(typeId: 2) // Benzersiz typeId
class Villain {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  Villain({this.name, this.url});

  factory Villain.fromJson(Map<String, dynamic> json) =>
      Villain(name: json["name"], url: json["url"]);
}
