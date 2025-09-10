import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../authWidgets/dialog.dart';
import '../providers/password_field_provider.dart';
import '../widgetClass/column.dart';


class ResetPassword extends ConsumerStatefulWidget {
  final authorization;
  const ResetPassword({super.key, required this.authorization});

  @override
  ConsumerState<ResetPassword> createState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends ConsumerState<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _newPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
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
                      "Reset Password",
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
                        "Please set a new password to secure your account and region access",
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
                            hintText: "Create a Password",
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
                      Text(
                        "Confirm New Password",
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
                        ref.watch(newPasswordVisibleProvider);
                        return TextFormField(
                          controller: _newPasswordController,
                          obscureText: obsecureProvider,
                          decoration: InputDecoration(
                            hintText: "Re-enter your new Password",
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
                            if (value != _passwordController.text) {
                              return "Password Does't matched";
                            }
                            return null;
                          },
                        );
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity - 40,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                        if (_formKey.currentState!.validate()) {
                          // setState(() {
                          //   _isLoading = true;
                          // });
                          // final resetProvider = await ref.read(
                          //     changePasswordProvider({
                          //   "password": _passwordController.text,
                          //   "Authorization": widget.authorization
                          // }).future);
                          // setState(() {
                          //   _isLoading = false;
                          // });
                          // if (resetProvider.success) {
                          //   showDialog(context: context, builder: (context)=>ConfirmDialog());
                          // } else {
                          //   ScaffoldMessenger.of(context)
                          //       .hideCurrentMaterialBanner();
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(SnackBar(
                          //     content: Text(resetProvider.message),
                          //     duration: Duration(seconds: 3),
                          //   ));
                          // }
                          showDialog(context: context, builder: (context)=>ConfirmDialog());
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
                        "Save Changes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
