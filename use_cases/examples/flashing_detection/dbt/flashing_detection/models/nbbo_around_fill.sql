SELECT 
      take_events.trade_date,
      take_events.symbol,
      take_events.take_exec_id,
      MAX(bid) AS max_bid,
      MIN(ask) AS min_ask
    FROM 
      {{ ref('take_events') }},
      market_data.nbbo        
    JOIN {{ ref('latest_nbbo') }} ON
      take_events.trade_date = latest_nbbo.trade_date
      AND take_events.symbol = latest_nbbo.symbol
      AND take_events.take_exec_id = latest_nbbo.take_exec_id
    WHERE 
      (
           nbbo.timestamp > DATETIME_SUB(take_timestamp, INTERVAL 1000 MILLISECOND)
        OR nbbo.timestamp >= latest_nbbo.nbbo_time
      )
      AND nbbo.timestamp < take_events.take_timestamp
    GROUP BY 
      trade_date, symbol, take_exec_id