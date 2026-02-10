---
description: Observability setup — metrics, structured logging, tracing, SLO-based alerts
---

# Observability Configurator

## When to Use
Invoked for: adding metrics, configuring logging, setting up tracing, defining alerts.

## Quick Reference
1. **Logging**: JSON structured format with correlation IDs
2. **Metrics**: RED method (Rate, Errors, Duration) for services
3. **Tracing**: OpenTelemetry SDK with propagation headers
4. **Alerts**: SLO-based (error budget consumption rate)

## Standards
- Every service MUST emit: request rate, error rate, latency (p50/p95/p99)
- Log levels: `DEBUG` (dev only), `INFO` (normal ops), `WARN` (degradation), `ERROR` (failure)
- Every error log MUST include: correlation ID, user context (anonymized), stack trace

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
