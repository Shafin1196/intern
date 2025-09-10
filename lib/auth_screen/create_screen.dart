import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/auth_screen/sign_in.dart';

import '../providers/password_field_provider.dart';
import '../widgetClass/column.dart';



Widget text(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  );
}

Widget textFormField({
  required TextEditingController controller,
  required String hintText,
  required String? Function(String?) validator,
  bool isPassword = false,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 15),
      border: fieldBorder(),
      enabledBorder: fieldBorder(),
      focusedBorder: fieldBorder(),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    ),
    validator: validator,
  );
}

class CreateScreen extends ConsumerStatefulWidget {
  const CreateScreen({super.key});

  @override
  ConsumerState<CreateScreen> createState() {
    return _CreateState();
  }
}

class _CreateState extends ConsumerState<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isChecked = false;
  bool isUser = true;
  final Color greenColor = Colors.green.shade700;
  final Color whiteColor = Colors.white;
  bool _isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
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
                      "Create Your Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "Join us to explore top Canadian-made products, exclusive deals, and great rewards",
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Select your role",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isUser = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: isUser ? greenColor : whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(
                                color: greenColor,
                                width: 1,
                              )),
                          child: Text(
                            "User",
                            style: TextStyle(
                                color: isUser ? whiteColor : Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isUser = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: isUser ? whiteColor : greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(
                                color: greenColor,
                                width: 1,
                              )),
                          child: Text(
                            "Rider",
                            style: TextStyle(
                                color: isUser ? Colors.black : whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("Full Name"),
                      const SizedBox(
                        height: 8,
                      ),
                      textFormField(
                          controller: _fullNameController,
                          hintText: "Enter your full name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                          isPassword: false),
                      const SizedBox(
                        height: 15,
                      ),
                      text("Email"),
                      const SizedBox(
                        height: 8,
                      ),
                      textFormField(
                          controller: _emailController,
                          hintText: "Enter your email address",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            }
                            if (!value.contains("@")) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          isPassword: false),
                      const SizedBox(
                        height: 15,
                      ),
                      text("Phone"),
                      const SizedBox(
                        height: 8,
                      ),
                      textFormField(
                        controller: _phoneController,
                        hintText: "Enter your phone number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
                          }
                          if (value.length < 10) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                        isPassword: false,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 12,
                            child: Transform.scale(
                              scale:
                              1.2, // Increase for zoom, decrease for shrink
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/flag2.png',
                                  fit: BoxFit.fitHeight,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      text("Password"),
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
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      text("Confirm Password"),
                      const SizedBox(
                        height: 8,
                      ),
                      Consumer(builder: (context, ref, child) {
                        final obsecureProvider =
                        ref.watch(newPasswordVisibleProvider);
                        return TextFormField(
                          controller: _confirmPassController,
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
                                    .read(newPasswordVisibleProvider.notifier)
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(
                                      color: Colors.grey.shade700, fontSize: 15),
                                ),
                                TextSpan(
                                  text: 'Terms and Conditions ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: TextStyle(
                                      color: Colors.grey.shade700, fontSize: 15),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity - 40,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                        if (_formKey.currentState!.validate() && _isChecked) {

                          // setState(() {
                          //   _isLoading = true;
                          // });

                          // final registerRes = await ref.read(
                          //   registerProvider({
                          //     'name': _fullNameController.text,
                          //     'role': isUser ? 'user' : 'rider',
                          //     'contact': _phoneController.text,
                          //     'countryCode': '+1',
                          //     'email': _emailController.text,
                          //     'password': _passwordController.text
                          //   }).future,
                          // );
                          // setState(() {
                          //   _isLoading = false;
                          // });
                          // if(registerRes.success){
                          //   ScaffoldMessenger.of(context).clearSnackBars();
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text(registerRes.message))
                          //   );
                          // Navigator.of(context).pushAndRemoveUntil(
                          //   MaterialPageRoute(
                          //     builder: (context) => SignIn(),
                          //   ),
                          //   (route) => false,
                          // );
                          // }
                          // else{
                          //   ScaffoldMessenger.of(context).clearSnackBars();
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text(registerRes.message))
                          //   );
                          // }
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                                (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700),
                      child: _isLoading
                          ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.green.shade700,
                        ),
                      )
                          : Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text(
                          "Sign In",
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
