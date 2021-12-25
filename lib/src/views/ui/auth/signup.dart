import 'package:flutter/material.dart';
import 'package:ishop/src/views/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            _nameField(),
            const SizedBox(height: 16),
            _emailField(),
            const SizedBox(height: 16),
            _addressField(),
            const SizedBox(height: 16),
            _mobileField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 16),
            _confirmPasswordField(),
            const SizedBox(height: 32),
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

  Widget _nameField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Full Name',
      ),
    );
  }

    Widget _emailField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Email',
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

    Widget _addressField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Address',
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
      ),
    );
  }

    Widget _mobileField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Mobile',
        keyboardType: TextInputType.phone,
    ),);
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

    Widget _confirmPasswordField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Confirm Password',
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  Widget _signUpButton() {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxWidth / 8,
          child: PositiveButton(
            title: 'Sign Up',
            onPressed: () {},
          ),
        ),
      );
    });
  }
}