class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.9.4/okteto-Darwin-x86_64"
    sha256 "c714484f05ff5a2baa133eb15bbb99a91253d0cad29f2e4ed6e3b8bad519deea"
    version "1.9.4"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.9.4", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
