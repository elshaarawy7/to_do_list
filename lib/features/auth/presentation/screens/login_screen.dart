import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/My_batton.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/custom_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "مرحبًا بك!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // حقل الإيميل
                CustomTextField(
                  hintText: "الاسم",
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "من فضلك ادخل اسمك";
                    }
                  },
                ),
                const SizedBox(height: 16),

                // حقل كلمة المرور
                CustomTextField(
                  hintText: "كلمة المرور",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل كلمه المرور';
                    } else if (value.length <= 6) {
                      return "لا يمكن ان تكون كلمه السر اقل من 6 حروف";
                    }
                    return null; // if valid
                  },
                ),
                const SizedBox(height: 10),

                // زر هل نسيت كلمة المرور؟
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // أكشن لاستعادة كلمة المرور
                    },
                    child: const Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // زر تسجيل الدخول
                CustomButton(
                  text: "تسجيل الدخول",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // إذا كان النموذج صحيحًا، قم بعملية تسجيل الدخول
                      print("النموذج صحيح، جاري تسجيل الدخول..." );
                      // ضع هنا كود تسجيل الدخول الحقيقي
                    context.go("/home");
                    } else {
                      print("النموذج غير صحيح، الرجاء التحقق من البيانات!");
                    }
                  },
                ),
                const SizedBox(height: 20),

                // الانتقال إلى صفحة التسجيل
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ليس لديك حساب؟",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/register'); // الانتقال لصفحة التسجيل
                      },
                      child: const Text("سجل الآن"),
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
