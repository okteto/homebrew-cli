class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.2.0/okteto-darwin-amd64"
    sha256 "cb23b0027ec50f67f7664f682d8b8efd2c249de733108f891663e14b6d69018c"
    version "0.2.0"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.2.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
