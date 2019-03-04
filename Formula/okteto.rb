class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.6.2/okteto-darwin-amd64"
    sha256 "7ea8bfa522bbe0f727467d83c44bcaaa449ffbc95db5a0050689677f1eef8d97"
    version "0.6.2"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.6.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
