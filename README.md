# E-Commerce Sales Analysis with SQL (PostgreSQL) 

## Project Overview 

This project analyzes an ecommerce business using SQL and PostgreSQL to evaluate financial performance, customer purchasing behavior, and revenue concentration. The objective is to transform raw transactional data into actionable insights that support executive decision-making, customer retention, and marketing budget optimization.

The analysis covers revenue performance from March 14 to June 16, 2026, alongside customer segmentation based on order frequency and lifetime spend. Findings are translated into recommendations for revenue recovery, repeat-purchase growth, and VIP customer retention. 

## Key Business Insights

**April revenue peak:** Revenue reached $6.73M in April.
**May contraction:** Revenue declined 43.54% month over month to $3.80M.
**June slowdown:** Revenue reached $1.02M in the first 16 days of June.
**Declining AOV:** AOV fell from $646.80 in April to $609.90 in June, a decrease of approximately 5.7%.
**Volume-led deterioration:** Completed orders fell from 10,398 in April to 6,111 in May, a decline of approximately 41.2%.

## Repository Structure
- `sql/`: Clean, commented SQL scripts (`1_exploration.sql`, `2_revenue.sql`, `3_customers.sql`)
- `findings/`: Executive reports (`0_executive_summary.md`, `1_business_overview.md`, `2_business_health.md`, `3_customer_segments.md`)

## How to Reproduce
1. Connect to PostgreSQL using VS Code + SQLTools.
2. Run scripts sequentially in the `sql/` directory with `SET search_path TO ecom;`.