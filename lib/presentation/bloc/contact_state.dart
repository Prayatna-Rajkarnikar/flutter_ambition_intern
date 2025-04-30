import 'package:flutter_intern/data/models/contact_model.dart';

abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<ContactModel> allContacts;
  final List<ContactModel> duplicateContacts;

  ContactLoadedState({
    required this.allContacts,
    required this.duplicateContacts,
  });
}
