import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HalamanEditProfil extends StatelessWidget {
  const HalamanEditProfil({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);

    UserModel user = authProvider.user;

    Widget profileInfo(String label, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      );
    }

    Widget konten() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            ClipOval(
              child: Icon(
                Icons.person,
                size: 120,
              ),
            ),
            SizedBox(height: 20),
            profileInfo('Nama', user.name!),
            profileInfo('Username', '@${user.username}'),
            profileInfo('Alamat Email', user.email!),
            SizedBox(height: 30),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 226, 226),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            color: Color.fromARGB(255, 233, 220, 220),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              OverlayEntry overlayEntry = OverlayEntry(
                builder: (context) => Positioned(
                  top: 30,
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Edit Profil Masih Dalam Pengembangan',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
              Overlay.of(context).insert(overlayEntry);
              Future.delayed(Duration(seconds: 3))
                  .then((_) => overlayEntry.remove());
            },
          )
        ],
      ),
      body: konten(),
      resizeToAvoidBottomInset: false,
    );
  }
}
