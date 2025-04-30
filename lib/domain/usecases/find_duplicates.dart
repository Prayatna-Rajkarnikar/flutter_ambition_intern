import 'package:flutter_intern/data/models/contact_model.dart';

class FindDuplicates {
  List<ContactModel> call(List<ContactModel> contacts) {
    final nameMap = <String, List<ContactModel>>{};
    final phoneMap = <String, List<ContactModel>>{};

    for (var contact in contacts) {
      nameMap.putIfAbsent(contact.name, () => []).add(contact);
      phoneMap.putIfAbsent(contact.phone, () => []).add(contact);
    }

    final duplicates = <ContactModel>[];

    nameMap.forEach((_, list) {
      if (list.length > 1) duplicates.addAll(list);
    });

    phoneMap.forEach((_, list) {
      if (list.length > 1) duplicates.addAll(list);
    });

    return duplicates.toSet().toList(); // remove exact duplicate entries
  }
}
