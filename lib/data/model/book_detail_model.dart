
import 'package:one_does_project/data/model/reflectable_model.dart';
import 'package:one_does_project/data/network/general_model.dart';
@reflector
class BookDetailModel  extends GeneralTypeModel{
    Data? data;

    BookDetailModel({
        this.data,
    });

    factory BookDetailModel.fromJson(Map<String, dynamic> json) => BookDetailModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
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

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        year: json["Year"],
        title: json["Title"],
        handle: json["handle"],
        publisher: json["Publisher"],
        isbn: json["ISBN"],
        pages: json["Pages"],
        notes: json["Notes"] == null ? [] : List<String>.from(json["Notes"]!.map((x) => x)),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        villains: json["villains"] == null ? [] : List<Villain>.from(json["villains"]!.map((x) => Villain.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Year": year,
        "Title": title,
        "handle": handle,
        "Publisher": publisher,
        "ISBN": isbn,
        "Pages": pages,
        "Notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "villains": villains == null ? [] : List<dynamic>.from(villains!.map((x) => x.toJson())),
    };
}

class Villain {
    String? name;
    String? url;

    Villain({
        this.name,
        this.url,
    });

    factory Villain.fromJson(Map<String, dynamic> json) => Villain(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
