-- =========================================================
-- QUESTION 1:
-- What are the number of unique users at each stage of the
-- GA4 e-commerce funnel, and what is the correct order of
-- those stages?
--
-- PURPOSE:
-- 1. Count DISTINCT users at each funnel stage
-- 2. Define an explicit stage order to preserve funnel flow



WITH funnel AS (
    SELECT
        event_name,
        COUNT(DISTINCT user_pseudo_id) AS users,
        CASE event_name
            WHEN 'page_view' THEN 1
            WHEN 'view_item' THEN 2
            WHEN 'add_to_cart' THEN 3
            WHEN 'begin_checkout' THEN 4
            WHEN 'purchase' THEN 5
        END AS stage_order
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE event_name IN (
        'page_view',
        'view_item',
        'add_to_cart',
        'begin_checkout',
        'purchase'
    )
    GROUP BY event_name
),

-- =========================================================
-- QUESTION 2:
-- What is the average order value (AOV) across all purchases?
--
-- PURPOSE:
-- 1. Calculate revenue per purchasing user
-- 2. Use this as a proxy to estimate revenue loss from
--    users dropping out of the funne

aov AS (
    SELECT
        SUM(item.price * item.quantity)
        / COUNT(DISTINCT user_pseudo_id) AS avg_order_value
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
         UNNEST(items) AS item
    WHERE event_name = 'purchase'
)

-- =========================================================
-- QUESTION 3:
-- How many users drop off at each funnel stage compared to
-- the previous stage, and what is the estimated revenue loss
-- associated with those dropped users?
--
-- PURPOSE:
-- 1. Use window functions to calculate stage-to-stage drop-off
-- 2. Multiply dropped users by AOV to estimate revenue leakage

SELECT
    f.event_name,
    f.users,

    -- Number of users who reached the previous stage
    -- but did not reach the current stage
    LAG(f.users) OVER (ORDER BY f.stage_order) - f.users
        AS dropped_users,

    -- Estimated revenue loss caused by dropped users
    ROUND(
        (LAG(f.users) OVER (ORDER BY f.stage_order) - f.users)
        * a.avg_order_value,
        2
    ) AS estimated_revenue_loss

FROM funnel f
CROSS JOIN aov a
ORDER BY f.stage_order;