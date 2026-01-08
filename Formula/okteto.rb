class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.15.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "250065901ea99da3b78967f78a95c64663d0948405ec0df3f0c63c369594f792"
    url "https://github.com/okteto/okteto/releases/download/3.15.0/okteto-Darwin-arm64"
  else
    sha256 "6b64962dd4088caf99927d232019111a197a48ed821a95cf65dc6ceb7fc1b15a"
    url "https://github.com/okteto/okteto/releases/download/3.15.0/okteto-Darwin-x86_64"
  end

  head do
    if Hardware::CPU.arm?
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-arm64"
    else
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "okteto-Darwin-arm64"
      mv bin/"okteto-Darwin-arm64", bin/"okteto"
    else
      bin.install "okteto-Darwin-x86_64"
      mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end
  end

  # Homebrew requires tests.
  test do
      assert_match "okteto version 3.15.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
