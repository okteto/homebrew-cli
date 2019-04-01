class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.6.5/okteto-darwin-amd64"
    sha256 "a12be11578553ef32e4f3a7c08cdd7c54338c7afb3d25cab1b4edb875252adba"
    version "0.6.5"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.6.5", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
