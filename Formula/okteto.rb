class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.15.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f7490ab97806d97ab753aa8cb0a1ec066bd22b8b48b8ea91ca8f7ed1e02acb60"
    url "https://github.com/okteto/okteto/releases/download/2.15.3/okteto-Darwin-arm64"
  else
    sha256 "282f9e347fed063cb6490418fb9b8b555667257c2e1d3301b001582834b46ff8"
    url "https://github.com/okteto/okteto/releases/download/2.15.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.15.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
