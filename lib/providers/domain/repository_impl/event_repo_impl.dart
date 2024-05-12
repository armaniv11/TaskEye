// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eventoo/providers/domain/remote_database_service.dart';
// import 'package:eventoo/providers/domain/repository/event_repo.dart';
// import 'package:eventoo/providers/models/category_resp_model.dart';
// import 'package:eventoo/providers/models/event_model.dart';
// import 'package:eventoo/utils/app_constants/app_constants.dart';
// import 'package:eventoo/utils/app_constants/firebase_constants.dart';

// class EventRepoImpl implements EventRepo {
//   final RemoteDatabaseService remoteDatabaseService = RemoteDatabaseService();
//   @override
//   Future<void> deleteEvent(EventModel eventReqModel) {
//     // TODO: implement deleteEvent
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> newEvent(EventModel eventReqModel) async {
//     await remoteDatabaseService.saveDocument(
//         collectionName: AppConstants.eventCollection,
//         docName: eventReqModel.eventId,
//         data: eventReqModel.toJson());
//   }

//   @override
//   Future<void> updateEvent(EventModel eventReqModel) {
//     // TODO: implement updateEvent
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<EventModel>> loadEvents() async {
//     final response = await remoteDatabaseService.getCollectionWhere(
//         AppConstants.eventCollection,
//         wherequery: AppConstants.mob,
//         whereQueryParam: "+918874030006");
//     return response.docs
//         .map((resp) => EventModel.fromJson(resp.data() as Map<String, dynamic>))
//         .toList();
//   }

//   @override
//   Future<void> newCategory(final String eventId, String categoryName) async {
//     await remoteDatabaseService.saveSubDocument(
//       collectionName: AppConstants.eventCollection,
//       docName: eventId,
//       subCollectionName: FirebaseConstants.categories,
//       subDocName: FirebaseConstants.eventCategories,
//       data: {
//         'categoriesList': FieldValue.arrayUnion([categoryName]),
//       },
//     );
//   }

//   @override
//   Future<EventCategoryModel> getCategories(String eventId) async {
//     return await remoteDatabaseService
//         .getSubDocument(
//             collection: AppConstants.eventCollection,
//             docName: eventId,
//             subCollection: FirebaseConstants.categories,
//             subDocName: FirebaseConstants.eventCategories)
//         .then((value) =>
//             EventCategoryModel.fromJson(value.data() as Map<String, dynamic>));
//   }
// }
