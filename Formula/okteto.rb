class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.1.1/okteto-darwin-amd64"
    sha256 "0af016f499196f9608aebd460228cbd7eff4f19dc381a5708c0383ba1ca6f987"
    version "0.1.1"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.1.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
