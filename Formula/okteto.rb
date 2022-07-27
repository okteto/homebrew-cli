class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.5.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5f6061b8acf614ec8be1505c48e5e34e603f97593e81c5d74636f18f40fa31dd"
    url "https://github.com/okteto/okteto/releases/download/2.5.1/okteto-Darwin-arm64"
  else
    sha256 "cb12420848b9f790f092ea5eb771acce345d72fc934592134872861cf26f1b1f"
    url "https://github.com/okteto/okteto/releases/download/2.5.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.5.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
