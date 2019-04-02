class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.6.6/okteto-darwin-amd64"
    sha256 "b0ee4a246fa5e109054343cb4f358469071fcff78fc9a9f46659679de42a8f4c"
    version "0.6.6"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.6.6", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
