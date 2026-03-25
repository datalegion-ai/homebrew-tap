class DatalegionCli < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/0d/7a/7c50547235fe921111bc92991858e94539995522f85cb609db800a631b9f/datalegion_cli-1.0.1.tar.gz"
  sha256 "e495d65f9cbc61c1a9ea5c7bf9f1617726298b1f4459016dec113f1a1d1fa46b"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", ".", "--prefix=#{libexec}"
    bin.install_symlink Dir[libexec/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
