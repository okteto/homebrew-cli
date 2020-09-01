class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.18/okteto-Darwin-x86_64"
    sha256 "0e855660bf4951ed956fbfe140cbfaa24f0a13775bd95479f52c6b93086c752f"
    version "1.8.18"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.18", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
