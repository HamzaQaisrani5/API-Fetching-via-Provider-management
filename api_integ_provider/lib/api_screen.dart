import 'package:api_integ_provider/api_call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('API FETCH'),
      ),
      //using If to show CircularProgressIndicator
      body: Center(
        child: Provider.of<ApiCall>(context,listen: true).posts.isEmpty?
          const CircularProgressIndicator(
            value: 1,
            color: Colors.grey,
            )
            //Listening Apicall
            : Consumer<ApiCall>(
              builder: (context,apicall,child)=>
              ListView.builder(
                padding:const EdgeInsets.symmetric(
                  // vertical: 4,
                  horizontal: 5
                ),
                itemCount: apicall.posts.length,
                itemBuilder: (context, index){
                var post = apicall.posts[index];
                //Using null safety to prevent error
                var title = post['title']??"N/A";
                var body = post['body']??'N/A';
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundColor: Colors.blueGrey.shade600,
                      child: Text('${index+1}'),
                    ),
                    title: Text(title),
                    subtitle: Text(body),
                  ),
                );
                
              })),
          ),
        );
      
  }
}

