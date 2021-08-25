class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.6"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "8f1d1496a7a578e8cef67282be6c5b781a28a7dd43c49bcc8712deb592d25fd3"
    url "https://github.com/okteto/okteto/releases/download/1.13.6/okteto-Darwin-arm64"
  else
    sha256 "9e6122eecda5ba5f0a8e4be068f86c146f5ca2ed2ee45008d7079bbfcac01a56"
    url "https://github.com/okteto/okteto/releases/download/1.13.6/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.6", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
