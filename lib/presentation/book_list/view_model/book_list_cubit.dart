import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:one_does_project/data/model/book_model.dart';
import 'package:one_does_project/data/repository/book_repository.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_state.dart';
import 'package:one_does_project/presentation/resources/utils.dart';

class BookListCubit extends Cubit<BookListState> with _CubitProperties {
  BookListCubit() : super(BookListInitial());

  Future<void> getBookList() async {
    emit(BookListLoading());
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      // İnternet yok, Hive'den veri çek
      print("İnternet bağlantısı yok. Veriler Hive'den alınıyor.");
      final cachedData = await _getCachedBooks();
      if (cachedData.isNotEmpty) {
        emit(BookListDisplay(bookModel: BookModel(data: cachedData)));
      } else {
        emit(BookListError(
          title: "Bağlantı Hatası",
          description: "İnternet yok ve önbellekte veri bulunamadı.",
        ));
      }
    } else {
      // İnternet var, API'den veri çek
      await _bookListRepository.getBookListRepository().then((bookData) {
        if (bookData != null && bookData.data != null) {
          allList = bookData.data!;
          _cacheBooks(allList); // Veriyi Hive'e kaydet
          emit(BookListDisplay(bookModel: bookData));
        } else {
          emit(BookListError(
            title: "Bulunamadı",
            description: "Kitap listesi bulunamadı.",
          ));
        }
      }).onError((error, stackTrace) {
        List<String> splittedList = Utils.errorCatching(error);
        emit(BookListError(
          title: splittedList.first,
          description: splittedList.last,
        ));
      });
    }
  }

  Future<List<Datum>> _getCachedBooks() async {
    var box = await Hive.openBox<Datum>('bookBox');
    return box.values.toList(); 
  }

  Future<void> _cacheBooks(List<Datum> books) async {
    var box = await Hive.openBox<Datum>('bookBox');
    await box.clear(); 
    for (var book in books) {
      await box.put(book.id, book); 
    }
  }

  void listenToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.none) {
        print("İnternet bağlantısı yok.");
        final cachedData = await _getCachedBooks();
        if (cachedData.isNotEmpty) {
          emit(BookListDisplay(bookModel: BookModel(data: cachedData)));
        } else {
          emit(BookListError(
            title: "Bağlantı Hatası",
            description: "İnternet bağlantısı yok ve önbellekte veri yok.",
          ));
        }
      } else {
        print("İnternet bağlantısı var.");
        getBookList();
      }
    });
  }

  void searchBookNamed({required String query}) {
    if (query == "") {
      emit(BookListDisplay(bookModel: BookModel(data: allList)));
    } else {
      tempList = allList.where((books) {
        return (books.title != null &&
                books.title!.toLowerCase().contains(query.toLowerCase())) ||
            (books.publisher != null &&
                books.publisher!.toLowerCase().contains(query.toLowerCase()));
      }).toList();

      if (tempList.isNotEmpty) {
        emit(BookListDisplay(bookModel: BookModel(data: tempList)));
      } else {
        emit(BookListDisplay(
          bookModel: BookModel(data: []),
          isSearchNotFound: true,
        ));
      }
    }
  }
  void clear() {
    tempList = [];
  }
}

mixin _CubitProperties {
  final BookRepository _bookListRepository = BookRepository();
  List<Datum> allList = [];
  List<Datum> tempList = [];
}


