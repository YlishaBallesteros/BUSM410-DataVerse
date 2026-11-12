# BUSM410-DataVerse

Team project by Ylisha Ballesteros and Layhok Houn (Canvas team: DataVerse).

| Item | Value |
|---|---|
| Dataset | Chicago Taxi Trips |
| BigQuery table | `bigquery-public-data.chicago_taxi_trips.taxi_trips` |
| Google Cloud project | `enduring-smile-509700-n5` |

## Problem framing

The project focuses on one manager-relevant gap: the difference in recorded taxi trips between matched 2019 and 2023 periods. One source row represents one recorded taxi trip. Across the same 272 Chicago-local dates (Jan 1–Sep 29), the table has 16,386,009 trips in 2019 and 4,839,408 in 2023: **11,546,601 fewer trips (70.5%)**. To give the gap a dollar scale, the 2023 average recorded fare was $142,690,533.04 / 6,415,469 fare-bearing trips ≈ $22.24163706 per trip. Applying that mean gives an **estimated fare equivalent of $256,815,308.67** (11,546,601 × [$142,690,533.04 / 6,415,469]). This estimate is not an observed fare shortfall, profit, or causal staffing impact. See [query 05](sql/05_matched_period_benchmark_2019_2023.sql), [findings.md](findings.md), and [sql/README.md](sql/README.md) for the period, source, assumptions, and calculations.

The 85 records with end timestamps earlier than their start remain in the trip counts; no rows were excluded. The [gap chart](visuals/gap_chart.svg) shows the single matched-period comparison. The 2023 local-date boundary confirmation remains a review item.

## Explore the work

| File or link | What it’s for |
|---|---|
| [charter.md](charter.md) | Project question, intended decision, scope, and success criteria |
| [findings.md](findings.md) | The selected gap, dollar estimate, benchmark, chart, and limitations |
| [sql/README.md](sql/README.md) | Query sequence, cleaning checks, and analysis decisions |
| [Other/audit_protocol.md](Other/audit_protocol.md) | How the team directs and checks agent work |
| [Other/audit_log.md](Other/audit_log.md) | Human-supplied evidence and review status |
| [sql/](sql/) | Numbered BigQuery SQL queries |
| [visuals/](visuals/) | The matched-period gap chart |
| [Other/](Other/) | Dataset documentation, table diagram, and audit records |
| [AGENTS.md](AGENTS.md) | Project facts and working guidance |
| [ChatGPT.md](ChatGPT.md) | Points ChatGPT to the shared project guidance |

## Data source

The analysis uses the BigQuery public table above. The City of Chicago dataset documentation is linked in [Other/README.md](Other/README.md). Data files are not stored in this repository.

## Earlier exploration

The project began by exploring total taxi trips, busy weekdays and hours, available years, and 2020 weekday patterns. The screenshots from that original exploration remain below as project history; the selected matched-period gap is documented in the findings and SQL files above.

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






