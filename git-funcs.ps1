
function git-delete-merged {
    git branch --merged | select-string -pattern "(^\*|master|dev)" -NotMatch | foreach {git branch -d $_.ToString().Trim()}
}

######################################################
# Git aliases
######################################################

function Get-GitStatus { & git status }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

function Get-GitAdd { & git add $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitAddAll { & git add . }
New-Alias -Name gaa -Value Get-GitAddAll -Force -Option AllScope

function Get-GitCommit { & git commit $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitPull { & git pull $args }
New-Alias -Name pull -Value Get-GitPull -Force -Option AllScope

function Get-GitPush { & git push $args }
New-Alias -Name push -Value Get-GitPush -Force -Option AllScope

function Get-GitReset { & git reset $args }
New-Alias -Name gr -Value Get-GitReset -Force -Option AllScope

function Get-GitUnstage { & git reset HEAD }
New-Alias -Name unstage -Value Get-GitUnstage -Force -Option AllScope

function Get-GitCheckout { & git checkout $args }
New-Alias -Name gco -Value Get-GitCheckout -Force -Option AllScope

function Get-GitDiff { & git diff $args }
New-Alias -Name gd -Value Get-GitDiff -Force -Option AllScope

function Get-GitStash { & git stash $args }
New-Alias -Name stash -Value Get-GitStash -Force -Option AllScope

function Get-DevelopBranch{ & git checkout develop }
New-Alias -Name dev -Value Get-DevelopBranch -Force -Option AllScope

function Get-MasterBranch{ & git checkout master }
New-Alias -Name master -Value Get-MasterBranch -Force -Option AllScope

######################################################################
## Some nice git log formats
######################################################################

function Get-GitLogWhoDunnit { & git log --pretty="format:%an - %s" $args }
New-Alias -Name gwhodunnit -Value Get-GitLogWhoDunnit -Force -Option AllScope

function Get-GitLogOneLiner { git log --pretty=oneline --abbrev-commit --decorate $args }
New-Alias -Name gl1l -Value Get-GitLogOneLiner -Force -Option AllScope

function Get-GitLogOneLinerGraph { git log --pretty=oneline --abbrev-commit --decorate --graph $args }
New-Alias -Name gl1lg -Value Get-GitLogOneLinerGraph -Force -Option AllScope


######################################################################
## Default g for git
######################################################################
function Get-Git { & git $args }
New-Alias -Name g -Value Get-Git -Force -Option AllScope

