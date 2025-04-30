import 'package:bloc/bloc.dart';
import 'package:flutter_intern/data/datasources/contact_local_data_source.dart';
import 'package:flutter_intern/domain/usecases/find_duplicates.dart';
import 'package:flutter_intern/presentation/bloc/contact_event.dart';
import 'package:flutter_intern/presentation/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactLocalDataSource dataSource;
  final FindDuplicates findDuplicates;

  ContactBloc(this.dataSource, this.findDuplicates)
    : super(ContactInitialState()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(ContactLoadingState());
    });
  }
}
