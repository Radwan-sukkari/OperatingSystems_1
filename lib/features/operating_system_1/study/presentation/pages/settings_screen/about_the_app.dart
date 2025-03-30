import 'package:flutter/material.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTheApp extends StatelessWidget {
  static const String name = 'about_the_app';
  static const String path = '/about_the_app';

  const AboutTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: ColumnAnimations(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                duration: 400,
                curve: Curves.easeIn,
                columnContent: [
                  Transform.rotate(
                    angle: 4.5 * (3.1415926535 / 180),
                    child: Image.asset(
                      Images.logo,
                      height: height(380),
                    ),
                  ),
                  SizedBox(
                    height: height(40),
                  ),
                  Text(
                    "مبرمج ومصمم التطبيق الطالب رضوان سكري من جامعة حلب دفعة 24",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: height(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://www.facebook.com/share/1BKZaudy4J/"));
                        },
                        child: Transform.flip(
                          flipX: true,
                          child: Icon(
                            PhosphorIcons.facebookLogo(),
                            color: Theme.of(context).primaryColor,
                            size: 45,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(20),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://www.instagram.com/radwan_sukkari?igsh=MWZ2M2VtajBwdzFkbw=="));
                        },
                        child: Icon(
                          PhosphorIcons.instagramLogo(),
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                      ),
                      SizedBox(
                        width: width(20),
                      ),
                      GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse("https://wa.me/+963946662215"));
                          },
                          child: Transform.flip(
                            flipX: true,
                            child: Icon(
                              PhosphorIcons.whatsappLogo(),
                              color: Theme.of(context).primaryColor,
                              size: 45,
                            ),
                          )),
                      SizedBox(
                        width: width(20),
                      ),
                      GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "tg://resolve?domain=Radwan_Sukkari"));
                          },
                          child: Transform.flip(
                            flipX: true,
                            child: Icon(
                              PhosphorIcons.telegramLogo(),
                              color: Theme.of(context).primaryColor,
                              size: 45,
                            ),
                          )),
                      SizedBox(
                        width: width(20),
                      ),
                      GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "https://www.linkedin.com/in/radwan-sukkari-5b134928b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app"));
                          },
                          child: Transform.flip(
                            flipX: true,
                            child: Icon(
                              PhosphorIcons.linkedinLogo(),
                              color: Theme.of(context).primaryColor,
                              size: 45,
                            ),
                          )),
                    ],
                  )
                ],
                verticalOffset: 0,
                horizontalOffset: 200)));
  }
}
