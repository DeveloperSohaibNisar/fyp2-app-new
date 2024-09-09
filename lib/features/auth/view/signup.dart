import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signin.dart';
import 'package:fyp2_clean_architecture/features/auth/viewmodel/auth/auth_view_model.dart';
import 'package:fyp2_clean_architecture/features/auth/viewmodel/form_error/signup/signup_form_error_view_notifier.dart';
import 'package:fyp2_clean_architecture/features/splash/view/splash_view.dart';

class Signup extends ConsumerStatefulWidget {
  static const routeName = '/Signup';
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Future<void> dispose() async {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authViewModelProvider, (prev, next) {
      next?.when(
          data: (data) {
            Navigator.pushReplacementNamed(context, SplashView.routeName);
          },
          error: (error, st) {
            showSnackBar(context, error as String);
          },
          loading: () {});
    });

    Map<String, dynamic>? formFieldErrors = ref.watch(signupFormErrorViewNotifierProvider)?.errors;
    final isLoading = ref.watch(authViewModelProvider.select((val) => val?.isLoading == true));

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // statusBarIconBrightness: Brightness.light,
          // statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: const Text(
                  'Create Your\nAccount',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFFC8A19),
                    fontSize: 36,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    //height: 0,
                    letterSpacing: 0.36,
                  ),
                )),
            const SizedBox(height: 24),
            Container(
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
              //clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [Color(0xFFFC8A19), Color(0xFFFE600C)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 56,
                        decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          textSelectionTheme: const TextSelectionThemeData(
                            cursorColor: Color(0xFFFE600C),
                            selectionColor: Color(0xFFFE600C),
                            selectionHandleColor: Color(0xFFFE600C),
                          ),
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                color: Color(0xFF848488),
                                fontSize: 14,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              helperStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              hintText: "Username",
                              helperText: formFieldErrors?['name'] ?? '',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.person)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              color: Color(0xFF848488),
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            helperStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            hintText: "Email",
                            helperText: formFieldErrors?['email'] ?? '',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.email)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    children: [
                      Container(
                        height: 56,
                        decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              color: Color(0xFF848488),
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            helperStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            hintText: "Password",
                            helperText: formFieldErrors?['password'] ?? '',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.password)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    children: [
                      Container(
                        height: 56,
                        decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              color: Color(0xFF848488),
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            helperStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            hintText: "Confirm Password",
                            helperText: formFieldErrors?['confirmPassword'] ?? '',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.password)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Container(
                      constraints: const BoxConstraints(minWidth: 345),
                      height: 53,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .signUpUser(name: usernameController.text, email: emailController.text, password: passwordController.text, confirmPassword: confirmPasswordController.text);
                              },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          //padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey[200],
                          disabledForegroundColor: const Color.fromRGBO(252, 138, 25, .8),
                          foregroundColor: const Color.fromRGBO(252, 138, 25, 1),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Text(
                              "Sign up",
                              // textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Inria Sans', fontWeight: FontWeight.w400, fontSize: 24, height: 0),
                            ),
                            if (isLoading)
                              const CircularProgressIndicator(
                                color: Color(0xFFFE600C),
                              ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Already a user?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 24,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        // height: 50,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              ref.watch(signupFormErrorViewNotifierProvider.notifier).unsetErrors();

                              Navigator.pushReplacementNamed(context, SignIn.routeName);
                            },
                            child: const Text(
                              'Sign in',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
