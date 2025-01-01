

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/core/widgets/mybutton.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_cubit.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isobsecured = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: Get.find<AuthCubit>(),
        listener: (context, state) {},
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
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  CircleAvatar(
                    radius: 80,
                    child: Image.asset(
                      'assets/images/avatar1.png',
                      scale: 1,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: MyTextField(
                            prefixicon: Icon(Icons.person),
                            type: 'First Name',
                            obscure: false,
                            controller: fnameController),
                      ),
                      Expanded(
                        child: MyTextField(
                            prefixicon: Icon(Icons.person),
                            type: 'Last Name',
                            obscure: false,
                            controller: lnameController),
                      ),
                    ],
                  ),
                  MyTextField(
                      prefixicon: Icon(Icons.email),
                      type: 'Email',
                      obscure: false,
                      controller: emailController),
                  MyTextField(
                      prefixicon: Icon(Icons.phone),
                      type: '+20',
                      obscure: false,
                      controller: phoneController),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Expanded(
                          child: MyTextField(
                              prefixicon: Icon(Icons.lock),
                              type: 'Password',
                              obscure: isobsecured,
                              controller: passwordController),
                        ),
                        Expanded(
                          child: MyTextField(
                              prefixicon: Icon(Icons.lock),
                              type: 'Confirm Password',
                              obscure: isobsecured,
                              controller: confirmpasswordController),
                        ),
                      ]),
                  //show password
                  Row(
                    children: [
                      Checkbox(
                        value: !isobsecured,
                        onChanged: (value) =>
                            setState(() => isobsecured = !isobsecured),
                      ),
                      Text('Show Password'),
                    ],
                  ),
                  state is AuthLoading
                      ? CircularProgressIndicator()
                      : MyButton(
                          name: 'Register', onPressed: () => register(cubit)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Sign In'))
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

  void register(AuthCubit cubit) {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmpassword = confirmpasswordController.text.trim();

    if (password != confirmpassword) {
      GetSnacbars.ErrorSnackbar('Password do not match');
      return;
    }
    try {
      cubit.register(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
