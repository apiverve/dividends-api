# Dividends API

Dividends returns the dividend-per-share history for a US public company by ticker - the amount reported each quarter and year straight from official SEC filings - plus a derived dividend-growth summary with year-over-year growth, multi-year growth rates and a consecutive-years-of-growth streak calculated for you.

[![npm version](https://img.shields.io/npm/v/@apiverve/dividends.svg)](https://www.npmjs.com/package/@apiverve/dividends)

This is a JavaScript wrapper for the [Dividends API](https://apiverve.com/marketplace/dividends?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/dividends
```

Using yarn:
```shell
yarn add @apiverve/dividends
```

---

## Configuration

Before using the Dividends API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Dividends API documentation is found here: [https://docs.apiverve.com/ref/dividends](https://docs.apiverve.com/ref/dividends?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const dividendsAPI = require('@apiverve/dividends');
const api = new dividendsAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  ticker: "AAPL",
  period: "annual",
  limit: 10
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  ticker: "AAPL",
  period: "annual",
  limit: 10
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  ticker: "AAPL",
  period: "annual",
  limit: 10
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
