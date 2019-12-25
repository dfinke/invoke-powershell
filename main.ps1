"Hello from GitHub Actions"

Import-Module /workdir/PSGHA.psm1

$eventPayload = Get-GitHub

$body = @{'body' = "[$(Get-Date)] Comment added by your friendly neighborhood github action" } | ConvertTo-Json

$irmParams = @{
    # Uri     = $eventPayload.issue.comments_url
    Method  = "Post"
    Uri     = Get-CommentsUrl
    Headers = Get-Header
    Body    = $body
}

Invoke-RestMethod @irmParams