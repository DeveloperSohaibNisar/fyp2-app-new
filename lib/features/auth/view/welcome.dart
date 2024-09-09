import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signin.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          // statusBarIconBrightness: Brightness.light,
          // statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            children: [
              const Column(
                children: [
                  // Icon(
                  //   size: 60,
                  //   Icons.image,
                  //   color: Colors.white,
                  // ),
                  Image(image: AssetImage('assets/images/app_logo.png')),
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      'Info-Verse',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Allerta Stencil',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.36,
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 53,
                        constraints: const BoxConstraints(minWidth: 321),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        //clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.restorablePushNamed(
                                context, SignIn.routeName);
                          },
                          child: const Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 53,
                        constraints: const BoxConstraints(minWidth: 321),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              Navigator.restorablePushNamed(
                                  context, Signup.routeName);
                            },
                            child: const Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFC8A19),
                                fontSize: 24,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
