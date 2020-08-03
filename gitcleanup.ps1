# Remove old STL and PNG files from git history to save space
# You do not need this script unless you are maintaining a git repository with these media files

git filter-branch -f --tree-filter "rm -rf *.stl && rm -rf *.png" --prune-empty -- --all

Write-Output "git reflog expire --expire=now --all"
git reflog expire --expire=now --all

Write-Output "git gc --prune=now"
git gc --prune=now --aggressive

Invoke-Expression ".\make.ps1 -clean -stl -png" 

Write-Output "============================================="
Write-Output "git push --all --force"
git add *
git commit -m "gitcleanup.ps1"
git push --all --force
git status
