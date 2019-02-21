class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.5.11/okteto-darwin-amd64"
    sha256 "0ad8c7ea9c6c5b078a1823cd68f4606830e67740a31a221f8a3e9c0d1463eb2f"
    version "0.5.11"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.11", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
