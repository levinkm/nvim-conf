#!/bin/bash

check_dependency() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 is not installed. Please install it first."
        exit 1
    fi
}

check_dependency "node"
check_dependency "npm"
check_dependency "go"
check_dependency "git"
check_dependency "dart"
check_dependency "flutter"

git clone --filter=blob:none https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim

nvim --headless "+TSInstall all" +qa

npm install -g pyright
npm install -g typescript typescript-language-server
npm install -g yaml-language-server
go install golang.org/x/tools/gopls@latest
dart pub global activate dart_language_server

cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
stylua . --check
EOF
chmod +x .git/hooks/pre-commit

echo ".DS_Store
.git/
lazy-lock.json
sessions/" > .gitignore