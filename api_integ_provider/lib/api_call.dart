import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends ChangeNotifier{
  //Using list of type dynamic because jsonDecoder expect dynamic type of list
  List _posts = [];
  List get posts=>_posts;
  // Function to call API
  void apiCall() async{
    //Exception handliing
    try{
    print('Api calling');
    // Using Uri.parse to avoid length
    var jsonResponse = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")); 
    if(jsonResponse.statusCode==200){
    var decode = jsonDecode(jsonResponse.body);
    _posts = decode;
    }
    }
    catch(e){
      print('exception $e');
    }
    print('calling completed, ${_posts.length} Posts');
    // State changing trigger
    notifyListeners();
  }
}