import '../../../global/models/time_table/time_table.dart';

/// This class is responsible for all the usecases related to the timetable
abstract class TimetableUsecase {
  Stream<List<Day>> get batchTimeTableStream;
  Future<List<Day>> get batchTimeTable;
  Future<void> addOrUpdateBatchTimeTable(TimeTable timeTable);
  Stream<List<Day>> get personalTimeTableStream;
  Future<List<Day>> get personalTimeTable;
  Future<void> addOrUpdatePersonalTimeTable(TimeTable timeTable);
  Future<void> deleteTimetable(int year);
  Future<void> addTimeTable(TimeTable timeTable);
  Future<List<TimeTable>> get getAllTimetable;
}
