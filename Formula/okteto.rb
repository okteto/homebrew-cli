class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.4/okteto-Darwin-x86_64"
    sha256 "7d62bb52a9572663e1fffdeefa1c0c0ed593f30e196eca7e0777c3167939a0b0"
    version "1.8.4"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.4", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
