class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.1/okteto-Darwin-x86_64"
    sha256 "19dce6b4a8e0147b7f70c964408d3204322fca15d245ae2bcb7f4474514f123e"
    version "1.10.1"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
