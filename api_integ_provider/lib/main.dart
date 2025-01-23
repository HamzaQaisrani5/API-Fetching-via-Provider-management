import 'package:api_integ_provider/api_call.dart';
import 'package:api_integ_provider/api_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void main() {
  //Parent context of registered listners of Provider
  runApp(ChangeNotifierProvider<ApiCall>(
    create: (context) => ApiCall(),
    child: const GlobalClass(),
  ));
}

class GlobalClass extends StatefulWidget {
  const GlobalClass({super.key});

  @override
  State<GlobalClass> createState() => _GlobalClassState();
}

class _GlobalClassState extends State<GlobalClass> {
  @override
  void initState() {
    //using addPostframe.. to avoid UI rendering error
    SchedulerBinding.instance.addPostFrameCallback(
    (_) => Provider.of<ApiCall>(context, listen: false).apiCall());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 165, 176, 198),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 131, 149, 184),
              centerTitle: true),
          listTileTheme: const ListTileThemeData(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(95, 6, 6, 6)),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              tileColor: Color.fromARGB(255, 169, 187, 214))),
      //Calling ApiScreen class
      home: const ApiScreen(),
    );
  }
}
