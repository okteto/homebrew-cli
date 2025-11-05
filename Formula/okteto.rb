class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.13.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "6b0bfab4ca1bc7288359a289156cc385ffe0be31f3332dc6500a922d3e3acfca"
    url "https://github.com/okteto/okteto/releases/download/3.13.0/okteto-Darwin-arm64"
  else
    sha256 "48de5e4427db2c8af53d16c178bf63037a949934cba2e3113a1c96abea9d2967"
    url "https://github.com/okteto/okteto/releases/download/3.13.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.13.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
