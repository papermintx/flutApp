import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 226, 226),
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding:const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                    child: Icon(
                      Icons.person,
                      size: 54,
                    ),
                  ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, ${user.name}',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '@${user.username}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/sign-in', (route) => false);
                      },
                      child: Image.asset(
                        'assets/button_exit.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          color: const Color.fromARGB(255, 231, 226, 226),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Akun',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: const MenuItem(label: 'Edit Profil'),
              ),
              const MenuItem(label: 'Pesanan Anda'),
              const MenuItem(label: 'Bantuan'),
              const SizedBox(height: 30),
              Text(
                'Umum',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const MenuItem(
                label: 'Kebijakan Privasi',
              ),
              const MenuItem(
                label: 'Syarat dan Ketentuan',
              ),
              const MenuItem(
                label: 'Beri Rating Aplikasi',
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Hanya menu edit profil yang berfungsi dan masih dalam pengembangan!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color(0xff999999),
              fontSize: 13,
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
