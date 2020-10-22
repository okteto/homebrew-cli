class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.9.3/okteto-Darwin-x86_64"
    sha256 "24c7befed85dd13e70ee67a6994996a9e49698684d7d0d3608d94d15a6cf99a5"
    version "1.9.3"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.9.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
