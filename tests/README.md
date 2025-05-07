# Testing AWS ECR Terraform Module

This directory contains tests for the Terraform AWS ECR module.

## Requirements

- Go 1.20 or later
- Terraform CLI
- AWS Credentials (for running non-plan-only tests)

## Running Tests

From the `tests` directory, run:

```bash
go test -v -timeout 30m
```

## Test Coverage

The tests validate:

1. Module initialization works correctly
2. Plan generation is successful with valid inputs
3. Required files exist in the module

## Adding More Tests

To add more comprehensive tests, consider:

- Testing actual resource creation (remove PlanOnly flag)
- Validating outputs against expected values
- Testing different configuration combinations