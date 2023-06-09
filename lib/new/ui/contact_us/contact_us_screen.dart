import 'package:auth_manager/config/constant.dart';
import 'package:auth_manager/new/model/contactus_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/base_state.dart';
import '../_profile/profile_screen.dart';
import '../branches/branch_screen.dart';
import 'contact_us_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends BaseState <ContactUsScreen, ContactUsBloc> {

  @override
  void initState() {
    super.initState();
    bloc.getContacts();
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
              const SizedBox(
                width: 18,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              const SizedBox(
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
                          image: const DecorationImage(
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
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Divider(
                  thickness: 5,
                ),
              ),

              FutureBuilder<ContactModel?>(
                future: bloc.contactUsController.stream.asBroadcastStream().first,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data!.data!.email);
                    return Column(
                      children: [
                        snapshot.data!.data!.email != null
                            ? cardInfo(
                            context,
                            Icons.email,
                            snapshot.data!.data!.email!,
                                () async {
                              String? encodeQueryParameters(
                                  Map<String, String> params) {
                                return params.entries
                                    .map((e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&');
                              }

                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: snapshot.data!.data!.email,
                                query: encodeQueryParameters(<String, String>{
                                  'subject': 'Mobile APP Contact us'
                                }),
                              );

                              await launchUrl(emailLaunchUri);
                            })
                            : Container(),
                        snapshot.data!.data!.phone != null
                            ? cardInfo(
                            context,
                            Icons.phone,
                            snapshot.data!.data!.phone!,
                                () async {
                              final Uri launchUri = Uri(
                                scheme: 'tel',
                                path: "+2${snapshot.data!.data!.phone}",
                              );
                              await launchUrl(launchUri);
                            })
                            : Container(),
                        snapshot.data!.data!.address != null
                            ? cardInfo(
                            context,
                            Icons.share_location,
                            snapshot.data!.data!.address!,
                                () async {
                              Uri uri = Uri(
                                scheme: "https",
                                host: snapshot.data!.data!.googleMapLocationUrl,
                              );
                              await launchUrl(uri);
                            })
                            : Container(),

                        snapshot.data!.data!.address != null
                            ? cardInfo(
                            context,
                            Icons.share_location,
                            snapshot.data!.data!.address!,
                                () async {
                              Uri uri = Uri(
                                scheme: "https",
                                host: snapshot.data!.data!.googleMapLocationUrl,
                              );
                              await launchUrl(uri);
                            })
                            : Container(),
                        snapshot.data!.data!.facebook != null
                            ? cardInfo(
                            context,
                            Icons.facebook_outlined,
                            "Facebook",
                                () async {
                                  openFacebook();
                            })
                            : Container(),
                        snapshot.data!.data!.whatsapp != null
                            ? cardInfo(
                            context,
                            FontAwesomeIcons.whatsapp,
                            "Whatsapp",
                                () async {
                              Uri uri = Uri(
                                scheme: "https",
                                host: "wa.me",
                                path: "${snapshot.data!.data!.whatsapp}",
                              );

                              await launchUrl(uri);
                            })
                            : Container(),

                        cardInfo(
                            context,
                            FontAwesomeIcons.mapPin,
                            "العناوين و الفروع",
                                ()=>
                            navigateTo(BranchesScreen())
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Center();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )

            ]),
          ),
        ),
      ),
    );
  }

  @override
  void initBloc() {
    bloc = ContactUsBloc(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.onDispose();
    super.dispose();
  }
}
