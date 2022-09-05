import 'package:flutter/material.dart';

class ErrorIconText extends StatelessWidget {
  const ErrorIconText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.refresh_outlined, size: 40.0),
          SizedBox(height: 10.0),
          Text(
            "ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല.\nവീണ്ടും ശ്രമിക്കുക.",
            style: TextStyle(fontFamily: 'Baloo Chettan 2'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
