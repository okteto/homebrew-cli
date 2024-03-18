class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.25.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "dedf7d0c3d0559fa7756487218ed4daec4d91cc755e2c0459f8ce4d977ca9ee5"
    url "https://github.com/okteto/okteto/releases/download/2.25.3/okteto-Darwin-arm64"
  else
    sha256 "26622e787c8efeb853fb6839a1e8c96acb7799144fcc5a3dca1057bf8d6aaf57"
    url "https://github.com/okteto/okteto/releases/download/2.25.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.25.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
