class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.3/okteto-darwin-amd64"
    sha256 "1e9e9f33e28021973f65e1fed7e88dc2ed12a938510792e935c431eb7c4a899e"
    version "0.5.3"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
