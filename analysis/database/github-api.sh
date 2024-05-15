# https://github.com/cli/cli
# https://docs.github.com/en/rest/commits/commits?apiVersion=2022-11-28#list-commits-on-a-repository
brew install gh

# GitHub CLI api
# https://cli.github.com/manual/gh_api

gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/OWNER/REPO/compare/BASEHEAD 
