import 'dart:convert';
import 'Book.dart';
import 'package:http/http.dart' as http;


Future<List<Book>> getAgathaChristie() async {

  List<Book> books = [];

  Uri link = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Agatha+Christie&maxResults=20");
var res = await http
    .get(link, headers: {"Accept": "application/json"});
         if (res.statusCode == 200) {
         var data = json.decode(res.body);
           var rest = data["items"] as List;

    books = rest.map<Book>((json) => Book.fromJson(json)).toList();
  }
  print("List Size: ${books[0].description}");
  return books;
}

Future<List<Book>> getRuskinBond() async {

  List<Book> books = [];

  Uri link = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Ruskin+Bond&maxResults=10");
  var res = await http
      .get(link, headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["items"] as List;

    books = rest.map<Book>((json) => Book.fromJson(json)).toList();
  }
  print("List Size: $books");
  return books;
}


Future<List<Book>> getJaneAusten() async {

  List<Book> books = [];

  Uri link = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Jane+Austin&maxResults=20");
  var res = await http
      .get(link, headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["items"] as List;

    books = rest.map<Book>((json) => Book.fromJson(json)).toList();
  }
  print("List Size: $books");
  return books;
}

Future<List<Book>> getEnidBlyton() async {

  List<Book> books = [];

  Uri link = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Enid+Blyton&maxResults=20");
  var res = await http
      .get(link, headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["items"] as List;

    books = rest.map<Book>((json) => Book.fromJson(json)).toList();
  }
  print("List Size: $books");
  return books;
}

Future<List<Book>> getRoaldDahl() async {

  List<Book> books = [];

  Uri link = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Roald+Dahl&maxResults=10");
  var res = await http
      .get(link, headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["items"] as List;

    books = rest.map<Book>((json) => Book.fromJson(json)).toList();
  }
  print("List Size: $books");
  return books;
}

Future<List<Book>> getAllBooks() async {
List<Book> allBooks = [];
    allBooks.addAll( await getEnidBlyton());
    allBooks.addAll( await getJaneAusten());
    allBooks.addAll( await getAgathaChristie());
    allBooks.addAll( await getRuskinBond());
    allBooks.addAll( await getRoaldDahl());

   return allBooks;
}

Future<List<Book>> getSearchedBook(String term) async {
  List<Book> books= [];
  term.trim();
  print(term);
  String stringLink = "https://www.googleapis.com/books/v1/volumes?q="+term+"&maxResults=10";
  Uri link = Uri.parse(stringLink);
  var res = await http
      .get(link, headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["items"] as List;

    books = rest.map<Book>((json) => Book.fromJson(json)).toList();
  }
  print("List Size: $books");
  return books;



}