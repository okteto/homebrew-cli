class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.19.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "54d518b41d6e337d89db82a6f004662147b88a20445574e088010ffc733c8af6"
    url "https://github.com/okteto/okteto/releases/download/3.19.0/okteto-Darwin-arm64"
  else
    sha256 "84ad59408742f27aede773e122a5b5f5b6554f56f35eddb5ede4095a0fd45cfc"
    url "https://github.com/okteto/okteto/releases/download/3.19.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.19.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
