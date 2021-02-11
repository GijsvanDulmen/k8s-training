#!/bin/bash
helm template --debug --dry-run test123 . --values ./values-production.yaml