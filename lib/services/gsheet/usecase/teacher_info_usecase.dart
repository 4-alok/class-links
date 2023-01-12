import '../models/my_teacher_model.dart';

abstract class TeacherInfoUsecase {
  Future<MyTeachers> get fetchMyTeachers;
  Future<MyTeachers?> get getMyTeachersCached;
}
