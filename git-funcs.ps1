
function git-delete-merged {
    git branch --merged | select-string -pattern "(^\*|master|dev)" -NotMatch | foreach {git branch -d $_.ToString().Trim()}
}

