import 'theme.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffFF581A), Color(0xffB93200)],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    width: width / 2.8951,
                    height: width / 2.8951,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'PENDATAAN',
                    style: whiteTextStyle.copyWith(
                      fontSize: width / 14.785714286,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'G E M P A',
                    style: whiteTextStyle.copyWith(
                      fontSize: width / 18.8181,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
