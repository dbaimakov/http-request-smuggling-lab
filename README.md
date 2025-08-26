# HTTP Request Smuggling Lab

A focused lab showing how I detected and validated an **HTTP Request Smuggling (HRS)** issue (true positive) using WebInspect, and how to reproduce the behavior without Burp Suite Professional.

## What’s here
- **poc/** – raw requests for CL.TE and TE.CL styles you can replay (curl/openssl).
- **automation/** – a tiny header probe to sanity-check edge behavior.
- **evidence/** – sanitized WebInspect notes/exports.
- **mitigations/** – concise guidance + verification checklist.
- **docs/** – short explanations, diagrams, and references.

> Educational use only. Only test systems you own or are authorized to assess.

## High-level idea
When a front-end proxy and a back-end server **disagree** about where one HTTP request ends and the next begins (e.g., conflicting `Content-Length` and `Transfer-Encoding: chunked`), an attacker can **smuggle** a hidden request that the back end processes unexpectedly.

```mermaid
sequenceDiagram
  participant Client
  participant FrontEnd as Front-end (Proxy/CDN)
  participant BackEnd as Back-end (App)

  Client->>FrontEnd: POST (CL=6 + TE: chunked)
  Note right of FrontEnd: Parses by Content-Length (6)
  FrontEnd->>BackEnd: Forwards bytes
  Note right of BackEnd: Parses by Transfer-Encoding (chunked)
  BackEnd-->>FrontEnd: Processes smuggled content
