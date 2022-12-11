import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todos/controllers/url_controller.dart';

import '../utils/components/container_media_contact.dart';

class ContactMePage extends StatelessWidget {
  const ContactMePage({super.key});

  @override
  Widget build(BuildContext context) {
    UrlController controller = context.watch<UrlController>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 40),
          child: Text("Info Dev"),
        )),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Theme.of(context).primaryColor,
                width: 200,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/images/teste.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Daniel Cavalcanti\nFlutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Row(
              children: [
                ContainerMediaContact(
                    icon: 'assets/icons/github.svg',
                    text: 'dev-dancavalcanti',
                    onTap: () {
                      controller.lauchHttps('github.com', '/dev-dancavalcanti');
                    }),
                const Spacer(),
                ContainerMediaContact(
                    icon: 'assets/icons/instagram.svg',
                    text: '@danielwiins       ',
                    onTap: () {
                      controller.lauchHttps('instagram.com', '/danielwiins');
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ContainerMediaContact(
                    icon: 'assets/icons/linkedin.svg',
                    text: 'dev.dancavalcanti',
                    onTap: () {
                      controller.lauchHttps('linkedin.com',
                          'in/daniel-lucas-cavalcanti-b2b6ba252/');
                    }),
                const Spacer(),
                ContainerMediaContact(
                    icon: 'assets/icons/gmail.svg',
                    text: 'Daniel Cavalcanti',
                    onTap: () {
                      controller.lauchEmail();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
