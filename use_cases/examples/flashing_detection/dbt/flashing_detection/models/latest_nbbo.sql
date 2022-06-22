SELECT 
    take_events.trade_date, 
    take_events.symbol,
    take_exec_id, 
    MAX(nbbo.timestamp) AS nbbo_time
  FROM 
    {{ ref('take_events') }}, 
    market_data.nbbo
  WHERE 
    nbbo.timestamp < take_timestamp
  GROUP BY 
    take_events.trade_date,
    take_events.symbol,
    take_exec_id,
    take_timestamp