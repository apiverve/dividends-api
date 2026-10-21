# Dividends API - Ruby Gem

Dividends returns the dividend-per-share history for a US public company by ticker - the amount reported each quarter and year straight from official SEC filings - plus a derived dividend-growth summary with year-over-year growth, multi-year growth rates and a consecutive-years-of-growth streak calculated for you.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_dividends'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_dividends
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_dividends'

# Initialize the client
client = APIVerve::Dividends::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  ticker: "AAPL",
  period: "annual",
  limit: 10
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ ticker: "AAPL", period: "annual", limit: 10 })
  puts response["data"]
rescue APIVerve::Dividends::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Dividends::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Dividends::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dividends?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dividends?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dividends?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
