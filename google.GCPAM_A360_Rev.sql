SELECT
  sfdc_account_id,
  customer_name,
  assigned_rep,
  Trad_vs_DN,
  is_digital_native,
  qb_flag,
  in_GENAI_Universe,
  rep_region,
  rep_type,
  --usage_month,
  SUM(CASE WHEN usage_month = '2024-01' THEN Gross_rev ELSE 0 END) AS fy24_m01,
  SUM(CASE WHEN usage_month = '2024-02' THEN Gross_rev ELSE 0 END) AS fy24_m02,
  SUM(CASE WHEN usage_month = '2024-03' THEN Gross_rev ELSE 0 END) AS fy24_m03,
  SUM(CASE WHEN usage_month = '2024-04' THEN Gross_rev ELSE 0 END) AS fy24_m04,
  SUM(CASE WHEN usage_month = '2024-05' THEN Gross_rev ELSE 0 END) AS fy24_m05,
  SUM(CASE WHEN usage_month = '2024-06' THEN Gross_rev ELSE 0 END) AS fy24_m06,
  SUM(CASE WHEN usage_month = '2024-07' THEN Gross_rev ELSE 0 END) AS fy24_m07,
  SUM(CASE WHEN usage_month = '2024-08' THEN Gross_rev ELSE 0 END) AS fy24_m08,
  SUM(CASE WHEN usage_month = '2024-09' THEN Gross_rev ELSE 0 END) AS fy24_m09,
  SUM(CASE WHEN usage_month = '2024-10' THEN Gross_rev ELSE 0 END) AS fy24_m10,
  SUM(CASE WHEN usage_month = '2024-11' THEN Gross_rev ELSE 0 END) AS fy24_m11,
  SUM(CASE WHEN usage_month = '2024-12' THEN Gross_rev ELSE 0 END) AS fy24_m12,
  SUM(CASE WHEN usage_month IN ('2024-01', '2024-02', '2024-03') THEN Gross_rev ELSE 0 END) AS fy24_q1_billing,
  SUM(CASE WHEN usage_month IN ('2024-04', '2024-05', '2024-06') THEN Gross_rev ELSE 0 END) AS fy24_q2_billing,
  SUM(CASE WHEN usage_month IN ('2024-07', '2024-08', '2024-09') THEN Gross_rev ELSE 0 END) AS fy24_q3_billing,
  SUM(CASE WHEN usage_month IN ('2024-10', '2024-11', '2024-12') THEN Gross_rev ELSE 0 END) AS fy24_q4_billing,
--   fy24_q4_billing + ((fy24_q4_billing / DATEDIFF(day, '2024-10-01', GETDATE())) * DATEDIFF(day, GETDATE(), '2024-12-31')) AS fy24_q4_forecast,
  SUM(Gross_rev) AS total_gross_rev
FROM
  google.GCPAM_A360_Rev
WHERE
  assigned_rep IN ('lililee', 'shwetaraman', 'keitish', 'sameerakhan', 'cheesang', 'kamwah', 'kijane', 'narinchaya', 'yongjiel', 'akitoishii', 'yokoarai', 'syuka', 'bbinh', 'yumemura', 'mtozuka', 'mohara')
  AND usage_quarter IN ('2024-Q1', '2024-Q2', '2024-Q3', '2024-Q4')
GROUP BY
  sfdc_account_id,
  customer_name,
  assigned_rep,
  Trad_vs_DN,
  is_digital_native,
  qb_flag,
  in_GENAI_Universe,
  rep_region,
  rep_type;
  -- usage_month;
