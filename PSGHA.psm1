function Get-GitHub {
    param(
        [Switch]$Raw
    )

    $content = Get-Content $env:GITHUB_EVENT_PATH
    if ($Raw) {
        return $content
    }

    $content | ConvertFrom-JSON
}

function Get-Stargazers {
    (Get-GitHub).repository.stargazers
}

function Get-Forks {
    (Get-GitHub).repository.forks
}

function Get-Actor {
    $env:GITHUB_ACTOR
}

function Get-Sender {
    (Get-GitHub).sender
}

function Get-Owner {
    (Get-GitHub).repository.owner
}

function Get-Repository {
    (Get-GitHub).repository
}

function Get-Commits {
    (Get-GitHub).commits
}

function Get-HeadCommit {
    (Get-GitHub).head_commit
}

function Get-Pusher {
    (Get-GitHub).pusher
}

function Get-CommitMessage {
    (Get-GitHub).head_commit.message
}

function Get-RepoFullname {
    (Get-GitHub).repository.full_name
}

function Get-DefaultBranch {
    (Get-GitHub).repository.default_branch
}

function Get-Ref {
    $env:GITHUB_REF
}

function Get-RepoToken {
    $token = $env:INPUT_REPOTOKEN
    if ($null -eq $token -or $token.Trim().Length() -eq 0) {
        $token = "Token not found"
    }
}

function Get-PullURI {
    $URI = "https://api.github.com"
    "${URI}/repos/$(Get-RepoFullname)/pulls"
}

function Get-Header {
    @{
        Authorization = "token $(Get-RepoToken)"
    }
}

function Get-Body {
    @"
{
	"title": "$(Get-CommitMessage)",
	"head": "$(Get-Ref)",
	"base": "$(Get-DefaultBranch)"
}
"@
}

function Get-InvokeRestMethodParams {
    @{
        Method  = "Post"
        Uri     = Get-PullURI
        Headers = Get-Header
        Body    = Get-Body
    }
}

function Get-AllSettings {
    [PSCustomObject][Ordered]@{
        "Actor"                  = (Get-Actor)
        "Sender"                 = (Get-Sender)
        "Owner"                  = (Get-Owner)
        "Repository"             = (Get-Repository)
        "Commits"                = (Get-Commits)
        "HeadCommit"             = (Get-HeadCommit)
        "Pusher"                 = (Get-Pusher)
        "CommitMessage"          = (Get-CommitMessage)
        "RepoFullname"           = (Get-RepoFullname)
        "DefaultBranch"          = (Get-DefaultBranch)
        "Ref"                    = (Get-Ref)
        "RepoToken"              = (Get-RepoToken)
        "PullURI"                = (Get-PullURI)
        "Header"                 = (Get-Header)
        "Body"                   = (Get-Body)
        "InvokeRestMethodParams" = (Get-InvokeRestMethodParams)
    }
}