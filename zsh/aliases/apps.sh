#Apps aliases

app() {
  if [ -d "${HOME}/peertransfer/code/$1" ]; then
    cd "${HOME}/peertransfer/code/$1"
  else
    echo "404 app not found :("
  fi
}

function merge-to-monoenv() {
  if [ $# -ne 1 ]; then
    echo "usage: merge-to-monoenv <environment>"
    return -1
  fi
  ENVIRONMENT=$1
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git checkout $ENVIRONMENT && git pull origin $ENVIRONMENT && git merge $BRANCH && git commit --allow-empty -m "[SKIP_MANUAL]"
  git checkout $BRANCH
}
