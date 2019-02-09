class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.5.10/okteto-darwin-amd64"
    sha256 "6cad83db2d137599c16ad011ee6029971976ea4dd5697a7585e2311eab696782"
    version "0.5.10"
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.10", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
