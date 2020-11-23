class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.0/okteto-Darwin-x86_64"
    sha256 "8d6414f25a26ede6d75bd47a76ecf2859d89400f6d679c16e28463360e734aab"
    version "1.10.0"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
