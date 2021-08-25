import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.6,
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff14274E),
            backgroundColor: Color(0xff9BA4B4),
          ),
        ),
      );
  }
}