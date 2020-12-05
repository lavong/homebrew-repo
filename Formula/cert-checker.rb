class CertChecker < Formula
    desc "Tool to display certificate chain infos"
    homepage "https://github.com/lavong/cert-checker"
    url "https://github.com/lavong/cert-checker/releases/download/0.0.8/cert-checker.zip"
    version "0.0.8"
    sha256 "349cec98597b29f97e4776d9c982b7889eae4b251dabf484952d44ab576b40cf"
  
    bottle :unneeded
  
    depends_on "openjdk"
  
    def install
      rm_f Dir["bin/*.bat"]
      libexec.install %w[bin lib]
      (bin/"cert-checker").write_env_script libexec/"bin/cert-checker",
        :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
    end
  
    test do
      output = shell_output("#{bin}/cert-checker --help")
      assert_includes output, "Usage: cert-checker"
    end
end