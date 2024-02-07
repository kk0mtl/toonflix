import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/screens/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webstoons = [];
  bool isLoading = true;

  // 데이터 fetch
  void waitForWebtoons() async {
    webstoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    print(webstoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Today\'s Toon',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent[700],
        elevation: 3,
      ),
    );
  }
}
