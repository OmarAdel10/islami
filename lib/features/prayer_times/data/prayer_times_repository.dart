import 'package:adhan_dart/adhan_dart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islami/features/prayer_times/data/location_service.dart';
import 'package:islami/features/prayer_times/data/models/prayer_times.dart';

class PrayerTimesRepository {
  final LocationService _locationService;

  PrayerTimesRepository({LocationService? locationService})
    : _locationService = locationService ?? const GeolocatorLocationService();

  Future<PrayerTimesModel> fetchPrayerTimes() async {
    if (!await _locationService.isLocationServiceEnabled()) {
      throw const PrayerTimesLocationException(
        'Location services are turned off on this device.',
      );
    }

    var permission = await _locationService.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _locationService.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const PrayerTimesLocationException(
        'Location permission is required to calculate prayer times.',
      );
    }

    final Position position;
    try {
      position = await _locationService.getCurrentPosition();
    } on PrayerTimesLocationException {
      rethrow;
    } catch (_) {
      throw const PrayerTimesLocationException(
        'Unable to determine your current location.',
      );
    }

    final calculationParameters =
        CalculationMethodParameters.muslimWorldLeague();
    final prayerTimes = PrayerTimes(
      date: DateTime.now(),
      coordinates: Coordinates(position.latitude, position.longitude),
      calculationParameters: calculationParameters,
    );

    final times = <PrayerTime>[
      PrayerTime(
        name: Prayer.fajr.displayName,
        time: _formatTime(prayerTimes.fajr),
      ),
      PrayerTime(
        name: Prayer.sunrise.displayName,
        time: _formatTime(prayerTimes.sunrise),
      ),
      PrayerTime(
        name: Prayer.dhuhr.displayName,
        time: _formatTime(prayerTimes.dhuhr),
      ),
      PrayerTime(
        name: Prayer.asr.displayName,
        time: _formatTime(prayerTimes.asr),
      ),
      PrayerTime(
        name: Prayer.maghrib.displayName,
        time: _formatTime(prayerTimes.maghrib),
      ),
      PrayerTime(
        name: Prayer.isha.displayName,
        time: _formatTime(prayerTimes.isha),
      ),
      PrayerTime(
        name: 'Qibla',
        time: _formatQibla(
          Qibla.qibla(Coordinates(position.latitude, position.longitude)),
        ),
      ),
    ];

    return PrayerTimesModel(times: times, date: prayerTimes.date);
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatQibla(double direction) {
    return '${direction.toStringAsFixed(0)}°';
  }
}
