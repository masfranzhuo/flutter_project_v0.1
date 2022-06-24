DateTime? dateTimeFromJson(String? date) =>
    date != null && date.isNotEmpty ? DateTime.parse(date).toLocal() : null;

String? dateTimeToJson(DateTime? date) =>
    // ignore: prefer_null_aware_operators
    date != null ? date.toUtc().toIso8601String() : null;
