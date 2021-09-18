class Todo {
  int id;
  String name;
  bool isComplete;

  Todo(this.id, this.name, this.isComplete);

  void setName(String name) {
    this.name = name;
  }

  void setIsComplete(bool isDone) {
    isComplete = isDone;
  }

  String getName() {
    return name;
  }

  bool getIsDone() {
    return isComplete;
  }
}
