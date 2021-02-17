class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.10.7"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "5b802c17f5fe8dc21bdd6024d71f9f4065970060b20ecfd202daaf4cae3f67cf"
    url "https://github.com/okteto/okteto/releases/download/1.10.7/okteto-Darwin-arm64"
  else
    sha256 "c0c741497a51592a18f98df7023af39f26dbd37d29a327ce9a8ed2d81d27eba2"
    url "https://github.com/okteto/okteto/releases/download/1.10.7/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.10.7", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
