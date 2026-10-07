class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/b7/0b/da75553aaeb029f71677c514b3af9065dc8d480b262bfd1baeb11cf8dc9f/datalegion_cli-1.3.1.tar.gz"
  sha256 "f136d4c7d1d8d90bcfe44d68dfd05b2ae13261b95471910b54218a638d382695"
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
