import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider(),
              child: Consumer<HomePageProvider>(
                  builder: (context, provider, child) {
                return Column(
                  children: [
                    Text(
                      provider.eligibleMessage.toString(),
                      style: TextStyle(
                          color: (provider.isEligible == true)
                              ? Colors.green
                              : Colors.red),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Enter your age'),
                      onChanged: (val) {
                        provider.checkEligiblity(int.parse(val));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      provider.validationMessage.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(hintText: 'Enter your email'),
                      onChanged: (val) {
                        provider.checkVolidation((val));
                      },
                    )
                  ],
                );
              }))),
    );
  }
}
