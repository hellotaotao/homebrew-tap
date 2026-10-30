cask "quotaswap" do
  version "0.2.1"
  sha256 "36a817a9eb371da1584ed8696cb2581a9cb4beef9dc565042c6b7183ba9891e4"

  url "https://github.com/hellotaotao/QuotaSwap/releases/download/v#{version}/QuotaSwap-#{version}.dmg"
  name "QuotaSwap"
  desc "Switch Claude desktop accounts and watch each account's usage"
  homepage "https://github.com/hellotaotao/QuotaSwap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "QuotaSwap.app"
  binary "#{appdir}/QuotaSwap.app/Contents/MacOS/QuotaSwap", target: "quotaswap"

  uninstall quit: "au.taotao.quotaswap"

  zap trash: [
    "~/Library/Application Support/Claude-accounts",
    "~/Library/Application Support/QuotaSwap",
  ]
end
