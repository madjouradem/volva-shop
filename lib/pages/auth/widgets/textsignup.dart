import 'package:flutter/material.dart';

import '../../../../core/constant/AppColor.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone, style: Theme.of(context).textTheme.displayMedium),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColor.primary,
                ),
          ),
        ),
      ],
    );
  }
}
