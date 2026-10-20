declare module '@apiverve/dividends' {
  export interface dividendsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface dividendsResponse {
    status: string;
    error: string | null;
    data: DividendsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface DividendsData {
      ticker:                 null | string;
      cik:                    null | string;
      company:                null | string;
      currency:               null | string;
      paysDividend:           boolean | null;
      latestDividendPerShare: number | null;
      latestDividendPeriod:   null | string;
      latestDividendDate:     Date | null;
      count:                  number | null;
      dividends:              Dividend[];
      analytics:              Analytics;
  }
  
  interface Analytics {
      dividendGrowth1Y:         number | null;
      dividendGrowth3YCagr:     number | null;
      dividendGrowth5YCagr:     number | null;
      consecutiveYearsOfGrowth: number | null;
      averageAnnualGrowthRate:  number | null;
      isDividendGrower:         boolean | null;
      annualHistory:            AnnualHistory[];
  }
  
  interface AnnualHistory {
      period:   null | string;
      perShare: number | null;
  }
  
  interface Dividend {
      period:    null | string;
      periodEnd: Date | null;
      perShare:  number | null;
      form:      null | string;
  }

  export default class dividendsWrapper {
    constructor(options: dividendsOptions);

    execute(callback: (error: any, data: dividendsResponse | null) => void): Promise<dividendsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dividendsResponse | null) => void): Promise<dividendsResponse>;
    execute(query?: Record<string, any>): Promise<dividendsResponse>;
  }
}
