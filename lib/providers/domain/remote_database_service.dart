// import 'package:jiffy/jiffy.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RemoteDatabaseService {
  final firestore = FirebaseFirestore.instance;

  //Get
  Future<DocumentSnapshot> getDocument(collectionname, docname) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestore.collection(collectionname).doc(docname).get();
      return documentSnapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot> getSubDocument(
      {required String collection,
      required String docName,
      required String subCollection,
      required String subDocName}) async {
    try {
      var querySnapshot = await firestore
          .collection(collection)
          .doc(docName)
          .collection(subCollection)
          .doc(subDocName)
          .get();
      return querySnapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuerySnapshot> getCollection(collection) async {
    try {
      var querySnapshot = await firestore.collection(collection).get();
      return querySnapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuerySnapshot> getSubCollection(
      {required String collection,
      required String docName,
      required String subCollection}) async {
    try {
      var querySnapshot = await firestore
          .collection(collection)
          .doc(docName)
          .collection(subCollection)
          .get();
      return querySnapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuerySnapshot> getCollectionWhere(final String collection,
      {String wherequery = 'mob', dynamic whereQueryParam}) async {
    try {
      var querySnapshot = await firestore
          .collection(collection)
          .where(wherequery, isEqualTo: whereQueryParam)
          .get();
      return querySnapshot;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuerySnapshot> getCollectionWhereAnd(
      {required collection,
      required wherefirst,
      required firstmatch,
      required wheresecond,
      required secondmatch}) async {
    try {
      var querySnapshot = await firestore
          .collection(collection)
          .where(wherefirst, isEqualTo: firstmatch)
          .where(wheresecond, isEqualTo: secondmatch)
          .get();
      return querySnapshot;
    } catch (e) {
      rethrow;
    }
  }

  //SAVE / POST
  Future<void> saveDocument(
      {required final String collectionName,
      required final String docName,
      required final Map<String, dynamic> data}) async {
    try {
      await firestore.collection(collectionName).doc(docName).set(data);
    } catch (e) {
      rethrow;
    }
  }

  //UPDATE
  Future<void> updateDocument(
      {required final String collectionName,
      required final String docName,
      required final Map<String, dynamic> data}) async {
    try {
      await firestore.collection(collectionName).doc(docName).update(data);
    } catch (e) {
      rethrow;
    }
  }

  // GET SNAPSHOT
  Stream<QuerySnapshot> getSnapshot({required final String collectionName}) {
    try {
      return firestore.collection(collectionName).snapshots();
    } catch (e) {
      rethrow;
    }
  }

  // GEt SNAPSHOT FILTER
  Future<Stream<QuerySnapshot>> getSnapshotWhere(
      {required final String collectionName,
      required final String queryField,
      required final queryValue}) async {
    try {
      return firestore
          .collection(collectionName)
          .where(queryField, isEqualTo: queryValue)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  // GET SNAPSHOT
  Stream<QuerySnapshot> getSnapshotSubCollection(
      {required final String collectionName,
      required String doc,
      required String subCollection}) {
    try {
      return firestore
          .collection(collectionName)
          .doc(doc)
          .collection(subCollection)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveSubDocument(
      {required final String collectionName,
      required final String docName,
      required final String subCollectionName,
      required final String subDocName,
      required final Map<String, dynamic> data}) async {
    try {
      await firestore
          .collection(collectionName)
          .doc(docName)
          .collection(subCollectionName)
          .doc(subDocName)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateSubDocument(
      {required final String collectionName,
      required final String docName,
      required final String subCollectionName,
      required final String subDocName,
      required final Map<String, dynamic> data}) async {
    try {
      await firestore
          .collection(collectionName)
          .doc(docName)
          .collection(subCollectionName)
          .doc(subDocName)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }
  // Future updateSellCount(String? pid) async {
  //   return await firestore
  //       .collection('Products')
  //       .doc(pid)
  //       .update({
  //     "sellCount": FieldValue.increment(1),
  //   });
  // }

  // Future clientSearch(id, param) async {
  //   return firestore
  //       .collection("clients")
  //       .where('clientname', isGreaterThanOrEqualTo: param)
  //       .where('clientname', isLessThan: param + 'z')
  //       .where('associateid', isEqualTo: id)
  //       .snapshots();
  // }
}
