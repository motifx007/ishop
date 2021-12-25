import 'package:flutter/material.dart';
import 'package:ishop/src/views/ui/products/product_list.dart';
import 'package:ishop/src/views/widgets/widgets.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            // _riveView(),
            const SizedBox(height: 16),
            _emailField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 8),
            _forgotPasswordButton(),
            const SizedBox(height: 16),
            _loginButton(),
            const SizedBox(height: 16),
            _signUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return const CircleAvatar(
      radius: 48,
      child: Text(
        'LOGO',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _emailField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Password',
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  Widget _forgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              // ForgotPassword.forgotPasswordBottomSheet(context: context);
            },
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }

  Widget _loginButton() {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxWidth / 8,
          child: PositiveButton(
            title: 'Login',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductList()),
              );
            },
          ),
        ),
      );
    });
  }

  Widget _signUpButton() {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxWidth / 8,
          child: PositiveButton(
            title: 'SignUp',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUp()),
              );
            },
          ),
        ),
      );
    });
  }
}