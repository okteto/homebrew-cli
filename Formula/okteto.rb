class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.6.1/okteto-darwin-amd64"
    sha256 "df8f79849e63527efa237d827977093a713dab04ef7046327c904b3709617910"
    version "0.6.1"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.6.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
