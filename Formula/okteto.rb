class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.6"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "3470960d9122a141ebe2ccba1c1f7a74abe4796850a7da2731c625a697126667"
    url "https://github.com/okteto/okteto/releases/download/1.15.6/okteto-Darwin-arm64"
  else
    sha256 "612d1f0a1d9dbd0bf8c468a54340a6033f08bbb53b47b90e4f13832b17618806"
    url "https://github.com/okteto/okteto/releases/download/1.15.6/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.6", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
