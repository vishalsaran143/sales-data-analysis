# 📊 Sales Analysis Project (2015–2018)
---
## 📌 What is This Project About?
This project analyzes sales data from 2015 to 2018 to answer 3 questions:
- Which year had the best sales?
- Which region and product makes the most money?
- Where should the business focus next — and WHY?
---
## 📂 About the Dataset
- Sales data from **2015 to 2018**
- Contains order, product, and region information
- Main columns used: `Order Date`, `Region`, `Category`, `Sub-Category`, `Sales`
> **Note:** Data was cleaned and prepared before analysis.
---
## 🔎 Analysis Approach
This project follows a structured top-down approach:
> **Big Picture → Drill Down → Find Pattern → Ask WHY → Recommend**

- Focus is on **2016 to 2018**
- **2015 is used as the starting baseline** for comparison
- Year-over-year growth, region performance, and product trends were studied
- Deep dive done to find the **root cause** behind every anomaly
---
## 📈 Key Findings

### 1. Overall Sales Trend
- Sales dropped slightly in 2016 (-4.26%) but recovered strongly
- **2017: +30.64% growth**
- **2018: +20.30% growth** — best year overall
- Total growth from 2016 to 2018: **+57%**
---
### 2. Region Performance
- **West region has the highest and most consistent growth** (35%+ every year)
- East region is large but growing slowly
- Central region grew fast in 2017 but declined in 2018 ⚠️
- South region is small but steady

> ✅ West region was selected for deeper analysis
---
### 3. Category Performance (West Region)
- **Technology** nearly doubled in 2 years — top category
- **Office Supplies** also grew strongly, especially in 2018
- **Furniture** started strong but went negative in 2018 ❌
---
### 4. Sub-Category Performance (West Region)
- **Copiers** — grew 4x in 2 years 🚀 — biggest growth product
- **Binders** — consistent growth both years ✅
- **Storage** — recovered well in 2018 ✅
- **Phones** — was the top product, now declining in West ⚠️
- **Supplies** — actively pulling growth down ❌
---
### 5. Growth Contribution (80/20 Rule)
- Just **3 sub-categories (Copiers, Binders, Storage)** are driving **73% of total growth**
- This shows growth is concentrated — not spread evenly
---
## 🔍 Deep Dive — WHY Behind the Numbers

### WHY 1 — Copiers is not just the fastest growing product, it is the most EFFICIENT
| Sub-Category | Total Orders | Revenue Per Order | Efficiency |
|---|---|---|---|
| **Copiers** | 23 | ₹2,020 | High ✅ |
| Phones | 253 | ₹386 | High |
| **Binders** | 397 | ₹138 | Low ❌ |
| Fasteners | 71 | ₹12 | Low ❌ |

> **Insight:** Copiers generates ₹2,020 per order while Binders needs 397 transactions to generate similar revenue at ₹138 per order. Sales team is spending 17x more effort on Binders for far less return. Redirecting focus to Copiers = same effort, significantly higher revenue.

---
### WHY 2 — Central Region did not have a general decline — ONE product crashed
- **Copiers in Central: 2017 → ₹17,499 | 2018 → ₹3,679 (-79% drop)**
- Same product (Copiers) was GROWING in West during the same period

> **Insight:** Central region decline in 2018 was caused primarily by a 79% crash in Copiers sales. Since the product was growing elsewhere, this is a **regional execution problem**, not a product problem. Central region sales strategy for Copiers needs immediate investigation.

---
### WHY 3 — Phones is not a dying product — it is a West region strategy failure
| Region | 2015 | 2018 | Change |
|---|---|---|---|
| **West** | ₹29,527 | ₹24,432 | ❌ Declining |
| **East** | ₹20,523 | ₹35,952 | ✅ +69% |
| Central | ₹9,925 | ₹23,143 | ✅ Growing |
| South | ₹17,248 | ₹21,157 | ✅ Growing |

> **Insight:** Phones is declining ONLY in West region while growing in all other regions. This is not a product problem — it is a West region sales strategy failure for Phones. Study what East region is doing differently and replicate it.

---
## 💡 Business Recommendations
| Priority | Action | Why |
|---|---|---|
| ✅ Do More | Invest in Copiers | ₹2,020 revenue per order — highest efficiency |
| ✅ Do More | Push Technology in West | Nearly doubled in 2 years |
| ✅ Do More | Apply West strategy to South | South steady but underperforming |
| ⚠️ Fix This | Investigate Copiers in Central | 79% crash — regional execution issue |
| ⚠️ Fix This | Fix Phones strategy in West | Product is fine — East grew 69% |
| ❌ Review | Binders, Fasteners, Art | Low efficiency — high effort, low return |
---
## 🛠️ Tools Used
- **SQL (MySQL)** — data extraction and analysis
- **Power BI** — dashboards and visualizations
---
## 📂 Project Structure
```
📁 sql/
   ├── sales_analysis.sql         → WHAT: Sales trends, region, category analysis
   └── deep_dive_analysis.sql     → WHY: Root cause analysis of every anomaly
📁 data/          → Raw dataset
📁 dashboard/     → Power BI file
📁 images/        → Charts and screenshots
```
---
## 🚀 Conclusion
> Business grew **57% in just 2 years** — from ₹4.6L to ₹7.2L
>
> Growth is driven by **West region**, **Technology category**, and **Copiers**
>
> Key finding: **Copiers is the most efficient product** (₹2,020/order), Central decline was caused by **one product crashing 79%**, and Phones decline is a **West-only strategy problem** — not a product failure
>
> Fixing these 3 root causes can push growth significantly higher
