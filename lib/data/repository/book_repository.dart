import 'package:flutter/material.dart';
import 'package:one_does_project/data/constant/api_constant.dart';
import 'package:one_does_project/data/model/book_detail_model.dart';
import 'package:one_does_project/data/model/book_model.dart';
import 'package:one_does_project/data/network/network_manager.dart';

class BookRepository {
  Future<BookModel?> getBookListRepository() async {
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

  Future<BookDetailModel?> getBookDetailRepository({required int bookID}) async {
    try {
      dynamic response = await NetworkManager.instance
          .getApiResponse<BookDetailModel>(
            ApiConstant.bookURL,
            "${ApiConstant.bookDetailEndPoint}/$bookID",
            isList: false,
          );
      return response;
    } catch (e) {
      debugPrint("getBooksWithoutModel Error: $e");
      rethrow;
    }
  }
}
