class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ec7b8175db4eeb6b38bd11ac17539010554662dd2c7edcc8ff20f9dd430e6492"
    url "https://github.com/okteto/okteto/releases/download/1.12.0/okteto-Darwin-arm64"
  else
    sha256 "82e7ac391bb1be97da9769cb0e56fb4ce04c7a8862f28f3666af4307687dca19"
    url "https://github.com/okteto/okteto/releases/download/1.12.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
