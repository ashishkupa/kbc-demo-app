# kbc-demo-app (UC7 shift-left demo)
Benign Flask service with deliberately old dependencies and an EOL base image.
Nothing in `pr-payload/` is ever applied; it exists only to generate PR findings.

## Setup (once)
1. Push this repo to your GitHub org.
2. Upwind console: connect GitHub (install Upwind GitHub App), then enable scanning for this repo
   under Code > Organizations & Repositories.
3. Repo secrets: `UPWIND_CLIENT_ID`, `UPWIND_CLIENT_SECRET`.
4. Upwind console: Code > Management, set warn/block thresholds for Source code, IaC, Secrets, Container image.
5. GitHub branch ruleset on `main`: require `Upwind-Code-Sca`, `Upwind-Code-Iac`, `Upwind-Code-Secrets`
   and the `build` job.

## Demo
Run `./make-demo-pr.sh`. Show PR comments, failing checks, blocked merge, then the findings in Upwind.
Admission half: apply `pr-payload/k8s/privileged-pod.yaml` to the cluster, expect Block.
