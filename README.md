# time_converter

Support 12-hours time and 24-hours time conversion.

## Usage

```dart
final result = TimeConverter.from12Hours(TimeIn12Hours(period: TimeIn12HoursPeriod.pm, string: '12:00'));
expect(result.string, '12:00');

final result = TimeConverter.from12Hours(TimeIn12Hours(period: TimeIn12HoursPeriod.pm, string: '11:59'));
expect(result.string, '23:59');

final result = TimeConverter.from24Hours(TimeIn24Hours(string: '00:00'));
expect(result.string, '12:00');
expect(result.period, TimeIn12HoursPeriod.am);

```

