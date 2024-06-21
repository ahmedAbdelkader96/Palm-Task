import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: IconButton.styleFrom(shape: const CircleBorder()),
      constraints: const BoxConstraints(
          maxWidth: 45, minWidth: 45, maxHeight: 45, minHeight: 45),
      icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
    );
  }
}
