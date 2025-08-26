# WebInspect Findings (sanitized)

- Scanner: Micro Focus / OpenText WebInspect
- Result: **True Positive** – conflicting `Content-Length` + `Transfer-Encoding` accepted.
- Endpoint: [redacted]
- Repro: PoC requests in `/poc` trigger inconsistent parsing (details redacted).
- Impact: potential request smuggling → cache poisoning / auth bypass paths.
