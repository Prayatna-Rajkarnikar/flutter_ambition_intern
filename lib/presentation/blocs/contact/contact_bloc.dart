import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/core/utils/hash_utils.dart';
import 'package:flutter_intern/data/datasources/contacts_local_data_source.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_event.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactsLocalDataSource dataSource;

  ContactBloc(this.dataSource) : super(ContactInitialState()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(ContactLoadingState());

      try {
        final contacts = await dataSource.loadContactsFromJson();

        final duplicates = detectDuplicates(contacts);
        emit(ContactLoadedState(contacts: contacts, duplicates: duplicates));
      } catch (e) {
        emit(ContactErrorState(message: '$e'));
      }
    });
  }
}
