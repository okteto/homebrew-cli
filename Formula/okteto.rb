class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.5.12/okteto-darwin-amd64"
    sha256 "bc492ea7403bf6e78a4cf50c2708202d4a0077752633796e5d06dbae66d1d865"
    version "0.5.12"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.5.12", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
