import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectionData extends StatelessWidget {
  final String content;
  final String image;
  final int mail1Phone2Link3Sms4;
  const ConnectionData(
      {Key? key,
      required this.content,
      required this.image,
      required this.mail1Phone2Link3Sms4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                //#8D8F90
                title: Text(
                  content,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.blue.shade300),
                ),
                leading: Image.asset(
                  image,
                  height: 25,
                  width: 25,
                ),
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 15,
                onTap: () async {
                  if (mail1Phone2Link3Sms4 == 1) {
                    await launchUrl(Uri.parse("mailto:$content"));
                  } else if (mail1Phone2Link3Sms4 == 2) {
                    await launchUrl(Uri.parse("tel:$content"));
                  } else if (mail1Phone2Link3Sms4 == 3) {
                    await launchUrl(Uri.parse("https:$content"));
                  } else if (mail1Phone2Link3Sms4 == 4) {
                    await launchUrl(Uri.parse("sms:$content"));
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
