class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.0.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "af8d23eca623036ac235332f116300a4bdedb458ae935b4c2c480d93dc284223"
    url "https://github.com/okteto/okteto/releases/download/2.0.3/okteto-Darwin-arm64"
  else
    sha256 "c35c55c2276807e4a923f060174ae32f1c3792994fba27a10e6a551f75119762"
    url "https://github.com/okteto/okteto/releases/download/2.0.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.0.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
