class HadithModel {
  int? hadithId;
  String? hadithBody;
  String? hadithExplain;

  HadithModel(this.hadithId, this.hadithExplain, this.hadithBody);

  HadithModel.fromJson(Map<String, dynamic> json) {
    hadithId = json["hadith_id"];
    hadithBody = json["hadith_body"];
    hadithExplain = json["hadith_explain"];
  }
}
