import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import 'addPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(future: DatabaseHelper.getAllNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // TODO: Handle this case.
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            // TODO: Handle this case.
            case ConnectionState.done:
            // TODO: Handle this case.
              return ListView(
                children: snapshot.data!.map((e) =>
                    ListTile(
                      title: Text("${ e.title}"),
                      subtitle: Text("${ e.description}"),
                    ),).toList(),
              );
          }
        },

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
              ));
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
