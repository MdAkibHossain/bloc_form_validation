import 'package:bloc_test_project_2_form_validation/screens/sign_in_screen/block/sign_in_block.dart';
import 'package:bloc_test_project_2_form_validation/screens/sign_in_screen/block/sign_in_event.dart';
import 'package:bloc_test_project_2_form_validation/screens/sign_in_screen/block/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In with Email"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          // physics: const BouncingScrollPhysics(
          //   parent: AlwaysScrollableScrollPhysics(),
          // ),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(
                    _emailController.text,
                    _passwordController.text,
                  ),
                );
                //  context.read<SignInBloc>().add(
                //       SignInTextChangeEvent(
                //         _emailController.text,
                //         _passwordController.text,
                //       ),
                //     );
              },
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (val) {
                // BlocProvider.of<SignInBloc>(context).add(
                //   SignInTextChangeEvent(
                //     _emailController.text,
                //     _passwordController.text,
                //   ),
                // );
                context.read<SignInBloc>().add(
                      SignInTextChangeEvent(
                        _emailController.text,
                        _passwordController.text,
                      ),
                    );
              },
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CupertinoButton(
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  child: const Text("Sign In"),
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmitEvent(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
