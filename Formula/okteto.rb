class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.7/okteto-darwin-amd64"
    sha256 "b7845cff125ca7359212f94faeca3d80a736475f2553971bdc277207dcb6611d"
    version "0.5.7"
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.7", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
