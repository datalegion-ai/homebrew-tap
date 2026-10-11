class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/c7/f8/5f2389ad83a252aac47744a3d9a533a87872054878acf824bf637e8ed09f/datalegion_cli-1.5.0.tar.gz"
  sha256 "f9697b3dd9f13b9a29cf2f9333c7258d1ad9f6f0775e5d2a5380c2300382c241"
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
