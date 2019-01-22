class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.4.4/okteto-darwin-amd64"
    sha256 "08d2a21735b42b01fd3559147b2f534ffe346a54e390997d164c37d5205905a8"
    version "0.4.4"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.4.4", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
