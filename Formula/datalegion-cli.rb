class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/91/63/f0f2c58c29bbaedd1f1eafe8d0dbce6359ffacb778a46ff55e505ae0e006/datalegion_cli-1.0.3.tar.gz"
  sha256 "48a17772c52293f33b26bbdce1cbf2b6408fb38888e4299c5d5c3cbf2d8359c7"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = libexec/"venv"
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "datalegion-cli==#{version}"
    bin.install_symlink Dir[venv/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
