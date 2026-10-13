#!/usr/bin/env bash
# Opens the UC7 demo PR: adds misconfigured Terraform + privileged pod manifest.
set -euo pipefail
BR="demo/uc7-$(date +%H%M%S)"
git checkout -b "$BR"
cp -R pr-payload/terraform ./terraform
cp pr-payload/k8s/privileged-pod.yaml k8s/privileged-pod.yaml
git add terraform k8s/privileged-pod.yaml
git commit -m "Add payments infra and rogue debug pod"
git push -u origin "$BR"
gh pr create --fill --title "Add payments infra (UC7 demo)" --body "Demo PR: IaC misconfigs + privileged pod."
