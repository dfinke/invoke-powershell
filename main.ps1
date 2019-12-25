"Hello from GitHub Actions"

"args"
""
$args.Count
$args

"env"
""
Get-ChildItem env:


"GITHUB_EVENT_PATH"
""
Get-Content $env:GITHUB_EVENT_PATH