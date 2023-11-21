class SelectedDate {
  SelectedDate._internal();
  static SelectedDate instance = SelectedDate._internal();

  factory SelectedDate() {
    return instance;
  }
  DateTime? selectedDateRangeStart;
  DateTime? selectedDateRangeEnd;

  // DateTime? endingDate;
  int? startingDateyear;
  int? startingDatemonth;
  int? startingDateday;
  int? endingDateyear;
  int? endingDatemonth;
  int? endingDateday;
}
