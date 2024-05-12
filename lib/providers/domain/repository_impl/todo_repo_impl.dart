// import 'package:eventoo/providers/domain/remote_database_service.dart';
// import 'package:eventoo/providers/domain/repository/expense_repo.dart';
// import 'package:eventoo/providers/domain/repository/todo_repo.dart';
// import 'package:eventoo/providers/models/event_model.dart';
// import 'package:eventoo/providers/models/expense_model.dart';
// import 'package:eventoo/providers/models/todo_model.dart';
// import 'package:eventoo/utils/app_constants/app_constants.dart';
// import 'package:eventoo/utils/app_constants/firebase_constants.dart';

// class TodoRepoImpl extends TodoRepo {
//   final RemoteDatabaseService remoteDatabaseService = RemoteDatabaseService();

//   @override
//   Future<void> deleteTodo(TodoModel todoModel) {
//     // TODO: implement deleteTodo
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<TodoModel>> loadTodoAll() {
//     // TODO: implement loadTodoAll
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<TodoModel>> loadTodoForEvent(EventModel event) async {
//     final response = await remoteDatabaseService.getSubCollection(
//       collection: FirebaseConstants.eventCollection,
//       docName: event.eventId,
//       subCollection: AppConstants.todos.toUpperCase(),
//     );
//     print(response.docs);
//     return response.docs
//         .map((resp) => TodoModel.fromJson(resp.data() as Map<String, dynamic>))
//         .toList();
//   }

//   @override
//   Future<void> newTodo(TodoModel todoModel) async {
//     await remoteDatabaseService.saveSubDocument(
//       collectionName: AppConstants.eventCollection,
//       docName: todoModel.eventId!,
//       subCollectionName: AppConstants.todos.toUpperCase(),
//       subDocName: todoModel.todoId,
//       data: todoModel.toJson(),
//     );
//   }

//   @override
//   Future<void> completeTodo(TodoModel todoModel) async {
//     await remoteDatabaseService.saveSubDocument(
//       collectionName: AppConstants.eventCollection,
//       docName: todoModel.eventId!,
//       subCollectionName: AppConstants.todos.toUpperCase(),
//       subDocName: todoModel.todoId,
//       data: todoModel.toJson(),
//     );
//   }

//   @override
//   Future<void> renameTodo(TodoModel todoModel) async {
//     await remoteDatabaseService.saveSubDocument(
//       collectionName: AppConstants.eventCollection,
//       docName: todoModel.eventId!,
//       subCollectionName: AppConstants.todos.toUpperCase(),
//       subDocName: todoModel.todoId,
//       data: todoModel.toJson(),
//     );
//   }
// }
