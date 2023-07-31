import 'package:flutter/material.dart';
import 'package:thebookstore/util/DataInitialisation.dart';
import '../util/Book.dart';
import '../util/BookPreview.dart';

class CustomSearchDelegate extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(
          onPressed: () {
            query = '';
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.clear),)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    late List<Book> bookList=[];
    print(query.toLowerCase());
    // TODO: implement buildResults
      return FutureBuilder(
        future: getSearchedBook(query.toString()),
          builder: (context, AsyncSnapshot<List<Book>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 280,
                childAspectRatio: 1/2,
                crossAxisSpacing: 10
            ),
            itemBuilder: (context, index) {
              return BookPreview(bookList: snapshot.data!,index: index,);
            },
            itemCount: snapshot.data!.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    late List<Book> bookList=[];
    print(query);
    // TODO: implement buildResults
    return FutureBuilder(
        future: getSearchedBook(query.toString()),
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  childAspectRatio: 1/2,
                  crossAxisSpacing: 10
              ),
              itemBuilder: (context, index) {
                return BookPreview(bookList: bookList,index: index,);
              },
              itemCount: bookList.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
  
}