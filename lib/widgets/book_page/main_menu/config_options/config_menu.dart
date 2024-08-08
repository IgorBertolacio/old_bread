import 'package:flutter/material.dart';
import '../../../../services/authentication_services.dart';

class ConfMenu extends StatelessWidget {
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;

  const ConfMenu(
      {super.key, required this.switchValue, required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                switchValue
                    ? const Text('PPM')
                    : const Text('PPM',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Switch(
                    value: switchValue,
                    onChanged: onSwitchChanged,
                  ),
                ),
                switchValue
                    ? const Text('CPM',
                        style: TextStyle(fontWeight: FontWeight.w900))
                    : const Text(
                        'CPM',
                      ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AuthServices().Logon();
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
