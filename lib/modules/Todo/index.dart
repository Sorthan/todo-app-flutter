import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todoapp/modules/Todo/controller.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/Todo/classes/todo_class.dart';

// ignore: must_be_immutable
class TodoList extends GetView {
  @override
  Controller controller = Get.put(Controller());
  int i = 0;
  TextEditingController textController = TextEditingController();
  TextEditingController edittextController = TextEditingController();

  TodoList({Key? key}) : super(key: key);

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return inputTodosField(context);
      },
    );
  }

  inputTodosField(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 225,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xFFFCAEB7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                    IconButton(
                      onPressed: () {
                        textController.clear();
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0)),
                    const Text(
                      'Add Task',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFCAEB7),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Color.fromRGBO(250, 250, 250, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Expanded(
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.checklist,
                            color: Color(0xFFFCAEB7),
                          ),
                          hintText: "What would you like to add here ? ",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00FFFFFF)),
                              borderRadius: BorderRadius.zero),
                        ),
                        autocorrect: false,
                        autofocus: true,
                        cursorColor: const Color(0xFFFCAEB7),
                        controller: textController,
                        keyboardType: TextInputType.text,
                        maxLength: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: const Color(0xFFFCAEB7),
                              elevation: 0),
                          onPressed: () {},
                          child: const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: const Color(0xFFFCAEB7),
                              elevation: 0),
                          onPressed: () {},
                          child: const Icon(
                            Icons.access_alarm,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFCAEB7), elevation: 0),
                          onPressed: () {
                            controller.addTodo(i, textController.text);
                            textController.clear();
                            i++;
                            Get.back();
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createTodosData(Todo item, BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: item.isComplete,
                    activeColor: const Color.fromRGBO(52, 182, 149, 1),
                    onChanged: (value) {
                      value = controller.toggleTodo(item.id);
                    },
                    shape: const CircleBorder(),
                  ),
                  Text(
                    item.name,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Edit your task'),
                          content: TextField(
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.checklist,
                                color: Color(0xFFFCAEB7),
                              ),
                              hintText: "write todo name",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero),
                            ),
                            autocorrect: false,
                            autofocus: true,
                            cursorColor: const Color(0xFFFCAEB7),
                            keyboardType: TextInputType.text,
                            controller: edittextController,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'Cancel',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.editTodo(
                                    item.id, edittextController.text);
                                edittextController.clear();
                                Get.back();
                              },
                              child: const Text(
                                'OK',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFCAEB7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Color(0xFF46D2F5),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteTodo(item.id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  showTodosData(BuildContext context) {
    return GetX<Controller>(
      init: Controller(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Text("You have " '${controller.todos.length}' " task"),
              const Divider(
                color: Colors.white,
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
              Column(
                children: controller.todos
                    .map((item) => createTodosData(item, context))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  showTodosCompletedData(BuildContext context) {
    return GetX<Controller>(
      init: Controller(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Text("You have "
                  '${controller.todos.where((item) => item.isComplete).length}'
                  " completed task"),
              const Divider(
                color: Colors.white,
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
              Column(
                children: controller.todos
                    .where((completeItem) => completeItem.isComplete)
                    .map((item) => createTodosData(item, context))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  showTodosNotCompletedData(BuildContext context) {
    return GetX<Controller>(
      init: Controller(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Text("You have "
                  '${controller.todos.where((item) => !item.isComplete).length}'
                  " not completed task"),
              const Divider(
                color: Colors.white,
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
              Column(
                children: controller.todos
                    .where((notcompleteItem) => !notcompleteItem.isComplete)
                    .map((item) => createTodosData(item, context))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final drawerItems = ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: Color(0xFF7F54D4)),
          accountName: const Text(
            "Hi Sorathan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          accountEmail: const Text(
            "peepln4444@hotmail.com",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          currentAccountPicture: Image.asset('assets/images/profile.png'),
          currentAccountPictureSize: const Size(80, 80),
        ),
        ListTile(
          title: const Text("Go Back"),
          leading: const Icon(Icons.arrow_back),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Text("Lockscreen"),
          leading: const Icon(Icons.lock),
          onTap: () {
            Get.toNamed('security');
          },
        ),
        ListTile(
          title: const Text("Exit"),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {
            exit(0);
          },
        ),
      ],
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "WORKS TO BE DONE",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF2859C),
                  Color(0xFFFF7681),
                  Colors.red,
                  Color(0xFF9E2936),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          titleSpacing: 4,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(text: 'Completed'),
              Tab(text: 'Not Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "✿ ALL TASK ITEMS ✿",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(5)),
                showTodosData(context),
              ],
            ),
            ListView(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "✿ COMPLETED TASK ITEMS ✿",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(5)),
                showTodosCompletedData(context),
              ],
            ),
            ListView(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "✿ NOT COMPLETED TASK ITEMS ✿",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(5)),
                showTodosNotCompletedData(context),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          child: drawerItems,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showModalBottomSheet(context);
          },
          label: const Text(
            "Add a new task",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
