class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.27.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "0baeea554e64e9937c2b041c55c341945da3ce02e8c0847d707d9c7419ec402d"
    url "https://github.com/okteto/okteto/releases/download/2.27.1/okteto-Darwin-arm64"
  else
    sha256 "cc7509eed9ccef41731223f062deebb398f32ac6fd68694a800aa33de8fc8d0e"
    url "https://github.com/okteto/okteto/releases/download/2.27.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.27.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
