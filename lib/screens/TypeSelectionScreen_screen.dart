import 'package:flutter/material.dart';
import 'TypeSelectionLoginScreen.dart'; // استيراد شاشة تسجيل الدخول للمؤسسات
import 'InvestorLoginScreen.dart'; // استيراد شاشة تسجيل الدخول للمستثمرين

class TypeSelectionScreen extends StatelessWidget {
  const TypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 117, 51, 232),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // صورة اللوجو
            Image.asset(
              'assets/images/logo1.png',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // الشعار COMMVEST
            const Text(
              'ComVest',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10),
            // النص تحت الشعار
            const Text(
              'COMMUNICATION + INVESTISSEMENT',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Bienvenue sur l'application ComVest",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Tous vos besoins en matière de services sont ici",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildServiceCard(
                        title: 'Entreprise',
                        subtitle: 'Si vous cherchez un entreprise. inscrivez-vous ici',
                        icon: Icons.business,
                        onTap: () {
                          print('clique sur entreprise');
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const TypeSelectionLoginScreen()),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildServiceCard(
                        title: 'Investisseur',
                        subtitle: 'Si vous souhaitez investir dans un projet. cliquez ici',
                        icon: Icons.trending_up,
                        onTap: () {
                          print('clique sur investisseur');
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const InvestorLoginScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 117, 51, 232).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 117, 51, 232),
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromARGB(255, 117, 51, 232),
          size: 20,
        ),
        onTap: onTap,
      ),
    );
  }
}