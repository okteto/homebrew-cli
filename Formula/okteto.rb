class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.12.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "77b0ea45c49fb289df1a00c46b825a3fb175902e086d1174a928b9fb8e59b89d"
    url "https://github.com/okteto/okteto/releases/download/3.12.3/okteto-Darwin-arm64"
  else
    sha256 "d4d59b7ca34279288be04192b7cfb58459fe4ef1bb6afe484d9d3931d70510ef"
    url "https://github.com/okteto/okteto/releases/download/3.12.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.12.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
