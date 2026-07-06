# 1. Create a new orphan branch (no history)

git checkout --orphan temp_branch

# 2. Add all current files

git add -A

# 3. Commit them as the first commit

git commit -m "Initial commit"

# 4. Delete the old branch (e.g. main)

git branch -D main

# 5. Rename current branch to main

git branch -m main

# 6. Force push, overwriting remote history

git push -f origin main
