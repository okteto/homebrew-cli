class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.4.1/okteto-darwin-amd64"
    sha256 "ed80893b28d38c7709bfeda05b4baf9edf28a42e5b11afcab9fb366bbe2a37e9"
    version "0.4.1"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.4.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
