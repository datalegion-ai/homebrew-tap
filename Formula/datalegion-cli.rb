class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/f7/d4/fae623a019ac0c22ee04bfbf27dca4e495767b287fa066e60f31b64c4389/datalegion_cli-1.10.0.tar.gz"
  sha256 "371422500b7b4d17fcf06e6b716f12aee0bf452118005585fc6eb2050df70a61"
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
