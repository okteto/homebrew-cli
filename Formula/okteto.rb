class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.7.2/okteto-darwin-amd64"
    sha256 "c896ad18df6f736889bea5524fd0ec68c6351431a930a74e729da2a9cbb99557"
    version "0.7.2"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.7.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
