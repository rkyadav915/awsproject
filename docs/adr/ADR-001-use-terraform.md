# ADR-001: Use Terraform for AWS Infrastructure

## Status
Accepted

## Date
2026-08-05

## Context
This project provisions and manages AWS infrastructure. We need a consistent,
version-controlled way to define infrastructure so that changes are
repeatable, reviewable, and not dependent on manual console clicks.

## Decision
We will use Terraform (HashiCorp) as the infrastructure-as-code tool for
provisioning and managing AWS resources in this project.

## Consequences
- Infrastructure changes go through `.tf` files and are reviewed like code.
- State is tracked via `terraform.tfstate`; state files and the `.terraform/`
  working directory are excluded from git (see `.gitignore`).
- Requires the team to know HCL and Terraform workflows (`init`, `plan`,
  `apply`).
- Provider binaries and lock files (`.terraform.lock.hcl`) pin exact provider
  versions for reproducibility.

## Alternatives Considered
- **AWS CloudFormation** — native to AWS but more verbose and less portable
  across other tooling/providers.
- **AWS CDK** — code-first, but adds a compilation/runtime dependency instead
  of a declarative config.
- **Manual console changes** — no version control, not repeatable, high risk
  of drift.
