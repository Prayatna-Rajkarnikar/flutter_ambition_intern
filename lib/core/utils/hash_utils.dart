import 'package:flutter_intern/domain/entities/contact.dart';

enum DuplicateType { name, phone }

Map<String, List<Contact>> detectDuplicates(List<Contact> contacts) {
  Map<String, List<Contact>> nameMap = {};
  Map<String, List<Contact>> phoneMap = {};

  for (var contact in contacts) {
    nameMap.putIfAbsent(contact.name, () => []).add(contact);
    phoneMap.putIfAbsent(contact.phone, () => []).add(contact);
  }

  Map<String, List<Contact>> duplicates = {};

  nameMap.forEach((name, list) {
    if (list.length > 1) {
      duplicates['name: $name'] = list;
    }
  });

  phoneMap.forEach((phone, list) {
    if (list.length > 1) {
      duplicates['phone: $phone'] = list;
    }
  });

  return duplicates;
}
