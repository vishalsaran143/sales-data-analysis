# 📊 Sales Analysis Project (2015–2018)

---

## 📌 What is This Project About?

This project analyzes sales data from 2015 to 2018 to answer 3 simple questions:
- Which year had the best sales?
- Which region and product makes the most money?
- Where should the business focus next?

---

## 📂 About the Dataset

- Sales data from **2015 to 2018**
- Contains order, product, and region information
- Main columns used: `Order Date`, `Region`, `Category`, `Sub-Category`, `Sales`

> **Note:** Data was cleaned and prepared before analysis.

---

## 🔎 What Was Analyzed?

- Focus is on **2016 to 2018**
- **2015 is used as the starting baseline** for comparison
- Year-over-year growth, region performance, and product trends were studied

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
- **Phones** — was the top product, now declining ⚠️
- **Supplies** — actively pulling growth down ❌

---

### 5. Growth Contribution (80/20 Rule)
- Just **3 sub-categories (Copiers, Binders, Storage)** are driving **73% of total growth**
- This shows growth is concentrated — not spread evenly

---

## 💡 Business Recommendations

| Priority | Action |
|----------|--------|
| ✅ Do More | Invest in Copiers, Binders, Storage |
| ✅ Do More | Push Technology category in West region |
| ✅ Do More | Apply West region strategy to South region |
| ⚠️ Fix This | Phones declining — try enterprise/bulk sales |
| ⚠️ Fix This | Supplies hurting growth — check pricing/competition |
| ❌ Investigate | Central region declined in 2018 — find out why |

---

## 🛠️ Tools Used

- **SQL (MySQL)** — data extraction and analysis
- **Power BI** — dashboards and visualizations

---

## 📂 Project Structure

```
📁 sql/          → All SQL queries
📁 data/         → Raw dataset
📁 dashboard/    → Power BI file
📁 images/       → Charts and screenshots
```

---

## 🚀 Conclusion

> Business grew **57% in just 2 years** — from ₹4.6L to ₹7.2L
>
> Growth is mainly driven by **West region**, **Technology category**, and **Copiers**
>
> Fixing declining products (Phones, Supplies) and regions (Central) can push growth even higher
