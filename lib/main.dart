import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stateflutter/counter_cubit.dart';
import 'package:stateflutter/result_page.dart';

void main(){
  runApp(
      MaterialApp(
      title: 'State Flutter',
        theme: ThemeData.light(),
        home: BlocProvider(
          create: (context) => CounterCubit(),
          child: const MyApp(),
        ),
  ),

  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late CounterCubit cubit;


  final myController = TextEditingController();

  @override
  void didChangeDependencies(){
    cubit = BlocProvider.of<CounterCubit>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculate'),
      ),
      body: BlocConsumer<CounterCubit, int>(
          bloc: cubit,
          listener: (context, state){
            final snackBar = SnackBar(content: Text('State is reached'));

            if (state ==5){
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
        },
              builder: (context, state) {
              return Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: "Enter a number",
                    )
                  ),
                  Text('$state'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      ElevatedButton(onPressed: (){
                      cubit.increment();
                      }, child: Text('increase')),

                      ElevatedButton(onPressed: (){
                      cubit.decrement();
                      }, child: Text('decrease')),

                      ElevatedButton(onPressed: (){
                      cubit.reset();
                      }, child: Text('reset')),
                      ]
                ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){
                        cubit.multiply();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return result('myController');
                        }));


                      }, child: Icon(Icons.add)),
                      ElevatedButton(onPressed: (){
                        cubit.divide();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>result('myController')),
                        );


                      }, child: Icon(Icons.remove))
                    ],
                  )
                ]
                ),
                );
                }
          ),
    );
  }
}
