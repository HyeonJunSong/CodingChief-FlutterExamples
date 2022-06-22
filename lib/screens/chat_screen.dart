import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    getCurrentUser();
  }
  
  void getCurrentUser(){
    try{
      final user = _authentication.currentUser;
      if(user != null){
        loggedUser = user;
        print(loggedUser!.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat Screen"
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
            onPressed: (){
              _authentication.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chats/g4RUbiVM1Dg16oZf6ev6/message").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${docs[index]["text"]}",
                  style: const TextStyle(
                    fontSize: 20.0
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}