"Hello from GitHub Actions"

Import-Module /workdir/PSGHA.psm1

$eventPayload = Get-GitHub

$body = @{'body' = "[$(Get-Date)] hello world" } | ConvertTo-Json

$irmParams = @{
    # Uri     = $eventPayload.issue.comments_url
    Method  = "Post"
    Uri     = Get-CommentsUrl
    Headers = Get-Header
    Body    = $body
}

Invoke-RestMethod @irmParams

''
'Show-GitHubToken'
''
Get-GitHubToken
(Get-GitHubToken).GetType()


#$eventPayload | ConvertTo-Json -depth 5