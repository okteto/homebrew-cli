class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.11.5"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "072f40548c870ded749d38ce958db8b9795f710918f2fe975d328b57aa7c2489"
    url "https://github.com/okteto/okteto/releases/download/1.11.5/okteto-Darwin-arm64"
  else
    sha256 "0b8bbd404d59edf3c461c8eaab1e982923823e7510a0f96879365e90bc48848f"
    url "https://github.com/okteto/okteto/releases/download/1.11.5/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.11.5", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
