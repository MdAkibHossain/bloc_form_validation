import 'package:bloc_test_project_2_form_validation/screens/sign_in_screen/block/sign_in_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sign_in_screen/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: SafeArea(
        child: Center(
          child: CupertinoButton(
              color: Colors.blue,
              child: const Text("Sign In with Email"),
              onPressed: () {
                print("object");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SignInBloc(),
                        child: SignInScreen(),
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}
