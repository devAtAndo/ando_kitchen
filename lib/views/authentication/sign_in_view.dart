import 'package:ando_kitchen_order/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(builder: (size) {
      return Column(
        children: [
          AndoButton(title: "Hello", onTap: () {}),
          AndoTextField(
            controller: TextEditingController(),
            fieldName: "Email Address",
          )
        ],
      );
    });
  }
}
