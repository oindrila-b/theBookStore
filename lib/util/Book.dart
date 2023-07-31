
class Book {

  final String title;
  final String description;
  final String author;
  final String score;
  final String image;
  final String buyLink;

  Book({required this.title, required this.description, required this.author, required this.score, required this.image, required this.buyLink});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['volumeInfo']['title'],
        description: json['volumeInfo']['description'] ?? "No descriptions provided",
        author: json['volumeInfo']['authors'] == null ?"None" :json['volumeInfo']['authors'][0] ,
        score: json['volumeInfo']['pageCount'].toString(),
        image: json['volumeInfo']['imageLinks'] == null ? "https://fastly.picsum.photos/id/403/3997/2665.jpg?hmac=l04T0quGocuZKSo0CxAJ7aC8CivbrCWV0X0dCzqvb0Y".toString() : json['volumeInfo']['imageLinks']['thumbnail'],
        buyLink: json['volumeInfo']['infoLink']);
  }

}



