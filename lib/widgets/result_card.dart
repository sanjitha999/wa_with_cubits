// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repository/result_repository.dart';


Widget resultCard(ResultRepository result) {
  List pageTitles = result.pageTitles;
  List pageLinks = result.pageLinks;
  return SingleChildScrollView(
    child: Card(
      elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: SizedBox(
        height: 550,
        width: double.infinity,
        child: ListView.builder(
          itemCount: pageTitles.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  style: ListTileStyle.list,
                  onTap: () async {
                    var url = pageLinks[index];
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: true, forceWebView: true);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  hoverColor: Colors.amber[300],
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(pageTitles[index]),
                  subtitle: Text(pageLinks[index]),
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                const Divider(color: Colors.black26, endIndent: 10, indent: 10),
              ],
            );
          },
        ),
      ),
    ),
  );
}
