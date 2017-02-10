

###########################
# VIM
###########################
$VimPath = "C:/gvim/./vim.exe"
set-alias vim $VimPath

function view {
    Param(
        [parameter(Mandatory=$true)]
        [String] $FilePath
    )

    vim $FilePath
}

# To edit the Powershell Profile
# (Not that I'll remember this)
Function Edit-Profile {
    vim $profile
}

# To edit Vim settings
Function Edit-Vimrc {
    vim $HOME\.vimrc
}


