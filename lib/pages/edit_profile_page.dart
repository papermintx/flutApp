import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/providers/auth_provider.dart';
import 'package:my_market/theme.dart';
import 'package:provider/provider.dart';

class HalamanEditProfil extends StatelessWidget {
  const HalamanEditProfil({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

    Widget inputNama() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: TextEditingController(text: user.name),
              style: GoogleFonts.poppins(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '${user.name}',
              ),
            ),
          ],
        ),
      );
    }

    Widget inputUsername() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: GoogleFonts.poppins(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: TextEditingController(text: '@${user.username}'),
              style: GoogleFonts.poppins(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '@${user.username}',
              ),
            ),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: TextEditingController(text: user.email),
              style: GoogleFonts.poppins(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '${user.email}',
              ),
            ),
          ],
        ),
      );
    }

    Widget konten() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: ClipOval(
                child: SvgPicture.network(
                  user.profilePhotoUrl!,
                  placeholderBuilder: (BuildContext context) =>
                      const CircularProgressIndicator(),
                ),
              ),
            ),
            inputNama(),
            inputUsername(),
            inputEmail(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 226, 226),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profil',
          style: TextStyle(
            color: const Color.fromARGB(255, 233, 220, 220),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              SnackBar snackBar = SnackBar(
                content: Text('Edit Profil Masih Dalam Pengembangan'),
                backgroundColor: secondaryColor,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: konten(),
      resizeToAvoidBottomInset: false,
    );
  }
}
