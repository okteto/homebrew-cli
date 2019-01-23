class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.1/okteto-darwin-amd64"
    sha256 "1a8397f4fc905baf022b4c346cb894f01fd2dc3e83db03407785f740cf7e67cf"
    version "0.5.1"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
