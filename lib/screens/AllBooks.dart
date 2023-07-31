import 'package:flutter/material.dart';
import 'package:thebookstore/util/BookPreview.dart';
import 'package:thebookstore/util/DataInitialisation.dart';

import '../search/CustomSearchDelegate.dart';
import '../util/Book.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  late List<Book> bookList = [];
  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 3;


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 5, 20,10),
              child: const Text("The ultimate book store you've been looking for!",
                textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Varela_Round',
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                ),
              ),
            ),
          ),
          title: const SafeArea(
            child: Center(
                child: Text("The Book Store", textAlign: TextAlign.justify, style: TextStyle(
                    fontFamily: 'Varela_Round',
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
                )
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFF322653),Color(0xFF9288F8)]
                ),
                borderRadius: BorderRadius.vertical(
                  bottom:  Radius.circular(50),
                )
            ),
          ),

          // backgroundColor: Colors.white,
          // shadowColor: Colors.transparent,
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //           colors: <Color>[Color(0xFF322653),Color(0xFF9288F8)]
          //       ),
          //       borderRadius: BorderRadius.vertical(
          //         bottom:  Radius.circular(50),
          //       )
          //   ),
          //   child: Stack(
          //       children: const [
          //         Positioned(
          //             left: 16,
          //             bottom: 5,
          //             child: SearchBar()
          //         )
          //       ]
          //   ),
          // )
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
                icon: Icon(Icons.search,
                  color: Colors.deepPurple[200],)
            )
          ],
        ),
      ),
      body: bookList.isEmpty ? Center(
        child: CircularProgressIndicator() ,
      ) :
      Center(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  childAspectRatio: 1/2,
                  crossAxisSpacing: 10
              ),
              itemBuilder: (context, index) {
                return BookPreview(bookList: bookList,index: index,);
              },
              itemCount: bookList.length,
          )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAllBooks().then((value) =>
    {
      setState(() {
        bookList = value;
      })
    });
  }
}