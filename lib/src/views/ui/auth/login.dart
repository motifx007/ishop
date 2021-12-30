
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/auth/auth_bloc.dart';
import 'package:ishop/src/business_logic/model/login_request.dart';
import 'package:ishop/src/business_logic/utils/simple_functions.dart';
import 'package:ishop/src/views/ui/products/product_list.dart';
import 'package:ishop/src/views/widgets/widgets.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(this.context);

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
              _emailField(),
              const SizedBox(height: 16),
              _passwordField(),
              // const SizedBox(height: 8),
              // _forgotPasswordButton(),
              const SizedBox(height: 56),
              _loginButton(),
              const SizedBox(height: 16),
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

  Widget _emailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SimpleTextField(
        hintText: 'Email',
        validator: SimpleFunctions.emailValidator,
        textEditingController: _emailController,
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
              style: Theme.of(this.context).textTheme.bodyText1,
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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                CustomSnackBar.positiveSnackBar(context: context, message: 'Login Success',);
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductList()),
                    );
              }
              if (state is Error) {
                CustomSnackBar.negativeSnackBar(context: context, message: 'Login Failed',);
              }
            },
            builder: (context, state) {
              // if (state is LoginSuccess) {

              // }
              return PositiveButton(
                title: 'Login',
                onPressed: () {
                  _dismissKeyboard();
                  if (_formKey.currentState!.validate()) {
                    _authBloc.add(Login(
                        loginRequest: LoginRequest(
                      email: _emailController.text,
                      password: _passwordController.text,
                    )));
                    
                  }
                },
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
              _dismissKeyboard();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
          ),
        ),
      );
    });
  }

  _dismissKeyboard() {
    FocusScope.of(this.context).unfocus();
  }
}
