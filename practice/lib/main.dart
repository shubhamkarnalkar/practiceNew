import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:practice/api.page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => const UnknownRoutePage()), //like 404 page in web
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage(title: 'API Page',)),
        GetPage(name: '/api', page: () => const ApiPage()),
        // GetPage(
        //   name: '/third',
        //   page: () => Third(),
        //   transition: Transition.zoom  
        // ),
      ],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final emailContr = TextEditingController();
  final eassContr = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validate(){
    if(formKey.currentState!.validate()){
      // print('Ok');
    }
    else{
      // print('Error');
    }
  }
  void _incrementCounter() {
    setState(() {
      
      _counter++;
     
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(onPressed: () 
            {
              Get.to(const ApiPage());
            },
             child: const Text('Navigate to API page'),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        )
                      ),
                      // controller: controllerEmail,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Email is a required field'),
                        EmailValidator(errorText: 'errorText')
                      ])
                    ),
                  ),
                  TextButton(onPressed: validate, child: const Text('Login'),)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class UnknownRoutePage extends StatefulWidget {
  const UnknownRoutePage({super.key});

  @override
  State<UnknownRoutePage> createState() => _UnknownRoutePageState();
}

class _UnknownRoutePageState extends State<UnknownRoutePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Page not found')),
    );
  }
}
