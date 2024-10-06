import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _petFarmNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();

  bool _isSubmitting = false;
  bool _isSubmitted = false;

  void _submitApplication() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true; // Start submitting
      });

      try {
        // Create a new document in Firestore
        await FirebaseFirestore.instance.collection('localHosts').add({
          'petFarmName': _petFarmNameController.text,
          'location': _locationController.text,
          'categories': _categoriesController.text,
          'submittedAt': FieldValue.serverTimestamp(),
          'status': 'Pending', // Initial status set to Pending
        });

        setState(() {
          _isSubmitting = false; // Stop submitting
          _isSubmitted = true; // Mark as submitted
        });

        // Show success pop-up
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Submitted Successfully'),
              content: Text('Your application has been submitted.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetForm(); // Reset form and status
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        setState(() {
          _isSubmitting = false; // Stop submitting on error
        });

        // Show error pop-up
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content:
                  Text('Failed to submit your application. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _resetForm() {
    _petFarmNameController.clear();
    _locationController.clear();
    _categoriesController.clear();
    setState(() {
      _isSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Become a Local Host'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _petFarmNameController,
                decoration: InputDecoration(labelText: 'Pet Farm Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your pet farm name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoriesController,
                decoration:
                    InputDecoration(labelText: 'Categories (e.g., Dogs, Cats)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter categories';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (_isSubmitted)
                Text(
                  'Status: Pending',
                  style: TextStyle(fontSize: 18, color: Colors.orange),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitApplication,
                child: Text(_isSubmitting ? 'Submitting...' : 'Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
