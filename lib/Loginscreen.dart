import 'package:flutter/material.dart';
import 'package:user_interface/SignUpScreen.dart';
import 'package:user_interface/forgetpassword.dart';
import 'package:user_interface/changepassword.dart';
import 'package:user_interface/successfullregistred.dart';



class Loginscreen extends StatelessWidget {
   Loginscreen({Key? key}) : super(key: key);
  final mykey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  void dispose(){
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: mykey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                 
                  validator: (value) {
                    bool emailvalid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%^!*&,'*+-/=?{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]*'")
                        .hasMatch(value!);
                        if(value.isEmpty){
                          return "enter email";
                        } 
                        if(!emailvalid){
                           return 'Enter the valid email';
                        }
                      },
                    ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null|| value.isEmpty) {
                      return 'enter a valid password';
                    }
                    return null;
                  },
                 ),
                 SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                 if(mykey.currentState!.validate())
                 {
                     Navigator.push(context, MaterialPageRoute(builder: ((context) => successfullregistred())));
                 }
                 else{
                  return;
                 }
                },
                
                child: Text('LOGIN'),
              ),
               
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => SignUpScreen())));
                      },
                      child: Text('Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => ForgetPasswordPage())));
                      },
                      child: Text('Forget Password?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                     TextButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => ChangePassword())));
                      },
                      child: Text('Change Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
