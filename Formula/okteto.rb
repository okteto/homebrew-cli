class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.5.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5e6fc66e0688a73a406b654ff2a3454fe133c4caddd75682b5520978fc8c4192"
    url "https://github.com/okteto/okteto/releases/download/3.5.0/okteto-Darwin-arm64"
  else
    sha256 "2af0dbfdad7e3f826f993af4f52472d91b8569b4b8b71b745d81ec7bb4e5f6fd"
    url "https://github.com/okteto/okteto/releases/download/3.5.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.5.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
