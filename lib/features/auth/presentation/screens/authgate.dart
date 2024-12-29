// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movieapp/core/functions/dependancy_injection.dart';
// import 'package:movieapp/features/auth/presentation/manager/cubit/auth_cubit.dart';
// import 'package:movieapp/features/auth/presentation/screens/login_or_register.dart';
// import 'package:movieapp/features/home/presentation/manager/cubit/genric_cubit.dart';
// import 'package:movieapp/features/home/presentation/manager/cubit/home_cubit.dart';
// import 'package:movieapp/features/home/presentation/screens/home.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => locator<HomeCubit>()..topRatedMovies(),
//               ),
//               BlocProvider(
//                 create: (context) =>
//                     locator<GenricCubit>()..genresMovies(genres: "All"),
//               ),
//               BlocProvider(
//                 create: (context) =>
//                     locator<AuthCubit>(),
//               ),
//             ],
//             child: Home(),
//           );
//         } else {
//           return BlocProvider(
//             create: (context) => locator<AuthCubit>(),
//             child: const LoginOrRegister(),
//           );
//         }
//       },
//     );
//   }
// }
