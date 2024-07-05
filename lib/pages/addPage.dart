import 'package:flutter/material.dart';
import '../services/database_helper.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final myTitle = TextEditingController();
  final mydescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout de note"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: myTitle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Titre',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Remplissez ce champs ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: mydescription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Remplissez ce champs ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          var titre = myTitle.text;
                          var description = mydescription.text;
                        }
                      },
                      child: Text("Ajouter la note")
                  )
                ],
              ))
        ],
      ),
    );
  }
}
