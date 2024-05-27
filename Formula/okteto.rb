class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.27.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "aba1aa66c981ad524c47d47eb7b0e5b8f1876e719df95155ccc53dd6b297d5d1"
    url "https://github.com/okteto/okteto/releases/download/2.27.3/okteto-Darwin-arm64"
  else
    sha256 "9cb5223ba3d999665ea41232b296095e3f28ab07e22fc5d921e7196300671f90"
    url "https://github.com/okteto/okteto/releases/download/2.27.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.27.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
