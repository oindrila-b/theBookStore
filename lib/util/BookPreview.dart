import 'package:flutter/material.dart';

import 'Book.dart';
import 'BookDetail.dart';
import 'DataInitialisation.dart';

class BookPreview extends StatefulWidget {

   List<Book> bookList;
   int index;
    BookPreview({Key? key, required this.bookList, required this.index}) : super(key: key);

  @override
  State<BookPreview> createState() => _BookPreviewState();
}


class _BookPreviewState extends State<BookPreview> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetail(
                    book: widget.bookList[widget.index],
                  )
          ),
        );
      },
      child: Container(
        height: 150,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                  child: Material(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(7.0, -6.0),
                            blurRadius: 2.0)
                      ]),
                ),
              )),
              Positioned(
                  child: Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: 250,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                           widget.bookList[widget.index].image),
                      )),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }


}
