import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/core/widgets/mybutton.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_cubit.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_state.dart';
import 'package:movieapp/presentation/Auth/screens/widgets/Register/name_fileds.dart';
import 'package:movieapp/presentation/Auth/screens/widgets/Register/password_fields.dart';
import 'package:movieapp/presentation/Auth/screens/widgets/Register/sgin_in.dart';
import 'package:movieapp/presentation/Auth/screens/widgets/Register/show_password.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<bool> isObscured = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: Get.find<AuthCubit>(),
        listener: (context, state) {
          if (state is AuthError) {
            GetSnacbars.ErrorSnackbar(state.errorMessage);
          }
        },
        builder: (context, state) {
          var cubit = Get.find<AuthCubit>();
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Image.asset('assets/images/Logo.png'),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  NameFieldsWidget(
                    fnameController: fnameController,
                    lnameController: lnameController,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    prefixicon: const Icon(Icons.email),
                    type: 'Email',
                    obscure: false,
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    prefixicon: const Icon(Icons.phone),
                    type: '+20',
                    obscure: false,
                    controller: phoneController,
                  ),
                  const SizedBox(height: 10),
                  PasswordFieldsWidget(
                    confirmpasswordController: confirmpasswordController,
                    isObscured: isObscured,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 10),
                  ShowPasswordCheckBox(isObscured: isObscured),
                  const SizedBox(height: 10),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : MyButton(
                          name: 'Register',
                          onPressed: () => _register(cubit),
                        ),
                  const SizedBox(height: 10),
                  SginInWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _register(AuthCubit cubit) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();

    if (password != confirmPassword) {
      GetSnacbars.ErrorSnackbar('Passwords do not match');
      return;
    }

    try {
      cubit.register(email: email, password: password);
    } catch (e) {
      GetSnacbars.ErrorSnackbar(e.toString());
    }
  }
}
