import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signup.dart';
import 'package:fyp2_clean_architecture/features/auth/viewmodel/auth/auth_view_model.dart';
import 'package:fyp2_clean_architecture/features/auth/viewmodel/form_error/login/login_form_error_view_notifier.dart';
import 'package:fyp2_clean_architecture/features/splash/view/splash_view.dart';

class SignIn extends ConsumerWidget {
  static const routeName = '/SignIn';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    emailController.text = 'sohaib@gmail.com';
    passwordController.text = '123456';

    ref.listen(authViewModelProvider, (prev, next) {
      next?.when(
          data: (data) {
            Navigator.pushReplacementNamed(context, SplashView.routeName);
          },
          error: (error, st) {
            GeneralFailure generalError = error as GeneralFailure;
            showSnackBar(context, generalError.message);
          },
          loading: () {});
    });

    Map<String, dynamic>? formFieldErrors =
        ref.watch(loginFormErrorViewNotifierProvider)?.errors;
    final isLoading = ref
        .watch(authViewModelProvider.select((val) => val?.isLoading == true));

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
            ),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // statusBarIconBrightness: Brightness.light,
          // statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [
                      Color(0xFFFC8A19),
                      Color(0xFFFD7713),
                      Color(0xFFFE600C)
                    ],
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 36, right: 36, bottom: 24),
                child: const Text(
                  'Hello\nSign In!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    //height: 0,
                    letterSpacing: 0.36,
                  ),
                )),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0xFFFC8A19),
                    Color(0xFFFD7713),
                    Color(0xFFFE600C)
                  ],
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
                //clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  color: Colors.white,
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
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              hintText: "Email",
                              helperText: formFieldErrors?['email'] ?? '',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFFC8A19),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xFFFC8A19),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.email)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              hintText: "Password",
                              helperText: formFieldErrors?['password'] ?? '',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                    width: 2, color: Color(0xFFFC8A19)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                    width: 2, color: Color(0xFFFC8A19)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.password)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 44),
                    Container(
                        constraints: const BoxConstraints(minWidth: 345),
                        height: 53,
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(1.00, 0.00),
                            end: Alignment(-1, 0),
                            colors: [
                              Color(0xFFFC8A19),
                              Color(0xFFFD7713),
                              Color(0xFFFE600C)
                            ],
                          ),
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
                                      .loginUser(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              //padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inria Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    height: 0),
                              ),
                              if (isLoading)
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Don\'t have account?',
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
                            height: 50,
                            width: double.infinity,
                            child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(loginFormErrorViewNotifierProvider
                                          .notifier)
                                      .unsetErrors();

                                  Navigator.pushReplacementNamed(
                                      context, Signup.routeName);
                                },
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFFE640D),
                                    fontSize: 24,
                                    fontFamily: 'Inria Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
