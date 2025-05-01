import 'package:flutter_intern/domain/entities/contact.dart';

abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<Contact> contacts;
  final Map<String, List<Contact>> duplicates;

  ContactLoadedState({required this.contacts, required this.duplicates});
}

class ContactErrorState extends ContactState {
  final String message;

  ContactErrorState({required this.message});
}
