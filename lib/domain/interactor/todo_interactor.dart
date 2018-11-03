import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tasking/data/repository/todo_repository.dart';
import 'package:tasking/domain/entity/todo_entity.dart';
import 'package:tasking/domain/interactor/task.dart';

class TodoInteractor {
  final TodoRepository todoRepository;

  TodoInteractor({
    @required this.todoRepository,
  }) : assert(todoRepository != null);

  Stream<List<TodoEntity>> get all => todoRepository.all;
  Stream<List<TodoEntity>> get unassigned => todoRepository.unassigned;
  Stream<List<TodoEntity>> get finished => todoRepository.finished;

  Stream<Task> add(TodoEntity todo) {
    return Observable.fromFuture(todoRepository.add(todo)).startWith(Task.running());
  }

  Stream<Task> remove(TodoEntity todo) {
    return Observable.fromFuture(todoRepository.remove(todo)).startWith(Task.running());
  }

  Stream<Task> update(TodoEntity todo) {
    return Observable.fromFuture(todoRepository.update(todo)).startWith(Task.running());
  }

  Stream<Task> clearArchive() {
    return Observable.fromFuture(todoRepository.clearArchive()).startWith(Task.running());
  }
}