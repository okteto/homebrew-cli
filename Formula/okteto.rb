class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.18.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "0e84677923f83e559f3e6f43e37a5920f6b9aef4ef6d0ca86c38f1294d13b1ba"
    url "https://github.com/okteto/okteto/releases/download/2.18.1/okteto-Darwin-arm64"
  else
    sha256 "c6013a011b73f4ad119d69fcde4ec56642dce0398367abf226dd4514fdc64439"
    url "https://github.com/okteto/okteto/releases/download/2.18.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.18.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
