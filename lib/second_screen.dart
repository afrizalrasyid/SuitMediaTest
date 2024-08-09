import 'package:flutter/material.dart';
import 'package:suitmediatest/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Second Screen',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Text('Welcome'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                selectedUserName ?? 'Selected User Name',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ThirdScreen()),
                  );
                  setState(() {
                    selectedUserName = result;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 2, 62, 138),
                ),
                child: const Text('Choose a User'),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
