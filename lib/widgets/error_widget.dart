import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final void Function() recall;
  final String message;
  const ErrorMessageWidget({Key? key, required this.recall, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => recall(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}