# 02-Networking

Creates the base VPC networking layer: a VPC, public and private subnets
spread across multiple AZs, an internet gateway, and route tables.

## Resources

- `aws_vpc.main` — the VPC (`var.vpc_cidr`, default `10.0.0.0/16`)
- `aws_subnet.public[*]` — public subnets, one per AZ, auto-assign public IP
- `aws_subnet.private[*]` — private subnets, one per AZ, no public IP
- `aws_internet_gateway.main` — attached to the VPC
- `aws_route_table.public` — routes `0.0.0.0/0` to the internet gateway,
  associated with all public subnets
- `aws_route_table.private` — no default route (add a NAT gateway route
  here if private subnets need outbound internet access)

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Files

| File                    | Purpose                                   |
| ------------------------ | ------------------------------------------ |
| `versions.tf`            | Terraform and provider version constraints |
| `provider.tf`            | AWS provider configuration                 |
| `variables.tf`           | Input variable declarations                |
| `terraform.tfvars`       | Default variable values                    |
| `vpc.tf`                 | VPC resource                               |
| `subnets.tf`             | Public and private subnets                 |
| `internet_gateway.tf`    | Internet gateway                           |
| `route_tables.tf`        | Route tables and associations              |
| `outputs.tf`             | Output values for downstream modules       |

## Notes

- No NAT gateway is provisioned, to avoid ongoing cost while learning.
  Add one plus a route in `aws_route_table.private` if private subnets
  need outbound internet access.
