import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/auth/auth_bloc.dart';
import 'package:ishop/src/business_logic/model/sign_up_request.dart';
import 'package:ishop/src/business_logic/utils/simple_functions.dart';
import 'package:ishop/src/views/widgets/widgets.dart';

import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Full Name',
        textEditingController: _fullNameController,
        validator: SimpleFunctions.nameValidator,
      ),
    );
  }

  Widget _emailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Email',
        textEditingController: _emailController,
        validator: SimpleFunctions.emailValidator,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _addressField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Address',
        textEditingController: _addressController,
        validator: SimpleFunctions.addressValidator,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
      ),
    );
  }

  Widget _mobileField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Mobile',
        textEditingController: _mobileController,
        validator: SimpleFunctions.mobileNumberValidator,
        maxLength: 10,
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Password',
        textEditingController: _passwordController,
        validator: SimpleFunctions.passWordValidator,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        maxLength: 6,
        labelText: 'Password can be any 6 characters',
      ),
    );
  }

  Widget _confirmPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Confirm Password',
        textEditingController: _confirmPasswordController,
        validator: (value) {
          if (_passwordController.text != _confirmPasswordController.text) {
            return 'Confirm password should be same as the original password';
          }
          return SimpleFunctions.passWordValidator(value);
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        maxLength: 6,
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
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              // if (state is SignUpSuccess) {

              // }
              return PositiveButton(
                title: 'Sign Up',
                onPressed: () {
                  _dismissKeyboard();

                  if (_formKey.currentState!.validate()) {
                    _authBloc.add(
                      SignUp(
                        signUpRequest: SignUpRequest(
                          fullName: _fullNameController.text,
                          email: _emailController.text,
                          address: _addressController.text,
                          mobile: _mobileController.text,
                          password: _passwordController.text,
                          token: SimpleFunctions.getRandomString(15),
                        ),
                      ),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  }
                },
              );
            },
          ),
        ),
      );
    });
  }

  _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
