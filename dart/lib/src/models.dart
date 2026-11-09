/// Response models for the Dividends API.

/// API Response wrapper.
class DividendsResponse {
  final String status;
  final dynamic error;
  final DividendsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  DividendsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory DividendsResponse.fromJson(Map<String, dynamic> json) => DividendsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DividendsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Dividends API.

class DividendsData {
  String? ticker;
  String? cik;
  String? company;
  String? currency;
  bool? paysDividend;
  num? latestDividendPerShare;
  String? latestDividendPeriod;
  String? latestDividendDate;
  num? count;
  List<DividendsDataDividendsItem>? dividends;
  DividendsDataAnalytics? analytics;
  DividendsDataMetrics? metrics;

  DividendsData({
    this.ticker,
    this.cik,
    this.company,
    this.currency,
    this.paysDividend,
    this.latestDividendPerShare,
    this.latestDividendPeriod,
    this.latestDividendDate,
    this.count,
    this.dividends,
    this.analytics,
    this.metrics,
  });

  factory DividendsData.fromJson(Map<String, dynamic> json) => DividendsData(
      ticker: json['ticker'],
      cik: json['cik'],
      company: json['company'],
      currency: json['currency'],
      paysDividend: json['paysDividend'],
      latestDividendPerShare: json['latestDividendPerShare'],
      latestDividendPeriod: json['latestDividendPeriod'],
      latestDividendDate: json['latestDividendDate'],
      count: json['count'],
      dividends: (json['dividends'] as List?)?.map((e) => DividendsDataDividendsItem.fromJson(e)).toList(),
      analytics: json['analytics'] != null ? DividendsDataAnalytics.fromJson(json['analytics']) : null,
      metrics: json['metrics'] != null ? DividendsDataMetrics.fromJson(json['metrics']) : null,
    );
}

class DividendsDataDividendsItem {
  String? period;
  String? periodEnd;
  num? perShare;
  String? form;

  DividendsDataDividendsItem({
    this.period,
    this.periodEnd,
    this.perShare,
    this.form,
  });

  factory DividendsDataDividendsItem.fromJson(Map<String, dynamic> json) => DividendsDataDividendsItem(
      period: json['period'],
      periodEnd: json['periodEnd'],
      perShare: json['perShare'],
      form: json['form'],
    );
}

class DividendsDataAnalytics {
  num? dividendGrowth1Y;
  num? dividendGrowth3YCagr;
  num? dividendGrowth5YCagr;
  num? consecutiveYearsOfGrowth;
  num? averageAnnualGrowthRate;
  bool? isDividendGrower;
  List<DividendsDataAnalyticsAnnualhistoryItem>? annualHistory;

  DividendsDataAnalytics({
    this.dividendGrowth1Y,
    this.dividendGrowth3YCagr,
    this.dividendGrowth5YCagr,
    this.consecutiveYearsOfGrowth,
    this.averageAnnualGrowthRate,
    this.isDividendGrower,
    this.annualHistory,
  });

  factory DividendsDataAnalytics.fromJson(Map<String, dynamic> json) => DividendsDataAnalytics(
      dividendGrowth1Y: json['dividendGrowth1Y'],
      dividendGrowth3YCagr: json['dividendGrowth3YCagr'],
      dividendGrowth5YCagr: json['dividendGrowth5YCagr'],
      consecutiveYearsOfGrowth: json['consecutiveYearsOfGrowth'],
      averageAnnualGrowthRate: json['averageAnnualGrowthRate'],
      isDividendGrower: json['isDividendGrower'],
      annualHistory: (json['annualHistory'] as List?)?.map((e) => DividendsDataAnalyticsAnnualhistoryItem.fromJson(e)).toList(),
    );
}

class DividendsDataAnalyticsAnnualhistoryItem {
  String? period;
  num? perShare;

  DividendsDataAnalyticsAnnualhistoryItem({
    this.period,
    this.perShare,
  });

  factory DividendsDataAnalyticsAnnualhistoryItem.fromJson(Map<String, dynamic> json) => DividendsDataAnalyticsAnnualhistoryItem(
      period: json['period'],
      perShare: json['perShare'],
    );
}

class DividendsDataMetrics {
  num? trailingAnnualDividend;
  String? trailingAnnualPeriod;
  num? dividendYield;
  String? priceAsOf;
  num? payoutRatio;
  num? payoutRatioFiscalYear;

  DividendsDataMetrics({
    this.trailingAnnualDividend,
    this.trailingAnnualPeriod,
    this.dividendYield,
    this.priceAsOf,
    this.payoutRatio,
    this.payoutRatioFiscalYear,
  });

  factory DividendsDataMetrics.fromJson(Map<String, dynamic> json) => DividendsDataMetrics(
      trailingAnnualDividend: json['trailingAnnualDividend'],
      trailingAnnualPeriod: json['trailingAnnualPeriod'],
      dividendYield: json['dividendYield'],
      priceAsOf: json['priceAsOf'],
      payoutRatio: json['payoutRatio'],
      payoutRatioFiscalYear: json['payoutRatioFiscalYear'],
    );
}

class DividendsRequest {
  String ticker;
  String? period;
  int? limit;
  bool? metrics;

  DividendsRequest({
    required this.ticker,
    this.period,
    this.limit,
    this.metrics,
  });

  Map<String, dynamic> toJson() => {
      'ticker': ticker,
      if (period != null) 'period': period,
      if (limit != null) 'limit': limit,
      if (metrics != null) 'metrics': metrics,
    };
}
