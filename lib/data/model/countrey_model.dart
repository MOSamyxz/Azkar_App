class CitiesModel {
  String? toponymName;
  String? name;
  String? countryName;
  String? countryCode;

  CitiesModel(this.name, this.toponymName, this.countryName, this.countryCode);

  CitiesModel.fromJson(Map<String, dynamic> json) {
    toponymName = json["toponymName"];
    name = json["name"];
    countryName = json["countryName"];
    countryCode = json["countryCode"];
  }
}
