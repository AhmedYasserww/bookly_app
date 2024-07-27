import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void>launchCustomUr(context,String? Url )async{
  if (Url !=null) {
    Uri url =Uri.parse(Url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("cannot launch $Url",style: TextStyle(fontSize: 16),))
      );
    }
  }
  print("ahmed");
}
