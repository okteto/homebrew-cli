class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.3.0/okteto-darwin-amd64"
    sha256 "610677ea78a6b15aaa6cca7fcc78fe9d0ab518507ae82c286d02f850547275ae"
    version "0.3.0"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.3.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
