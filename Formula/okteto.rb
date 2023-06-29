class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.16.5"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ffe6c958025308d4e1ea01a7db12d045ed2d7cc993fe702e83108a2cbe06d23c"
    url "https://github.com/okteto/okteto/releases/download/2.16.5/okteto-Darwin-arm64"
  else
    sha256 "84d0ba00d512723509a6e7ebcd3369c7f81472ac5c0f28468881421486bd16b4"
    url "https://github.com/okteto/okteto/releases/download/2.16.5/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.16.5", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
