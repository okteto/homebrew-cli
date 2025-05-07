class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.7.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "8b82c6088fd2accd37bdc698eea1379fe9a54094e9336938cdaa1d3e91cf7e17"
    url "https://github.com/okteto/okteto/releases/download/3.7.0/okteto-Darwin-arm64"
  else
    sha256 "14642f84536e6f4d395b7f0df5efd5283fa28ee1915be74f004d1dd28c39dab0"
    url "https://github.com/okteto/okteto/releases/download/3.7.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.7.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
