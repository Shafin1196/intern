import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/widgetClass/column.dart';
import '../homeScreens/home_screen.dart';
import '../providers/password_field_provider.dart';
import 'create_screen.dart';
import 'forget_password.dart';


class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() {
    return _SignInState();
  }
}

class _SignInState extends ConsumerState<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Welcome Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "Log in to continue shopping and enjoy personalized offers",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email or Phone Number",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade700, fontSize: 15),
                          border: fieldBorder(),
                          enabledBorder: fieldBorder(),
                          focusedBorder: fieldBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          if (!value.contains("@")) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Consumer(builder: (context, ref, child) {
                        final obsecureProvider =
                        ref.watch(passwordVisibleProvider);
                        return TextFormField(
                          controller: _passwordController,
                          obscureText: obsecureProvider,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                            border: fieldBorder(),
                            enabledBorder: fieldBorder(),
                            focusedBorder: fieldBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                ref
                                    .read(passwordVisibleProvider.notifier)
                                    .state = !obsecureProvider;
                              },
                              icon: Icon(obsecureProvider
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            if (value.length < 6) {
                              return "Password too short";
                            }
                            return null;
                          },
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen()));
                          },
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    final loginState = ref.watch(logInProvider);
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: loginState.isLoading
                            ? null
                            : () {
                          if (_formKey.currentState!.validate()) {
                            // ref.read(logInProvider.notifier).logIn({
                            //   'email': _emailController.text,
                            //   'password': _passwordController.text,
                            // });
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                    (route) => false);

                          }
                          // if (loginState.response != null &&
                          //     loginState.response!.success) {
                          //   Navigator.of(context).pushAndRemoveUntil(
                          //       MaterialPageRoute(
                          //           builder: (context) => HomeScreen()),
                          //       (route) => false);
                          // }
                          // if (loginState.error != null) {
                          //   ScaffoldMessenger.of(context)
                          //       .hideCurrentMaterialBanner();
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text(loginState.error!)),
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: loginState.isLoading
                            ? CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity - 40,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        //function will be add later...
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: const Color.fromARGB(34, 245, 245, 245),
                                width: 0.05)),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      icon: Image.asset(
                        "assets/images/google.png",
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => CreateScreen()));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
