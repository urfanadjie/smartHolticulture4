import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_holticulture_4/constants/constants_value.dart';
import 'package:smart_holticulture_4/ui/root_page.dart';
import 'package:smart_holticulture_4/ui/screens/forgot_password.dart';
import 'package:smart_holticulture_4/ui/screens/signup_page.dart';
import 'package:smart_holticulture_4/ui/screens/widgets/custom_textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 95,
                child: Image.asset('assets/plant/plant_anthurium.png')),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextfield(
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
              ),
              const CustomTextfield(
                obscureText: true,
                hintText: 'Enter Password',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const RootPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const ForgotPasswordPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: 'Lupa Password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Reset disini',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Icon(Icons.face),
                    ),
                    Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: 'Belum buat Akun? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Buat Sekarang!',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
