class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.10/okteto-Darwin-x86_64"
    sha256 "9339fcd909365f5e2b626f4e97bd93c21b649c1ab10ebc735b54f65ea3c6e3b7"
    version "1.8.10"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.10", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
