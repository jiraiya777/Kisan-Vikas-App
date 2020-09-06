import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:kisanVikasApp/pages/home_page.dart';

import 'package:kisanVikasApp/pages/userDetails.dart';
import 'package:kisanVikasApp/pages/login_page.dart';
import 'package:kisanVikasApp/pages/otp_page.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String actualCode;
  AuthResult a1;

  @observable
  bool isLoginLoading = false;
  @observable
  bool isOtpLoading = false;

  @observable
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  @observable
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  FirebaseUser firebaseUser;

  @action
  Future<bool> isAlreadyAuthenticated() async {
    firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> getCodeWithPhoneNumber(BuildContext context, String phoneNumber) async {
    isLoginLoading = true;
    print('mobile number is : $phoneNumber ');
    
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),

        verificationCompleted: (AuthCredential auth) async {
          await _auth
              .signInWithCredential(auth);
              loginScaffoldKey.currentState.showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              content: Text('Something has gone wrong, please try later', style: TextStyle(color: Colors.white),),
            ));
            
          
        },
        verificationFailed: (AuthException authException) {
          print('Error message: ' + authException.message);
          loginScaffoldKey.currentState.showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text('The phone number format is incorrect. Please enter your number in E.164 format. [+][country code][number]', style: TextStyle(color: Colors.white),),
          ));
          isLoginLoading = false;
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          actualCode = verificationId;
          isLoginLoading = false;
          await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OtpPage()));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          actualCode = verificationId;
        }
    );
  }

  @action
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) async {
    isOtpLoading = true;
    final AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);

    print(smsCode);
    print('ddddddddddddddddddddddddddddddddd');
    print(_authCredential.toString());
    /*
    
    final AuthResult ap = await _auth.signInWithCredential(_authCredential);
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    if(ap != null && ap.user!=null)
    {
         print('Authentication successful');
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        onAuthenticationSuccessful(context, ap);
    }
    else
    {
      isOtpLoading = false;
      print('anttttttttttttttttttttttttttttttttttttttttttt');
      otpScaffoldKey.currentState.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text('Wrong code ! Please enter the last code received.', style: TextStyle(color: Colors.white),),
      ));
    }
    */
    await _auth.signInWithCredential(_authCredential).then((authResult) {
      
      //a1 = authResult;
      //print(a1.toString());
      
      print('ffffffffffffffffffffffffffffffffffffffffff');
      if (authResult != null && authResult.user != null) {
        print('Authentication successful');
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        onAuthenticationSuccessful(context, authResult);
      }
    }).catchError((error) {
      print(error.toString());
      print('ggggggggggggggggggggggggggggggggggggg');
      isOtpLoading = false;
      otpScaffoldKey.currentState.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text('Wrong code ! Please enter the last code received.', style: TextStyle(color: Colors.white),),
      ));
    });
  
  }

  Future<void> onAuthenticationSuccessful(BuildContext context, AuthResult result) async {
    isLoginLoading = true;
    isOtpLoading = true;

    firebaseUser = result.user;
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaAAAAAAAAAAAAAAAAAAAA');
    print(firebaseUser.uid);
    

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const UserDetails()), (Route<dynamic> route) => false);

    isLoginLoading = false;
    isOtpLoading = false;
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (Route<dynamic> route) => false);
    firebaseUser = null;
  }
}