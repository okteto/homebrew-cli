class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.24.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "880cd016e9d49e9c889cebd02e2679c7b08e85e1784039062b4e38619448c1e0"
    url "https://github.com/okteto/okteto/releases/download/2.24.1/okteto-Darwin-arm64"
  else
    sha256 "6ee0f04d451b84a5d066636a349f81454588cfe14c0811f935817ea61b4d4168"
    url "https://github.com/okteto/okteto/releases/download/2.24.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.24.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
