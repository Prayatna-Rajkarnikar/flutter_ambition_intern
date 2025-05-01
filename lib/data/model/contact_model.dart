import 'package:flutter_intern/domain/entities/contact.dart';

class ContactModel extends Contact {
  final String? dupliateType;

  ContactModel({required super.name, required super.phone, this.dupliateType});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'],
      phone: json['phone'],
      dupliateType: json['duplicate_type'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'duplicate_type': dupliateType,
  };
}
