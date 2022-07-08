import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/services/cloud/cloud_note.dart';
import 'package:untitled/services/cloud/cloud_storage_constants.dart';
import 'package:untitled/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudStorage {
  final notes = FirebaseFirestore.instance.collection('notes');

  Future<void> deleteNotes({
    required String documentId,
  }) async {
    try {
      await notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }

  Future<void> updateNotes({
    required String documentId,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({
        textFieldName: text,
      });
    } catch (e) {
      throw CouldNotUpdateNoteException();
    }
  }

  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) {
    final allNotes = notes
        .where(ownerUserIdFieldName, isEqualTo: ownerUserId)
        .snapshots()
        .map((event) => event.docs.map((doc) => CloudNote.fromSnapshot(doc)));
    // .where((note) => note.ownerUserId == ownerUserId));
    return allNotes;
  }

  // Future<Iterable<CloudNote>> getNotes({
  //   required String ownerUserId,
  // }) async {
  //   try {
  //     return await notes
  //         .where(ownerUserIdFieldName, isEqualTo: ownerUserId)
  //         .get()
  //         .then(
  //           (value) => value.docs.map(
  //             (doc) {
  //               return CloudNote.fromSnapshot(doc);
  //               // CloudNote(
  //               //   documentId: doc.id,
  //               //   ownerUserId: doc.data()[ownerUserIdFieldName] as String,
  //               //   text: doc.data()[textFieldName] as String,
  //               // );
  //             },
  //           ),
  //         );
  //   } catch (e) {
  //     throw CouldNotGetAllNoteException();
  //   }
  // }

  Future<CloudNote> createNewNote({
    required String ownerUserId,
  }) async {
    final document = await notes.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: '',
    });
    final fetchedNote = await document.get();
    return CloudNote(
      documentId: fetchedNote.id,
      ownerUserId: ownerUserId,
      text: '',
    );
  }

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._shareInstance();
  FirebaseCloudStorage._shareInstance();
  factory FirebaseCloudStorage() => _shared;
}
