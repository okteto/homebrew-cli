class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "278c377c7b7208c07e91ec000ab857919ad25e7513a80ab6959f6c4e8b4309c2"
    url "https://github.com/okteto/okteto/releases/download/1.12.3/okteto-Darwin-arm64"
  else
    sha256 "7fd82c9e60e0d384bcd2107a7ca612324062076ebdda050875abec1f9828d12c"
    url "https://github.com/okteto/okteto/releases/download/1.12.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
