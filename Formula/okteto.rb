class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.7"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "9e86539812ddd6400a974c76d1369f8baa08b8ffe32f80b05407ef1b4a8ca8f9"
    url "https://github.com/okteto/okteto/releases/download/1.13.7/okteto-Darwin-arm64"
  else
    sha256 "1d31073d48c0f69f959dae1510c7dcb6c0766cfe7eaddff53dee378114906c88"
    url "https://github.com/okteto/okteto/releases/download/1.13.7/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.7", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
