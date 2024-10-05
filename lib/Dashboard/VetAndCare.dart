import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VeterinaryCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinary & Care'),
        backgroundColor: Colors.brown, // Themed with brown
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction Section
              Text(
                'Veterinary & Care Services',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We provide the best care for your pets. Our experienced vets offer a variety of services to ensure the health and well-being of your beloved animals.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 16),

              // Services Section
              Text(
                'Our Services:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 12),

              // List of Services
              ServiceItem(
                icon: Icons.local_hospital,
                title: 'General Check-up',
                description:
                    'Regular health check-ups for your pets to ensure they are healthy and happy.',
              ),
              ServiceItem(
                icon: Icons.vaccines,
                title: 'Vaccinations',
                description:
                    'Keep your pets safe from diseases with our comprehensive vaccination services.',
              ),
              ServiceItem(
                icon: Icons.pets,
                title: 'Dental Care',
                description:
                    'Oral health is important for pets too. We offer dental care services for your pets.',
              ),

              ServiceItem(
                icon: Icons.healing,
                title: 'Emergency Care',
                description:
                    'Our team is available for emergency situations, providing fast and reliable care when needed.',
              ),

              SizedBox(height: 16),

              // Placeholder for Future Content
              Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      'Image or Additional Content Here',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  ServiceItem(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.brown,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
