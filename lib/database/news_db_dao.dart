// import 'package:statemanagement/database/news_database.dart';
// import 'package:statemanagement/models/news_saved_model.dart';
// import 'package:sembast/sembast.dart';

// class NewsDBDao {
//   static const String NEWS_STORE_NAME = 'fruits';
//   // A Store with int keys and Map<String, dynamic> values.
//   // This Store acts like a persistent map, values of which are Fruit objects converted to Map
//   final _newsStore = intMapStoreFactory.store(NEWS_STORE_NAME);

//   // Private getter to shorten the amount of code needed to get the
//   // singleton instance of an opened database.
//   Future<Database> get _db async => await NewsDatabase.instance.database!;

//   Future insert(NewsSavedModel newsSavedModel) async {
//     await _newsStore.add(await _db, newsSavedModel.toMap());
//   }

//   Future update(NewsSavedModel newsSavedModel) async {
//     // For filtering by key (ID), RegEx, greater than, and many other criteria,
//     // we use a Finder.
//     final finder = Finder(filter: Filter.byKey(newsSavedModel.id));
//     await _newsStore.update(
//       await _db,
//       newsSavedModel.toMap(),
//       finder: finder,
//     );
//   }

//   Future delete(NewsSavedModel newsSavedModel) async {
//     final finder = Finder(filter: Filter.byKey(newsSavedModel.id));
//     await _newsStore.delete(
//       await _db,
//       finder: finder,
//     );
//   }

//   Future<List<NewsSavedModel>> getAllSortedByName() async {
//     // Finder object can also sort data.
//     Finder finder = Finder(sortOrders: [SortOrder('title')]);
//     final recordSnapshots = await _newsStore.find(
//       await _db,
//       finder: finder,
//     );

//     // Making a List<Fruit> out of List<RecordSnapshot>
//     return recordSnapshots.map((snapshot) {
//       final nsModel = NewsSavedModel.fromMap(snapshot.value);
//       // An ID is a key of a record from the database.
//       nsModel.id = snapshot.key;
//       print(nsModel.title);
//       return nsModel;
//     }).toList();
//   }
// }
