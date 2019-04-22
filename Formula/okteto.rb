class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/0.7.3/okteto-darwin-amd64"
    sha256 "43f58c453d4dc35fbc97d0b19830a3916fcdc8a2005cc601d3da566495ffa1ee"
    version "0.7.3"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-darwin-amd64"
    end
    
    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 0.7.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
