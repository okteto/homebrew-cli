class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.8.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "35ff8af016f0607ab0443a2b94633a598f24d8089a0e0d5c690e00bb3b021643"
    url "https://github.com/okteto/okteto/releases/download/3.8.0/okteto-Darwin-arm64"
  else
    sha256 "e9d674088b8f1e58d23f785ef08b3af2144d0c1b9e4af29546e7089d8fcbd9ec"
    url "https://github.com/okteto/okteto/releases/download/3.8.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.8.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
