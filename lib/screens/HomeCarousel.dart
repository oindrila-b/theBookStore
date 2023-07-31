import 'package:flutter/material.dart';
import 'package:thebookstore/search/CustomSearchDelegate.dart';
import 'package:thebookstore/util/BookPreview.dart';
import '../util/Book.dart';
import '../util/DataInitialisation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  List<Book> bookList = [];
  List<Book> rbBookList = [];
  List<Book> jaBookList = [];
  List<Book> enidBookList = [];
  var prefs;

  @override
  Widget build(BuildContext context) {
    print("calling build");
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height / 2.5;

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
              padding: const EdgeInsets.fromLTRB(30, 5, 20, 10),
              child: const Text(
                "The ultimate book store you've been looking for!",
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
                child: Text("The Book Store", textAlign: TextAlign.justify,
                  style: TextStyle(
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
                    colors: <Color>[Color(0xFF322653), Color(0xFF9288F8)]
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                )
            ),
          ),

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
      body: bookList.isEmpty ? Center(child: CircularProgressIndicator()) :
      Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    width: width,
                    child: const Text("Ruskin Bond",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Varela_Round'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            BookPreview(bookList: rbBookList, index: index),
                        scrollDirection: Axis.horizontal,
                        itemCount: rbBookList.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: const Text("Agatha Christie",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Varela_Round'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            BookPreview(bookList: bookList, index: index),
                        scrollDirection: Axis.horizontal,
                        itemCount: bookList.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: const Text("Jane Austen",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Varela_Round'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            BookPreview(bookList: jaBookList, index: index),
                        scrollDirection: Axis.horizontal,
                        itemCount: jaBookList.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: const Text("Good Reads",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Varela_Round'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            BookPreview(bookList: enidBookList, index: index,),
                        scrollDirection: Axis.horizontal,
                        itemCount: enidBookList.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  @override
  void initState() {
    print("calling init");
    super.initState();

    getAgathaChristie().then((value) =>
    {
      setState(() {
        bookList = value;
      })
    });
    getRuskinBond().then((value) =>
    {
      setState(() {
        rbBookList = value;
      })
    });
    getJaneAusten().then((value) =>
    {
      setState(() {
        jaBookList = value;
      })
    });
    getEnidBlyton().then((value) =>
    {
      setState(() {
        enidBookList = value;
      })
    });
  }



}
