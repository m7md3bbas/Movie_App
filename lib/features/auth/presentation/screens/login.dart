import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/core/widgets/mybutton.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';
import 'package:movieapp/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:movieapp/features/auth/presentation/manager/cubit/auth_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isobsecured = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: Get.find<AuthCubit>(),
        listener: (context, state) {
          if (state is AuthError) {
            GetSnacbars.ErrorSnackbar(state.errorMessage);
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          var cubit = Get.find<AuthCubit>();
          return SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Image.asset('assets/images/Logo.png'),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  MyTextField(
                    prefixicon: Icon(Icons.email),
                    obscure: false,
                    type: 'Email',
                    controller: emailController,
                  ),
                  MyTextField(
                    prefixicon: Icon(Icons.lock),
                    type: 'Password',
                    controller: passwordController,
                    obscure: isobsecured,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: !isobsecured,
                        onChanged: (value) =>
                            setState(() => isobsecured = !isobsecured),
                      ),
                      Text('Show Password'),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/forgetPassword');
                        },
                        child: Text(
                          'Forgot Password?',
                        ),
                      )
                    ],
                  ),
                  state is AuthLoading
                      ? CircularProgressIndicator()
                      : MyButton(name: 'Login', onPressed: () => login(cubit)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            Get.toNamed("/register");
                          },
                          child: Text('Sign up'))
                    ],
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  void login(AuthCubit cubit) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      cubit.login(email: email, password: password);
      FocusScope.of(context).unfocus();
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      GetSnacbars.ErrorSnackbar(e.toString());
    }
  }
}
