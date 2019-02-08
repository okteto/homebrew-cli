class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.9/okteto-darwin-amd64"
    sha256 "e08bbb59251804a9ff42ebb0d428045466a40a5d403c7322c9ee135526f6af62"
    version "0.5.9"
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.9", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
