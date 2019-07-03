class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/okteto-Darwin-x86_64"
    sha256 "ef7c53c52228a3ee37e7155b473aec0a6deb8160caffcda4ccec0caa74d4c944"
    version "1.1.2"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.1.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
