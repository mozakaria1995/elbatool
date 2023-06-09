import 'package:auth_manager/config/constant.dart';
import 'package:auth_manager/controllers/contact_us_controller.dart';
import 'package:auth_manager/models/contact_us_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              SizedBox(
                height: 30,
              ),
              Center(
                child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[100],
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"))),
                    )),
              ),
              Center(
                child: Text(
                  'El Batool Clinics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  thickness: 5,
                ),
              ),

            ]),
          ),
        ),
      ),
    );
  }

  Widget cardInfo(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).primaryColor),
              SizedBox(
                width: 18,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
