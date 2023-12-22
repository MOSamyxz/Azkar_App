class MoshafModel {
  int? id;
  int? jozz;
  int? suraNo;
  String? suraName;
  int? page;
  int? ayaNo;
  String? ayaText;

  MoshafModel(
    this.id,
    this.jozz,
    this.suraNo,
    this.suraName,
    this.page,
    this.ayaNo,
    this.ayaText,
  );

  MoshafModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    jozz = json["jozz"];
    suraNo = json["sura_no"];
    suraName = json["sura_name_ar"];
    page = json["page"];
    ayaNo = json["aya_no"];
    ayaText = json["aya_text"];
  }
}
