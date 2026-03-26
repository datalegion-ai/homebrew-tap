class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/42/ee/5d8ad45370604477e7ccd77d017da2acd237dfb585632e0bd56c91431577/datalegion_cli-1.0.4.tar.gz"
  sha256 "7f262173be527eec193224a7e4e7fbb39f61eeaebc96bdceee71db2dd5fe1af8"
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
