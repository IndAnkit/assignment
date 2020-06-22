class User{
int id;
String title;
String body;
User(this.id,this.title,this.body);

String get getTitle=>this.title;
String get getBody=>this.body;

Map toJson() => {
    'id':id,
    'title':title,
    'body': body
  };

  User.fromJson(Map json) :
  id = json['id'],
  title = json['title'],
  body = json['body'];


}