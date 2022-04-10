/// Represents the time period.
enum TimeIn12HoursPeriod {
  am,
  pm,
}

/// Represents the time in 12-hours format.
class TimeIn12Hours {
  // AM or PM.
  final TimeIn12HoursPeriod period;

  /// The string as xx:xx.
  final String string;

  /// Creates a new instance.
  TimeIn12Hours({required this.period, required this.string});
}

/// Represents the time in 24-hours format.
class TimeIn24Hours {
  /// The string as xx:xx.
  final String string;

  /// Creates a new instance.
  TimeIn24Hours({required this.string});
}

/// Helps to convert time between 12-hours format and 24-hours format.
class TimeConverter {
  TimeConverter._();

  /// Converts to a time in 12-hours format.
  static TimeIn12Hours from24Hours(TimeIn24Hours input) {
    final time = _Time.from24Hours(input);
    return time.to12Hours();
  }

  /// Converts to a time in 24-hours format.
  static TimeIn24Hours from12Hours(TimeIn12Hours input) {
    final time = _Time.from12Hours(input);
    return time.to24Hours();
  }
}

class _Time {
  int minutes;

  _Time(this.minutes);

  TimeIn12Hours to12Hours() {
    var period = TimeIn12HoursPeriod.am;
    var hour = minutes ~/ 60;
    var minute = minutes % 60;
    if (hour >= 12) {
      hour -= 12;
      period = TimeIn12HoursPeriod.pm;
    }
    if (hour == 0) hour = 12;
    final string = '$hour'.padLeft(2, '0') + ':' + '$minute'.padLeft(2, '0');
    return TimeIn12Hours(string: string, period: period);
  }

  TimeIn24Hours to24Hours() {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final string = '$hour'.padLeft(2, '0') + ':' + '$minute'.padLeft(2, '0');
    return TimeIn24Hours(string: string);
  }

  factory _Time.from12Hours(TimeIn12Hours input) {
    final components = input.string.split(':');
    if (components.length != 2) {
      throw Exception('The format should be xx:xx');
    }
    final hourString = components[0];
    final minuteString = components[1];

    var hour = int.parse(hourString);
    if (hour < 1 || hour > 12) {
      throw Exception('The hours should be within 1 and 12.');
    }
    int minute = int.parse(minuteString);
    if (minute < 0 || minute > 59) {
      throw Exception('The minutes should be within 0 and 59.');
    }
    if (hour == 12) hour = 0;
    int allMinutes = hour * 60 + minute;
    if (input.period == TimeIn12HoursPeriod.pm) {
      allMinutes += 12 * 60;
    }
    return _Time(allMinutes);
  }

  factory _Time.from24Hours(TimeIn24Hours input) {
    final components = input.string.split(':');
    if (components.length != 2) {
      throw Exception('The format should be xx:xx');
    }
    final hourString = components[0];
    final minuteString = components[1];
    var hour = int.parse(hourString);
    if (hour < 0 || hour > 23) {
      throw Exception('The hours should be within 1 and 12.');
    }
    int minute = int.parse(minuteString);
    if (minute < 0 || minute > 59) {
      throw Exception('The minutes should be within 0 and 59.');
    }
    int allMinutes = hour * 60 + minute;
    return _Time(allMinutes);
  }
}
