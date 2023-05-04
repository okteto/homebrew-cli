class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.15.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "93592f02cfe1888dc446e42e459597d958cc8bc1734e27e39e340e4ea536c3eb"
    url "https://github.com/okteto/okteto/releases/download/2.15.2/okteto-Darwin-arm64"
  else
    sha256 "332890671e8426990d359e3b6c35b5d095ce3012e27de55c597f59543855ca45"
    url "https://github.com/okteto/okteto/releases/download/2.15.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.15.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
