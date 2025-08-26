# Verification Checklist

- [ ] Edge rejects requests containing **both** `Content-Length` **and** `Transfer-Encoding`.
- [ ] HTTP/2 kept **end-to-end** (no H2→H1 downgrade on internal hops).
- [ ] `Transfer-Encoding` disabled where not needed; strict `Content-Length`.
- [ ] Back-end frameworks upgraded; reverse proxy and app **parse consistently**.
- [ ] After changes, PoC requests in `/poc` are blocked with clear 4xx responses.

## References
- PortSwigger – How to prevent HTTP request smuggling vulnerabilities  
- StackOverflow – Content-Length vs chunked  
- MDN – Transfer-Encoding header
