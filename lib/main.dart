import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesListApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 31, 31, 31),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 31, 31),

          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        dividerColor: Colors.white10,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
      ),
      routes: {
        '/': (context) => CryptoListScreen(),
        '/coin': (context) => CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CryptoCurrenciesListApp")),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/bitcoin_logo.svg',
              width: 30,
              height: 30,
            ),
            title: Text(
              coinName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              '200000\$',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.of(context).pushNamed('/coin', arguments: coinName),
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'you must provide String args');

    coinName = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(coinName ?? '...')));
  }
}
