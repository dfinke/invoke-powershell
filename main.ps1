"Hello from GitHub Actions"

Import-Module /workdir/PSGHA.psm1

$eventPayload = Get-GitHub

$GITHUB_TOKEN = $env:GITHUB_TOKEN
$Header = @{
    Authorization = "token $GITHUB_TOKEN"
}

$body = @{'body' = "hello world" } | ConvertTo-Json

$irmParams = @{
    Uri     = $eventPayload.issue.comments_url
    Method  = "Post"
    Headers = $Header
    Body    = $body
}

Invoke-RestMethod @irmParams

#$eventPayload | ConvertTo-Json -depth 5