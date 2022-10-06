import 'package:company_directory/models/company.dart';
import 'package:flutter/material.dart';

import 'package:company_directory/utils/colors.dart' as app_colors;

class CompanyCard extends StatelessWidget {
  final Company company;
  final VoidCallback onTap;

  const CompanyCard(
      {super.key,
      required this.company,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Column(children: <Widget>[
          Container(
              decoration: const BoxDecoration(color: app_colors.primary),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                title: Text(company.name,
                    style: const TextStyle(
                        color: app_colors.text, fontWeight: FontWeight.bold)),
                subtitle: Row(children: <Widget>[
                  const Icon(Icons.linear_scale, color: app_colors.secondary),
                  const SizedBox(width: 2.0),
                  Text(company.type.toString(),
                      style: const TextStyle(color: app_colors.white))
                ]),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: app_colors.white,
                ),
                leading: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(width: 1.0, color: app_colors.white))),
                  child:
                      const Icon(Icons.corporate_fare, color: app_colors.white),
                ),
                onTap: onTap,
              )),
        ]));
  }
}
