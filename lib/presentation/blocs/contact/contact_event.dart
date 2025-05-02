abstract class ContactEvent {}

class LoadContactsEvent extends ContactEvent {}

class SearchPrefix extends ContactEvent {
  final String prefix;
  SearchPrefix(this.prefix);
}
