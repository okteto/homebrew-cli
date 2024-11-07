class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.1.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "de6ebbf6761b10ad0acb52e6bbee2a0e4359e4b6aaf003a07e22e47a6895a3f6"
    url "https://github.com/okteto/okteto/releases/download/3.1.0/okteto-Darwin-arm64"
  else
    sha256 "a82cba424b280457784557fd410a0a2652a39931a0e18616ac46b76386860287"
    url "https://github.com/okteto/okteto/releases/download/3.1.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.1.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
