import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const LogoutConfirmationDialog({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Log Out',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Are you sure you want to log out?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        OutlinedButton(
          onPressed: onCancel,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.cancel, color: Colors.black),
              SizedBox(width: 8), // Spacing between icon and text
              Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(); // Close the dialog
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout, color: Colors.black),
              SizedBox(width: 8), // Spacing between icon and text
              Text(
                'Log Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
