import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/core/utils/hash_utils.dart';
import 'package:flutter_intern/core/utils/trie.dart';
import 'package:flutter_intern/data/datasources/contacts_local_data_source.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_event.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactsLocalDataSource dataSource;
  final Trie trie = Trie();

  ContactBloc(this.dataSource) : super(ContactInitialState()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(ContactLoadingState());

      try {
        final contacts = await dataSource.loadContactsFromJson();

        final duplicates = detectDuplicates(contacts);
        for (var contact in contacts) {
          trie.insert(contact.name);
        }
        emit(ContactLoadedState(contacts: contacts, duplicates: duplicates));
      } catch (e) {
        emit(ContactErrorState(message: '$e'));
      }
    });

    on<SearchPrefix>((event, emit) {
      if (state is ContactLoadedState) {
        final allContacts = (state as ContactLoadedState).contacts;
        final matchedNames = trie.search(event.prefix);
        final filtered =
            allContacts
                .where((c) => matchedNames.contains(c.name.toLowerCase()))
                .toList();
        emit(ContactLoadedState(contacts: filtered, duplicates: {}));
      }
    });
  }
}
