import 'dart:convert';


import 'package:assign_app/user/UserModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier{


bool loading =false;
List<User> userList;
List<User> get getUserList=>userList;

void listUser(List<User> val){
  userList=val;
  notifyListeners();

}

Future<void> fetchPost() async{
  
  final response=await http.get("https://jsonplaceholder.typicode.com/posts");
  List res=jsonDecode(response.body);
   List<User> data=[];

   for(var i=0;i<res.length;i++){
     var post=User.fromJson(res[i]);
     data.add(post);
   }
   listUser(data);
  
   setLoading(true);
   
  
}



  

  bool isLoading() { 
    return loading;
  } 
  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

 


}