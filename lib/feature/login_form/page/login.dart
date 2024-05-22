import 'package:flutter/material.dart';
import 'package:learn_flutter/feature/login_form/page/widgets/gradient_button.dart';
import 'package:learn_flutter/feature/login_form/page/widgets/login_field.dart';
import 'package:learn_flutter/feature/login_form/page/widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/signin_balls.png"),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SocialButton(
                iconPath: 'assets/svg/g_logo.svg',
                label: "Continue with google",
              ),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: 'assets/svg/f_logo.svg',
                label: 'Continue with facebook',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              LoginField(controller: emailController, hintText: "Email"),
              const SizedBox(height: 15),
              LoginField(controller: passwordController, hintText: "Password"),
              const SizedBox(height: 20),
              const GradientButton(),
            ],
          ),
        ),
      ),
    );
  }
}
