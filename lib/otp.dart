import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp/home.dart';
import 'package:otp/phone.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your Phone number'),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Pinput(
              length: 6,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try{
                     PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: MyPhone.verify, smsCode: code);

                
                await auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ));
                }
                catch(e){
                  print("wrong OTP");
                }
               
              },
              child: Text('send the code'))
        ],
      ),
    );
  }
}
