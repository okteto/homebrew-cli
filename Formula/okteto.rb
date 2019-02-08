class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.8/okteto-darwin-amd64"
    sha256 "09609693d1353bea65afc8a8aa12a67b707836a34faacf307c242f01d3977cfe"
    version "0.5.8"
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.8", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
