class ProfileGetAllModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? location;

  ProfileGetAllModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.location,
  });

  factory ProfileGetAllModel.fromJson(Map<String, dynamic> json) =>
      ProfileGetAllModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        mobile: json["mobile"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "mobile": mobile,
    "location": location,
  };
}
