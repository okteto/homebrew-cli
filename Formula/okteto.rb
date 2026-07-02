class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.21.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d6a1748009bce5c6f0d05c51fccded86fa63acf1a1295304ded44d6ff5711d57"
    url "https://github.com/okteto/okteto/releases/download/3.21.0/okteto-Darwin-arm64"
  else
    sha256 "d91f7fcc8977af345fe5130159152b0579cc5d8fdc84f4714a5a2f84b3d0b820"
    url "https://github.com/okteto/okteto/releases/download/3.21.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.21.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
