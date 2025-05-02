import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_bloc.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_event.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_state.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ContactBloc>().add(LoadContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Duplicate Contact Finder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search name...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<ContactBloc>().add(SearchPrefix(value));
              },
            ),
            const SizedBox(height: 16),

            Expanded(
              child: BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  if (state is ContactLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is ContactLoadedState) {
                    final duplicates = state.duplicates;
                    final contacts = state.contacts;

                    return ListView(
                      children: [
                        if (duplicates.isNotEmpty) ...[
                          const Text(
                            'Duplicates:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          for (var entry in duplicates.entries) ...[
                            Text(
                              entry.key,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...entry.value.map(
                              (c) => ListTile(
                                title: Text(c.name),
                                subtitle: Text(c.phone),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        ],

                        const SizedBox(height: 16),

                        const Text(
                          'All Contacts:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...contacts.map(
                          (c) => ListTile(
                            title: Text(c.name),
                            subtitle: Text(c.phone),
                          ),
                        ),
                      ],
                    );
                  }

                  if (state is ContactErrorState) {
                    return Center(child: Text(state.message));
                  }

                  return const Center(child: Text('No contacts found.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
