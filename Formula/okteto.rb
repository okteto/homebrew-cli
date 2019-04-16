class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.7.1/okteto-darwin-amd64"
    sha256 "a235d474f77a3f384cfb1d3f4afff51453000c076853d34ad97f45880a4a7798"
    version "0.7.1"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.7.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
