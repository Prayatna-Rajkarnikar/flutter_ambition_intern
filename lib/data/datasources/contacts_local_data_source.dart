import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_intern/data/model/contact_model.dart';

class ContactsLocalDataSource {
  Future<List<ContactModel>> loadContactsFromJson() async {
    final jsonString = await rootBundle.loadString('assets/contacts.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => ContactModel.fromJson(e)).toList();
  }
}
