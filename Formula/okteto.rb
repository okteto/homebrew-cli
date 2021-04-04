class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d8fc08afb2b52360ac8bd02a805fb3369d4eb8b1003b59b112508a3227e271d6"
    url "https://github.com/okteto/okteto/releases/download/1.12.4/okteto-Darwin-arm64"
  else
    sha256 "1335dd31bdc7d9c49aea13d6d944aec33957f3444c4d8770e20dc04bcaf064f2"
    url "https://github.com/okteto/okteto/releases/download/1.12.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
