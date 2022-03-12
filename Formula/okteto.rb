class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.7"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d863a6a8de865655d16e2cec26929fdba305f57396fccc49ed6c732966be3412"
    url "https://github.com/okteto/okteto/releases/download/1.15.7/okteto-Darwin-arm64"
  else
    sha256 "9d33cdd9cba898981ca7a68d85517b8d62f57adc2ab2023fb95e3eecf7176db7"
    url "https://github.com/okteto/okteto/releases/download/1.15.7/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.7", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
