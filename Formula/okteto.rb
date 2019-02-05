class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.4.5/okteto-darwin-amd64"
    sha256 "08bd9c47fe4afccecf7abe5f40ae45c570afbfd67356d08dbffcc52363a8e764"
    version "0.4.5"
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.4.5", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
