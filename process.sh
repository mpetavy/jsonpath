curl --user "mpetavy:$GITHUB_PWD" https://api.github.com/users/mpetavy/repos?per_page=1000 | jsonpath -q "$..[?(@.private == false)].name" | while read -r line; do echo process $line; done
