class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/3c/0d/74913edd70190e887e5aa21dbbe7e9546558313d87980a4b93db3a96c3ba/datalegion_cli-1.0.5.tar.gz"
  sha256 "2c6e8e3b56e7936ffec008832db824c8fd7b6de10080716df34d5a12e2701bf7"
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
