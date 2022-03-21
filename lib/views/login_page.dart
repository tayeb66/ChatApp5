import 'package:chatapp5/controller/auth_controller.dart';
import 'package:chatapp5/views/signUp_page.dart';
import 'package:flutter/material.dart';

class LoginPage5 extends StatefulWidget {
  const LoginPage5({Key? key}) : super(key: key);

  @override
  State<LoginPage5> createState() => _LoginPage5State();
}

class _LoginPage5State extends State<LoginPage5> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AuthController authController = AuthController();

  void clearText(){
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('LoginPage5'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 0.0,
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter UserName',
                    contentPadding: EdgeInsets.only(left: 10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    contentPadding: EdgeInsets.only(left: 10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(200, 50), shape: StadiumBorder()),
                onPressed: () {
                  if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                    authController.loginUser(context, emailController.text, passwordController.text);
                  }else{
                    authController.catchError(context, 'Something wrong');
                  }
                  clearText();

                },
                child: Text(
                  'Login',
                  textScaleFactor: 1.2,
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(200, 50), shape: StadiumBorder()),
                onPressed: () {
                 authController.signInWithGoogle(context);

                },
                child: Text(
                  'Login with google',
                  textScaleFactor: 1.2,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Create a account ? '),
                  TextButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage5()));
                  }, child: Text('SignUp'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}