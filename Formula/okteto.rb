class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/okteto-Darwin-x86_64"
    sha256 "5bd4fcc2921a9864c44607b6e00a7bb30c919ea6f4e5839db00190bb9fc17962"
    version "1.4.6"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.4.6", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
