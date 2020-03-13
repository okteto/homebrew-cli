class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.1/okteto-Darwin-x86_64"
    sha256 "b4a5adff11c7d87450f043d3fcfd104e5b6a17287f342a03b9ad3ba8e06ba134"
    version "1.8.1"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
