import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/personalInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalContactWidget extends StatelessWidget {
  final PersonalInfo personalInfo;
  const PersonalContactWidget(this.personalInfo, {Key key}) : super(key: key);

  Future<bool> launchMailto(String emailAddress) async {
    final mailtoLink = Mailto(
      to: [emailAddress],
    );
    return await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      alignment: Alignment.topCenter,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Contact Info",
                style: getTextStyle(TextTypes.cardTitle),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.lime[900],
                border: Border.all(width: 2.5),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          "Email Address",
                          style: getTextStyle(TextTypes.text),
                        ),
                      ),
                      InkWell(
                        child: Text(
                          personalInfo.email,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => {launchMailto(personalInfo.email)},
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
