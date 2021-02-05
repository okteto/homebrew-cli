class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.6/okteto-Darwin-x86_64"
    sha256 "60245291a4d451b4ec435620dcfb7641c5027abc0e4415919e03cafe70840b39"
    version "1.10.6"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.6", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
