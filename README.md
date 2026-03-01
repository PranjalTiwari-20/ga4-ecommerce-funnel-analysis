# ga4-ecommerce-funnel-analysis
End-to-end GA4 funnel analysis using SQL, Python &amp; Power BI
GA4 E-Commerce Funnel & Revenue Leakage Analysis
-Project Overview

This project analyzes user behavior across an e-commerce funnel using GA4 event data to understand where users drop off before completing a purchase and how those drop-offs impact revenue.

The goal is to combine technical analysis with business interpretation to identify conversion inefficiencies and quantify potential revenue leakage.

-Business Problem

In an e-commerce environment, thousands of users enter the funnel daily, but only a small fraction complete the purchase journey.

Without structured funnel analysis, businesses struggle to:

Identify the exact stage causing the highest drop-off

Measure the severity of conversion loss

Estimate the financial impact of user abandonment

This project addresses these gaps through stage-wise analysis and revenue estimation.

-Objectives

Analyze 358K users across 5 funnel stages

Calculate stage-wise drop-offs

Compute overall and stage-level conversion rates

Estimate potential revenue leakage

Build an executive-level Power BI dashboard

-Data & Methodology

Funnel Stages Analyzed:

Page View

View Item

Add to Cart

Begin Checkout

Purchase

-Workflow

SQL used to aggregate GA4 event-level data

Python used for drop-off calculations and revenue estimation

Power BI used to build KPI cards, funnel visualization, and revenue leakage analysis

- Key Metrics

Total Funnel Users: 358K

Purchases: 4K

Overall Conversion Rate: 1.6%

Estimated Revenue Leakage: ₹21.77M

-Key Insights

The largest drop-off occurs between Page View and View Item.

₹17.11M in potential revenue leakage occurs before users add items to cart.

Only 1.6% of total users complete the purchase journey.

Product exploration stage appears to be the primary friction point.

-Dashboard Preview




-Business Recommendations

Improve product page UX and clarity

Optimize product descriptions and visuals

Implement retargeting for drop-off users

Reduce friction in checkout flow

-Tools Used

SQL

Python (Pandas, NumPy, Matplotlib, Seaborn)

Power BI (DAX, Funnel Chart, KPI Cards)
