#!/usr/bin/env fish

if type -q nvm
  nvm install lts
  echo "lts" >> ~/.nvmrc
  sudo npm i -g commitizen cz-conventional-changelog yarn bun
end
