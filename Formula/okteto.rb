class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.8"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "01efb281d9b061efec04a6f4d9f9b94f50a21d7df70f103898e9b6ed25589959"
    url "https://github.com/okteto/okteto/releases/download/1.15.8/okteto-Darwin-arm64"
  else
    sha256 "57f722bd471378cca39fca468f7122e2569c387421226db698f2b8b989271ebe"
    url "https://github.com/okteto/okteto/releases/download/1.15.8/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.8", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
