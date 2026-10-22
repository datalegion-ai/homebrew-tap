class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/f6/d1/d67c8a55a73ebdd676532e5fa9343c3f49e7d2d7dc7f9cfd1aa79554a5d8/datalegion_cli-1.5.3.tar.gz"
  sha256 "0c438746c2f4a1206c5d3978b50bb0e243606ada17e32d9f24c101c9fa340c6c"
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
