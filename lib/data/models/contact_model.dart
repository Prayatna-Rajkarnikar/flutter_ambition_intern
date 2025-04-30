class ContactModel {
  final String name;
  final String phone;

  ContactModel({required this.name, required this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(name: json["name"], phone: json["phone"]);
  }
}
