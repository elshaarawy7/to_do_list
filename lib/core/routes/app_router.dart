import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app_2/features/auth/presentation/screens/home_screan.dart';
import 'package:to_do_app_2/features/auth/presentation/screens/login_screen.dart';
import 'package:to_do_app_2/features/auth/presentation/screens/regester.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/', // الصفحة الرئيسية عند البداية
  routes: [
    // صفحة تسجيل الدخول
    GoRoute(
      path: '/',
      builder: (context, state) =>  LoginScreen(),
    ),
    // صفحة التسجيل
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),   

    GoRoute(
      path: "/home" , 
      builder: (context, state) => const HomeScrean(),
    ) 
  ],
);

