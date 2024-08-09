import 'package:flutter/material.dart';
import 'package:suitmediatest/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var inputNameControllers = TextEditingController();
  var inputPalindromControllers = TextEditingController();

  bool cekPalindrom(String text) {
    String cleanedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join();
    return cleanedText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/first_screen.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 45),
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              controller: inputNameControllers,
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: 'Palindrom',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              controller: inputPalindromControllers,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (cekPalindrom(inputPalindromControllers.text)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Is Palindrom'),
                          content: const Text(
                              'Kalimat tersebut merupakan kalimat palindrom!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Not Palindrom'),
                          content: const Text(
                              'Kalimat tersebut bukan kalimat palindrom!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 2, 62, 138),
                  ),
                ),
                child: const Text('CHECK'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SecondScreen(
                        name: inputNameControllers.text,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 2, 62, 138),
                  ),
                ),
                child: const Text('NEXT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
