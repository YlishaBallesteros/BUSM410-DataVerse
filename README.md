# BUSM410-DataVerse

Team project by Ylisha Ballesteros and Layhok Houn (Canvas team: DataVerse).

| Item | Value |
|---|---|
| Dataset | Chicago Taxi Trips |
| BigQuery table | `bigquery-public-data.chicago_taxi_trips.taxi_trips` |
| Google Cloud project | `enduring-smile-509700-n5` |

## Problem framing

This project analyzes Chicago taxi demand and recorded fare patterns during 2023 to help taxi companies plan driver availability and understand when fare totals are highest. One row is one recorded taxi trip from `bigquery-public-data.chicago_taxi_trips.taxi_trips`, grouped by Chicago-local start time. Of 6,427,460 scoped trips, 11 a.m. is the busiest hour with 451,453 trips; compared with the evenly weighted hourly mean (6,427,460 / 24 = 267,810.83), the gap is 183,642.17 (+68.6%). Thursday averages 20,669.17 trips per occurrence (1,074,797 / 52), 3,059.69 (+17.4%) above the daily mean (6,427,460 / 365 = 17,609.48). Thursday at 11 a.m. is the busiest weekday-hour at 1,455.98 trips per Thursday, 594.77 (+69.1%) above Thursday's average hour (20,669.17 / 24 = 861.22). Recorded `fare` totals $142,690,533.04; 10 a.m. peaks at $9,742,359.75, $3,796,920.87 (+63.9%) above the mean hourly fare total ($142,690,533.04 / 24 = $5,945,438.88). Thursday at 10 a.m. has the highest weekday-hour fare average at $31,059.68 per occurrence, $12,317.13 (+65.7%) above Thursday's average hour ($449,821.24 / 24 = $18,742.55). The average-hour benchmark compares the peak bucket with all daily hour buckets; day averages account for calendar occurrences in 2023. The source table's `fare` field is recorded fare only, not profit or net revenue. See [query 02](sql/02_demand_by_hour_2023.sql), [query 03](sql/03_peak_day_hour_2023.sql), and [query 04](sql/04_fare_by_day_hour_2023.sql) for source calculations, [Other/README.md](Other/README.md) for the data source documentation, and [findings.md](findings.md) for details.

The matched-period benchmark uses the same 272 Chicago-local dates (Jan 1–Sep 29) in 2019 and 2023. [Query 05](sql/05_matched_period_benchmark_2019_2023.sql) returned 16,386,009 trips in 2019 and 4,839,408 in 2023: 16,386,009 − 4,839,408 = 11,546,601 fewer trips, a 70.5% decline (11,546,601 / 16,386,009). The updated [gap chart](visuals/gap_chart.svg) compares the per-hour daily averages for both years. Query 01 found no negative fares, durations, or distances and 85 end-before-start rows; those 85 rows are documented and retained.

**Submission status:** The earlier-period results, SQL, chart, dataset documentation, and review log are assembled. The 2023 local-date boundary check and the audit protocol still need project-owner review; the protocol remains a proposal until approved.

## Explore the work

| File or link | What it’s for |
|---|---|
| [charter.md](charter.md) | Project question, intended decision, scope, and success criteria |
| [findings.md](findings.md) | Demand and fare findings, comparisons, chart, and limitations |
| [sql/README.md](sql/README.md) | Query sequence, cleaning checks, and analysis decisions |
| [audit_protocol.md](audit_protocol.md) | Proposed agent review steps, pending project-owner approval |
| [Other/audit_log.md](Other/audit_log.md) | Human-supplied evidence and review status |
| [sql/](sql/) | Numbered BigQuery SQL queries |
| [visuals/](visuals/) | Demand and fare charts |
| [Other/](Other/) | Dataset documentation, table diagram, and audit records |
| [AGENTS.md](AGENTS.md) | Project facts and working guidance |
| [ChatGPT.md](ChatGPT.md) | Points ChatGPT to the shared project guidance |

## Data source

The analysis uses the BigQuery public table above. The City of Chicago dataset documentation is linked in [Other/README.md](Other/README.md). Data files are not stored in this repository.

## Earlier exploration

The project began by exploring total taxi trips, busy weekdays and hours, available years, and 2020 weekday patterns. The screenshots from that original exploration remain below as project history; the 2023 CP1 analysis is documented in the findings and SQL files above.

<!-- Existing CP0 screenshots can be restored here if needed from their original README revision. -->
BUSM410-DataVerse

**Team Members:**
- Ylisha Ballesteros
- Layhok Houn

**Canvas Team Number:** DataVerse

**Dataset:** Chicago Taxi Trips

**Google Cloud Project ID:** enduring-smile-509700-n5

**BigQuery Table:**
`bigquery-public-data.chicago_taxi_trips.taxi_trips`
  

**Find the total number of taxi trips**

<img width="671" height="453" alt="image" src="https://github.com/user-attachments/assets/61bfe6e2-d119-43f7-807e-7aab1e83fd64" />

**Find the busiest days of the week**

<img width="668" height="788" alt="image" src="https://github.com/user-attachments/assets/369172a5-9f43-4cea-bba1-f0fb3d546486" />

**Find the busiest hours**

<img width="1334" height="894" alt="image" src="https://github.com/user-attachments/assets/e47863c4-1da1-4354-95d9-5ae3975f4c4e" />

**Find all available years**

<img width="1397" height="891" alt="image" src="https://github.com/user-attachments/assets/45f44071-d351-4fad-b29b-da055002dcec" />

****
<img width="1363" height="869" alt="image" src="https://github.com/user-attachments/assets/e2d90544-c1b0-4da2-ab53-cda3a11664fc" />

**Busiest Day of the Week by Month in Chicago (2020)**

<img width="1363" height="891" alt="image" src="https://github.com/user-attachments/assets/e4fb9e59-8a26-4611-b480-8a9fd8775e4b" />

**The busiest time for each day of the week in 2020**

<img width="1308" height="857" alt="image" src="https://github.com/user-attachments/assets/38d15073-cc8b-47d1-9183-7229bc24f8db" />






