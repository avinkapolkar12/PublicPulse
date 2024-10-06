import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Import firebase_options.dart for Firebase config
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart'; // Import for file picking
import 'dart:io'; // For file handling
import 'package:firebase_storage/firebase_storage.dart'; // Firebase storage for file upload

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use platform-specific Firebase options
  );
  runApp(const PublicPulseApp());
}

class PublicPulseApp extends StatelessWidget {
  const PublicPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PublicPulse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        '/userTypeSelection': (context) => const UserTypeSelection(),
        '/citizenLogin': (context) => const CitizenLoginPage(),
        '/adminLogin': (context) => const AdminLoginPage(),
        '/citizenSignup': (context) => const CitizenSignupPage(),
        '/forgotPassword': (context) => const ForgotPasswordPage(),
        '/citizenHome': (context) => const CitizenHomePage(),
        '/adminHome': (context) => const AdminHomePage(),
        '/citizenOptions': (context) => const CitizenOptionsPage(),
        '/complaint': (context) => ComplaintPage(), // Complaint page route
        '/account':(context) => AccountSettingsPage(),
      },
    );
  }
}

// Splash Screen with App Name, Motto, and "Get Started" Button
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PublicPulse',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                  color: Colors.indigo
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Your Concerns, Our Commitment.',
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                  color: Colors.blue
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              width: 350.0,
              height: 350.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/logo.jpg'),  // Make sure this path is valid
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/userTypeSelection');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//logo
class BackgroundImageWrapper extends StatelessWidget {
  final Widget child; // The main content of each page will be passed here

  const BackgroundImageWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Opacity

          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust opacity as needed
              child: Image.asset(
                'assets/logo.jpg', // Path to your logo image
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          // Main content passed as a child
          child,
        ],
      ),
    );
  }
}


class UserTypeSelection extends StatelessWidget {
  const UserTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWrapper( // Use BackgroundImageWrapper here
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PublicPulse - User Type'),
          backgroundColor: Colors.blue.withOpacity(0.8), // Slight opacity for better readability
        ),
        backgroundColor: Colors.transparent, // Ensure the background is transparent
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'PublicPulse',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              const Text(
                'Your Concerns, Our Commitment',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adminLogin');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Admin',  style: TextStyle(color: Colors.white), ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/citizenOptions');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Citizen',  style: TextStyle(color: Colors.white), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Citizen Options Page
class CitizenOptionsPage extends StatelessWidget {
  const CitizenOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'PublicPulse',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const Text(
                  'Your Concerns, Our Commitment',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/citizenLogin');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Citizen Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/citizenSignup');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Citizen Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// Admin Login Page
class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back! Enter your credentials to login.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: 'Admin Username'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: 'Admin Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: 'Admin Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/adminHome');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// Citizen Login Page with Firebase Auth
class CitizenLoginPage extends StatefulWidget {
  const CitizenLoginPage({super.key});

  @override
  _CitizenLoginPageState createState() => _CitizenLoginPageState();
}

class _CitizenLoginPageState extends State<CitizenLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter both email and password'),
      ));
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/citizenHome');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back! Enter your credentials to login.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgotPassword');
                    },

                    child: const Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Add other pages and their respective functionality
class CitizenSignupPage extends StatefulWidget {
  const CitizenSignupPage({super.key});

  @override
  _CitizenSignupPageState createState() => _CitizenSignupPageState();
}

class _CitizenSignupPageState extends State<CitizenSignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signup() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill all the fields'),
      ));
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Passwords do not match'),
      ));
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Save user info to Firestore
      await _firestore.collection('citizens').doc(userCredential.user?.uid).set({
        'email': _emailController.text,
        'role': 'citizen',
      });

      Navigator.pushReplacementNamed(context, '/citizenHome');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create your account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//forgot password
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password reset email sent!'),
      ));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Enter your email to reset your password.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetPassword,style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                  child: const Text('Reset Password', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class CitizenHomePage extends StatelessWidget {
  const CitizenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Column(
            children: [
              // App Name Header
              Container(
                color: Colors.blue,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'PublicPulse',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16.0),
              // Search Box
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Complaints',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              // Filter Options
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterButton('Filter by Date'),
                    _buildFilterButton('Filter by Dept'),
                    _buildFilterButton('Filter by Status'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              // Complaint Overview
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: const [
                      // Example complaint overview items
                      ListTile(
                        title: Text('Complaint #1'),
                        subtitle: Text('Description of complaint #1'),
                      ),
                      ListTile(
                        title: Text('Complaint #2'),
                        subtitle: Text('Description of complaint #2'),
                      ),
                      // Add more complaint items here
                    ],
                  ),
                ),
              ),
              // Add Complaint Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Action for adding a complaint
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),

                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to ComplaintPage when the button is pressed
                      Navigator.pushNamed(context, '/complaint');
                    },
                    child: const Text('Add Complaint',  style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              // Icon Buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconButton(Icons.feedback, 'Feedback'),
                    _buildIconButton(Icons.group, 'Community'),
                    _buildIconButton(Icons.bar_chart, 'Progress'),
                    _buildIconButton(Icons.person, 'Account'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build filter buttons
  Widget _buildFilterButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Action for each filter button
        void navigateToSettings(BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountSettingsPage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  // Helper method to build icon buttons
  Widget _buildIconButton(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust this value to make the image lighter or darker
              child: Image.asset(
                'assets/logo.jpg', // Path to your image
                fit: BoxFit.scaleDown, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          Column(
            children: [
              // App Name Header
              Container(
                color: Colors.blue,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'PublicPulse',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16.0),
              // Admin Details
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin Name: John Doe',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Admin ID: 123456',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              // Overall Complaints Status
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Overall Complaints Status',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for viewing reports
                      },
                      child: const Text('View Reports'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              // Complaints Statistics
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Complaints: 123',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Resolved Complaints: 45',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              // Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomButton('Feedback'),
                    _buildBottomButton('Dashboard'),
                    _buildBottomButton('Community'),
                    _buildBottomButton('Progress'),
                    _buildBottomButton('Account'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build bottom buttons
  Widget _buildBottomButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Action for each button
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}



//Complaint Page

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final TextEditingController _complaintTitleController = TextEditingController();
  final TextEditingController _deptNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  bool _notifyMe = false;
  String? _uploadedFileURL;

  // Method to select the date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  // Method to pick a file and upload to Firebase Storage
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'mp4'], // Allowed file types
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      File fileToUpload = File(file.path!);

      // Check if file exists
      print('Picked file path: ${file.path}'); // Check if the file path is correct
      if (!await fileToUpload.exists()) {
        print('Error: File does not exist.');
        return;
      }

      // Show a loading indicator while uploading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Uploading file...')),
      );

      try {
        // Upload file to Firebase Storage
        String fileName = file.name;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref('complaint_files/$fileName')
            .putFile(fileToUpload);

        TaskSnapshot snapshot = await uploadTask;

        // Retrieve download URL
        String downloadURL = await snapshot.ref.getDownloadURL();
        print('File uploaded, download URL: $downloadURL');

        setState(() {
          _uploadedFileURL = downloadURL; // Store the download URL
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully!')),
        );
      } catch (e) {
        // Catch and print errors
        print('Upload error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload file: $e')),
        );
      }
    } else {
      print('File picker canceled.');
    }
  }

  // Method to submit the complaint to Firestore
  Future<void> _submitComplaint() async {
    final complaintId = FirebaseFirestore.instance.collection('complaints').doc().id;

    try {
      await FirebaseFirestore.instance.collection('complaints').doc(complaintId).set({
        'complaint_id': complaintId,
        'complaint_title': _complaintTitleController.text,
        'dept_name': _deptNameController.text,
        'date': _dateController.text,
        'address': _addressController.text,
        'pincode': _pincodeController.text,
        'details': _detailsController.text,
        'notify_me': _notifyMe,
        'file_url': _uploadedFileURL, // Save the uploaded file URL in Firestore
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Complaint Submitted Successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit complaint: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File a Complaint'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _complaintTitleController,
              decoration: const InputDecoration(
                labelText: 'Complaint Title',
                hintText: 'Enter complaint title',
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Department',
              ),
              items: <String>['PWD', 'Municipality', 'Panchayat']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _deptNameController.text = newValue!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Complaint Date',
                hintText: 'dd/mm/yy',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                hintText: 'Enter address',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _pincodeController,
              decoration: const InputDecoration(
                labelText: 'Pincode',
                hintText: 'Enter pincode',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(
                labelText: 'Complaint Details',
                hintText: 'Describe your complaint...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            TextButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.attachment),
              label: const Text('Upload files related to the complaint'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _notifyMe,
                  onChanged: (bool? value) {
                    setState(() {
                      _notifyMe = value!;
                    });
                  },
                ),
                const Text('Notify me of updates via email/SMS'),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _submitComplaint,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text('Submit Complaint'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Edit Profile Section
            Text(
              'Edit Profile Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16.0),

            // Address
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                labelText: '123 Main St, City, Country',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Phone Number
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: '+1234567890',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Email
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'user@example.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Name
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'John Doe',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 32.0),

            // About Public Pulse Section
            Text(
              'About Public Pulse',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Public Pulse is dedicated to providing a platform for citizens\' grievances to government departments. '
                  'Our mission is to empower citizens who want to make the government departments aware of the difficulties faced by them.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24.0),

            // Contact Information
            Text(
              'Contact Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            Text('For support, reach out to us via email or phone.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16.0),

            // Email Support and Call Support buttons
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      // Add email support action
                    },
                    icon: Icon(Icons.email, color: Colors.white),
                    label: Text('Email support'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.purple,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      // Add call support action
                    },
                    icon: Icon(Icons.phone, color: Colors.white),
                    label: Text('Call Support'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32.0),

            // General Settings Section
            Text(
              'General Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16.0),

            // General settings list tiles
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification Preferences'),
              onTap: () {
                // Navigate to notification preferences
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy Settings'),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language Selection'),
              onTap: () {
                // Navigate to language selection
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Account Security'),
              onTap: () {
                // Navigate to account security settings
              },
            ),
          ],
        ),
      ),
    );
  }
}

