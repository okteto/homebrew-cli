class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.10.8"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "8618d0a868d285ed3263177692c463379e91223fe95689ae28a34ae1b7c5ab73"
    url "https://github.com/okteto/okteto/releases/download/1.10.8/okteto-Darwin-arm64"
  else
    sha256 "01763881b846227690c7f363edc9ba1eff5a12b6d99fdaedb50fe3b27d23fd90"
    url "https://github.com/okteto/okteto/releases/download/1.10.8/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.10.8", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
