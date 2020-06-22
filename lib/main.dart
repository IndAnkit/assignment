

import 'package:assign_app/provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
         create: (context)=>UserProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
         
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   @override
  Widget build(BuildContext context) {
    final UserProvider userProvider=Provider.of<UserProvider>(context);
    userProvider.fetchPost();
    
    return Scaffold(
      appBar: AppBar(title:Text("Assignment App")),
      body:Consumer<UserProvider>( //                    <--- Consumer
                  builder: (context, myUser, child){
                   return myUser.loading?ListView.builder(
                     itemCount: myUser.userList.length,
                     itemBuilder: (context,i)=>Card(
                       elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                           crossAxisAlignment:CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Text(myUser.userList[i].getTitle,style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.bold),textAlign: TextAlign.justify),
                             Divider(),
                             Text(myUser.userList[i].getBody,style: TextStyle(fontSize: 18.0),textAlign: TextAlign.justify),
                           ],
                         ),
                      ),
                     )
                       
                     
                   ):Center(child:CircularProgressIndicator());
                  }),
    );
  }
}