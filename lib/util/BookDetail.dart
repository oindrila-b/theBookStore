import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Book.dart';
class BookDetail extends StatelessWidget {

  final Book book;

  BookDetail({required this.book});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            child: Hero(
                tag: "Title : ${book.title}",
                child: Image.network(
                  book.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 48, left: 32,),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 32, left: 32, bottom: 16,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text(
                              book.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                  fontFamily: 'Varela_Round'
                              )
                          ),
                          SizedBox(height: 15,),
                          Text(
                              "Author : ${book.author}",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                  fontFamily: 'Varela_Round'
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Text("Rating : "),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star, size: 20,
                                      color: Colors.deepOrange,),
                                    Icon(Icons.star, size: 20,
                                      color: Colors.deepOrange,),
                                    Icon(Icons.star, size: 20,
                                      color: Colors.deepOrange,),
                                    Icon(Icons.star, size: 20,
                                      color: Colors.deepOrange,),
                                    Icon(Icons.star_half, size: 20,
                                      color: Colors.deepOrange,),
                                  ],
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Pages : ${book.score}" ,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                height: 1,
                                fontFamily: 'Varela_Round'
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                book.description,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Varela_Round'
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 80,
                    width: size.width,
                    padding: EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 20,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child:  GestureDetector(
                      onTap: () {
                        print("Inside get a copy");
                        _launchUrl(book.buyLink);
                      },
                      child: Container(
                        width: size.width / 1.5 ,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Get a copy",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Varela_Round'
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.content_copy,
                                color: Color(0xFFEC3133),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 32, bottom: (size.height * 0.5) - (75 / 2)),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                         book.image
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
