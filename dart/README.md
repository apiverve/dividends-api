# Dividends API - Dart/Flutter Client

Dividends returns the dividend-per-share history for a US public company by ticker - the amount reported each quarter and year straight from official SEC filings - plus a derived dividend-growth summary with year-over-year growth, multi-year growth rates and a consecutive-years-of-growth streak calculated for you. Paid plans can add dividend yield and the full-year payout ratio.

[![pub package](https://img.shields.io/pub/v/apiverve_dividends.svg)](https://pub.dev/packages/apiverve_dividends)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Dividends API](https://apiverve.com/marketplace/dividends?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dividends: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_dividends/apiverve_dividends.dart';

void main() async {
  final client = DividendsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'ticker': 'AAPL',
      'period': 'annual',
      'limit': 10,
      'metrics': true
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "ticker": "AAPL",
    "cik": "0000320193",
    "company": "Apple Inc.",
    "currency": "USD",
    "paysDividend": true,
    "latestDividendPerShare": 0.26,
    "latestDividendPeriod": "CY2026Q1",
    "latestDividendDate": "2026-03-28",
    "count": 5,
    "dividends": [
      {
        "period": "CY2026Q1",
        "periodEnd": "2026-03-28",
        "perShare": 0.26,
        "form": "10-Q"
      },
      {
        "period": "CY2025Q4",
        "periodEnd": "2025-12-27",
        "perShare": 0.26,
        "form": "10-Q"
      },
      {
        "period": "CY2025Q2",
        "periodEnd": "2025-06-28",
        "perShare": 0.26,
        "form": "10-Q"
      },
      {
        "period": "CY2025Q1",
        "periodEnd": "2025-03-29",
        "perShare": 0.25,
        "form": "10-Q"
      },
      {
        "period": "CY2024Q4",
        "periodEnd": "2024-12-28",
        "perShare": 0.25,
        "form": "10-Q"
      }
    ],
    "analytics": {
      "dividendGrowth1Y": 4.08,
      "dividendGrowth3YCagr": 4.26,
      "dividendGrowth5YCagr": 5.11,
      "consecutiveYearsOfGrowth": 7,
      "averageAnnualGrowthRate": 5.98,
      "isDividendGrower": true,
      "annualHistory": [
        {
          "period": "CY2018",
          "perShare": 0.68
        },
        {
          "period": "CY2019",
          "perShare": 0.75
        },
        {
          "period": "CY2020",
          "perShare": 0.795
        },
        {
          "period": "CY2021",
          "perShare": 0.85
        },
        {
          "period": "CY2022",
          "perShare": 0.9
        },
        {
          "period": "CY2023",
          "perShare": 0.94
        },
        {
          "period": "CY2024",
          "perShare": 0.98
        },
        {
          "period": "CY2025",
          "perShare": 1.02
        }
      ]
    },
    "metrics": {
      "trailingAnnualDividend": 1.02,
      "trailingAnnualPeriod": "CY2025",
      "dividendYield": 0.33,
      "priceAsOf": "2026-08-17T19:27:12.559994467Z",
      "payoutRatio": 13.67,
      "payoutRatioFiscalYear": 2025
    }
  }
}
```

## API Reference

- **API Home:** [Dividends API](https://apiverve.com/marketplace/dividends?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/dividends](https://docs.apiverve.com/ref/dividends?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
