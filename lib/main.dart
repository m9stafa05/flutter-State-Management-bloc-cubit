import 'package:flutter/material.dart';
import 'package:flutter_state_management/controller/bloc/task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocProvider(
        create: (context) => TaskBloc(),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            final cubitController = context.read<TaskBloc>();
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Add Task',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isEmpty) return;
                      cubitController.add(
                        AddTaskEvent(title: controller.text),
                      );
                      controller.clear();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Add'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tasksList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.tasksList[index].title ?? "",
                          ),
                          leading: Checkbox(
                            value: state.tasksList[index].isCompleted,
                            onChanged: (v) {
                              cubitController.add(
                                ToggleTaskEvent(
                                  id: state.tasksList[index].id,
                                ),
                              );
                            },
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              cubitController.add(
                                RemoveTaskEvent(
                                  id: state.tasksList[index].id,
                                ),
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
