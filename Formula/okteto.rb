class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.10.6"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "5c9e9034df896198e17e13ded1bdefee406c5bd14ea9c5a0877b0c20e217a1d9"
    url "https://github.com/okteto/okteto/releases/download/1.10.6/okteto-Darwin-arm64"
  else
    sha256 "60245291a4d451b4ec435620dcfb7641c5027abc0e4415919e03cafe70840b39"
    url "https://github.com/okteto/okteto/releases/download/1.10.6/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.10.6", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end