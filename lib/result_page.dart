import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stateflutter/counter_cubit.dart';

class Toget {
  final int input;
  final int state;

  const Toget(this.input, this.state);
}

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  late CounterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('results'),
      ),
      // body: BlocBuilder<CounterCubit, int>(
      //   bloc: cubit,
      //   builder: (context, state) {
        body: Column(
          children: [
            ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int number){
                return Container(
                  height: 30,
                  width: 70,
                  children:[
                    Text('Toget.input'),
                    Text('Toget.state'),
                  ]
                );
              }
            )
          ]
        )
        // },
      // ),
    );
  }
}
