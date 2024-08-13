class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.30.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "4d430b9a68d305027930d428cd8de39d92dbea28a8440e33dc718272344c3516"
    url "https://github.com/okteto/okteto/releases/download/2.30.1/okteto-Darwin-arm64"
  else
    sha256 "482b9c851f57cd8e22e6786caafb868ad5f38088b19a20f0948fffa855710aa4"
    url "https://github.com/okteto/okteto/releases/download/2.30.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.30.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
