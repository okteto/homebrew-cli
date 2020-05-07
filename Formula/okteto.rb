class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.7/okteto-Darwin-x86_64"
    sha256 "f4ec6cd1dba9b84dc1b30e90e019547da62744f92c9ef784738aa05b52389976"
    version "1.8.7"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.7", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
