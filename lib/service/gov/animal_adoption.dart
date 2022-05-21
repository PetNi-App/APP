import 'dart:convert';

AnimalAdoption animalAdoptionFromJson(String str) =>
    AnimalAdoption.fromJson(json.decode(str));

String animalAdoptionToJson(AnimalAdoption data) => json.encode(data.toJson());

class AnimalAdoption {
  AnimalAdoption({
    required this.animalSubid,
    required this.animalAreaPkid,
    required this.animalShelterPkid,
    required this.animalPlace,
    required this.animalKind,
    required this.animalSex,
    required this.animalBodytype,
    required this.animalColour,
    required this.animalAge,
    required this.animalSterilization,
    required this.animalBacterin,
    required this.animalFoundplace,
    required this.animalTitle,
    required this.animalStatus,
    required this.animalRemark,
    required this.animalCaption,
    required this.animalOpendate,
    required this.animalCloseddate,
    required this.animalUpdate,
    required this.animalCreatetime,
    required this.shelterName,
    required this.albumFile,
    required this.albumUpdate,
    required this.cDate,
    required this.shelterAddress,
    required this.shelterTel,
    required this.animalVariety,
  });

  final String animalSubid;
  final int animalAreaPkid;
  final int animalShelterPkid;
  final String animalPlace;
  final String animalKind;
  final String animalSex;
  final String animalBodytype;
  final String animalColour;
  final String animalAge;
  final String animalSterilization;
  final String animalBacterin;
  final String animalFoundplace;
  final String animalTitle;
  final String animalStatus;
  final String animalRemark;
  final String animalCaption;
  final String animalOpendate;
  final DateTime animalCloseddate;
  final String animalUpdate;
  final String animalCreatetime;
  final String shelterName;
  final String albumFile;
  final String albumUpdate;
  final String cDate;
  final String shelterAddress;
  final String shelterTel;
  final String animalVariety;

  AnimalAdoption copyWith({
    String? animalSubid,
    int? animalAreaPkid,
    int? animalShelterPkid,
    String? animalPlace,
    String? animalKind,
    String? animalSex,
    String? animalBodytype,
    String? animalColour,
    String? animalAge,
    String? animalSterilization,
    String? animalBacterin,
    String? animalFoundplace,
    String? animalTitle,
    String? animalStatus,
    String? animalRemark,
    String? animalCaption,
    String? animalOpendate,
    DateTime? animalCloseddate,
    String? animalUpdate,
    String? animalCreatetime,
    String? shelterName,
    String? albumFile,
    String? albumUpdate,
    String? cDate,
    String? shelterAddress,
    String? shelterTel,
    String? animalVariety,
  }) =>
      AnimalAdoption(
        animalSubid: animalSubid ?? this.animalSubid,
        animalAreaPkid: animalAreaPkid ?? this.animalAreaPkid,
        animalShelterPkid: animalShelterPkid ?? this.animalShelterPkid,
        animalPlace: animalPlace ?? this.animalPlace,
        animalKind: animalKind ?? this.animalKind,
        animalSex: animalSex ?? this.animalSex,
        animalBodytype: animalBodytype ?? this.animalBodytype,
        animalColour: animalColour ?? this.animalColour,
        animalAge: animalAge ?? this.animalAge,
        animalSterilization: animalSterilization ?? this.animalSterilization,
        animalBacterin: animalBacterin ?? this.animalBacterin,
        animalFoundplace: animalFoundplace ?? this.animalFoundplace,
        animalTitle: animalTitle ?? this.animalTitle,
        animalStatus: animalStatus ?? this.animalStatus,
        animalRemark: animalRemark ?? this.animalRemark,
        animalCaption: animalCaption ?? this.animalCaption,
        animalOpendate: animalOpendate ?? this.animalOpendate,
        animalCloseddate: animalCloseddate ?? this.animalCloseddate,
        animalUpdate: animalUpdate ?? this.animalUpdate,
        animalCreatetime: animalCreatetime ?? this.animalCreatetime,
        shelterName: shelterName ?? this.shelterName,
        albumFile: albumFile ?? this.albumFile,
        albumUpdate: albumUpdate ?? this.albumUpdate,
        cDate: cDate ?? this.cDate,
        shelterAddress: shelterAddress ?? this.shelterAddress,
        shelterTel: shelterTel ?? this.shelterTel,
        animalVariety: animalVariety ?? this.animalVariety,
      );

  factory AnimalAdoption.fromJson(Map<String, dynamic> json) => AnimalAdoption(
        animalSubid: json["animal_subid"],
        animalAreaPkid: json["animal_area_pkid"],
        animalShelterPkid: json["animal_shelter_pkid"],
        animalPlace: json["animal_place"],
        animalKind: json["animal_kind"],
        animalSex: json["animal_sex"],
        animalBodytype: json["animal_bodytype"],
        animalColour: json["animal_colour"],
        animalAge: json["animal_age"],
        animalSterilization: json["animal_sterilization"],
        animalBacterin: json["animal_bacterin"],
        animalFoundplace: json["animal_foundplace"],
        animalTitle: json["animal_title"],
        animalStatus: json["animal_status"],
        animalRemark: json["animal_remark"],
        animalCaption: json["animal_caption"],
        animalOpendate: json["animal_opendate"],
        animalCloseddate: DateTime.parse(json["animal_closeddate"]),
        animalUpdate: json["animal_update"],
        animalCreatetime: json["animal_createtime"],
        shelterName: json["shelter_name"],
        albumFile: json["album_file"],
        albumUpdate: json["album_update"],
        cDate: json["cDate"],
        shelterAddress: json["shelter_address"],
        shelterTel: json["shelter_tel"],
        animalVariety: json["animal_Variety"],
      );

  Map<String, dynamic> toJson() => {
        "animal_subid": animalSubid,
        "animal_area_pkid": animalAreaPkid,
        "animal_shelter_pkid": animalShelterPkid,
        "animal_place": animalPlace,
        "animal_kind": animalKind,
        "animal_sex": animalSex,
        "animal_bodytype": animalBodytype,
        "animal_colour": animalColour,
        "animal_age": animalAge,
        "animal_sterilization": animalSterilization,
        "animal_bacterin": animalBacterin,
        "animal_foundplace": animalFoundplace,
        "animal_title": animalTitle,
        "animal_status": animalStatus,
        "animal_remark": animalRemark,
        "animal_caption": animalCaption,
        "animal_opendate": animalOpendate,
        "animal_closeddate":
            "${animalCloseddate.year.toString().padLeft(4, '0')}-${animalCloseddate.month.toString().padLeft(2, '0')}-${animalCloseddate.day.toString().padLeft(2, '0')}",
        "animal_update": animalUpdate,
        "animal_createtime": animalCreatetime,
        "shelter_name": shelterName,
        "album_file": albumFile,
        "album_update": albumUpdate,
        "cDate": cDate,
        "shelter_address": shelterAddress,
        "shelter_tel": shelterTel,
        "animal_Variety": animalVariety,
      };
}
