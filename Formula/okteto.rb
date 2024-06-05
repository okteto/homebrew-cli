class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.28.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f136fec374b91774a83786993283b315cd0e7e127cd434f674cc065682b89478"
    url "https://github.com/okteto/okteto/releases/download/2.28.0/okteto-Darwin-arm64"
  else
    sha256 "353c16b3234361c845d8179785853d956e1681f0f546738d5de20396d5839867"
    url "https://github.com/okteto/okteto/releases/download/2.28.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.28.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
