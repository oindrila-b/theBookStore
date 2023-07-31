import 'package:flutter/material.dart';
import 'package:thebookstore/util/DataInitialisation.dart';

import '../util/Book.dart';
import '../util/BookPreview.dart';

class SearchedBookList extends StatefulWidget {
  String query;
   SearchedBookList({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchedBookList> createState() => _SearchedBookListState();
}

class _SearchedBookListState extends State<SearchedBookList> {
  List<Book> bookList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bookList.isEmpty ? const Center(child: CircularProgressIndicator() ,) :
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            childAspectRatio: 1/2,
            crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return BookPreview(bookList: bookList,index: index,);
        },
        itemCount: bookList.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSearchedBook(widget.query).then((value) => {
      setState(() {
        bookList = value;
      })
    });
  }
}
