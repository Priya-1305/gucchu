import 'package:flutter/material.dart';

class CarePage extends StatelessWidget {
  const CarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            // Dogs Category
            CategoryTile(
              category: 'Dogs',
              info: {
                'Familiar Condition':
                    'Dogs often suffer from conditions like arthritis, skin allergies, and hip dysplasia.',
                'Common Vaccination':
                    'Rabies, Parvovirus, and Distemper are crucial vaccines for dogs.',
                'Food':
                    'Dogs require a balanced diet with protein-rich foods and vitamins.',
                'Medicine':
                    'Common medications include flea treatments, dewormers, and pain relievers.'
              },
            ),
            SizedBox(height: 12),

            // Cats Category
            CategoryTile(
              category: 'Cats',
              info: {
                'Familiar Condition':
                    'Cats may face kidney disease, diabetes, and hyperthyroidism.',
                'Common Vaccination':
                    'Core vaccines include Rabies, Feline Distemper, and Feline Leukemia.',
                'Food':
                    'Cats are obligate carnivores and need high-protein food with taurine.',
                'Medicine':
                    'Flea control, heartworm prevention, and antibiotics are common treatments.'
              },
            ),
            SizedBox(height: 12),

            // Birds Category
            CategoryTile(
              category: 'Birds',
              info: {
                'Familiar Condition':
                    'Birds often suffer from respiratory issues, feather plucking, and mites.',
                'Common Vaccination':
                    'Vaccines are less common but can include Avian Pox and Polyomavirus.',
                'Food':
                    'Birds thrive on seeds, fruits, and specialized bird food.',
                'Medicine':
                    'Antibiotics, antifungals, and anti-parasitic meds are common.'
              },
            ),
            SizedBox(height: 12),

            // Fish Category
            CategoryTile(
              category: 'Fish',
              info: {
                'Familiar Condition':
                    'Common issues include ich (white spot disease), fin rot, and fungal infections.',
                'Common Vaccination':
                    'Vaccinations are uncommon for fish but proper water care is essential.',
                'Food':
                    'Fish require a varied diet of fish flakes, pellets, and live/frozen food.',
                'Medicine':
                    'Water treatments, antifungal, and antiparasitic solutions are used for fish health.'
              },
            ),
            SizedBox(height: 12),

            // Rabbit Category
            CategoryTile(
              category: 'Rabbit',
              info: {
                'Familiar Condition':
                    'Rabbits may suffer from dental disease, snuffles, and GI stasis.',
                'Common Vaccination':
                    'Vaccines against Myxomatosis and Rabbit Hemorrhagic Disease (RHD) are essential.',
                'Food':
                    'A rabbit’s diet should consist of hay, fresh veggies, and pellets.',
                'Medicine':
                    'Deworming, antibiotics for infections, and pain management for dental issues are common.'
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;
  final Map<String, String> info;

  const CategoryTile({super.key, required this.category, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown.withOpacity(0.2), // Light brown background
      ),
      child: ExpansionTile(
        title: Text(
          category,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown, // Text color
          ),
        ),
        children: info.keys.map((key) {
          return ButtonRow(
            label: key,
            info: info[key]!,
          );
        }).toList(),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  final String label;
  final String info;

  const ButtonRow({super.key, required this.label, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.brown, // Text color
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showInfoDialog(context, label, info);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown, // Button color
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text(
              'Learn More',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
