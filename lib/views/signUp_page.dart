import 'package:chatapp5/controller/auth_controller.dart';
import 'package:chatapp5/views/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage5 extends StatefulWidget {
  const SignUpPage5({Key? key}) : super(key: key);

  @override
  State<SignUpPage5> createState() => _SignUpPage5State();
}

class _SignUpPage5State extends State<SignUpPage5> {

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
        title: Text('SignUpPage6'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          elevation: 0.0,
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),

              ElevatedButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(200, 50),
                    shape: StadiumBorder()
                ),
                onPressed: () {
                  if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                    authController.register(context, emailController.text, passwordController.text);
                  }else{
                    authController.catchError(context, 'Something wrong');
                  }
                  clearText();

                },
                child: Text('SignUp',textScaleFactor: 1.2,),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Have an account ?'),
                  TextButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage5()));
                  }, child: Text('Login'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}