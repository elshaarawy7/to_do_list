import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/My_batton.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/custom_text_field.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "إنشاء حساب جديد",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // حقل الاسم
                CustomTextField(
                  hintText: "الاسم",
                  obscureText: false,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك ادخل اسمك";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // حقل البريد الإلكتروني
                CustomTextField(
                  hintText: "البريد الإلكتروني",
                  obscureText: false,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك ادخل البريد الإلكتروني";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                      return "البريد الإلكتروني غير صحيح";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // حقل كلمة المرور
                CustomTextField(
                  hintText: "كلمة المرور",
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك ادخل كلمة المرور";
                    } else if (value.length < 6) {
                      return "كلمة المرور يجب أن تكون على الأقل 6 أحرف";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // حقل تأكيد كلمة المرور
                CustomTextField(
                  hintText: "تأكيد كلمة المرور",
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك أكد كلمة المرور";
                    } else if (value != passwordController.text) {
                      return "كلمتا المرور غير متطابقتين";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // زر التسجيل
                CustomButton(
                  text: "تسجيل",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      print("النموذج صحيح، يتم التسجيل...");
                      context.go('/home'); // الانتقال للصفحة الرئيسية
                    } else {
                      print("النموذج غير صحيح، الرجاء التحقق من البيانات!");
                    }
                  },
                ),
                const SizedBox(height: 20),

                // زر الرجوع لصفحة تسجيل الدخول
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "لديك حساب؟",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


