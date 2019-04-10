class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.7.0/okteto-darwin-amd64"
    sha256 "a544876db3131d28b61e3a8e3c15c4b6c813223bab09eda4557a31eca714e9cc"
    version "0.7.0"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.7.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
