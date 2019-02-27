class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.6.0/okteto-darwin-amd64"
    sha256 "7ca9ce1a930fbf6714956e7db30aca74900e326d47468e50d26d4e6de552f605"
    version "0.6.0"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.6.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
