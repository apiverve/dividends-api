using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.Dividends
{
    /// <summary>
    /// Query options for the Dividends API
    /// </summary>
    public class DividendsQueryOptions
    {
        /// <summary>
        /// Stock ticker symbol (e.g. AAPL, MSFT, KO)
        /// </summary>
        [JsonProperty("ticker")]
        public string Ticker { get; set; }

        /// <summary>
        /// Which series to return in the history list: quarterly (default) or annual.
        /// </summary>
        [JsonProperty("period")]
        public string Period { get; set; }

        /// <summary>
        /// Number of periods to return in the history list (1-25). Defaults to 5.
        /// </summary>
        [JsonProperty("limit")]
        public int? Limit { get; set; }
    }
}
