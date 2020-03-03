#Apps aliases

app() {
  if [ -d "${HOME}/peertransfer/code/$1" ]; then
    cd "${HOME}/peertransfer/code/$1"
  elif [ -d "/home/vagrant/code/platform/apps/$1" ]; then
    cd "/home/vagrant/code/platform/apps/$1"
  elif [ -d "${HOME}/peertransfer/code/platform/apps/$1" ]; then
    cd "${HOME}/peertransfer/code/platform/apps/$1"
  else
    echo "404 app not found :("
  fi
}

iapp() {
  dirtomove=$(ls "${HOME}/peertransfer/code" "${HOME}/peertransfer/code/platform/apps" | fzf)
  app $dirtomove
}

infra() {
  if [ -d "/home/vagrant/code/platform/infra/$1" ]; then
    cd "/home/vagrant/code/platform/infra/$1"
  else
    cd "${HOME}/peertransfer/code/platform/infra/$1"
  fi
}

platform() {
  if [ -d "/home/vagrant/code/platform" ]; then
    cd "/home/vagrant/code/platform"
  else
    cd "${HOME}/peertransfer/code/platform"
  fi
}
