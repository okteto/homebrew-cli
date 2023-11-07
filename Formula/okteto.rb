class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.22.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d11242d15252be77b88d33334099c893f4b04b5b2ec20642e28b65ce9a4f5f36"
    url "https://github.com/okteto/okteto/releases/download/2.22.0/okteto-Darwin-arm64"
  else
    sha256 "b6c9554b66c1db2d42a4813802c93fcee542042cc9131e37cf5b01ec1a809693"
    url "https://github.com/okteto/okteto/releases/download/2.22.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.22.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
