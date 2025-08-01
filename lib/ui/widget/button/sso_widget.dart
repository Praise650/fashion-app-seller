import 'package:flutter/material.dart';

import '../../../app/res/images.dart';

class SsoWidget extends StatelessWidget {
  const SsoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Or log in with',
          style: TextStyle(
            color: Color(0xFF212121),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(12)), // Google login
              child: Image.asset(Images.googleLogo, width: 24),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(
                  12,
                ),
              ), // Apple login
              child: Image.asset(
                Images.appleLogo,
                width: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
