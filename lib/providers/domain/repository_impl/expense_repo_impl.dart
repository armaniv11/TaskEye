// import 'package:eventoo/providers/domain/remote_database_service.dart';
// import 'package:eventoo/providers/domain/repository/expense_repo.dart';
// import 'package:eventoo/providers/models/event_model.dart';
// import 'package:eventoo/providers/models/expense_model.dart';
// import 'package:eventoo/utils/app_constants/app_constants.dart';
// import 'package:eventoo/utils/app_constants/firebase_constants.dart';

// class ExpenseRepoImpl extends ExpenseRepo {
//   final RemoteDatabaseService remoteDatabaseService = RemoteDatabaseService();

//   @override
//   Future<void> deleteExpense(ExpenseModel expenseModel) {
//     // TODO: implement deleteExpense
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<ExpenseModel>> loadExpenseAll() async {
//     final response = await remoteDatabaseService.getCollectionWhere(
//         FirebaseConstants.eventCollection,
//         wherequery: AppConstants.mob,
//         whereQueryParam: "+918874030006");
//     return response.docs
//         .map((resp) =>
//             ExpenseModel.fromJson(resp.data() as Map<String, dynamic>))
//         .toList();
//   }

//   @override
//   Future<List<ExpenseModel>> loadExpenseForEvent(EventModel eventModel) async {
//     final response = await remoteDatabaseService.getSubCollection(
//       collection: FirebaseConstants.eventCollection,
//       docName: eventModel.eventId,
//       subCollection: AppConstants.expenses.toUpperCase(),
//     );
//     return response.docs
//         .map((resp) =>
//             ExpenseModel.fromJson(resp.data() as Map<String, dynamic>))
//         .toList();
//   }

//   @override
//   Future<void> newExpense(ExpenseModel expenseModel) async {
//     await remoteDatabaseService.saveSubDocument(
//       collectionName: AppConstants.eventCollection,
//       docName: expenseModel.eventId!,
//       subCollectionName: AppConstants.expenses.toUpperCase(),
//       subDocName: expenseModel.expenseId,
//       data: expenseModel.toJson(),
//     );
//   }

//   @override
//   Future<void> updateExpense(ExpenseModel expenseModel) {
//     // TODO: implement updateExpense
//     throw UnimplementedError();
//   }
// }
