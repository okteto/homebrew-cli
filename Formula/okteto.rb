class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/latest/download/okteto-Darwin-x86_64"
    sha256 "b47574583c7b1d7278657c0f42b966396608400043561de8e50f205656d69319"
    version "1.7.2"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.7.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
