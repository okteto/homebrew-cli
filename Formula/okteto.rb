class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.1.2/okteto-darwin-amd64"
    sha256 "5f7f111baff6d1c769751e21a140a0b82f350d9cf9b6d10e8d426864b836f569"
    version "0.1.2"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.1.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
