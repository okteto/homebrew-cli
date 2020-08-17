class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.16/okteto-Darwin-x86_64"
    sha256 "3ba500d5d2bfd44375d4e0381eab870c6d770c65ff91bb5fd3784e16722211ed"
    version "1.8.16"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.16", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
