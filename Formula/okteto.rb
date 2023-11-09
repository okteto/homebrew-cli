class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.22.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "bc28859f6d402fcc7ee293e057549d41aa2da88577c72535a51d9ed7b80f1edc"
    url "https://github.com/okteto/okteto/releases/download/2.22.2/okteto-Darwin-arm64"
  else
    sha256 "3e7ad7668f0c4dc646e8ede2e0eab831a5b4fbfee3e0cf16d6fc4a8b473ac294"
    url "https://github.com/okteto/okteto/releases/download/2.22.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.22.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
