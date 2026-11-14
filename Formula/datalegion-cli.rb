class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/80/b9/04789b263242385efc56e1aacd7f00509bdff6c27880623e6faae5cef510/datalegion_cli-1.9.0.tar.gz"
  sha256 "2bdcc370de78d34531a6a74a02e3746f39003198b7a4eb916152a75f69f94d8b"
  license "MIT"

  depends_on "python@3.15"

  def install
    venv = libexec/"venv"
    system Formula["python@3.15"].opt_bin/"python3.15", "-m", "venv", venv
    system venv/"bin/pip", "install", buildpath
    bin.install_symlink Dir[venv/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
