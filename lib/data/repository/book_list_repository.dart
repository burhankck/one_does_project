import 'package:flutter/material.dart';
import 'package:one_does_project/data/constant/api_constant.dart';
import 'package:one_does_project/data/model/book_model.dart';
import 'package:one_does_project/data/network/network_manager.dart';

class BookListRepository {
  Future<BookModel?> getBookRepository() async {
    try {
      dynamic response = await NetworkManager.instance
          .getApiResponse<BookModel>(
            ApiConstant.bookURL,
            "${ApiConstant.bookListEndPoint}",
            isList: false,
          );

      return response;
    } catch (e) {
      debugPrint("getBooksWithoutModel Error: $e");
      rethrow;
    }
  }
}
