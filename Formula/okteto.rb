class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.6.3/okteto-darwin-amd64"
    sha256 "7bf2a6206681f2c5589ff3335c001d852fef0372b066db83633250babc5f0ef7"
    version "0.6.3"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.6.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
