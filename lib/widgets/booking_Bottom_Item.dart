import 'package:flutter/material.dart';
class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _BottomItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: Colors.black87),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 17),
          ],
        ),
      ),
    );
  }
}
