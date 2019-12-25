"Hello from GitHub Actions"

Import-Module /workdir/PSGHA.psm1

"args"
""
$args.Count
$args

"env"
""
Get-ChildItem env:


"GITHUB_EVENT_PATH"
""
Get-GitHub

"Repository"
""
Get-Repository