# Platform Architecture

## Overview
This project provisions AWS infrastructure using Terraform, organized into
numbered stages under the repo root as learning/build progresses.

## Current State

### Provider
- AWS, region `us-east-1` (`02-terraform/01-basics/providers.tf`)

### Resources
- `aws_s3_bucket.terraform_demo` — demo bucket (`02-terraform/01-basics/main.tf`)

### Layout
```
02-terraform/
└── 01-basics/
    ├── main.tf         # resources
    ├── network.tf      # networking (not yet defined)
    ├── output.tf        # outputs
    ├── providers.tf     # provider config
    ├── variables.tf     # input variables
    └── versions.tf       # required provider/Terraform versions
```

## Decisions
See [ADR-001: Use Terraform](../adr/ADR-001-use-terraform.md) for why
Terraform was chosen as the IaC tool.

## Planned / Not Yet Built
- Networking (`network.tf` is currently empty — VPC, subnets, etc. TBD)
- IAM roles/policies beyond defaults
- Additional stages beyond `01-basics`

## State Management
- Local state (`terraform.tfstate`) — not committed to git; see `.gitignore`.
- No remote backend configured yet.
