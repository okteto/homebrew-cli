class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.11.4"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "dd8c9339555f062f8767acf06971e10dbe42eafe62c0160f262c0de526e11896"
    url "https://github.com/okteto/okteto/releases/download/1.11.4/okteto-Darwin-arm64"
  else
    sha256 "858711cdcd1ac4ddd3861433f59e1d190ccdefe3eb46a9d1479038211861c3d0"
    url "https://github.com/okteto/okteto/releases/download/1.11.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.11.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
