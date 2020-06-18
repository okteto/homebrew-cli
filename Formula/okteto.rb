class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.12/okteto-Darwin-x86_64"
    sha256 "378fbcb9911af8ec98534c0774fe152e7a1ec7598b0eaee989e8c26839caa5da"
    version "1.8.12"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.12", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
