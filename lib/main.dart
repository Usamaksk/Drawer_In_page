import 'package:drawer_widget/new_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS
      ? Colors.grey[50]: null),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => NewPage("New Page"),
      // }
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer App"),
        elevation:defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
       child: ListView(
         children:  [
           UserAccountsDrawerHeader(accountName:Text("Usama Sabir"),
               accountEmail: Text("usamaksk123@gmail.com"),
             currentAccountPicture: CircleAvatar(
               backgroundColor:
               Theme.of(context).platform == TargetPlatform.iOS
                   ? Colors.deepPurple
                   : Colors.grey,
               child: Text("QM"),
             ),
             otherAccountsPictures: [
               CircleAvatar(
                 backgroundColor:
                 Theme.of(context).platform == TargetPlatform.iOS
                     ? Colors.deepPurple
                     : Colors.grey,
                 child: Text("US"),
               ),
             ],
           ),
            ListTile(
             title: Text("Page One"),
             trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)
                    => NewPage("Page One")));
              }
           ),
            ListTile(
             title: Text("Page Two"),
             trailing: Icon(Icons.arrow_downward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)
                    => NewPage("Page Two")));
              }
           ),
           ListTile(
             title: Text("Close"),
             trailing: Icon(Icons.close),
             onTap: () => Navigator.of(context).pop(),
           ),
         ],
       ),
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}