import 'package:flutter/material.dart';
import 'package:untitled/auth/auth_service.dart';
import 'package:untitled/crud/notes_service.dart';
import 'package:untitled/pages/notes/notes_list_view.dart';
import 'package:untitled/routes/Routes.dart';
import 'package:untitled/services/cloud/cloud_note.dart';
import 'package:untitled/services/cloud/firebase_cloud_storage.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late final FirebaseCloudStorage _notesService;
  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _notesService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Notes View"),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(createOrUpdateNotePage),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _notesService.allNotes(ownerUserId: userId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                if (snapshot.hasData) {
                  final allNotes = snapshot.data as Iterable<CloudNote>;
                  return NotesListView(
                    notes: allNotes,
                    onDeleteNote: (note) async {
                      _notesService.deleteNotes(documentId: note.documentId);
                    },
                    onTap: (note) {
                      Navigator.of(context)
                          .pushNamed(createOrUpdateNotePage, arguments: note);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              default:
                return const CircularProgressIndicator();
            }
          },
        ),
      );
}
