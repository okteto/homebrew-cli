class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.6/okteto-darwin-amd64"
    sha256 "373524433e7250e7dcb4066cabc0d83fe8bc6a7d5334caae1f0d3ffacd96b4e9"
    version "0.5.6"
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.6", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
