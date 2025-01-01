import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/core/widgets/mybutton.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_cubit.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_state.dart';
import 'package:movieapp/presentation/Auth/screens/widgets/login/sginup.dart';
import 'package:movieapp/presentation/Auth/screens/widgets/login/show_password.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isObscuredNotifier = ValueNotifier<bool>(true);

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    MyTextField(
                      prefixicon: Icon(Icons.email),
                      obscure: false,
                      type: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isObscuredNotifier,
                      builder: (context, isObscured, child) {
                        FocusScope.of(context).unfocus();
                        return MyTextField(
                          prefixicon: Icon(Icons.lock),
                          type: 'Password',
                          controller: passwordController,
                          obscure: isObscured,
                        );
                      },
                    ),
                    ShowPasswordWidget(isObscuredNotifier: isObscuredNotifier),
                    state is AuthLoading
                        ? CircularProgressIndicator()
                        : MyButton(
                            name: 'Login',
                            onPressed: () => _login(cubit, context),
                          ),
                    SginUpWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _login(AuthCubit cubit, BuildContext context) {
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
