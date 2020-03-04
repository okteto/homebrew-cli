class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.7.5/okteto-Darwin-x86_64"
    sha256 "5522cf8fa05b20892d07b7cffa67c995a5ff18939022531fd131c1d5124dc130"
    version "1.7.5"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.7.4", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
