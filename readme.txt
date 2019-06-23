curl --user "mpetavy:$GITHUB_PWD" https://api.github.com/users/mpetavy/repos | jsonpath -q "$..[?(@.private == false)].name"
