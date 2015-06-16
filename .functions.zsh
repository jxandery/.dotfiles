# ----- #
# shell #
# ----- #

# cd to dotfile repo and open in editor
function dotf() {
  cd ~/.dotfiles && vim .
}

# create a new directory and enter it
function mkd() {
  if [ $# -lt 1 ]; then
    echo "Missing argument";
    return 1;
  fi

  mkdir -p "$@" && cd "$@"
}

# touch a file and create path
function supertouch() {
  if [ $# -lt 1 ]; then
    echo "Missing argument";
    return 1;
  fi

  for f in "$@"; do
    mkdir -p -- "$(dirname -- "$f")"
    touch -- "$f"
  done
}

# cd into a specifc gem's source code
function 2gem() {
  cd "$(dirname $(gem which $1))"
}

# show directory history
fucntion d() {
  if [ $# -lt 1 ]; then
    dirs -v | head -10
  fi

  cd -$@
}

# --- #
# git #
# --- #

function gcm() {
  args=$@
  git commit -m "$args"
}
function gca() {
  args=$@
  git commit --amend -m "$args"
}

# ----- #
# rails #
# ----- #

# rails project generator
function rails_pg() {
  rails new $1 -T -B --database=postgresql

  cd $1

  add_rails_gems
  bundle
  rails generate rspec:install

  git init
  git add .
  git commit -m "initial commit"

  vim .;
}

function add_rails_gems() {

echo "
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'pry-rails'
  gem 'awesome_print'
end
" >> Gemfile;

}
