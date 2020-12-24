class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.3/okteto-Darwin-x86_64"
    sha256 "34208d1114bf6b128c6cf02f1c96beb76c926cc7bcc0a09c70c3411f34fbe8c4"
    version "1.10.3"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
