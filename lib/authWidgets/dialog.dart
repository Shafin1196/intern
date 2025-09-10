import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_screen/sign_in.dart';

class ConfirmDialog extends ConsumerWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: SizedBox(
        height: 300,
        width: 400,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 70,
              ),
              Text(
                "Reset Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "You can now use your new password to login to your account.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 400-140,
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=> SignIn()
                      ), (route)=>false);
                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
