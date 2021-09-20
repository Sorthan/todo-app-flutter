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
}
