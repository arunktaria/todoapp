import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Model/PostModel.dart';
import 'package:todoapp/cubit/todo_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    await cubitTodo.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
            String str = "null";
            print("on api hit state ${state.props.length}");
            if (state is Success) {
              try {
                return getListviewBuilder(context, state.list);
              } catch (e) {
                print("105 $e");
              }
            } else if (state is Failed) {
              try {
                return Text("Failed to load");
                str = state.props.first.toString();
                const Text("in else part");
                print("failed $str");
              } catch (e) {
                print("116 $e");
              }
            }
            return Text("Null returned");
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  late TodoCubit cubitTodo;

  @override
  void initState() {
    print("print initial");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubitTodo = context.read<TodoCubit>();
    });
  }

  Widget getListViewItem(String text) {
    print(text);
    return Card(
        color: Colors.blueGrey,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          clipBehavior: Clip.values.first,
          child:  Row(children: [
            Container(margin:const EdgeInsets.all(10),child:
            Image.network(
              "https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Aura-230120231337.jpg&w=350&h=251&q=90&c=1",
              width: 50,
              height: 50,
            )
              ,),
            Expanded(child:
            Text(text.toString(),overflow:TextOverflow.visible,textDirection: TextDirection.ltr,
                style: const TextStyle(color: Colors.white)))
          ]),
        ));
  }


  Widget getListCircularItem(String text) {
    print(text);
    return Card(
     color: Colors.blueGrey,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          clipBehavior: Clip.values.first,
          child:  Row(children: [
            Container(margin:const EdgeInsets.all(10),child:
            ClipRRect(
              borderRadius:  BorderRadius.circular(8.0),
                child:
            Image.network(
              "https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Aura-230120231337.jpg&w=350&h=251&q=90&c=1",
              width: 50,
              height: 50,
            ))
              ,),
            Expanded(child:
            Text(text.toString(),overflow:TextOverflow.visible,textDirection: TextDirection.ltr,
                style: const TextStyle(color: Colors.white)))
          ]),
        ));
  }


  Widget getListTtestItem(String text) {
    print(text);
    return Card(
        color: Colors.blueGrey,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          clipBehavior: Clip.values.first,
          child:Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Row(children: [
              Text("ID : 13221545645",style: TextStyle(color: Colors.lightGreenAccent)),
              Spacer(),
              Text("ID : 4544545421"),
            ],),

          Row(children: [
            Text("ID : 13221545645"),

            Spacer(),
            InkWell(child:  Container(padding: EdgeInsets.all(6),decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.amber,),width: 70,height: 30,child: Center(child: Text("submit",style: TextStyle(color: Colors.white),)),))
          ],),

            Text("Email: arun@gmail.com",style: TextStyle(color: Colors.white),)
              ,Text(text,style: TextStyle(color: Colors.cyanAccent))
          ],)


        )
    );
  }


/*
ClipRRect(
                borderRadius:  BorderRadius.circular(8.0),
                child:
                Image.network(
                  "https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Aura-230120231337.jpg&w=350&h=251&q=90&c=1",
                  width: 50,
                  height: 50,
                ))
              ,),
            Expanded(child:
            Text(text.toString(),overflow:TextOverflow.visible,textDirection: TextDirection.ltr,
                style: const TextStyle(color: Colors.white)))
          ]),

*/

  ListView getListviewBuilder(BuildContext mcontext, List<PostModel> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return getListTtestItem(list[index].body);
      },
      reverse: false,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      padding:const EdgeInsets.all(5),
    );
  }
}