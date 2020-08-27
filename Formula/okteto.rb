class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.17/okteto-Darwin-x86_64"
    sha256 "fd4d6d3b8d603be22c9f0272961f6c29fa2d264f81f70e53e7a6d69610398e32"
    version "1.8.17"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.17", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
