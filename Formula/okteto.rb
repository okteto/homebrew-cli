class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.5/okteto-Darwin-x86_64"
    sha256 "5c37de70aca43943dae4f480e992dcf957542a9dfc03374139ae6e81cf496b92"
    version "1.10.5"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.5", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
