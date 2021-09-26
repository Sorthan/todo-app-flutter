import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/Todo/classes/todo_class.dart';

class Controller extends GetxController {
  RxList todos = <Todo>[].obs;

  void addTodo(int id, String todoname) {
    Todo newItem = Todo(id, todoname, false);
    todos.add(newItem);
  }

  void editTodo(int onfocusId, String newName) {
    for (Todo todo in todos) {
      if (todo.id == onfocusId) {
        todo.setName(newName);
        todo.setIsComplete(false);
        todos.refresh();
      }
    }
    todos.refresh();
  }

  void deleteTodo(int onfocusId) {
    for (Todo todo in todos) {
      if (todo.id == onfocusId) {
        todos.remove(todo);
      }
    }
  }

  bool toggleTodo(int focusId) {
    bool isDone = false;
    for (Todo todo in todos) {
      if (todo.id == focusId) {
        todo.isComplete = !todo.isComplete;
        isDone = todo.isComplete;
        todos.refresh();
      }
    }
    return isDone;
  }

  // Widget createTodoItem(Todo item,BuildContext context) {
  //   return Obx(() =>Column(
  //     children: [
  //       Card(
  //         color: Colors.white,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Checkbox(
  //                   value: item.isComplete,
  //                   activeColor: const Color.fromRGBO(52, 182, 149, 1),
  //                   onChanged: (value) {
  //                     value = controller.toggleTodo(item.id);
  //                   },
  //                   shape: const CircleBorder(),
  //                 ),
  //                 Text(
  //                   item.name,
  //                   textAlign: TextAlign.left,
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 IconButton(
  //                   onPressed: () {
  //                     showDialog<String>(
  //                       context: context,
  //                       builder: (BuildContext context) => AlertDialog(
  //                         title: const Text('Edit your task'),
  //                         content: TextField(
  //                           textAlign: TextAlign.left,
  //                           decoration: const InputDecoration(
  //                             prefixIcon: Icon(
  //                               Icons.checklist,
  //                               color: Color(0xFFFCAEB7),
  //                             ),
  //                             hintText: "write todo name",
  //                             focusedBorder: OutlineInputBorder(
  //                                 borderSide: BorderSide(color: Colors.white),
  //                                 borderRadius: BorderRadius.zero),
  //                           ),
  //                           autocorrect: false,
  //                           autofocus: true,
  //                           cursorColor: const Color(0xFFFCAEB7),
  //                           keyboardType: TextInputType.text,
  //                           controller: edittextController,
  //                         ),
  //                         actions: [
  //                           TextButton(
  //                             onPressed: () {
  //                               Get.back();
  //                             },
  //                             child: const Text(
  //                               'Cancel',
  //                               textAlign: TextAlign.center,
  //                               style: TextStyle(color: Colors.red),
  //                             ),
  //                           ),
  //                           TextButton(
  //                             onPressed: () {
  //                               controller.editTodo(
  //                                   item.id, edittextController.text);
  //                               edittextController.clear();
  //                               Get.back();
  //                             },
  //                             child: const Text(
  //                               'OK',
  //                               textAlign: TextAlign.center,
  //                               style: TextStyle(
  //                                 color: Color(0xFFFCAEB7),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     );
  //                   },
  //                   icon: const Icon(
  //                     Icons.edit,
  //                     color: Color(0xFF46D2F5),
  //                   ),
  //                 ),
  //                 IconButton(
  //                   onPressed: () {
  //                     controller.deleteTodo(item.id);
  //                   },
  //                   icon: const Icon(
  //                     Icons.delete,
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ));
  //}
}
