# Dividends API - PHP Package

Dividends returns the dividend-per-share history for a US public company by ticker - the amount reported each quarter and year straight from official SEC filings - plus a derived dividend-growth summary with year-over-year growth, multi-year growth rates and a consecutive-years-of-growth streak calculated for you.

## Installation

Install via Composer:

```bash
composer require apiverve/dividends
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Dividends\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'ticker' => 'AAPL',
    'period' => 'annual',
    'limit' => 10
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Dividends\Client;
use APIVerve\Dividends\Exceptions\APIException;
use APIVerve\Dividends\Exceptions\ValidationException;

try {
    $response = $client->execute(['ticker' => 'AAPL', 'period' => 'annual', 'limit' => 10]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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
    }
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dividends?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dividends?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dividends?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
