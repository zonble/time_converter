import 'dart:math';

import 'package:time_converter/time_converter.dart';
import 'package:test/test.dart';

void main() {
  group('Test from 12 hours', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Test 00:00 AM', () {
      try {
        TimeConverter.from12Hours(
            TimeIn12Hours(period: TimeIn12HoursPeriod.am, string: '00:00'));
        fail('It should be invalid');
      } catch (e) {
        // should throw.
      }
    });

    test('Test 00 AM', () {
      try {
        TimeConverter.from12Hours(
            TimeIn12Hours(period: TimeIn12HoursPeriod.am, string: '00'));
        fail('It should be invalid');
      } catch (e) {
        // should throw.
      }
    });

    test('Test 12:00 AM', () {
      final result = TimeConverter.from12Hours(
          TimeIn12Hours(period: TimeIn12HoursPeriod.am, string: '12:00'));
      expect(result.string, '00:00');
    });

    test('Test 1:00 AM', () {
      final result = TimeConverter.from12Hours(
          TimeIn12Hours(period: TimeIn12HoursPeriod.am, string: '1:00'));
      expect(result.string, '01:00');
    });

    test('Test 9:00 AM', () {
      final result = TimeConverter.from12Hours(
          TimeIn12Hours(period: TimeIn12HoursPeriod.am, string: '9:00'));
      expect(result.string, '09:00');
    });

    test('Test 13:00 AM', () {
      try {
        TimeConverter.from12Hours(
            TimeIn12Hours(period: TimeIn12HoursPeriod.pm, string: '12:00'));
        fail('It should be invalid');
      } catch (e) {
        // should throw.
      }
    });

    test('Test 12:00 PM', () {
      final result = TimeConverter.from12Hours(
          TimeIn12Hours(period: TimeIn12HoursPeriod.pm, string: '12:00'));
      expect(result.string, '12:00');
    });

    test('Test 11:59 PM', () {
      final result = TimeConverter.from12Hours(
          TimeIn12Hours(period: TimeIn12HoursPeriod.pm, string: '11:59'));
      expect(result.string, '23:59');
    });
  });

  group('Test from 24 hours', () {
    test('Test 00:00', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '00:00'));
      expect(result.string, '12:00');
      expect(result.period, TimeIn12HoursPeriod.am);
    });

    test('Test 01:00', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '01:00'));
      expect(result.string, '01:00');
      expect(result.period, TimeIn12HoursPeriod.am);
    });

    test('Test 09:00', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '09:00'));
      expect(result.string, '09:00');
      expect(result.period, TimeIn12HoursPeriod.am);
    });

    test('Test 12:00', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '12:00'));
      expect(result.string, '12:00');
      expect(result.period, TimeIn12HoursPeriod.pm);
    });

    test('Test 13:00', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '13:00'));
      expect(result.string, '01:00');
      expect(result.period, TimeIn12HoursPeriod.pm);
    });

    test('Test 20:00', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '20:00'));
      expect(result.string, '08:00');
      expect(result.period, TimeIn12HoursPeriod.pm);
    });

    test('Test 23:59', () {
      final result = TimeConverter.from24Hours(TimeIn24Hours(string: '23:59'));
      expect(result.string, '11:59');
      expect(result.period, TimeIn12HoursPeriod.pm);
    });

    test('Test 24:00', () {
      try {
        TimeConverter.from24Hours(TimeIn24Hours(string: '24:00'));
        fail('It should be invalid');
      } catch (e) {
        // should throw
      }
    });

    test('Test 25:00', () {
      try {
        TimeConverter.from24Hours(TimeIn24Hours(string: '25:00'));
        fail('It should be invalid');
      } catch (e) {
        // should throw
      }
    });

    test('Test 00:100', () {
      try {
        TimeConverter.from24Hours(TimeIn24Hours(string: '00:100'));
        fail('It should be invalid');
      } catch (e) {
        // should throw
      }
    });

    test('Test 24:24', () {
      try {
        TimeConverter.from24Hours(TimeIn24Hours(string: '24:24'));
        fail('It should be invalid');
      } catch (e) {
        // should throw
      }
    });
  });
}
