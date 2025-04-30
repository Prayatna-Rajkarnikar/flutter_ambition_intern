import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_intern/data/models/contact_model.dart';

class ContactLocalDataSource {
  Future<List<ContactModel>> loadContacts() async {
    final data = await rootBundle.loadString('assets/contacts.json');
    final List<dynamic> jsonList = jsonDecode(data);
    final contacts = jsonList.map((e) => ContactModel.fromJson(e)).toList();
    return contacts;
  }
}
