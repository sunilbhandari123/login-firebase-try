import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Homep extends StatefulWidget {
  const Homep({Key? key}) : super(key: key);

  @override
  State<Homep> createState() => _HomepState();
}

class _HomepState extends State<Homep> {
  String uid='';
  @override
  void initState(){
    uid= '';
    User? currentUser= FirebaseAuth.instance.currentUser;{
      setState(() {
        this.uid = currentUser!.uid;
      });
    }
    super.initState();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('User'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('User Id : $uid'),
              SizedBox(height: 10,),
              new OutlinedButton(
                
                  child: Text('Log out', style: TextStyle( color: Colors.blue),),
                  onPressed: (){
                    FirebaseAuth.instance.signOut().then((action){
                      Navigator.of(context)
                          .pushReplacementNamed('/landpage');
                    }).catchError((e){
                      print(e);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
