class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.26.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5a89c4a40f7dfe0f3269429151b7a10d716c7139c6c3792ec67781a69058e95b"
    url "https://github.com/okteto/okteto/releases/download/2.26.2/okteto-Darwin-arm64"
  else
    sha256 "360e79582a3b73f17bd38d19c0db9d2b54f7a80ce3b2988843df2fb24f56b456"
    url "https://github.com/okteto/okteto/releases/download/2.26.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.26.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
