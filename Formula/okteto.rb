class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.4/okteto-darwin-amd64"
    sha256 "3a6951935797c2f16d423d888d51e9d9731afd432176bbdccd6069c3b50e9652"
    version "0.5.4"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.4", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
