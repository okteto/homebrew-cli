class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.4.0/okteto-darwin-amd64"
    sha256 "69c8a6a4831ed8a85046267d35f0ba1b54134ba9cc10e63803508ab094733188"
    version "0.4.0"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.4.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
