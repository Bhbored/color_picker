import 'package:flutter/material.dart';
import 'package:color_picker/screens/about_us.dart';
import 'package:color_picker/screens/faq.dart';
import 'package:color_picker/screens/support.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerFb1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFFFFC0CB), // Light Pink background
        child: ListView(
          children: <Widget>[
            // Profile or Logo Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/logo.jpeg'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'RainbowRush',
                    style: GoogleFonts.nunito(
                      color: Colors.white, // White text for contrast
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.white70,
                  ), // Light divider for separation
                ],
              ),
            ),
            // Menu Items
            MenuItem(
              text: 'About Us',
              icon: Icons.info_outline,
              onClicked: () => selectedItem(context, 0),
            ),
            MenuItem(
              text: 'FAQ',
              icon: Icons.help_outline,
              onClicked: () => selectedItem(context, 1),
            ),
            MenuItem(
              text: 'Support',
              icon: Icons.support_agent,
              onClicked: () => selectedItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    Widget page;
    switch (index) {
      case 0:
        page = AboutUsPage();
        break;
      case 1:
        page = FAQPage();
        break;
      case 2:
        page = SupportPage();
        break;
      default:
        return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white), // White icons
      title: Text(text, style: TextStyle(color: Colors.white)), // White text
      hoverColor: Colors.white70, // Light hover effect
      onTap: onClicked,
    );
  }
}
