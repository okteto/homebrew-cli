class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.23.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "e914cb940c001c0778c0cac0608449470ecd979d92ff4caa2b178b9736e4e045"
    url "https://github.com/okteto/okteto/releases/download/3.23.0/okteto-Darwin-arm64"
  else
    sha256 "5b4b165d5f9e216505649f7970872469470e2a7572714a42d0534b50d63d97d4"
    url "https://github.com/okteto/okteto/releases/download/3.23.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.23.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
