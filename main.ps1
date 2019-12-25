"Hello from GitHub Actions"

Import-Module /workdir/PSGHA.psm1

$eventPayload = Get-GitHub

function Get-AuthorizedHeader {
    $GITHUB_TOKEN = $env:GITHUB_TOKEN
    @{
        Authorization = "token $GITHUB_TOKEN"
    }
}

$body = @{'body' = "[$(Get-Date)] hello world" } | ConvertTo-Json

$irmParams = @{
    # Uri     = $eventPayload.issue.comments_url
    Method  = "Post"
    Uri     = Get-CommentsUrl
    Headers = Get-Header
    Body    = $body
}

Invoke-RestMethod @irmParams

Show-GitHubToken

#$eventPayload | ConvertTo-Json -depth 5