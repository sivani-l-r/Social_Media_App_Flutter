import 'package:flutter/material.dart';
import 'package:social_media_app/pages/mainscreen.dart';
import 'package:social_media_app/pages/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControl = TextEditingController();
    TextEditingController passwordControl = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 34,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,),                
                  child: TextField(
                  controller: emailControl,
                  decoration: InputDecoration(
                    hintText: 'EMAIL',
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    prefixIcon: Icon(Icons.person_outline),
                    prefixIconColor: Theme.of(context).colorScheme.secondary,

                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,),                
                child: TextField(
                  controller: passwordControl,
                  decoration: InputDecoration(
                    hintText: 'PASSWORD',
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    prefixIconColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              SizedBox(height: 10), 
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,),                
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => MainPage())
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.inversePrimary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      
                    ),
                    elevation: MaterialStateProperty.all<double>(6.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14), 
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,),                
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?", 
                      style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => SignUpPage())
                          );
                        },
                        child: Text(
                          "Register Here",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
