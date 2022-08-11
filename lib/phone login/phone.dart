import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/phone%20login/homel.dart';

class Phone extends StatefulWidget {
  Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

 class _PhoneState extends State<Phone> {
   late String phoneNo, verificationId, smssent;
   
     get Buildcontext => null;


  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialoge(Buildcontext,context).then((value) {
        print("Code Sent");
      });
  };

final PhoneVerificationCompleted verifiedSuccess=(AuthCredential auth){};
final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e){
  print('${e.message}');
};


  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNo,
    verificationCompleted: verifiedSuccess,
    verificationFailed: verifyFailed, 
    codeSent: smsCodeSent,
    codeAutoRetrievalTimeout: autoRetrive);
  }

  Future smsCodeDialoge(Buildcontext, context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title:Text('Provide OTP'),
            content: TextField(
              onChanged: (value) {
                this.smssent = value;
              },
            ),
            contentPadding: EdgeInsets.all(10),
            actions: [
              new FlatButton(onPressed: (){
                User? currentUser= FirebaseAuth.instance.currentUser;
                  if (currentUser!=null){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homep()));
                  }else{
                    Navigator.of(context).pop();
                    signIn(smssent);
                  }},
              child:Text('Done',style:TextStyle(color:Colors.blue) )
    )],
          );
        });
  }
  
 
  Future<void> 
  signIn(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential( 
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential)
        .then((user){
      Navigator.of(context).pushReplacementNamed('/loginpage');
    }).catchError((e){
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            (AppBar(title: const Center(child: Text('Phone Authentication')))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            TextField(
                decoration: const InputDecoration(hintText: 'Phone Number'),
                onChanged: (Value) {
                  setState(() {
                    phoneNo = Value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: verifyPhone,
              child: Text('Verify'),
              color: Colors.brown,
            )
          ],
        ));
  }
}

