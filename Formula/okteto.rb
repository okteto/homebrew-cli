class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.4.3/okteto-darwin-amd64"
    sha256 "1dbb4ddbc7f032699869bb61a971e7dbaeab7d9e6e503098aed8339f006e46dd"
    version "0.4.3"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.4.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
