class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.0/okteto-darwin-amd64"
    sha256 "e7bafd00da037eab2f61c77468c68047bfd3140eb41fdc1418fec491990efee5"
    version "0.5.0"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
