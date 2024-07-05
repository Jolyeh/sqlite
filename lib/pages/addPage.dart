import 'package:flutter/material.dart';
import 'package:sqlite/models/notedata.dart';
import '../services/database_helper.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final Note note = Note(title: "", description: "");


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
                    onSaved: (data){
                      note.title=data!;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(

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
                    onSaved: (data){
                      note.description=data!;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                        print(note) ;
                         //var id= await  DatabaseHelper.addNote(Note(title: titre, description: description));


                        // print(id);



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
