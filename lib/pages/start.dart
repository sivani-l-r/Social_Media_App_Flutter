import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/pages/login.dart';
import 'package:social_media_app/pages/signup.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network('https://lottie.host/56cd7ef4-dfaa-48b3-8443-be0cae69937f/beA9DFHbdq.json'),
            SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => LoginPage())
                  );
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.inversePrimary), // Background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 22, 
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: 300,
              height: 50,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SignUpPage())
                  );
                }, 
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
